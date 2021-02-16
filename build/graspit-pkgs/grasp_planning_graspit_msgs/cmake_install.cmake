# Install script for directory: /home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/rrameshwar/JacoTeleoperationHaptics/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasp_planning_graspit_msgs/srv" TYPE FILE FILES
    "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/LoadDatabaseModel.srv"
    "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/AddToDatabase.srv"
    "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/srv/SaveWorld.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasp_planning_graspit_msgs/cmake" TYPE FILE FILES "/home/rrameshwar/JacoTeleoperationHaptics/build/graspit-pkgs/grasp_planning_graspit_msgs/catkin_generated/installspace/grasp_planning_graspit_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/rrameshwar/JacoTeleoperationHaptics/devel/include/grasp_planning_graspit_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/rrameshwar/JacoTeleoperationHaptics/devel/share/roseus/ros/grasp_planning_graspit_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/rrameshwar/JacoTeleoperationHaptics/devel/share/common-lisp/ros/grasp_planning_graspit_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/rrameshwar/JacoTeleoperationHaptics/devel/share/gennodejs/ros/grasp_planning_graspit_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/rrameshwar/JacoTeleoperationHaptics/devel/lib/python2.7/dist-packages/grasp_planning_graspit_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/rrameshwar/JacoTeleoperationHaptics/devel/lib/python2.7/dist-packages/grasp_planning_graspit_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/rrameshwar/JacoTeleoperationHaptics/build/graspit-pkgs/grasp_planning_graspit_msgs/catkin_generated/installspace/grasp_planning_graspit_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasp_planning_graspit_msgs/cmake" TYPE FILE FILES "/home/rrameshwar/JacoTeleoperationHaptics/build/graspit-pkgs/grasp_planning_graspit_msgs/catkin_generated/installspace/grasp_planning_graspit_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasp_planning_graspit_msgs/cmake" TYPE FILE FILES
    "/home/rrameshwar/JacoTeleoperationHaptics/build/graspit-pkgs/grasp_planning_graspit_msgs/catkin_generated/installspace/grasp_planning_graspit_msgsConfig.cmake"
    "/home/rrameshwar/JacoTeleoperationHaptics/build/graspit-pkgs/grasp_planning_graspit_msgs/catkin_generated/installspace/grasp_planning_graspit_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/grasp_planning_graspit_msgs" TYPE FILE FILES "/home/rrameshwar/JacoTeleoperationHaptics/src/graspit-pkgs/grasp_planning_graspit_msgs/package.xml")
endif()

