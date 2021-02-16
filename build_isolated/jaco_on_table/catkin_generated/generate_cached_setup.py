# -*- coding: utf-8 -*-
from __future__ import print_function

import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/opt/ros/melodic/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/opt/ros/melodic/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in '/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/jaco_moveit;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/jaco_graspit_sample;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/jaco_description;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/jaco_control;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/jaco_arm;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/graspit_tools;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/grasp_planning_graspit_ros;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/grasp_planning_graspit_msgs;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/grasp_planning_graspit;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/grasp_execution_msgs;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/gazebo_world_plugin_loader;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/gazebo_grasp_plugin;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/gazebo_version_helpers;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/convenience_ros_functions;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/arm_components_name_manager;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/convenience_math_functions;/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/baselib_binding;/home/rrameshwar/JacoTeleoperationHaptics/devel;/opt/ros/melodic'.split(';'):
        python_path = os.path.join(workspace, 'lib/python2.7/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/rrameshwar/JacoTeleoperationHaptics/devel_isolated/jaco_on_table/env.sh')

output_filename = '/home/rrameshwar/JacoTeleoperationHaptics/build_isolated/jaco_on_table/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    # print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
