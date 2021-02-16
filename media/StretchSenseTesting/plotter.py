#!/usr/bin/env python


#import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import butter, filtfilt
from scipy.optimize import curve_fit

avg_1 = []
avg_2 = []
avg_3 = []
avg_4 = []
avg_5 = []

T = 5.0         # Sample Period
fs = 30.0       # sample rate, Hz
cutoff = 2      # desired cutoff frequency of the filter, Hz ,      slightly higher than actual 1.2 Hznyq = 0.5 * fs  # Nyquist Frequencyorder = 2       # sin wave can be approx represented as quadratic
n = int(T * fs) # total number of samples
order = 2

# F11, F12, F13, wrist, F21, F22, F23, F31, F32, F33, F41, F42, F43, F51, F52, F53 = np.loadtxt('StillTest/StretchSense_StillTest.csv', delimiter=',', unpack=True, 
# 	skiprows=1, usecols=(2,3,4,5,6,7,8, 9, 10, 11, 12, 13, 14, 15, 16, 17))

no_pressure_data = np.genfromtxt('PressureTest/curvatures_open_noPressure.csv', delimiter=',', unpack=True)

pressure_data = np.genfromtxt('PressureTest/curvatures_open_Pressure.csv', delimiter=',', unpack=True)

pressure_data_zero = [pressure_data[0][0]

no_pressure_data_cut = []

no_pressure_data = no_pressure_data.transpose()
pressure_data = pressure_data.transpose()

for x in no_pressure_data:
	no_pressure_data_cut.append(x[0:len(pressure_data[0])])

print(len(pressure_data), " ", len(pressure_data[0]))
print(len(no_pressure_data_cut), " ", len(no_pressure_data_cut[0]))


time = np.linspace(0,len(pressure_data[0]),len(pressure_data[0]))

# for i in range(0, len(F11)):
# 	avg_1.append((F11[i]+F12[i]+F13[i])/3)

# for i in range(0, len(F21)):
# 	avg_2.append((F21[i]+F22[i]+F23[i])/3)

# for i in range(0, len(F31)):
# 	avg_3.append((F31[i]+F32[i]+F33[i])/3)

# for i in range(0, len(F41)):
# 	avg_4.append((F41[i]+F42[i]+F43[i])/3)

# for i in range(0, len(F51)):
# 	avg_5.append((F51[i]+F52[i]+F53[i])/3)

def butter_lowpass_filter(data, cutoff, fs, order):
    nyq = 0.5 * fs
    normal_cutoff = cutoff / nyq
    # Get the filter coefficients 
    b, a = butter(order, normal_cutoff, btype='low', analog=False)
    y = filtfilt(b, a, data)
    return y


# plt.figure()
# plt.plot(time, F11, label='Thumb Sensor 1')
# plt.plot(time, F21, label='Pointer Sensor 1')
# plt.plot(time, F31, label='Middle Sensor 1')
# plt.plot(time, F41, label='Ring Sensor 1')
# plt.plot(time, F51, label='Pinkie Sensor 1')
# plt.legend()
# plt.title('First Sensor on Each Finger')

# plt.figure()
# plt.plot(time, F12, label='Thumb Sensor 2')
# plt.plot(time, F22, label='Pointer Sensor 2')
# plt.plot(time, F32, label='Middle Sensor 2')
# plt.plot(time, F42, label='Ring Sensor 2')
# plt.plot(time, F52, label='Pinkie Sensor 2')
# plt.legend()
# plt.title('Second Sensor on Each Finger')

# plt.figure()
# plt.plot(time, F13, label='Thumb Sensor 3')
# plt.plot(time, F23, label='Pointer Sensor 3')
# plt.plot(time, F33, label='Middle Sensor 3')
# plt.plot(time, F43, label='Ring Sensor 3')
# plt.plot(time, F53, label='Pinkie Sensor 3')
# plt.legend()
# plt.title('Third Sensor on Each Finger')

# plt.figure()
# plt.plot(time, avg_1, label='Thumb Sensor avg')
# plt.plot(time, avg_2, label='Pointer Sensor avg')
# plt.plot(time, avg_3, label='Middle Sensor avg')
# plt.plot(time, avg_4, label='Ring Sensor avg')
# plt.plot(time, avg_5, label='Pinkie Sensor avg')
# plt.legend()
# plt.title('Average Sensor on Each Finger')

# plt.figure()
# plt.plot(time, avg_1[0:469], label="Thumb Sensor No Pressure")
# plt.plot(time, avg_2[0:469], label="Pointer Sensor No Pressure")
# plt.plot(time, avg_3[0:469], label="Middle Sensor No Pressure")
# plt.plot(time, a[1], label="Thumb Sensor Pressure")
# plt.plot(time, a[2], label="Pointer Sensor Pressure")
# plt.plot(time, a[3], label="Middle Sensor Pressure")
# plt.legend()
# plt.title('Curvature Readings With and Without Pressure - Closed Fingers')

middle_pressure = pressure_data[3]
middle_pressure_test_diff = []

for x in middle_pressure:
	middle_pressure_test_diff.append(x - middle_pressure[0])

diff_thumb = butter_lowpass_filter(pressure_data[1] - no_pressure_data_cut[0], cutoff, fs, order)
diff_pointer = butter_lowpass_filter(pressure_data[2] - no_pressure_data_cut[1], cutoff, fs, order)
#diff_middle = butter_lowpass_filter(pressure_data[3] - no_pressure_data_cut[2], cutoff, fs, order)
diff_middle = butter_lowpass_filter(middle_pressure_test_diff, cutoff, fs, order)

# plt.figure()
# plt.plot(time, y1, label="Thumb Sensor Diff")
# plt.plot(time, y2, label="Pointer Sensor Diff")
# plt.plot(time, y3, label="Middle Sensor Diff")
# plt.legend()
# plt.title('Difference between pressure and no pressure (open fingers)')
# print(np.average(y1))
# print(np.average(y2))
# print(np.average(y3))


test_haptic = pressure_data[0]
test_thumb = diff_thumb
test_pointer = diff_pointer
test_middle = diff_middle

def objective(x, c, d):
    return c * x + d

def objective2(x, c, d):
    return c * x + d

popt_thumb, _ = curve_fit(objective, test_haptic, test_thumb)
c_thumb, b_thumb = popt_thumb
print('y = %.5f * x + %.5f' % (c_thumb, b_thumb))

popt_pointer, _ = curve_fit(objective, test_haptic, test_pointer)
c_pointer, b_pointer = popt_pointer
print('y = %.5f * x + %.5f' % (c_pointer, b_pointer))

popt_middle, _ = curve_fit(objective, test_haptic, test_middle)
c_middle, b_middle = popt_middle
print('y = %.5f * x + %.5f' % (c_middle, b_middle))

x_line = np.arange(min(test_haptic), max(test_haptic), 1)

line_thumb = objective(x_line, c_thumb, b_thumb)
line_pointer = objective(x_line, c_pointer, b_pointer)
line_middle = objective(x_line, c_middle, b_middle)

plt.figure()
plt.plot(test_haptic, test_thumb, label="Thumb Sensor Diff")
plt.plot(x_line, line_thumb, label="Fitting A Line")
plt.legend()
plt.title('Haptic Value Vs. Thumb Curvature')

plt.figure()
plt.plot(test_haptic, test_pointer, label="Pointer Sensor Diff")
plt.plot(x_line, line_pointer, label="Fitting A Line")
plt.legend()
plt.title('Haptic Value Vs. Pointer Curvature')

plt.figure()
plt.plot(test_haptic, test_middle, label="Middle Sensor Diff")
plt.plot(x_line, line_middle, label="Fitting A Line")
plt.legend()
plt.title('Haptic Value Vs. Thumb Curvature')


plt.show()

