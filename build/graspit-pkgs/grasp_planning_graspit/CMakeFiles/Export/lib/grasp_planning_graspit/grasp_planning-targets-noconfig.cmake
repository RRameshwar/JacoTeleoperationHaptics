#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "grasp_planning" for configuration ""
set_property(TARGET grasp_planning APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(grasp_planning PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/grasp_planning_graspit/grasp_planning"
  )

list(APPEND _IMPORT_CHECK_TARGETS grasp_planning )
list(APPEND _IMPORT_CHECK_FILES_FOR_grasp_planning "${_IMPORT_PREFIX}/lib/grasp_planning_graspit/grasp_planning" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
