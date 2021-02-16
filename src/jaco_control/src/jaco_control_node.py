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

from tf.transformations import euler_from_quaternion, quaternion_from_euler

# [4.5532, 4.55069, 0.703853, 5.46553, 1.5063, 3.13586]

class JacoController():

    def __init__(self):
        self.jointsPos = [-1.39, -3.0, -1.5, 0, -0.17, -0.11]

        self.fingersPos = [0.0, 0.0, 0.0]

        self.homePos = [-1.39, -3.0, -1.5, 0, -0.17, -0.11]

        self.curvatureRangeThumb = [0, 0]
        self.curvatureRangePointer = [0, 0]
        self.curvatureRangeMiddle = [0, 0]
        self.jacoGripperRange = [0, 1]
        
        self.imuRangeUpper = [[0,0], [0, 0], [0, 0]]
        self.imuHomeUpper = [0, 0, 0]
        self.imuRangeForearm = [[2, 5], [0, 0], [0, 0]]
        self.imuHomeForearm = [0, 0, 0]
        self.imuRangeWrist = [[0,0], [0, 0], [0, 0]]
        self.imuHomeWrist = [0, 0, 0]
        
        self.jacoRange0 = [self.homePos[0] - 0.3, self.homePos[0] + 0.3]
        self.jacoRange1 = [-3.94, -2.03]
        self.jacoRange2 = [self.homePos[2], -4.0]
        self.jacoRange3 = [1.36, self.homePos[3]]

        self.imuCurrentUpper = [0, 0, 0]
        self.imuCurrentUpper_raw = 0
        self.imuCurrentForearm = [0, 0, 0]
        self.imuCurrentWrist = [0, 0, 0]

        self.haptics = [0, 0, 0]

        self.isControlling = False

        rospy.Subscriber("fingersPos", Float32MultiArray, self.fingersPosCallback)
        rospy.Subscriber("imuUpperarm", Vector3, self.imuUpperCB)
        rospy.Subscriber("imuForearm", Vector3, self.imuForeCB)
        rospy.Subscriber("imuWrist", Vector3, self.imuWristCB)


        rospy.Subscriber("haptics_filtered", Int16MultiArray, self.hapticsCB)
        
        rospy.Subscriber("homeJaco", Bool, self.homeJacoCallback)
        rospy.Subscriber("isControlling", Bool, self.ControllingCB)

        self.jointPub = rospy.Publisher("/jaco/joint_control", JointState, queue_size=1000)

    def getIMUCalibration(self):
        folder = os.path.dirname(os.path.abspath(__file__))

        # GET IMU HOME VALES
        my_file = os.path.join(folder, 'imuZeroPositions.csv')
        cal_matrix = []

        with open(my_file, 'r') as f:
            reader = csv.reader(f, delimiter=',', quotechar='|', quoting=csv.QUOTE_NONNUMERIC) #This is a very brittle way of reading the csv in as floats. Eventually                                                                                               #it might be good to use pandas to do this better?     
            for row in reader:
                cal_matrix.append(row)

        self.imuHomeUpper = cal_matrix[0]
        self.imuHomeForearm = cal_matrix[1]
        self.imuHomeWrist = cal_matrix[2]

        # GET GLOVE CALIBRATION VALUES
        my_file = os.path.join(folder, 'gloveCalibrations.csv')
        cal_matrix = []

        with open(my_file, 'r') as f:
            reader = csv.reader(f, delimiter=',', quotechar='|', quoting=csv.QUOTE_NONNUMERIC) #This is a very brittle way of reading the csv in as floats. Eventually                                                                                               #it might be good to use pandas to do this better?     
            for row in reader:
                cal_matrix.append(row)

        self.curvatureRangeThumb = [cal_matrix[0][0], cal_matrix[1][0]]
        self.curvatureRangePointer = [cal_matrix[0][1], cal_matrix[1][1]]
        self.curvatureRangeMiddle = [cal_matrix[0][2], cal_matrix[1][2]]

        my_file = os.path.join(folder, 'imuRangePositions.csv')
        cal_matrix = []

        with open(my_file, 'r') as f:
            reader = csv.reader(f, delimiter=',', quotechar='|', quoting=csv.QUOTE_NONNUMERIC) #This is a very brittle way of reading the csv in as floats. Eventually                                                                                               #it might be good to use pandas to do this better?     
            for row in reader:
                cal_matrix=row

        self.imuRangeUpper[0][0] = cal_matrix[1]
        self.imuRangeUpper[0][1] = cal_matrix[0]

        self.imuRangeUpper[1][0] = cal_matrix[4]
        self.imuRangeUpper[1][1] = cal_matrix[5]

        self.imuRangeForearm[0][0] = cal_matrix[2]
        self.imuRangeForearm[0][1] = 0.0 #1.0 #self.imuHomeForearm[0] # - self.imuHomeUpper[0]

        self.imuRangeWrist[2][0] = self.imuHomeWrist[2]
        self.imuRangeWrist[2][1] = cal_matrix[3] 

        self.jacoRange0 = [self.homePos[0] - 0.3, self.homePos[0] + 0.3]
        self.jacoRange1 = [-3.94, -2.03]
        self.jacoRange2 = [-4.0, self.homePos[2]]
        self.jacoRange3 = [self.homePos[3], 1.36]

    def ControllingCB(self, msg):
        self.isControlling = msg.data

    def hapticsCB(self, msg):
        self.haptics = msg.data

    def fingersPosCallback(self, msg):
        f1 = msg.data[0]
        f2 = msg.data[1]
        f3 = msg.data[2]

        h1 = self.haptics[0]
        h2 = self.haptics[1]
        h3 = self.haptics[2]

        y1 = f1 - (0.00468 * h1 + 0.24840)
        y2 = f2 - (0.01434 * h2 + -2.37179)
        y3 = f3 - (0.01343 * h3 + 0.28527)


        self.fingersPos[0] = self.map(y1, 0, self.curvatureRangeThumb, self.jacoGripperRange)
        self.fingersPos[1] = self.map(y2, 0, self.curvatureRangePointer, self.jacoGripperRange)
        self.fingersPos[2] = self.map(y3, 0, self.curvatureRangeMiddle, self.jacoGripperRange)

        test = []
        
        for i in range(0, len(msg.data)):
            test.append(int(msg.data[i]))
        
        #print(msg.data[2], self.curvatureRangeMiddle, self.fingersPos[2])

    def homeJacoCallback(self, msg):
        if not isControlling:
            self.jointsPos = homePos

    def FK(self, x1, y1, x2, y2):
        a1 = 300
        a2 = 280

        x1 = x1 * np.pi/180
        x2 = x2 * np.pi/180
        y1 = y1 * np.pi/180
        y2 = y2 * np.pi/180

        y = a1*np.cos(x1)*np.cos(y1) + a2*np.cos(x2)*np.cos(y2);
        z =  (a1*np.sin(y1) + a2*np.sin(y2)) *-1;

        return y,z

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


    def imuUpperCB(self, msg):
        # orientation_q = msg
        # orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        # (x, y, z) = euler_from_quaternion (orientation_list)
        # print(x)

        x_cal = msg.x - self.imuHomeUpper[0]
        y_cal = msg.y - self.imuHomeUpper[1]
        z_cal = msg.z - self.imuHomeUpper[2]

        self.imuCurrentWrist = [x_cal, y_cal, z_cal]
        self.imuCurrentUpper_raw = msg.x
        #print self.imuCurrentWrist
        #print self.imuHomeUpper

        cart_y, cart_z = self.FK(x_cal, y_cal,self.imuCurrentForearm[0], self.imuCurrentForearm[1])
        num = np.arctan2(cart_z, cart_y)

        if (self.isControlling):
            #self.jointsPos[0] = num
            self.jointsPos[0] = self.map(y_cal, self.homePos[0], self.imuRangeUpper[1], self.jacoRange0)
            #print (x_cal, self.homePos[1], self.imu1Range[0], self.jacoRange1)
            self.jointsPos[1] = self.map(x_cal, self.homePos[1], self.imuRangeUpper[0], self.jacoRange1)
            #print (x_cal, self.homePos[1], self.imu1Range[0], self.jacoRange1)

    def imuForeCB(self, msg):
        # orientation_q = msg
        # orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        # (x, y, z) = euler_from_quaternion (orientation_list)

        x_cal = msg.x - self.imuHomeForearm[0]
        y_cal = msg.y - self.imuHomeForearm[1]
        z_cal = msg.z - self.imuHomeForearm[2]

        self.imuCurrentForearm = [x_cal, y_cal, z_cal]

        diff = msg.x - self.imuCurrentUpper_raw
        #print(diff, x_cal, self.imuCurrentWrist[0])

        if (self.isControlling):
            self.jointsPos[2] = self.map(diff, self.homePos[2], self.imuRangeForearm[0], self.jacoRange2)
            #print(diff, self.jointsPos[2], self.homePos[2], self.imuRangeForearm[0], self.jacoRange2)

    def imuWristCB(self, msg):
        # orientation_q = msg
        # orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        # (x, y, z) = euler_from_quaternion (orientation_list)

        x_cal = msg.x - self.imuHomeWrist[0]
        y_cal = msg.y - self.imuHomeWrist[1]
        z_cal = msg.z - self.imuHomeWrist[2]

        self.imuCurrentWrist = [x_cal, y_cal, z_cal]

        
        print(z_cal, self.jointsPos[4], self.homePos[3], self.imuRangeWrist[2], self.jacoRange3)
        self.jointsPos[4] = self.map(z_cal, self.homePos[3], self.imuRangeWrist[2], self.jacoRange3)
            

if __name__ == '__main__':
    rospy.init_node('jaco_control_node', anonymous = True)
    
    jc = JacoController()
    jc.getIMUCalibration()
    jc.isControlling = 1

    #pub = rospy.Publisher("/jaco/joint_control", JointState, queue_size=1000)
    

    while not rospy.is_shutdown():

        msg = JointState()
        msg.name = ['jaco_arm_0_joint', 'jaco_arm_1_joint', 'jaco_arm_2_joint', 'jaco_arm_3_joint', 'jaco_arm_4_joint', 'jaco_arm_5_joint', 'jaco_finger_joint_0', 'jaco_finger_joint_2', 'jaco_finger_joint_4']
        
        msg.position[0:6] = jc.jointsPos
        msg.position[6:9] = jc.fingersPos
        
        jc.jointPub.publish(msg)