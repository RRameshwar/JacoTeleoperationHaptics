#!/usr/bin/env python

import roslib; roslib.load_manifest('jaco_control')
import rospy

import sys
import numpy as np
import random
import itertools
import os
import csv
import matplotlib.pyplot as plt

from sensor_msgs.msg import JointState
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Int16MultiArray
from std_msgs.msg import Int16
from geometry_msgs.msg import Quaternion
from geometry_msgs.msg import Vector3
from std_msgs.msg import Bool



#rospy.Subscriber("keyboard_input", Int16, keyboardInputCB)
rospy.init_node('pressure_apply', anonymous = True)
pub = rospy.Publisher("haptics_filtered", Int16MultiArray, queue_size=1000)
    


if __name__ == '__main__':
	
	msg = Int16MultiArray()

	for i in range(0, 25):
		msg.data = [0, 0, 0]
		pub.publish(msg)
		print(msg.data)
		rospy.sleep(0.1)

	for j in range(0,4):
		print("ROUND ", j)
		i=40
		for i in range(40, 250):
			msg.data = [i, i, i]
			pub.publish(msg)
			print(msg.data)
			rospy.sleep(0.1)

		i = 0
		for i in range(0, 210):
			msg.data = [250-i, 250-i, 250-i]
			pub.publish(msg)
			print(msg.data)
			rospy.sleep(0.1)
		




