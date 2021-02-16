#!/usr/bin/env python

import roslib; roslib.load_manifest('jaco_control')
import rospy

import sys
import numpy as np
import random
import itertools
import csv
import os

import serial

from std_msgs.msg import Int16MultiArray
from std_msgs.msg import Float32MultiArray


if __name__ == '__main__':

	rospy.init_node('glove_bluetooth_node', anonymous = True)

	pub = rospy.Publisher("fingersPos", Float32MultiArray, queue_size=1000)
	rate = rospy.Rate(60)

	msg = Float32MultiArray()
	
	with serial.Serial('/dev/ttyACM0', 115200, timeout=1) as ser:
		while not rospy.is_shutdown():
			# x = ser.read()          # read one byte
			# s = ser.read(1)        # read up to ten bytes (timeout)
			line = ser.readline()   # read a '\n' terminated line
			print(line)
			array = line.split(',', 30)[0:16]
			
			if len(array) >= 16:
				for i in range(0, len(array)):
					array[i] = float(array[i][2:])
				
				msg.data = [array[1], array[5], array[8], array[11], array[14]]
				 
				pub.publish(msg)
			rate.sleep()


