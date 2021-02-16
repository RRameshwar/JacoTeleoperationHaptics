#!/usr/bin/env python

import roslib; roslib.load_manifest('jaco_control')
import rospy

import sys
import numpy as np
import random
import itertools
import csv
import os

from sensor_msgs.msg import JointState
from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Int16MultiArray
from std_msgs.msg import Int16
from geometry_msgs.msg import Quaternion
from geometry_msgs.msg import Vector3
from std_msgs.msg import Bool

from tf.transformations import euler_from_quaternion, quaternion_from_euler
 

class imuRangeCalibrator():

    def __init__(self):
        rospy.Subscriber("imuUpperarm", Vector3, self.imuUpperCB)
        rospy.Subscriber("imuForearm", Vector3, self.imuForeCB)
        rospy.Subscriber("imuWrist", Vector3, self.imuWristCB)
        rospy.Subscriber("keyboard_input", Int16, self.keyboardInputCB)


        self.jointReadList = [False, False, False, False, False, False] #Upper X Max, Upper X Min, Fore DiffX Min, Wrist Z Max, Upper Y Max, Upper Y Min

        self.jointDataList = [[], [], [], [], [], []]

        self.upperX = 0

        self.home = [-1.39, -3.0, -1.5, 0.08, 0.17, 0.83]
    
        #pos1 = [-1.56, -2.0, -1.5, 0.08, 0.17, 0.83] #Joint 1 max
        #pos2 = [-1.20, -2.0, -1.5, 0.08, 0.17, 0.83] #Joint 1 min

        pos3 = [-1.39, -2.03, -1.5, 0.08, 0.17, 0.83] #Joint 2 max
        pos4 = [-1.39, -3.94, -1.5, 0.08, 0.17, 0.83] #Joint 2 min

        pos5 = [-1.39, -3.0, -4.0, 0.08, 0.17, 0.83] #Joint 3 min (Max is home position)

        pos6 = [-1.39, -3.0, -1.5, 1.36, 0.17, 0.83] #Joint 4 min (Max is home position)

        pos8 = [-1.09, -3.0, -1.5, 0.08, 0.17, 0.83] #Joint 2 lowest
        pos7 = [-1.59, -3.0, -1.5, 0.08, 0.17, 0.83] #Joint 2 highest

        self.position_list = [pos3, pos4, pos5, pos6, pos7, pos8]
        self.jointsPos = self.home

        self.count = 0
        self.finishedCalibrating = False


    def keyboardInputCB(self,msg):
        print(self.count)
        if (self.count < 24):
            num = self.count/4
            if self.count % 4 == 0:
                self.jointsPos = self.home
                print("homing arm")
                
            elif self.count % 4 == 1:
                self.jointsPos = self.position_list[num]
                print("Position Number", num)

            elif self.count % 4 == 2:
                self.jointReadList[num] = True
                print("reading data")

            else:
                self.jointReadList[num] = False
                print("stopped reading data")
                

            self.count += 1
        else:
            self.finishedCalibrating = True

    def imuUpperCB(self, msg):
        x = msg.x
        y = msg.y
        z = msg.z

        self.upperX = x

        if self.jointReadList[0]:
            self.jointDataList[0].append(x)
            print("reading x max", x)
        elif self.jointReadList[1]:
            self.jointDataList[1].append(x)
            print("reading x min", x)

        elif self.jointReadList[4]:
            self.jointDataList[4].append(y)
            print("reading y max", y)            

        elif self.jointReadList[5]:
            self.jointDataList[5].append(y)
            print("reading y min", y)            

    def imuForeCB(self, msg):
        x = msg.x
        y = msg.y
        z = msg.z

        if self.jointReadList[2]:
            diff = x - self.upperX
            self.jointDataList[2].append(diff)
            print("reading fore upper diff ", diff)

    def imuWristCB(self, msg):
        x = msg.x
        y = msg.y
        z = msg.z

        if self.jointReadList[3]:
            self.jointDataList[3].append(z)
            print("reading wrist Z", z)

    def moveArm(self, position):
        msg = JointState()
        msg.name = ['jaco_arm_0_joint', 'jaco_arm_1_joint', 'jaco_arm_2_joint', 'jaco_arm_3_joint', 'jaco_arm_4_joint', 'jaco_arm_5_joint', 'jaco_finger_joint_0', 'jaco_finger_joint_2', 'jaco_finger_joint_4']
        msg.position = [position, 0.0, 0.0, 0.0]
        
        self.jointPub.publish(msg)


if __name__ == '__main__':
    if os.path.exists("imuRangePositions.csv"):
        os.remove("imuRangePositions.csv")
    else:
        pass

    rospy.init_node('imu_calibration_node', anonymous = True)
    rate = rospy.Rate(60)
    jointPub = rospy.Publisher("/jaco/joint_control", JointState, queue_size=1000)


    msg = JointState()
    msg.name = ['jaco_arm_0_joint', 'jaco_arm_1_joint', 'jaco_arm_2_joint', 'jaco_arm_3_joint', 'jaco_arm_4_joint', 'jaco_arm_5_joint', 'jaco_finger_joint_0', 'jaco_finger_joint_2', 'jaco_finger_joint_4']
    

    ic = imuRangeCalibrator()

    averages = []

    while not rospy.is_shutdown():
        msg.position[0:6] = ic.jointsPos
        msg.position[6:9] = [0.0, 0.0, 0.0]
        jointPub.publish(msg)

        # for i in range(0, 5):
        #     x = raw_input ("Press to move arm")
        #     ic.moveArm(position_list[i])
        #     x = raw_input ("Press to get data")
        #     ic.jointReadList[i] = True
        #     x = raw_input ("Press to stop data")
        #     ic.jointReadList[i] = False        

        if (ic.finishedCalibrating):
            for i in range(0,6):
                print(len(ic.jointDataList[i]))
            for i in range(0,6):
                averages.append(np.average(ic.jointDataList[i]))
        
            print(averages)

            with open('imuRangePositions.csv', 'wb') as csvfile:
                writer = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
                writer.writerow(averages)
        
            rospy.signal_shutdown("Done Calibrating")

        rate.sleep()

