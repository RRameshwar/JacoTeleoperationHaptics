# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "grasp_planning_graspit_msgs: 0 messages, 3 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(grasp_planning_graspit_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv" NAME_WE)
add_custom_target(_grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "grasp_planning_graspit_msgs" "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv" ""
)

get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv" NAME_WE)
add_custom_target(_grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "grasp_planning_graspit_msgs" "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv" NAME_WE)
add_custom_target(_grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "grasp_planning_graspit_msgs" "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grasp_planning_graspit_msgs
)
_generate_srv_cpp(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grasp_planning_graspit_msgs
)
_generate_srv_cpp(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grasp_planning_graspit_msgs
)

### Generating Module File
_generate_module_cpp(grasp_planning_graspit_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grasp_planning_graspit_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(grasp_planning_graspit_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(grasp_planning_graspit_msgs_generate_messages grasp_planning_graspit_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_cpp _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_cpp _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_cpp _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(grasp_planning_graspit_msgs_gencpp)
add_dependencies(grasp_planning_graspit_msgs_gencpp grasp_planning_graspit_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS grasp_planning_graspit_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grasp_planning_graspit_msgs
)
_generate_srv_eus(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grasp_planning_graspit_msgs
)
_generate_srv_eus(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grasp_planning_graspit_msgs
)

### Generating Module File
_generate_module_eus(grasp_planning_graspit_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grasp_planning_graspit_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(grasp_planning_graspit_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(grasp_planning_graspit_msgs_generate_messages grasp_planning_graspit_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_eus _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_eus _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_eus _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(grasp_planning_graspit_msgs_geneus)
add_dependencies(grasp_planning_graspit_msgs_geneus grasp_planning_graspit_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS grasp_planning_graspit_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grasp_planning_graspit_msgs
)
_generate_srv_lisp(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grasp_planning_graspit_msgs
)
_generate_srv_lisp(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grasp_planning_graspit_msgs
)

### Generating Module File
_generate_module_lisp(grasp_planning_graspit_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grasp_planning_graspit_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(grasp_planning_graspit_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(grasp_planning_graspit_msgs_generate_messages grasp_planning_graspit_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_lisp _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_lisp _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_lisp _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(grasp_planning_graspit_msgs_genlisp)
add_dependencies(grasp_planning_graspit_msgs_genlisp grasp_planning_graspit_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS grasp_planning_graspit_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grasp_planning_graspit_msgs
)
_generate_srv_nodejs(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grasp_planning_graspit_msgs
)
_generate_srv_nodejs(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grasp_planning_graspit_msgs
)

### Generating Module File
_generate_module_nodejs(grasp_planning_graspit_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grasp_planning_graspit_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(grasp_planning_graspit_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(grasp_planning_graspit_msgs_generate_messages grasp_planning_graspit_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_nodejs _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_nodejs _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_nodejs _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(grasp_planning_graspit_msgs_gennodejs)
add_dependencies(grasp_planning_graspit_msgs_gennodejs grasp_planning_graspit_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS grasp_planning_graspit_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grasp_planning_graspit_msgs
)
_generate_srv_py(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grasp_planning_graspit_msgs
)
_generate_srv_py(grasp_planning_graspit_msgs
  "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grasp_planning_graspit_msgs
)

### Generating Module File
_generate_module_py(grasp_planning_graspit_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grasp_planning_graspit_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(grasp_planning_graspit_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(grasp_planning_graspit_msgs_generate_messages grasp_planning_graspit_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_py _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_py _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv" NAME_WE)
add_dependencies(grasp_planning_graspit_msgs_generate_messages_py _grasp_planning_graspit_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(grasp_planning_graspit_msgs_genpy)
add_dependencies(grasp_planning_graspit_msgs_genpy grasp_planning_graspit_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS grasp_planning_graspit_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grasp_planning_graspit_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/grasp_planning_graspit_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grasp_planning_graspit_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/grasp_planning_graspit_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grasp_planning_graspit_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/grasp_planning_graspit_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grasp_planning_graspit_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/grasp_planning_graspit_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grasp_planning_graspit_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grasp_planning_graspit_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/grasp_planning_graspit_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(grasp_planning_graspit_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
