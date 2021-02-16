# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "control_msgs;grasp_execution_msgs;roscpp;std_msgs;control_msgs;trajectory_msgs;baselib_binding;arm_components_name_manager;convenience_math_functions;convenience_ros_functions;object_msgs;object_msgs_tools;eigen_conversions;actionlib;actionlib_msgs;moveit_planning_helper;moveit_object_handling;grasp_planning_graspit_ros".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lsimple_grasp_control_server;-lsimple_grasp_action_server;-lsimple_automated_grasp_execution".split(';') if "-lsimple_grasp_control_server;-lsimple_grasp_action_server;-lsimple_automated_grasp_execution" != "" else []
PROJECT_NAME = "grasp_execution"
PROJECT_SPACE_DIR = "/home/rrameshwar/JacoTeleoperationHaptics/install"
PROJECT_VERSION = "0.0.0"
