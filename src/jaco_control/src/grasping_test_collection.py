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

global fingersPos

fingersPos = [0.0, 0.0, 0.0]

global jointsPos
global cubeCompression
global cubeCompressionMax
global waiting
global runTest
global recordingTest
global haptics

jointsPos = [4.5532, 4.55069, 0.703853, 5.46553, 1.5063, 3.13586]

cubeCompression = 0
cubeCompressionMax = 0

runTest = False
recordingTest = False
waiting = True

haptics = [0, 0, 0]

def fingersPosCallback(msg):
    global haptics
    global fingersPos

    f1 = msg.data[0]
    f2 = msg.data[1]
    f3 = msg.data[2]

    h1 = self.haptics[0]
    h2 = self.haptics[1]
    h3 = self.haptics[2]

    y1 = f1 - (0.00468 * h1 + 0.24840)
    y2 = f2 - (0.01434 * h2 + -2.37179)
    y3 = f3 - (0.01343 * h3 + 0.28527)


    fingersPos[0] = map(y1, 0, self.curvatureRangeThumb, [0,1])
    fingersPos[1] = map(y2, 0, self.curvatureRangePointer, [0,1])
    fingersPos[2] = map(y3, 0, self.curvatureRangeMiddle, [0,1])

def hapticsCB(msg):
    global haptics
    haptics = msg.data

def keyboardInputCB(msg):
    global jointsPos
    global runTest
    global recordingTest
    global waiting

    if msg.data == 1: #Send the robot home
        jointsPos = [4.5532, 4.55069, 0.703853, 5.46553, 1.5063, 3.13586]
        fingersPos = [0.0, 0.0, 0.0]

    if msg.data == 2: #Send the robot over the cube - pos1
        jointsPos = [-1.44341, -0.5, -0.41735, -2.77498, 2.227743, -2.56573]

    if msg.data == 3: #Send the robot over the cube - pos2
        jointsPos = [-1.44341, -0.300781, -0.41736, -2.77498, 2.22774, -2.56573]

    if msg.data == 4: #begin test: record finger positions and keep track of cube compression. Carries through to pickup.
        runTest = True
        waiting = False
        print("Started test")

    if msg.data == 5: #write success to csv and end test
        print('success!')
        recordingTest = True

    if msg.data == 6: #write fail to csv and end test
        print('fail!')
        recordingTest = True

def cubeContactCallback(msg):
    global cubeCompressionMax
    global cubeCompression
    global runTest

    if runTest:
        if msg.data > cubeCompressionMax:
            cubeCompressionMax = msg.data
            #print("Got a new max!")

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
    settings = termios.tcgetattr(sys.stdin)
    pub = rospy.Publisher('/jaco/joint_control', JointState, queue_size=1000)
    rospy.Subscriber("fingersPos", Float32MultiArray, fingersPosCallback)
    rospy.Subscriber("cube_contact", Int16, cubeContactCallback)
    rospy.Subscriber("haptics_filtered", Int16MultiArray, hapticsCB)


    rospy.Subscriber("keyboard_input", Int16, keyboardInputCB)

    msg = JointState()
    msg.name = ['jaco_arm_0_joint', 'jaco_arm_1_joint', 'jaco_arm_2_joint', 'jaco_arm_3_joint', 'jaco_arm_4_joint', 'jaco_arm_5_joint', 'jaco_finger_joint_0', 'jaco_finger_joint_2', 'jaco_finger_joint_4']


    rospy.init_node('contact_publisher')
    rate = rospy.Rate(60)

    fingerValues = [[], [], []]

    count = 0
    
    while not rospy.is_shutdown():
        msg.position[0:6] = jointsPos
        msg.position[6:9] = fingersPos

        #print(msg.position)
        pub.publish(msg)
      
        if waiting:
            #print("waiting")
            pass
        elif runTest:
            #print("running ", count)
            if count < 300:            
                fingerValues[0].append(fingersPos[0])
                fingerValues[1].append(fingersPos[1])
                fingerValues[2].append(fingersPos[2])
                count += 1
            elif count == 300:
                jointsPos = [4.5532, 4.55069, 0.703853, 5.46553, 1.5063, 3.13586]
                count += 1
                print("Homing")
            elif count < 600:      
                fingerValues[0].append(fingersPos[0])
                fingerValues[1].append(fingersPos[1])
                fingerValues[2].append(fingersPos[2])
                count += 1
            else:
                runTest = False
                count = 0 
                print("Done Testing!")
        elif recordingTest:
            print(len(fingerValues[0]))
            print(cubeCompressionMax)
            print("Ended test!")
            recordingTest = False
            waiting = True


        rate.sleep()

        
