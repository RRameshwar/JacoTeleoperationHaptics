# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;sensor_msgs;control_msgs;trajectory_msgs;actionlib_msgs;actionlib;arm_components_name_manager;convenience_math_functions".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-ltrajectory_action_server".split(';') if "-ltrajectory_action_server" != "" else []
PROJECT_NAME = "joint_trajectory_execution"
PROJECT_SPACE_DIR = "/home/rrameshwar/JacoTeleoperationHaptics/install_isolated"
PROJECT_VERSION = "0.0.0"
