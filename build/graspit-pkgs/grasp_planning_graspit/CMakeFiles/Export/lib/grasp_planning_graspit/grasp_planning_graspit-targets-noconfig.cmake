#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "grasp_planning_graspit" for configuration ""
set_property(TARGET grasp_planning_graspit APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(grasp_planning_graspit PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "/usr/lib/x86_64-linux-gnu/libboost_filesystem.so;/usr/lib/x86_64-linux-gnu/libboost_system.so;/usr/lib/x86_64-linux-gnu/libboost_thread.so;/usr/lib/x86_64-linux-gnu/libboost_program_options.so;/usr/lib/x86_64-linux-gnu/libboost_chrono.so;/usr/lib/x86_64-linux-gnu/libboost_date_time.so;/usr/lib/x86_64-linux-gnu/libboost_atomic.so;/usr/lib/x86_64-linux-gnu/libpthread.so;/opt/ros/melodic/lib/libeigen_conversions.so;/opt/ros/melodic/lib/liborocos-kdl.so.1.4.0;/opt/ros/melodic/lib/libroscpp_serialization.so;/opt/ros/melodic/lib/librostime.so;/opt/ros/melodic/lib/libcpp_common.so;/usr/lib/x86_64-linux-gnu/libboost_system.so;/usr/lib/x86_64-linux-gnu/libboost_thread.so;/usr/lib/x86_64-linux-gnu/libboost_chrono.so;/usr/lib/x86_64-linux-gnu/libboost_date_time.so;/usr/lib/x86_64-linux-gnu/libboost_atomic.so;/usr/lib/x86_64-linux-gnu/libpthread.so;/usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4;graspit"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libgrasp_planning_graspit.so"
  IMPORTED_SONAME_NOCONFIG "libgrasp_planning_graspit.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS grasp_planning_graspit )
list(APPEND _IMPORT_CHECK_FILES_FOR_grasp_planning_graspit "${_IMPORT_PREFIX}/lib/libgrasp_planning_graspit.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
