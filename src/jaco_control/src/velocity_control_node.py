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

from sensor_msgs.msg import JointState
from std_msgs.msg import Int16MultiArray
from std_msgs.msg import Int16
from std_msgs.msg import Float32MultiArray

global currentState
global desiredState

P = 0.1
I = 0.1
D = 0

def currentStateCB(msg):
	global currentState
	currentState = msg.position

def desiredStateCB(msg):
	global desiredState
	desiredState = msg.position
	

if __name__ == '__main__':

	rospy.init_node('velocity_control')
    rate = rospy.Rate(60)
	joint_pub = rospy.Publisher('/jaco/joint_control', JointState, queue_size=1000)
	current_sub = rospy.Subscriber('/jaco/joint_state', JointState, currentStateCB)
	desired_sub = rospy.Subscriber('desired_position', JointState, desiredStateCB)
	msg = JointState()
    msg.name = ['jaco_arm_0_joint', 'jaco_arm_1_joint', 'jaco_arm_2_joint', 'jaco_arm_3_joint', 'jaco_arm_4_joint', 'jaco_arm_5_joint', 'jaco_finger_joint_0', 'jaco_finger_joint_2', 'jaco_finger_joint_4']


	while not rospy.is_shutdown():
		error = desiredState - currentState
		for e in error:
			if e < 0.01:
				e = 0
		
		vel = P*error
		msg.velocity = vel

		joint_pub.publish(msg)

		rate.sleep()