import roslib; roslib.load_manifest('kinova_demo')
import rospy

import sys
import numpy as np
import random

from sensor_msgs import JointState



if __name__ == '__main__':
    pub = rospy.Publisher('/jaco/joint_control', JointState, queue_size=1000)
    rospy.Subscriber("fingersPos", Int16, fingersPosCallback)
    rospy.Subscriber('/jaco/joint_state', JointState, jointStateCallback)


    while not rospy.is_shutdown():
    	position_msg = [1, 1, 1, 1, 1, 1]
    	pub.publish(position_msg)