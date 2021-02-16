#!/usr/bin/env python

import roslib; roslib.load_manifest('jaco_control')
import rospy

import sys
import numpy as np
import random
import itertools
import csv
import os
import time

from sensor_msgs.msg import JointState
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Int16MultiArray
from std_msgs.msg import Int16
from geometry_msgs.msg import Quaternion
from geometry_msgs.msg import Vector3
from std_msgs.msg import Bool



class GloveCalibrator():

	def __init__(self):
		self.openValues = [[], [], [], [], []]
		self.closedValues = [[], [], [], [], []]

		self.mode = 0

		rospy.Subscriber("fingersPos", Float32MultiArray, self.fingersCB)

	def fingersCB(self, msg):
		if self.mode == 0:
			for i in range(0, len(msg.data)):
				self.openValues[i].append(msg.data[i])

		if self.mode == 1:
			for i in range(0, len(msg.data)):
				self.closedValues[i].append(msg.data[i])



if __name__ == '__main__':
	if os.path.exists("gloveCalibrations.csv"):
		os.remove("gloveCalibrations.csv")
	else:
		pass


	rospy.init_node('glove_calibration_node', anonymous = True)
	rate = rospy.Rate(60)
	gc = GloveCalibrator()
	count = 0
	avgOpen = []
	avgClosed = []

	while not rospy.is_shutdown():
		while len(gc.openValues[0]) <= 100:
			gc.mode = 0
			print("Keep fingers open", len(gc.openValues[0]))

		time.sleep(3)

		while len(gc.closedValues[0]) <= 100:
			gc.mode = 1
			print("Keep fingers closed", len(gc.closedValues[0]))

		for x in gc.openValues:
			avgOpen.append(np.average(x[0:100]))

		for x in gc.closedValues:
			avgClosed.append(np.average(x))

		print(len(gc.openValues), len(gc.closedValues), avgOpen, avgClosed)

		with open('gloveCalibrations.csv', 'wb') as csvfile:
			writer = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
			writer.writerow(avgOpen)
			writer.writerow(avgClosed)
	
		rospy.signal_shutdown("Done Calibrating")

