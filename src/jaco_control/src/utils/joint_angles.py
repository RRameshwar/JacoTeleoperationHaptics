# this file read current joint angles and send joint angle commands. 
from sensor_msgs.msg import JointState
import rospy
import actionlib


class JointAngles:
    def __init__(self, is_simulation=True):
        self.is_simulation = is_simulation
        if self.is_simulation:
            self.sub_topic_name = "/jaco/joint_state"
            self.pub_topic_name = "/jaco/joint_control"
            self.joint_state_pub = rospy.Publisher(self.pub_topic_name, JointState, queue_size=1)
        else:
            self.sub_topic_name = topic_address = '/' + 'jaco_srl_' + 'driver/out/joint_angles'
            self.action_address = '/' + 'jaco_srl_' + 'driver/joints_action/joint_angles'

        self.JointAngles = [0, 0, 0, 0, 0, 0]

    def getcurrentJointPose(self):
        # wait to get current position
        if self.is_simulation:
            rospy.Subscriber(self.sub_topic_name, JointState, self.setcurrentJointPose)
            rospy.wait_for_message(self.sub_topic_name, JointState)
        else:
            rospy.Subscriber(self.sub_topic_name, kinova_msgs.msg.JointAngles, self.setcurrentJointPose)
            rospy.wait_for_message(self.sub_topic_name, kinova_msgs.msg.JointAngles)
        # print 'position listener obtained message for joint pose. '
        return self.JointAngles

    def setcurrentJointPose(self, feedback):
        if self.is_simulation:
            self.JointAngles = [feedback.position[1], feedback.position[2], feedback.position[3],
                                feedback.position[4], feedback.position[5], feedback.position[6]]
        else:
            self.JointAngles = [feedback.joint1, feedback.joint2, feedback.joint3,
                                feedback.joint4, feedback.joint5, feedback.joint6]

    
    def moveJoint(self, joints):
        if self.is_simulation:
            joint_states = JointState()
            joint_states.name = ['base_to_jaco_on_table', 'jaco_arm_0_joint', 'jaco_arm_1_joint',
                                 'jaco_arm_2_joint', 'jaco_arm_3_joint', 'jaco_arm_4_joint',
                                 'jaco_arm_5_joint', 'jaco_finger_joint_0', 'jaco_finger_joint_2', 'jaco_finger_joint_4']
            joint_states.position = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            joint_states.velocity = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            joint_states.effort = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            joint_states.position[1] = joints[0]
            joint_states.position[2] = joints[1]
            joint_states.position[3] = joints[2]
            joint_states.position[4] = joints[3]
            joint_states.position[5] = joints[4]
            joint_states.position[6] = joints[5]
            if len(joints) > 6:
                joint_states.position[7] = joints[6]
                joint_states.position[8] = joints[7]
                joint_states.position[9] = joints[8]
            self.joint_state_pub.publish(joint_states)
        else:
    
            client = actionlib.SimpleActionClient(self.action_address,
                                                  kinova_msgs.msg.ArmJointAnglesAction)
            client.wait_for_server()
        
            goal = kinova_msgs.msg.ArmJointAnglesGoal()
        
            goal.angles.joint1 = joints[0]
            goal.angles.joint2 = joints[1]
            goal.angles.joint3 = joints[2]
            goal.angles.joint4 = joints[3]
            goal.angles.joint5 = joints[4]
            goal.angles.joint6 = joints[5]
            # goal.angles.joint7 = angle_set[6]
        
            client.send_goal(goal)
            # if client.wait_for_result(rospy.Duration(20)):
            #     return client.get_result()
            # else:
            #     print('        the joint angle action timed-out')
            #     client.cancel_all_goals()
            # return None
