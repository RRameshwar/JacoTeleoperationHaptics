import numpy as np
import math


def rotx(x):
    re = np.matrix([[1.0, 0.0, 0.0, 0.0],
                    [0, np.cos(x), -np.sin(x), 0],
                    [0, np.sin(x), np.cos(x), 0],
                    [0, 0, 0, 1]])
    return re


def rotx33(x):
    re = np.matrix([[1.0, 0.0, 0.0],
                    [0, np.cos(x), -np.sin(x)],
                    [0, np.sin(x), np.cos(x)]])
    return re


def roty(x):
    re = np.matrix([[np.cos(x), 0, np.sin(x), 0],
                   [0, 1, 0, 0],
                   [-np.sin(x), 0, np.cos(x), 0],
                   [0, 0, 0, 1]])
    return re


def roty33(x):
    re = np.matrix([[np.cos(x), 0, np.sin(x)],
                   [0, 1, 0],
                   [-np.sin(x), 0, np.cos(x)]])
    return re


def rotz(x):
    re = np.matrix([[np.cos(x), -np.sin(x), 0, 0],
                   [np.sin(x), np.cos(x), 0, 0],
                   [0, 0, 1, 0],
                   [0, 0, 0, 1]])
    return re


def rotz33(x):
    re = np.matrix([[np.cos(x), -np.sin(x), 0],
                   [np.sin(x), np.cos(x), 0],
                   [0, 0, 1]])
    return re


def transx(x):
    re = np.matrix([[1, 0, 0, x],
                   [0, 1, 0, 0],
                   [0, 0, 1, 0],
                   [0, 0, 0, 1]])
    return re


def transy(y):
    re = np.matrix([[1, 0, 0, 0],
                   [0, 1, 0, y],
                   [0, 0, 1, 0],
                   [0, 0, 0, 1]])
    return re


def transz(z):
    re = np.matrix([[1, 0, 0, 0],
                   [0, 1, 0, 0],
                   [0, 0, 1, z],
                   [0, 0, 0, 1]])
    return re


# calculates the inverse of transformation function
def inver_t(t):  # is matrix
    r = t[0:3, 0:3]
    r_inver = r.transpose()
    p = t[0:3, 3]
    p_inver = -np.matmul(r_inver, p)
    t_inver = np.matrix([[r_inver[0, 0], r_inver[0, 1], r_inver[0, 2], p_inver[0, 0]],
                        [r_inver[1, 0], r_inver[1, 1], r_inver[1, 2], p_inver[1, 0]],
                        [r_inver[2, 0], r_inver[2, 1], r_inver[2, 2], p_inver[2, 0]],
                        [0, 0, 0, 1]])
    return t_inver

def Quaternion2EulerXYZ(Q_raw):
    Q_normed = QuaternionNorm(Q_raw)
    qx_ = Q_normed[0]
    qy_ = Q_normed[1]
    qz_ = Q_normed[2]
    qw_ = Q_normed[3]

    tx_ = math.atan2((2 * qw_ * qx_ - 2 * qy_ * qz_), (qw_ * qw_ - qx_ * qx_ - qy_ * qy_ + qz_ * qz_))
    ty_ = math.asin(2 * qw_ * qy_ + 2 * qx_ * qz_)
    tz_ = math.atan2((2 * qw_ * qz_ - 2 * qx_ * qy_), (qw_ * qw_ + qx_ * qx_ - qy_ * qy_ - qz_ * qz_))
    EulerXYZ_ = [tx_, ty_, tz_]
    return EulerXYZ_


def QuaternionNorm(Q_raw):
    qx_temp, qy_temp, qz_temp, qw_temp = Q_raw[0:4]
    qnorm = math.sqrt(qx_temp * qx_temp + qy_temp * qy_temp + qz_temp * qz_temp + qw_temp * qw_temp)
    qx_ = qx_temp / qnorm
    qy_ = qy_temp / qnorm
    qz_ = qz_temp / qnorm
    qw_ = qw_temp / qnorm
    Q_normed_ = [qx_, qy_, qz_, qw_]
    return Q_normed_


def EulerXYZ2Quaternion(EulerXYZ_):
    tx_, ty_, tz_ = EulerXYZ_[0:3]
    sx = math.sin(0.5 * tx_)
    cx = math.cos(0.5 * tx_)
    sy = math.sin(0.5 * ty_)
    cy = math.cos(0.5 * ty_)
    sz = math.sin(0.5 * tz_)
    cz = math.cos(0.5 * tz_)

    qx_ = sx * cy * cz + cx * sy * sz
    qy_ = -sx * cy * sz + cx * sy * cz
    qz_ = sx * sy * cz + cx * cy * sz
    qw_ = -sx * sy * sz + cx * cy * cz

    Q_ = [qx_, qy_, qz_, qw_]
    return Q_


def RotationMatrix2Quaternion(R):  # R is np matrix
    R00 = R[0, 0]
    R01 = R[0, 1]
    R02 = R[0, 2]
    R10 = R[1, 0]
    R11 = R[1, 1]
    R12 = R[1, 2]
    R20 = R[2, 0]
    R21 = R[2, 1]
    R22 = R[2, 2]
    w = np.sqrt(1 + R00 + R11 + R22)/2
    x = (R21 - R12)/4/w
    y = (R02 - R20)/4/w
    z = (R10 - R01)/4/w
    return [x, y, z, w]


def Quaternion2RotationMatrix(Q_raw):
    Q_normed = QuaternionNorm(Q_raw)
    qx_ = Q_normed[0]
    qy_ = Q_normed[1]
    qz_ = Q_normed[2]
    qw_ = Q_normed[3]
    R00 = qw_ * qw_ + qx_ * qx_ - qy_ * qy_ - qz_ * qz_
    R01 = 2 * (qy_ * qx_ - qw_ * qz_)
    R02 = 2 * (qx_ * qz_ + qw_ * qy_)
    R10 = 2 * (qy_ * qx_ + qw_ * qz_)
    R11 = qw_ * qw_ - qx_ * qx_ + qy_ * qy_ - qz_ * qz_
    R12 = 2 * (qy_ * qz_ - qw_ * qx_)
    R20 = 2 * (qx_ * qz_ - qw_ * qy_)
    R21 = 2 * (qy_ * qz_ + qw_ * qx_)
    R22 = qw_ * qw_ - qx_ * qx_ - qy_ * qy_ + qz_ * qz_
    R = np.matrix([[R00, R01, R02], [R10, R11, R12], [R20, R21, R22]])
    return R





