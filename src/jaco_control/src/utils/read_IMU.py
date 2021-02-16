# IMU reading class, including some calculations based on IMU readings.
from geometry_msgs.msg import *
from utils.viconlib import *
import rospy



class ArmIMU:
    def __init__(self, l_upperarm=0.3, l_forearm=0.4):
        self.wRotQ = [0, 0, 0, 1]
        self.uRotQ = [0, 0, 0, 1]
        self.fRotQ = [0, 0, 0, 1]
        self.length_forearm = l_forearm
        self.length_upperarm = l_upperarm
        self.elbow = [0, 0, 0]
        self.wrist = [0, 0, 0]
        self.correction_angle = -30
    
    def getWristRot(self):
        rospy.wait_for_message("/imuWristQ", geometry_msgs.msg.Quaternion)
        # print 'listener obtained message for wrist rotation. '
        return self.wRotQ
    
    def setWristRot(self, data):
        # print data
        self.wRotQ[0] = data.x
        self.wRotQ[1] = data.y
        self.wRotQ[2] = data.z
        self.wRotQ[3] = data.w
    
    def getForeRot(self):
        rospy.wait_for_message("/imuForearmQ", geometry_msgs.msg.Quaternion)
        # print 'listener obtained message for fore arm rotation. '
        return self.fRotQ
    
    def setForeRot(self, data):
        # print data
        self.fRotQ[0] = data.x
        self.fRotQ[1] = data.y
        self.fRotQ[2] = data.z
        self.fRotQ[3] = data.w
    
    def getUpperRot(self):
        rospy.wait_for_message("/imuUpperarmQ", geometry_msgs.msg.Quaternion)
        # print 'listener obtained message for upper arm rotation. '
        return self.uRotQ
    
    def setUpperRot(self, data):
        # print data
        self.uRotQ[0] = data.x
        self.uRotQ[1] = data.y
        self.uRotQ[2] = data.z
        self.uRotQ[3] = data.w

    def angle_correct(self, ee):
        # transfer IMU angles to human facing frame.
        # correct position
        ee_human = rotz33(self.correction_angle * np.pi/180) * np.matrix([[ee[0]], [ee[1]], [ee[2]]])
        ee_corret = [0, 0, 0]
        ee_corret[0] = ee_human[0].item(0)
        ee_corret[1] = ee_human[1].item(0)
        ee_corret[2] = ee_human[2].item(0)

        # correct rotation
        R_imu = Quaternion2RotationMatrix(self.wRotQ)
        R_human = rotz33(self.correction_angle * np.pi/180) * R_imu
        eq = RotationMatrix2Quaternion(R_human)
        return ee_corret, eq, R_human
    
    def get_shoulder_joints(self):
        # get the human first two joint angles
        self.cal_humanFK()
    
        # calculate theta2
        l1 = self.length_upperarm
        s2 = -self.elbow[0]/l1
        theta2 = np.arcsin(s2).item(0)  # theta2 from -pi/2 to pi/2
    
        # calculate theta1
        c2 = np.cos(theta2)
        s1 = self.elbow[1]/c2/l1
        theta1 = np.arcsin(s1).item(0)  # theta1 from -pi/2 to pi/2
        return theta1, theta2
    
    def get_flex(self):
        self.cal_humanFK()
        
        dist_wrist = np.linalg.norm(self.wrist)
        # law of cosine
        cos_elbow = (self.length_upperarm * self.length_upperarm + self.length_forearm * self.length_forearm -
                     dist_wrist * dist_wrist)/2/self.length_upperarm/self.length_forearm
        flex = np.arccos(cos_elbow)
        return flex

    def cal_humanFK(self):
        # calculates human arm FK position from IMU data. this calculation is in the IMU frame.
        # using upper arm IMU, calculate elbow position,
        elbow_vec = np.matrix([[self.length_upperarm], [0], [0]])  # the vector representing upper arm.
        wrist_vec = np.matrix([[self.length_forearm], [0], [0]])  # the vector representing fore arm.
        
        # calculate rotation matrixs. 
        elbow_rot = Quaternion2RotationMatrix(self.uRotQ)
        wrist_rot = Quaternion2RotationMatrix(self.fRotQ)
    
        elbow_vec = elbow_rot * elbow_vec
        wrist_vec = wrist_rot * wrist_vec
        wrist_pos = elbow_vec + wrist_vec

        self.elbow = [elbow_vec[0][0].item(0), elbow_vec[1][0].item(0), elbow_vec[2][0].item(0)]
        self.wrist = [wrist_pos[0][0].item(0), wrist_pos[1][0].item(0), wrist_pos[2][0].item(0)]

        return [wrist_pos[0][0].item(0), wrist_pos[1][0].item(0), wrist_pos[2][0].item(0)], \
               [elbow_vec[0][0].item(0), elbow_vec[1][0].item(0), elbow_vec[2][0].item(0)]

    def setup(self):
        rospy.Subscriber("/imuUpperarmQ", geometry_msgs.msg.Quaternion, self.setUpperRot)
        rospy.Subscriber("/imuForearmQ", geometry_msgs.msg.Quaternion, self.setForeRot)
        rospy.Subscriber("/imuWristQ", geometry_msgs.msg.Quaternion, self.setWristRot)


