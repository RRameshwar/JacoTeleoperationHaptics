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

global fingersPos
fingersPos = []

global haptics_plot
haptics_plot = []

global fingers_plot
fingers_plot = [[], [], [], [], []]

global capturinghaptics
capturinghaptics = False

def fingersPosCallback(msg):
    global fingers_plot
    global capturinghaptics
    # for i in range(0,5):
    #     fingers_plot[i].append(msg.data[i])
    if capturinghaptics:
        for i in range(0,5):
            fingers_plot[i].append(msg.data[i])
        capturinghaptics = False

def hapticCallback(msg):
    global haptics_plot
    global capturinghaptics
    
    capturinghaptics = True

    if capturinghaptics:
        haptics_plot.append(msg.data[0])
        print("yay")

if __name__ == '__main__':

    if os.path.exists("curvatures_open_Pressure.csv"):
        os.remove("curvatures_open_Pressure.csv")
    else:
        pass

    rospy.init_node('jaco_control_node', anonymous = True)
    msg = Int16()
    rospy.Subscriber("haptics_filtered", Int16MultiArray, hapticCallback)
    rospy.Subscriber("fingersPos", Float32MultiArray, fingersPosCallback)

    global fingers_plot
    global haptics_plot

    while not rospy.is_shutdown():
        pass

    print(len(haptics_plot))
    print(len(fingers_plot[0]))

    with open('curvatures_open_Pressure.csv', 'wb') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(haptics_plot)
        for i in range(0,5):
            writer.writerow(fingers_plot[i])

    time = np.linspace(0, len(haptics_plot), len(haptics_plot))
    
    plt.figure()
    plt.plot(time, haptics_plot, label='Haptics Value')
    plt.plot(time, fingers_plot[0], label='Thumb Sensor')
    plt.plot(time, fingers_plot[1], label='Pointer Sensor')
    plt.plot(time, fingers_plot[2], label='Middle Sensor')
    plt.plot(time, fingers_plot[3], label='Ring Sensor')
    plt.plot(time, fingers_plot[4], label='Pinky Sensor')
    
    plt.legend()
    plt.title('Haptics Test')

    plt.show()


