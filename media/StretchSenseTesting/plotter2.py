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

pressure_data = np.genfromtxt('PressureTest/curvatures_closed_Pressure.csv', delimiter=',', unpack=True)
pressure_data = pressure_data.transpose()

pressure_data_haptics = pressure_data[0]
pressure_data_thumb = pressure_data[1]
pressure_data_pointer = pressure_data[2]
pressure_data_middle = pressure_data[3]

print(len(pressure_data_thumb))

pressure_data_thumb_zero = np.average(pressure_data_thumb[0:25])
pressure_data_pointer_zero = np.average(pressure_data_pointer[0:25])
pressure_data_middle_zero = np.average(pressure_data_middle[0:25])


pressure_data_haptics = pressure_data_haptics[27:len(pressure_data_haptics)]
pressure_data_thumb = pressure_data_thumb[27:len(pressure_data_thumb)]
pressure_data_pointer = pressure_data_pointer[27:len(pressure_data_pointer)]
pressure_data_middle = pressure_data_middle[27:len(pressure_data_middle)]

print(pressure_data_haptics[0])
print(pressure_data_thumb_zero)
print(len(pressure_data_thumb))


time = np.linspace(0,len(pressure_data_thumb),len(pressure_data_thumb))

def butter_lowpass_filter(data, cutoff, fs, order):
    nyq = 0.5 * fs
    normal_cutoff = cutoff / nyq
    # Get the filter coefficients 
    b, a = butter(order, normal_cutoff, btype='low', analog=False)
    y = filtfilt(b, a, data)
    return y


thumb_diff = []
pointer_diff = []
middle_diff = []

for x in pressure_data_thumb:
    thumb_diff.append(x - pressure_data_thumb_zero)

for x in pressure_data_pointer:
    pointer_diff.append(x - pressure_data_pointer_zero)

for x in pressure_data_middle:
	middle_diff.append(x - pressure_data_middle_zero)

thumb_diff_filt = butter_lowpass_filter(thumb_diff, cutoff, fs, order)
pointer_diff_filt = butter_lowpass_filter(pointer_diff, cutoff, fs, order)
middle_diff_filt = butter_lowpass_filter(middle_diff, cutoff, fs, order)

# # plt.figure()
# # plt.plot(time, y1, label="Thumb Sensor Diff")
# # plt.plot(time, y2, label="Pointer Sensor Diff")
# # plt.plot(time, y3, label="Middle Sensor Diff")
# # plt.legend()
# # plt.title('Difference between pressure and no pressure (open fingers)')
# # print(np.average(y1))
# # print(np.average(y2))
# # print(np.average(y3))


test_haptic = pressure_data_haptics
test_thumb = thumb_diff_filt
test_pointer = pointer_diff_filt
test_middle = middle_diff_filt

print(np.where(test_haptic == 0))

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
plt.ylabel("Curvature - Baseline (Glove output)")
plt.xlabel("Haptic Input (PWM value)")
plt.legend()
plt.title('Haptic Value Vs. Thumb Curvature')

plt.figure()
plt.plot(test_haptic, test_pointer, label="Pointer Sensor Diff")
plt.plot(x_line, line_pointer, label="Fitting A Line")
plt.ylabel("Curvature - Baseline (Glove output)")
plt.xlabel("Haptic Input (PWM value)")
plt.legend()
plt.title('Haptic Value Vs. Pointer Curvature')

plt.figure()
plt.plot(test_haptic, test_middle, label="Middle Sensor Diff")
plt.plot(x_line, line_middle, label="Fitting A Line")
plt.ylabel("Curvature - Baseline (Glove output)")
plt.xlabel("Haptic Input (PWM value)")
plt.legend()
plt.title('Haptic Value Vs. Middle Curvature')


plt.show()

