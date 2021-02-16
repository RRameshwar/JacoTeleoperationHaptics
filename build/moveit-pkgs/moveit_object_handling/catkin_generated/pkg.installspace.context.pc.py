# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "geometry_msgs;sensor_msgs;moveit_msgs;roscpp;shape_msgs;std_msgs;eigen_conversions;convenience_ros_functions".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lmoveit_grasped_object_handler;-lmoveit_collision_matrix_manipulator".split(';') if "-lmoveit_grasped_object_handler;-lmoveit_collision_matrix_manipulator" != "" else []
PROJECT_NAME = "moveit_object_handling"
PROJECT_SPACE_DIR = "/home/rrameshwar/JacoTeleoperationHaptics/install"
PROJECT_VERSION = "1.0.4"
