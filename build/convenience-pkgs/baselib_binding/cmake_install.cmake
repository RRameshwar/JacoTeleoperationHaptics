# Install script for directory: /home/rrameshwar/JacoTeleoperationHaptics/src/convenience-pkgs/baselib_binding

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/rrameshwar/JacoTeleoperationHaptics/build/convenience-pkgs/baselib_binding/catkin_generated/installspace/baselib_binding.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/baselib_binding/cmake" TYPE FILE FILES "/home/rrameshwar/JacoTeleoperationHaptics/src/convenience-pkgs/baselib_binding/cmake/baselib_bindingConfigExtras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/baselib_binding/cmake" TYPE FILE FILES
    "/home/rrameshwar/JacoTeleoperationHaptics/build/convenience-pkgs/baselib_binding/catkin_generated/installspace/baselib_bindingConfig.cmake"
    "/home/rrameshwar/JacoTeleoperationHaptics/build/convenience-pkgs/baselib_binding/catkin_generated/installspace/baselib_bindingConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/baselib_binding" TYPE FILE FILES "/home/rrameshwar/JacoTeleoperationHaptics/src/convenience-pkgs/baselib_binding/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/baselib_binding" TYPE FILE FILES
    "/home/rrameshwar/JacoTeleoperationHaptics/src/convenience-pkgs/baselib_binding/include/baselib_binding/Thread.h"
    "/home/rrameshwar/JacoTeleoperationHaptics/src/convenience-pkgs/baselib_binding/include/baselib_binding/SharedPtr.h"
    )
endif()

