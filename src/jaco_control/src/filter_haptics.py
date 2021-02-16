#!/usr/bin/env python

import roslib; roslib.load_manifest('jaco_control')
import rospy

import sys
import numpy as np
import random
import itertools
import os
import csv

from sensor_msgs.msg import JointState
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Int16MultiArray
from std_msgs.msg import Int16
from geometry_msgs.msg import Quaternion
from geometry_msgs.msg import Vector3
from std_msgs.msg import Bool


class HapticsFilter():
	def __init__(self):
		self.thumb_prev = 0
		self.pointer_prev = 0
		self.middle_prev = 0

		self.thumb_weight = 0.5
		self.pointer_weight = 0.5
		self.middle_weight = 0.5

		self.haptics_filtered = [0, 0, 0]

		self.haptics_filtered_mapped = [0, 0, 0]

		rospy.Subscriber("/haptic_thumb", Int16, self.thumbCB)
		rospy.Subscriber("/haptic_pointer", Int16, self.pointerCB)
		rospy.Subscriber("/haptic_middle", Int16, self.middleCB)

		self.hapticsPub = rospy.Publisher("/haptics_filtered", Int16MultiArray, queue_size=1000)

	def map(self, num, sensorRange, hapticsRange):
		if num == 0:
			return 0

		mapped = (((num - sensorRange[0])/(sensorRange[1]-sensorRange[0]))*(hapticsRange[1]-hapticsRange[0])) + float((hapticsRange[0]))

		if mapped >= hapticsRange[1]:
			return hapticsRange[1]
		elif mapped <= hapticsRange[0]:
			return hapticsRange[0]
		else:
			return mapped

	def thumbCB(self,msg):
		num = (self.thumb_weight * msg.data) + ((1-self.thumb_weight)*self.thumb_prev)
		num_map = self.map(num, [0, 153], [0, 255])
		
		self.haptics_filtered[0] = num
		self.thumb_prev = num
		self.haptics_filtered_mapped[0] = num_map

	def pointerCB(self,msg):
		num = (self.pointer_weight * msg.data) + ((1-self.pointer_weight)*self.pointer_prev)
		num_map = self.map(num, [0, 153], [0, 255])

		self.haptics_filtered[1] = num
		self.pointer_prev = num
		self.haptics_filtered_mapped[1] = num_map


	def middleCB(self,msg):
		num = (self.middle_weight * msg.data) + ((1-self.middle_weight)*self.middle_prev)
		num_map = self.map(num, [0, 153], [0, 255])

		self.haptics_filtered[2] = num
		self.middle_prev = num
		self.haptics_filtered_mapped[2] = num_map

if __name__ == '__main__':
	rospy.init_node('haptics_filtering_node', anonymous = True)
	hf = HapticsFilter()
	rate = rospy.Rate(60)

	while not rospy.is_shutdown():
		msg = Int16MultiArray()
		msg.data = hf.haptics_filtered_mapped
		print(hf.haptics_filtered_mapped)
		hf.hapticsPub.publish(msg)
		rate.sleep()

