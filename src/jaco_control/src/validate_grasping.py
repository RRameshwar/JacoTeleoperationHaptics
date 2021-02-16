#!/usr/bin/env python

import roslib; roslib.load_manifest('jaco_control')
import rospy

import sys
import numpy as np
import random
import itertools

import math
import argparse
import csv
import sys, select, termios, tty
import os

from sensor_msgs.msg import JointState
from std_msgs.msg import Int16MultiArray
from std_msgs.msg import Int16
from std_msgs.msg import Float32MultiArray


class Grasper():
	def __init__(self):

		self.home = [4.5532, 4.55069, 0.703853, 5.46553, 1.5063, 3.13586]
		self.pos1 = [-1.44341, -0.5, -0.41735, -2.77498, 2.227743, -2.56573]
		self.pos2 = [-1.44341, -0.300781, -0.41736, -2.77498, 2.22774, -2.56573]

		self.fingersPos = [0, 0, 0]
		self.jointsPos = self.home

		self.haptics = [0, 0, 0]

		self.curvatureRangeThumb = [0, 0]
		self.curvatureRangePointer = [0, 0]
		self.curvatureRangeMiddle = [0, 0]

		self.diff_thumb = 0
		self.diff_pointer = 0
		self.diff_middle = 0

		rospy.Subscriber("fingersPos", Float32MultiArray, self.fingersCB)
		
		rospy.Subscriber("keyboard_input", Int16, self.keyboardInputCB)

		rospy.Subscriber("haptics_filtered", Int16MultiArray, self.hapticsCB)

		self.pub = rospy.Publisher("/jaco/joint_control", JointState, queue_size = 1000)


	def readGloveCalibration(self):
		folder = os.path.dirname(os.path.abspath(__file__))

		my_file = os.path.join(folder, 'gloveCalibrations.csv')
		cal_matrix = []

		with open(my_file, 'r') as f:
			reader = csv.reader(f, delimiter=',', quotechar='|', quoting=csv.QUOTE_NONNUMERIC) #This is a very brittle way of reading the csv in as floats. Eventually                                                                                               #it might be good to use pandas to do this better?     
			for row in reader:
				cal_matrix.append(row)

		self.curvatureRangeThumb = [cal_matrix[0][0], cal_matrix[1][0]]
		self.curvatureRangePointer = [cal_matrix[0][1], cal_matrix[1][1]]
		self.curvatureRangeMiddle = [cal_matrix[0][2], cal_matrix[1][2]]

		self.diff_thumb = self.curvatureRangeThumb[1] - self.curvatureRangeThumb[0]
		self.diff_pointer = self.curvatureRangePointer[1] - self.curvatureRangePointer[0]
		self.diff_middle = self.curvatureRangeMiddle[1] - self.curvatureRangeMiddle[0]

		print(self.curvatureRangeThumb)


	def hapticsCB(self, msg):
		self.haptics = msg.data

	def keyboardInputCB(self,msg):
		if msg.data == 1:
			self.jointsPos = self.home
			print("homing arm")
		if msg.data == 2:
			self.jointsPos = self.pos1
		if msg.data == 3:
			self.jointsPos = self.pos2
			print("approached the cube")

	def fingersCB(self, msg):
		f1 = msg.data[0]
		f2 = msg.data[1]
		f3 = msg.data[2]

		h1 = self.haptics[0]
		h2 = self.haptics[1]
		h3 = self.haptics[2]

		# y1 = f1
		# y2 = f2
		# y3 = f3

		if f1 < (self.curvatureRangeThumb[1] - 0.2*self.diff_thumb):
			y1 = f1 - (0.00272 * h1 + -0.22093) #Do the mapping for open fingers
		else:
			y1 = f1 - (-0.00816 * h1 + -5.68944)

		if f2 < (self.curvatureRangePointer[1] - 0.2*self.diff_pointer):
			y2 = f2 - (0.01102 * h2 + 0.52019)
		else:
			y2 = f2 - (0.00368 * h2 + -3.88521)

		if f3 < (self.curvatureRangeMiddle[1] - 0.2*self.diff_middle):
			y3 = f3 - (0.02532 * h3 + -0.25666)
		else:
			y3 = f3 - (0.00808 * h3 + -1.24785)


		self.fingersPos[0] = self.map(y1, 0, self.curvatureRangeThumb, [0,1])
		self.fingersPos[1] = self.map(y2, 0, self.curvatureRangePointer, [0,1])
		self.fingersPos[2] = self.map(y3, 0, self.curvatureRangeMiddle, [0,1])

	def map(self, num, home, imuRange, jointRange):
		if num == 0:
			return home

		mapped = (((num - imuRange[0])/(imuRange[1]-imuRange[0]))*(jointRange[1]-jointRange[0])) + float((jointRange[0]))

		if mapped >= jointRange[1]:
			return jointRange[1]
		elif mapped <= jointRange[0]:
			return jointRange[0]
		else:
			return mapped



if __name__ == '__main__':

	gp = Grasper()
	gp.readGloveCalibration()
	

	rospy.init_node('contact_publisher')
	rate = rospy.Rate(60)

	while not rospy.is_shutdown():
		msg = JointState()
		msg.name = ['jaco_arm_0_joint', 'jaco_arm_1_joint', 'jaco_arm_2_joint', 'jaco_arm_3_joint', 'jaco_arm_4_joint', 'jaco_arm_5_joint', 'jaco_finger_joint_0', 'jaco_finger_joint_2', 'jaco_finger_joint_4']

		msg.position[0:6] = gp.jointsPos
		msg.position[6:9] = gp.fingersPos

		print(msg.position)
		gp.pub.publish(msg)
		rate.sleep()


