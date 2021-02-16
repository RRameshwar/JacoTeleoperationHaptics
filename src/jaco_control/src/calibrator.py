#!/usr/bin/env python

import roslib; roslib.load_manifest('jaco_control')
import rospy

import sys
import numpy as np
import random
import itertools
import csv

from sensor_msgs.msg import JointState
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Int16MultiArray
from std_msgs.msg import Int16
from geometry_msgs.msg import Vector3
from std_msgs.msg import Bool

from tf.transformations import euler_from_quaternion, quaternion_from_euler


class imuHomeCalibrator():

    def __init__(self):
        rospy.Subscriber("imuUpperarm", Vector3, self.imuUpperCB)
        rospy.Subscriber("imuForearm", Vector3, self.imuForeCB)
        rospy.Subscriber("imuWrist", Vector3, self.imuWristCB)

        self.upperIsCalibrated = False
        self.foreIsCalibrated = False
        self.wristIsCalibrated = False

        self.upperReadings = [[], [], []]
        self.foreReadings = [[], [], []]
        self.wristReadings = [[], [], []]

        self.upperCalibrations = []
        self.foreCalibrations = []
        self.wristCalibrations = []


    def getAvg(self, cal):
        return (np.average(cal))

    def imuUpperCB(self, msg):
        # orientation_q = msg
        # orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        # (x, y, z) = euler_from_quaternion (orientation_list)

        if len(self.upperReadings[0]) == 250:
            x_avg = self.getAvg(self.upperReadings[0])
            y_avg = self.getAvg(self.upperReadings[1])
            z_avg = self.getAvg(self.upperReadings[2])

            self.upperCalibrations = [x_avg, y_avg, z_avg]
            self.upperIsCalibrated = True

        else:
            self.upperReadings[0].append(msg.x)
            self.upperReadings[1].append(msg.y)
            self.upperReadings[2].append(msg.z)


    def imuForeCB(self, msg):
        # orientation_q = msg
        # orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        # (x, y, z) = euler_from_quaternion (orientation_list)

        if len(self.foreReadings[0]) == 250:
            x_avg = self.getAvg(self.foreReadings[0])
            y_avg = self.getAvg(self.foreReadings[1])
            z_avg = self.getAvg(self.foreReadings[2])

            self.foreCalibrations = [x_avg, y_avg, z_avg]
            self.foreIsCalibrated = True

        else:
            self.foreReadings[0].append(msg.x)
            self.foreReadings[1].append(msg.y)
            self.foreReadings[2].append(msg.z)

    def imuWristCB(self, msg):
        # orientation_q = msg
        # orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        # (x, y, z) = euler_from_quaternion (orientation_list)

        if len(self.wristReadings[0]) == 250:
            x_avg = self.getAvg(self.wristReadings[0])
            y_avg = self.getAvg(self.wristReadings[1])
            z_avg = self.getAvg(self.wristReadings[2])

            self.wristCalibrations = [x_avg, y_avg, z_avg]
            self.wristIsCalibrated = True

        else:
            self.wristReadings[0].append(msg.x)
            self.wristReadings[1].append(msg.y)
            self.wristReadings[2].append(msg.z)


if __name__ == '__main__':
    rospy.init_node('imu_calibration_node', anonymous = True)

    iC = imuHomeCalibrator()

    while not rospy.is_shutdown():
        
        if (iC.upperIsCalibrated and iC.foreIsCalibrated and iC.wristIsCalibrated):
            with open('imuZeroPositions.csv', 'wb') as csvfile:
                writer = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
                writer.writerow([iC.upperCalibrations[0], iC.upperCalibrations[1], iC.upperCalibrations[2]])
                writer.writerow([iC.foreCalibrations[0], iC.foreCalibrations[1], iC.foreCalibrations[2]])
                writer.writerow([iC.wristCalibrations[0], iC.wristCalibrations[1], iC.wristCalibrations[2]])
                print("DONE CALIBRATING ALL!")

