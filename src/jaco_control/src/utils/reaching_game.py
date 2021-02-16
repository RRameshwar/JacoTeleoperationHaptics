# this file defines a simple reaching for testing IMU arm mapping from to Jaco arm. 
from gazebo_msgs.msg import *
import numpy as np
from pykdl_utils.kdl_kinematics import KDLKinematics
import rospy
from utils.viconlib import *
import time
import csv
import datetime


class ReachingGame:
    def __init__(self, robot):
        self.reaching_bound_pos = 0.03
        self.reaching_bound_rot = 0.3
        self.reaching_target = [[0.5, 0.05, 0.8, -1.0, 0.0, 0.0, 6.123233995736766e-17], 
                                [0.5, 0, 0.9, -1.0, 0.0, 0.0, 6.123233995736766e-17],
                                [0.45, 0.15, 0.9, -1.0, 0.0, 0.0, 6.123233995736766e-17],
                                [0.4, 0.1, 0.9, -0.9659258262890683, 1.5848e-17, -0.2588, 5.91e-17],
                                [0.4, 0.1, 0.9, -0.8660254037844387, 3.0616e-17, -0.4999, 5.30e-17],
                                [0.45, 0.15, 0.9, -0.7500000000000001, -0.24999999999999986, -0.4330127018922193, -0.4330127018922192]]
        self.num_target = len(self.reaching_target)
        self.CubeState = LinkState()
        self.CubeState.link_name = "jaco_on_table::Cube3" 
        self.CubeState.reference_frame = "jaco_on_table::robot_base"
        cube_topic = "/gazebo/set_link_state"
        self.pub_cube = rospy.Publisher(cube_topic, gazebo_msgs.msg.LinkState, queue_size=1)
        self.kdl_kin = KDLKinematics(robot, "robot_base", "jaco_fingers_base_link")
        self.current_target = 0
        self.end_game = False
        self.time_taken = [0] * self.num_target
        self.current_time = time.time()

    def game_start(self):
        self.set_target(self.current_target)

    def set_target(self, i):
        self.CubeState.pose.position.x = self.reaching_target[i][0]
        self.CubeState.pose.position.y = self.reaching_target[i][1]
        self.CubeState.pose.position.z = self.reaching_target[i][2]
        self.CubeState.pose.orientation.x = self.reaching_target[i][3]
        self.CubeState.pose.orientation.y = self.reaching_target[i][4]
        self.CubeState.pose.orientation.z = self.reaching_target[i][5]
        self.CubeState.pose.orientation.w = self.reaching_target[i][6]
        self.pub_cube.publish(self.CubeState)
        print "Target set to ", self.current_target

    def test_reached(self, currentJointState):
        self.pub_cube.publish(self.CubeState)
        # test if the current position is reached within a bound
        cur_pose = self.kdl_kin.forward(currentJointState)
        cur_q = RotationMatrix2Quaternion(cur_pose[0:3, 0:3])
        current = [cur_pose[0, 3].item(0), cur_pose[1, 3].item(0), cur_pose[2, 3].item(0), 
                   cur_q[0], cur_q[1], cur_q[2], cur_q[3]]

        target = self.reaching_target[self.current_target]
        # print target[0] - current[0], target[1] - current[1], target[2] - current[2]
        for i in range(3):
            if np.abs(target[i] - current[i]) > self.reaching_bound_pos:
                return
        target_rot = Quaternion2EulerXYZ(target[3:])
        current_rot = Quaternion2EulerXYZ(current[3:])
        # test_rot = rotx33(current_rot[0]) * roty33(current_rot[1]) * rotz33(current_rot[2])
        # print test_rot - cur_pose[0:3, 0:3]
        print target_rot[0] - current_rot[0], target_rot[1] - current_rot[1]
        # print current_rot
        for i in range(2):
            # print np.abs(np.min([target_rot[i] - current_rot[i], target_rot[i] - current_rot[i] - 2*np.pi,
            # target_rot[i] - current_rot[i] + 2*np.pi]))
            if np.min([np.abs(target_rot[i] - current_rot[i]), np.abs(target_rot[i] - current_rot[i] - 2*np.pi),
                       np.abs(target_rot[i] - current_rot[i] + 2*np.pi)]) > self.reaching_bound_rot:
                return

        # passed all test
        # record time taken
        self.time_taken[int(self.current_target)] = time.time() - self.current_time
        self.current_time = time.time()
        self.current_target = self.current_target + 1
        if self.current_target == self.num_target:
            self.end_game = True
            return
        self.set_target(self.current_target)

    def log_data(self, IK_method, subject):
        with open("../TimeTaken.csv", 'a') as writeFile:
            writer = csv.writer(writeFile)
            data = [IK_method]
            for i in range(self.num_target):
                data.append(str(self.time_taken[i]))
            data.append(subject)
            data.append(str(datetime.datetime.now()))
            writer.writerow(data)
