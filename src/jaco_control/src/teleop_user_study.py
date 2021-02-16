#! /usr/bin/env python
# this files teleoperates the physical robot. 
# teleop_method is partIK_talbe, with first three joint IK for position and last three joint IK for orientation
# workspace is mapped. Using joint velocity command. 
# to use, do: python teleop_partIK_vel.py subject_name true/false(for data recoding)
# this is the final code used for user study.  by Sihui Li 03/2019
import rospy
from trac_ik_python.trac_ik import IK
#from pykdl_utils.kdl_kinematics import KDLKinematics
from PyKDL import *
from urdf_parser_py.urdf import URDF
from utils.viconlib import *
# from utils.reaching_game import *
from utils.joint_angles import *
from utils.read_IMU import *
# from utils.record_data import *
# import csv
import threading
import numpy as np
import termios, fcntl, sys, os
import datetime
import time
import csv

from sensor_msgs.msg import JointState

length_upperarm = 0.26
length_forearm = 0.30
z_safebound = 0.10
xy_safebound_max = 0.53
xy_safebound_min = 0.10
angle_min = 0.0285689913324063
angle_max = 1.6192561843441901
dist_max = 0.5024078095817711
dist_min = 0.383501076062373
last_joint_correction = 60
last_joint_correction_radius = last_joint_correction / 180 * np.pi
lower_limits = [np.pi * 1.5, np.pi/2.0, np.pi, -np.pi, -np.pi, -np.pi]
upper_limits = [np.pi * 2.0, np.pi-0.17, np.pi*2.0, np.pi, np.pi, np.pi]


class VelController(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self)
        self._kill = False
        self.topic = '/jaco/joint_control/in/joint_velocity'
        self.topic_name = ['jaco_arm_0_joint', 'jaco_arm_1_joint', 'jaco_arm_2_joint', 'jaco_arm_3_joint', 'jaco_arm_4_joint', 
            'jaco_arm_5_joint', 'jaco_finger_joint_0', 'jaco_finger_joint_2', 'jaco_finger_joint_4']
        self.pub = rospy.Publisher(self.topic, JointState, queue_size=1)
        self.msg = JointState()
        self.kp = 0.6

    def send_vel(self, vel_input):
        if len(vel_input) != 6:
            print "Invalid velocity command."
        self.msg.velocity = vel_input
    
    def put_in_range(self, angles):
        for i in range(3):
            if angles[i] < lower_limits[i] * 180.0/np.pi or angles[i] > upper_limits[i] * 180.0/np.pi:
                print "angle ", i+1, " is out of range", angles[i]
                if angles[i] > upper_limits[i] * 180.0/np.pi:
                    angles[i] = upper_limits[i] * 180.0/np.pi
                else:
                    angles[i] = lower_limits[i] * 180.0/np.pi
        for i in range(3, 6):
            if angles[i] < lower_limits[i] * 180.0/np.pi or angles[i] > upper_limits[i] * 180.0/np.pi:
                num_pi = 1
                print "angle ", i+1, " is out of range", angles[i]
                while True: 
                    angle_temp = angles[i] + 2*180.0*num_pi
                    if lower_limits[i] * 180.0/np.pi <= angle_temp <= upper_limits[i] * 180.0/np.pi:
                        angles[i] = angle_temp
                        print "angle ", i+1, " is put in range", angles[i]
                        break
                    angle_temp = angles[i] - 2*180.0*num_pi
                    if lower_limits[i] * 180.0/np.pi <= angle_temp <= upper_limits[i] * 180.0/np.pi:
                        angles[i] = angle_temp
                        print "angle ", i+1, " is put in range", angles[i]
                        break
                    num_pi = num_pi + 1

        return angles

    def send_target(self, curr, target):
        target = self.put_in_range(target)
        target[5] = target[5] + last_joint_correction
        vel = [self.kp * (target[j] - curr[j]) for j in range(6)] #P control, calculates velocity based on error
        if curr[0] > 360 or curr[0] < 270:
            vel[0] = 0.0
        if curr[1] > 180 or curr[1] < 90:
            vel[1] = 0.0
        if curr[2] > 360 or curr[2] < 180:
            vel[2] = 0.0
        self.send_vel(vel)

    def run(self):
        rate = rospy.Rate(100)  # must be 100 HZ
        while not self._kill:
            self.pub.publish(self.msg)
            # print "vel is, ", [self.vel_command.joint1, self.vel_command.joint2, self.vel_command.joint3,
            #                    self.vel_command.joint4, self.vel_command.joint5, self.vel_command.joint6]
            rate.sleep()

    def kill(self):
        self.send_vel([0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        self._kill = True


def workspace_map(x, y):
    # this maps the humans workspace to the robot workspace, we need this because robot's workspace is bigger.
    a_dist = (xy_safebound_max - xy_safebound_min) / (dist_max - dist_min)
    b_dist = xy_safebound_min - a_dist * dist_min
    dist = np.sqrt(x * x + y * y)
    dist_correct = a_dist * dist + b_dist

    a_angle = np.pi / 2 / (angle_max - angle_min)
    b_angle = -a_angle * angle_min
    current_angle = np.arccos(x / dist)
    angle_correct = a_angle * current_angle + b_angle

    x_correct = np.cos(angle_correct) * dist_correct
    y_correct = np.sin(angle_correct) * dist_correct
    return x_correct, y_correct


def first3IK(x, y, z):
    joint1 = np.arctan2(y, x)
    if joint1 > np.pi/2 or joint1 < 0:
        print "Invalid joint1"
        return None
    l1 = 0.15675 + 0.11875
    l2 = 0.41 
    l3 = 0.2073
    c2 = x * x + y * y + (z - l1) * (z - l1)
    a2 = l2 * l2
    b2 = l3 * l3
    cos3 = (a2 + b2 - c2)/2/l2/l3
    if abs(cos3) > 1:
        print "Invalid joint3"
        return None
    joint3 = np.arccos(cos3)  # 0 - pi. 
    alpha = np.arctan2(z - l1, np.sqrt(x*x + y*y))
    beta = np.arccos((a2 + c2 - b2)/2/l2/np.sqrt(c2))
    joint2 = beta + alpha
    joint1 = -joint1 + np.pi*2
    joint3 = -joint3 + np.pi*2
    joint2 = joint2 + np.pi/2
    return [joint1, joint2, joint3] 


def teleop_partIK_table(angles, imu, ik_solver3e, kdl_kin03, kdl_kin3e):
    # get human elbow and wrist position
    ee, eb = imu.cal_humanFK()

    # transfer ee position and orientation to human facing frame.
    ee_correct, eq_correct, R_human = imu.angle_correct(ee)
    z_correction = 0.6
    ee_correct[2] = ee_correct[2] + z_correction

    # for safety
    if ee_correct[2] < z_safebound:
        ee_correct[2] = z_safebound

    # map plane workspace:
    ee_correct[0], ee_correct[1] = workspace_map(ee_correct[0], ee_correct[1])
    # print "ee position is: ", [ee_correct[0], ee_correct[1], ee_correct[2]]
    
    # IK for position 
    # joints03 = ik_solver03.get_ik(angles[0:3],
    #                               ee_correct[0], ee_correct[1], ee_correct[2],  # X, Y, Z bounds
    #                               0, 0, 0, 1,  # q (x, y, z, w)
    #                               0.02, 0.02, 0.02,  # X, Y, Z error bounds
    #                               20.0, 20.0, 20.0)  # set bounds big enough so that it won't solve for rotation
    joints03 = first3IK(ee_correct[0], ee_correct[1], ee_correct[2])
    # transfer to "jaco_3_forearm_limb" frame for the IK solver to solve correctly. 
    pose_03 = kdl_kin03.forward(angles[0:3])  # R30
    # change orientation to fit the customized hand
    R_newPalm = np.matrix([[R_human[0, 0], R_human[0, 2], -R_human[0, 1]],
                           [R_human[1, 0], R_human[1, 2], -R_human[1, 1]],
                           [R_human[2, 0], R_human[2, 2], -R_human[2, 1]]])
    # eq_newPalm = RotationMatrix2Quaternion(R_newPalm)
    R_3r = pose_03[0:3, 0:3].transpose() * R_newPalm  # rotation matrix in frame3
    eq = RotationMatrix2Quaternion(R_3r)  # this angle is in frame3

    # get ee position in frame3
    pose_3e = kdl_kin3e.forward(angles[3:])
    ee = [pose_3e[0, 3].item(0), pose_3e[1, 3].item(0), pose_3e[2, 3].item(0)]

    # IK with human wrist position and orientation.
    joints3e = ik_solver3e.get_ik(angles[3:],
                                  ee[0], ee[1], ee[2],  # X, Y, Z bounds
                                  eq[0], eq[1], eq[2], eq[3],  # q (x, y, z, w)
                                  0.5, 0.5, 0.5,  # set bounds big enough so that it won't solve for positon
                                  0.1, 0.1, 0.1)  # Rotation X, Y, Z error bounds)  
    if joints03 and joints3e:
        return [joints03[0], joints03[1], joints03[2], joints3e[0], joints3e[1], joints3e[2]]
    else:
        if not joints03:
            print "joints03 is, ", joints03
        if not joints3e:
            print "joints3e is, ", joints3e
        return None

global currentState
currentState = []

def getcurrentJointPose(msg):
    global currentState
    currentState = msg.position

if __name__ == '__main__':
    global currentState
    # set subject name
    if len(sys.argv) > 1:
        subject_name = sys.argv[1]
    else:
        subject_name = "None"

    # set data recording flag
    if len(sys.argv) > 2:
        is_recording = sys.argv[2]
    else:
        is_recording = "false"

    # initialize ros node
    rospy.init_node('move_robot')

    # setup IK slover
    # Get URDF for Jaco arm
    urdf_str = rospy.get_param('/robot_description')

    # ik_solver03 = IK("jaco_srl_link_base",
    #                  "jaco_srl_link_3",
    #                  urdf_string=urdf_str)
    ik_solver3e = IK("jaco_3_forearm_limb",
                     "jaco_6_hand_limb",
                     urdf_string=urdf_str)
    # set joint limits
    # lower_bound03, upper_bound03 = ik_solver03.get_joint_limits()
    # lower_bound03_list = list(lower_bound03)
    # upper_bound03_list = list(upper_bound03)
    # lower_bound03_list[0] = lower_limits[0]
    # upper_bound03_list[0] = upper_limits[0]
    # lower_bound03_list[1] = lower_limits[1]
    # upper_bound03_list[1] = upper_limits[1]
    # lower_bound03_list[2] = lower_limits[2]
    # upper_bound03_list[2] = upper_limits[2]
    # ik_solver03.set_joint_limits(lower_bound03_list, upper_bound03_list)

    lower_bound3e, upper_bound3e = ik_solver3e.get_joint_limits()
    lower_bound3e_list = list(lower_bound3e)
    upper_bound3e_list = list(upper_bound3e)
    lower_bound3e_list[0] = lower_limits[3]   # joint 4
    upper_bound3e_list[0] = upper_limits[3]
    lower_bound3e_list[1] = lower_limits[4]   # joint 5
    upper_bound3e_list[1] = upper_limits[4]
    # lower_bound3e_list[2] = lower_limits[5] - last_joint_correction_radius  # joint 5
    # upper_bound3e_list[2] = upper_limits[5] - last_joint_correction_radius
    ik_solver3e.set_joint_limits(lower_bound3e_list, upper_bound3e_list)
    
    # setup FK
    robot = URDF.from_parameter_server()
    kdl_kin03 = ChainFkSolverPos(robot, "robot_base", "jaco_3_forearm_limb")
    kdl_kin3e = KDLKinematics(robot, "jaco_3_forearm_limb", "jaco_6_hand_limb")
    kdl_kin0e = KDLKinematics(robot, "robot_base", "jaco_6_hand_limb")

    # setup IMU
    imu = ArmIMU(length_upperarm, length_forearm)
    imu.setup()

    # setup joint angel readings
    rospy.Subscriber("jaco/joint_state", JointState, getcurrentJointPose)


    # Initialize joint angles
    # JA.moveJoint([315, 135, 270, 0, 0, 0, 90])
    rospy.sleep(3)

    # keyboard control
    fd = sys.stdin.fileno()

    oldterm = termios.tcgetattr(fd)
    newattr = termios.tcgetattr(fd)
    newattr[3] = newattr[3] & ~termios.ICANON & ~termios.ECHO
    termios.tcsetattr(fd, termios.TCSANOW, newattr)

    oldflags = fcntl.fcntl(fd, fcntl.F_GETFL)
    fcntl.fcntl(fd, fcntl.F_SETFL, oldflags | os.O_NONBLOCK)

    # setup velcocity controller
    velController = VelController()
    velController.start()

    # setup data recording
    # file_name = "../data/user_study.csv"
    # num_object = 0
    # time_taken = [0.0] * 10
    # total_time_stuck = [0.0] * 10
    # last_time = time.time()
    # time_stuck = 0
    # last_time_stuck = 0
    # drops = [0] * 10
    # falls = [0] * 10
    # object_index = 0
    # object_list = ['Subject Name', 'Bear Feedback', 'Bear', 'Box Feedback', 'Box', 'Bottle Feedback', 'Bottle', 
    #                "Robot Feedback", 'Robot', 'Paper Cup Feedback', 'Paper Cup', 'Time']
    # if is_recording == 'true':
    #     with open(file_name, 'a') as writeFile:
    #         data_writer = csv.writer(writeFile)
    #     DR = DataRecorder()

    print "Initialization completed!"

    # data recording
    # TIMEs = []
    # stuck_TIMEs = []
    # humans = []
    # robots = []
    # humans_rot = []
    # robots_rot = []
    # time_nowww = time.time()
    
    while not rospy.is_shutdown():
        # if isData(0.001):  # check if there is data coming for 1 seconds, if not vel will be set to zero
        #     sig = sys.stdin.read(1)  # read the input.
        # try:
        #     char = sys.stdin.read(1)
        #     if char == '\x1b':
        #         # velController.send_target([0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0])
        #         print "Bye!"
        #         break
        #     if char == 'e':
        #         print "Completed!"
        #         num_object = num_object + 1
        #         time_taken[object_index] = time.time() - last_time - total_time_stuck[object_index]               
        #         time_stuck = 0
        #     if char == 'b':
        #         print "Begun!"
        #         last_time = time.time()
        #     if char == 's':
        #     	print "Arm Stuck!"
        #     	last_time_stuck = time.time()
        #     if char == 'u':
        #     	print "Arm Unstuck!"
        #     	time_stuck = time.time() - last_time_stuck
        #     	total_time_stuck[object_index] += time_stuck 
        #     if char == 'd':
        #     	print "Object Dropped!"
        #     	drops[object_index] += 1
        #     if char == 'f':
        #     	print "Object Fell Over!"
        #     	falls[object_index] += 1


        #     if char == '0':
        #         print 'Bear Feedback'
        #         object_index = int(char)
        #     if char == '1':
        #         print 'Bear'
        #         object_index = int(char)
        #     if char == '2':
        #         print 'Box Feedback'
        #         object_index = int(char)
        #     if char == '3':
        #         print 'Box'
        #         object_index = int(char)
        #     if char == '4':
        #         print 'Bottle Feedback'
        #         object_index = int(char)
        #     if char == '5':
        #         print 'Bottle'
        #         object_index = int(char)
        #     if char == '6':
        #         print "Robot Feedback"
        #         object_index = int(char)
        #     if char == '7':
        #         print 'Robot'
        #         object_index = int(char)
        #     if char == '8':
        #         print 'Paper Cup Feedback'
        #         object_index = int(char)
        #     if char == '9':
        #         print 'Paper Cup'
        #         object_index = int(char)

        # except IOError:
        #     pass
        # get current joint angles
        angles = currentState
        angles_radians = list(map(math.radians, angles))
        # get rotation angles.
        # www = imu.getWristRot()
        # imu.getUpperRot()
        # imu.getForeRot()

        joints = teleop_partIK_table(angles_radians, imu, ik_solver3e, kdl_kin03, kdl_kin3e)

        if joints:
            # print "IK result is: \n", joints
            # home [0.0, 2.9, 1.3, 4.2, 1.4, 0.0]
            joint_degree = list(map(math.degrees, joints))
            # print [joint_degree[0], joint_degree[1], joint_degree[2], joint_degree[3], joint_degree[4], joint_degree[5] + 90]
            joint_degree = [joint_degree[0], joint_degree[1], joint_degree[2], joint_degree[3], joint_degree[4], joint_degree[5]]
            # print joint_degree
            velController.send_target(angles, joint_degree)  # the current angles, and the goal angles.
        else:
            print "No valid IK solution found."
            velController.send_target(angles, angles)  # set zero velocity
            # moveJoint([joint0, joint1, joint2, currentJointState[3], currentJointState[4], currentJointState[5]])
        # if is_recording == 'true':
        #     finger_forces, finger_poses = DR.get_row()
        #     data_writer.writerow([finger_forces, finger_poses, str(datetime.datetime.now())])
        rospy.sleep(0.01)
        # record for data
        ee, eb = imu.cal_humanFK()
        humans.append(ee[2])
        TIMEs.append(time.time() - time_nowww)
        robot_poses = kdl_kin0e.forward(angles_radians)
        robots.append(robot_poses[2, 3].item(0))
        human_z = Quaternion2EulerXYZ(www)[1]
        humans_rot.append(human_z)
        robot_z = Quaternion2EulerXYZ(RotationMatrix2Quaternion(robot_poses[0:3, 0:3]))
        robots_rot.append(robot_z[2])
        print robot_z[2], human_z
    # kill sub threading
    velController.kill()
    termios.tcsetattr(fd, termios.TCSAFLUSH, oldterm)
    fcntl.fcntl(fd, fcntl.F_SETFL, oldflags)
    
    # record time
    print time_taken
    with open(file_name, 'a') as writeFile:
        writer = csv.writer(writeFile)
        data2 = [subject_name]  # second line
        data3 = [subject_name+" Stuck Times"]
        for i in range(10):
            data2.append(str(time_taken[i]))
        for i in range(10):
            data3.append(str(total_time_stuck[i]))
        data2.append(str(datetime.datetime.now()))
        writer.writerow(object_list)
        writer.writerow(data2)
        writer.writerow(data3)
    # record human and robot z direction data for comparison in the paper.
    with open('dataforpaper.csv', 'a') as writeFile2:
        writer2 = csv.writer(writeFile2)
        writer2.writerow(['   '])
        writer2.writerow(TIMEs)
        writer2.writerow(humans)
        writer2.writerow(robots)
        writer2.writerow(humans_rot)
        writer2.writerow(robots_rot)

