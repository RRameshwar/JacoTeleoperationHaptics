# read IMU directly from python
import serial
import threading
from utils.viconlib import *
import rospy
import time

class PyArmIMU(threading.Thread):
    def __init__(self, l_upperarm=0.3, l_forearm=0.4):
        threading.Thread.__init__(self)
        self.port = serial.Serial('/dev/ttyACM0', 4800)
        self.wRotQ = [0, 0, 0, 1]
        self.uRotQ = [0, 0, 0, 1]
        self.fRotQ = [0, 0, 0, 1]
        self.length_forearm = l_forearm
        self.length_upperarm = l_upperarm
        self.correction_angle = -40
        self.elbow = [0, 0, 0]
        self.wrist = [0, 0, 0]
        self._kill = False
        self.imu_read = False

    def run(self):
        data = [None] * 12
        while not self._kill:
            inputs = self.port.readline()
            # print inputs
            spt = inputs.split("|")
            if len(spt) == 13:
                # time_now = time.time()
                for i in range(12):
                    data[i] = float(spt[i])
                print data
                sums = [data[0]+data[1]+data[2]+data[3], data[4]+data[5]+data[6]+data[7], 
                        data[8]+data[9]+data[10]+data[11]]
                if 0.0 in sums:
                    continue
                if not self.imu_read:
                    self.imu_read = True
                self.fRotQ = [data[0], data[1], data[2], data[3]]
                self.wRotQ = [data[4], data[5], data[6], data[7]]
                self.uRotQ = [data[8], data[9], data[10], data[11]]
                # print time.time() - time_now
            else:
                print inputs
            # print time.time() - time_now
            rospy.sleep(0.01)  # python thread is gready. if no waiting will cause the main code to be slow. 

    def IMU_read(self):
        return self.imu_read

    def getForeArmQ(self):
        return self.fRotQ

    def getWristQ(self):
        return self.wRotQ

    def getUpperArmQ(self):
        return self.uRotQ

    def kill(self):
        self._kill = True

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

