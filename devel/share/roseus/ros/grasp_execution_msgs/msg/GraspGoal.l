;; Auto-generated. Do not edit!


(when (boundp 'grasp_execution_msgs::GraspGoal)
  (if (not (find-package "GRASP_EXECUTION_MSGS"))
    (make-package "GRASP_EXECUTION_MSGS"))
  (shadow 'GraspGoal (find-package "GRASP_EXECUTION_MSGS")))
(unless (find-package "GRASP_EXECUTION_MSGS::GRASPGOAL")
  (make-package "GRASP_EXECUTION_MSGS::GRASPGOAL"))

(in-package "ROS")
;;//! \htmlinclude GraspGoal.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass grasp_execution_msgs::GraspGoal
  :super ros::object
  :slots (_grasp _is_grasp _ignore_effector_pose_ungrasp _gripper_approach_trajectory _gripper_retreat_trajectory _grasp_trajectory _use_custom_tolerances _effector_pos_tolerance _effector_angle_tolerance _joint_angles_tolerance _curr_effector_pose _curr_joint_state ))

(defmethod grasp_execution_msgs::GraspGoal
  (:init
   (&key
    ((:grasp __grasp) (instance grasp_execution_msgs::GraspData :init))
    ((:is_grasp __is_grasp) nil)
    ((:ignore_effector_pose_ungrasp __ignore_effector_pose_ungrasp) nil)
    ((:gripper_approach_trajectory __gripper_approach_trajectory) (instance trajectory_msgs::JointTrajectory :init))
    ((:gripper_retreat_trajectory __gripper_retreat_trajectory) (instance trajectory_msgs::JointTrajectory :init))
    ((:grasp_trajectory __grasp_trajectory) (instance trajectory_msgs::JointTrajectory :init))
    ((:use_custom_tolerances __use_custom_tolerances) nil)
    ((:effector_pos_tolerance __effector_pos_tolerance) 0.0)
    ((:effector_angle_tolerance __effector_angle_tolerance) 0.0)
    ((:joint_angles_tolerance __joint_angles_tolerance) 0.0)
    ((:curr_effector_pose __curr_effector_pose) (instance geometry_msgs::PoseStamped :init))
    ((:curr_joint_state __curr_joint_state) (instance sensor_msgs::JointState :init))
    )
   (send-super :init)
   (setq _grasp __grasp)
   (setq _is_grasp __is_grasp)
   (setq _ignore_effector_pose_ungrasp __ignore_effector_pose_ungrasp)
   (setq _gripper_approach_trajectory __gripper_approach_trajectory)
   (setq _gripper_retreat_trajectory __gripper_retreat_trajectory)
   (setq _grasp_trajectory __grasp_trajectory)
   (setq _use_custom_tolerances __use_custom_tolerances)
   (setq _effector_pos_tolerance (float __effector_pos_tolerance))
   (setq _effector_angle_tolerance (float __effector_angle_tolerance))
   (setq _joint_angles_tolerance (float __joint_angles_tolerance))
   (setq _curr_effector_pose __curr_effector_pose)
   (setq _curr_joint_state __curr_joint_state)
   self)
  (:grasp
   (&rest __grasp)
   (if (keywordp (car __grasp))
       (send* _grasp __grasp)
     (progn
       (if __grasp (setq _grasp (car __grasp)))
       _grasp)))
  (:is_grasp
   (&optional __is_grasp)
   (if __is_grasp (setq _is_grasp __is_grasp)) _is_grasp)
  (:ignore_effector_pose_ungrasp
   (&optional __ignore_effector_pose_ungrasp)
   (if __ignore_effector_pose_ungrasp (setq _ignore_effector_pose_ungrasp __ignore_effector_pose_ungrasp)) _ignore_effector_pose_ungrasp)
  (:gripper_approach_trajectory
   (&rest __gripper_approach_trajectory)
   (if (keywordp (car __gripper_approach_trajectory))
       (send* _gripper_approach_trajectory __gripper_approach_trajectory)
     (progn
       (if __gripper_approach_trajectory (setq _gripper_approach_trajectory (car __gripper_approach_trajectory)))
       _gripper_approach_trajectory)))
  (:gripper_retreat_trajectory
   (&rest __gripper_retreat_trajectory)
   (if (keywordp (car __gripper_retreat_trajectory))
       (send* _gripper_retreat_trajectory __gripper_retreat_trajectory)
     (progn
       (if __gripper_retreat_trajectory (setq _gripper_retreat_trajectory (car __gripper_retreat_trajectory)))
       _gripper_retreat_trajectory)))
  (:grasp_trajectory
   (&rest __grasp_trajectory)
   (if (keywordp (car __grasp_trajectory))
       (send* _grasp_trajectory __grasp_trajectory)
     (progn
       (if __grasp_trajectory (setq _grasp_trajectory (car __grasp_trajectory)))
       _grasp_trajectory)))
  (:use_custom_tolerances
   (&optional __use_custom_tolerances)
   (if __use_custom_tolerances (setq _use_custom_tolerances __use_custom_tolerances)) _use_custom_tolerances)
  (:effector_pos_tolerance
   (&optional __effector_pos_tolerance)
   (if __effector_pos_tolerance (setq _effector_pos_tolerance __effector_pos_tolerance)) _effector_pos_tolerance)
  (:effector_angle_tolerance
   (&optional __effector_angle_tolerance)
   (if __effector_angle_tolerance (setq _effector_angle_tolerance __effector_angle_tolerance)) _effector_angle_tolerance)
  (:joint_angles_tolerance
   (&optional __joint_angles_tolerance)
   (if __joint_angles_tolerance (setq _joint_angles_tolerance __joint_angles_tolerance)) _joint_angles_tolerance)
  (:curr_effector_pose
   (&rest __curr_effector_pose)
   (if (keywordp (car __curr_effector_pose))
       (send* _curr_effector_pose __curr_effector_pose)
     (progn
       (if __curr_effector_pose (setq _curr_effector_pose (car __curr_effector_pose)))
       _curr_effector_pose)))
  (:curr_joint_state
   (&rest __curr_joint_state)
   (if (keywordp (car __curr_joint_state))
       (send* _curr_joint_state __curr_joint_state)
     (progn
       (if __curr_joint_state (setq _curr_joint_state (car __curr_joint_state)))
       _curr_joint_state)))
  (:serialization-length
   ()
   (+
    ;; grasp_execution_msgs/GraspData _grasp
    (send _grasp :serialization-length)
    ;; bool _is_grasp
    1
    ;; bool _ignore_effector_pose_ungrasp
    1
    ;; trajectory_msgs/JointTrajectory _gripper_approach_trajectory
    (send _gripper_approach_trajectory :serialization-length)
    ;; trajectory_msgs/JointTrajectory _gripper_retreat_trajectory
    (send _gripper_retreat_trajectory :serialization-length)
    ;; trajectory_msgs/JointTrajectory _grasp_trajectory
    (send _grasp_trajectory :serialization-length)
    ;; bool _use_custom_tolerances
    1
    ;; float32 _effector_pos_tolerance
    4
    ;; float32 _effector_angle_tolerance
    4
    ;; float32 _joint_angles_tolerance
    4
    ;; geometry_msgs/PoseStamped _curr_effector_pose
    (send _curr_effector_pose :serialization-length)
    ;; sensor_msgs/JointState _curr_joint_state
    (send _curr_joint_state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; grasp_execution_msgs/GraspData _grasp
       (send _grasp :serialize s)
     ;; bool _is_grasp
       (if _is_grasp (write-byte -1 s) (write-byte 0 s))
     ;; bool _ignore_effector_pose_ungrasp
       (if _ignore_effector_pose_ungrasp (write-byte -1 s) (write-byte 0 s))
     ;; trajectory_msgs/JointTrajectory _gripper_approach_trajectory
       (send _gripper_approach_trajectory :serialize s)
     ;; trajectory_msgs/JointTrajectory _gripper_retreat_trajectory
       (send _gripper_retreat_trajectory :serialize s)
     ;; trajectory_msgs/JointTrajectory _grasp_trajectory
       (send _grasp_trajectory :serialize s)
     ;; bool _use_custom_tolerances
       (if _use_custom_tolerances (write-byte -1 s) (write-byte 0 s))
     ;; float32 _effector_pos_tolerance
       (sys::poke _effector_pos_tolerance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _effector_angle_tolerance
       (sys::poke _effector_angle_tolerance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _joint_angles_tolerance
       (sys::poke _joint_angles_tolerance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/PoseStamped _curr_effector_pose
       (send _curr_effector_pose :serialize s)
     ;; sensor_msgs/JointState _curr_joint_state
       (send _curr_joint_state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; grasp_execution_msgs/GraspData _grasp
     (send _grasp :deserialize buf ptr-) (incf ptr- (send _grasp :serialization-length))
   ;; bool _is_grasp
     (setq _is_grasp (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _ignore_effector_pose_ungrasp
     (setq _ignore_effector_pose_ungrasp (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; trajectory_msgs/JointTrajectory _gripper_approach_trajectory
     (send _gripper_approach_trajectory :deserialize buf ptr-) (incf ptr- (send _gripper_approach_trajectory :serialization-length))
   ;; trajectory_msgs/JointTrajectory _gripper_retreat_trajectory
     (send _gripper_retreat_trajectory :deserialize buf ptr-) (incf ptr- (send _gripper_retreat_trajectory :serialization-length))
   ;; trajectory_msgs/JointTrajectory _grasp_trajectory
     (send _grasp_trajectory :deserialize buf ptr-) (incf ptr- (send _grasp_trajectory :serialization-length))
   ;; bool _use_custom_tolerances
     (setq _use_custom_tolerances (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _effector_pos_tolerance
     (setq _effector_pos_tolerance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _effector_angle_tolerance
     (setq _effector_angle_tolerance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _joint_angles_tolerance
     (setq _joint_angles_tolerance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/PoseStamped _curr_effector_pose
     (send _curr_effector_pose :deserialize buf ptr-) (incf ptr- (send _curr_effector_pose :serialization-length))
   ;; sensor_msgs/JointState _curr_joint_state
     (send _curr_joint_state :deserialize buf ptr-) (incf ptr- (send _curr_joint_state :serialization-length))
   ;;
   self)
  )

(setf (get grasp_execution_msgs::GraspGoal :md5sum-) "4913bb3efa7b5af93ac24d63634d823b")
(setf (get grasp_execution_msgs::GraspGoal :datatype-) "grasp_execution_msgs/GraspGoal")
(setf (get grasp_execution_msgs::GraspGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# the grasp / ungrasp to perform
grasp_execution_msgs/GraspData grasp 

# true if this is a grasping action,
# false if this is an ungrasp action.
bool is_grasp

# For an ungrasping action, there may be an expected
# end effector pose for the action to be eligible,
# e.g. at a pose where to place an object.
# The expected end effector pose is specified in 
# GraspData.grasp.grasp_pose (for both grasping and
# ungrasping actions). However sometimes,
# the action should be eligible anywhere
# (i.e. the object may be dropped anywhere).
# To allow the ungrasp action to be eligible anywhere,
# set this to true.
bool ignore_effector_pose_ungrasp

# The joint trajectory to move from curr_effector_pose 
# along the *approach* GripperTranslation specified
# in the Grasp.msg message (contained in GraspData.msg).
# For an ungrasp action, this trajectory should not include
# the gripper joints, because they should not move while
# holding the object, and the exact state of the grippers
# while holding the object can vary and
# cannot be foreseen exactly.
trajectory_msgs/JointTrajectory gripper_approach_trajectory

# The joint trajectory to move from the grasp pose, after
# doint the grasp, along the *retreat* GripperTranslation specified
# in the Grasp.msg message (contained in GraspData.msg).
# For a grasp action, this trajectory should not include
# the gripper joints, because they should not move while
# holding the object, and the exact state of the grippers
# while holding the object can vary and
# cannot be foreseen exactly.
trajectory_msgs/JointTrajectory gripper_retreat_trajectory

# The joint trajectory to open/close the grippers, i.e. to move from
# GraspData.grasp.pre_grasp_posture to
# GraspData.grasp.grasp_posture, or the other way round if
# this is an action to un-grasp.
# In its simplest form, the first point in this trajectory
# is the current joint state, and the second point is
# the target state specified in grasp.grasp.grasp_posture
# if this is a grasp, or grasp.grasp.pre_grasp_posture if
# this is an ungrasp.
trajectory_msgs/JointTrajectory grasp_trajectory

# set to true if you want to use effector_pos_tolerance,
# effector_angle_tolerance and joint_angles_tolerance
# for determining whether the end effector / the joints
# are at the correct pose.
# Set to false if default tolerances are to be used.
bool use_custom_tolerances

# the grasp is only executed if the robot's effector is at the
# correct pose, plus this tolerance
float32 effector_pos_tolerance

# the grasp is only executed if the robot's effector is at the
# correct orientation, plus this tolerance (in rad)
float32 effector_angle_tolerance

# tolerance allowed for all joints to be at a desirec
# position (GraspData.grasp.grasp_posture and
# GraspData.grasp.pre_grasp_posture). 
float32 joint_angles_tolerance


#####################################################
# Current robot state. While it is possible to
# rely on that the processing action servers obtain
# this information via subscribed topics, it should
# not be required to rely on it, hence the relevant
# current state of the robot can be passed here as well.
# All fields should be up-to-date when the action is called.
#####################################################

# The current pose of the end effector in the world.
# This has to be equal to:
# {GraspData.grasp.grasp_pose - GraspData.grasp.approach.direction * GraspData.grasp.approach.desired_distance}.
# Which means the effector currently has to be at the pose at which after 
# performing the gripper approach, it is at the GraspData.grasp.grasp_pose.
# If this is an ungrasp action, and ignore_effector_pose_ungrasp is
# set to true, checking this condition is skipped.
# This field may not be used by the implementation, because
# some implementations can use /tf transforms to determine
# the effector pose.
geometry_msgs/PoseStamped curr_effector_pose

# The current joint state of the robot. 
# This is to ensure the the robot is in the correct state
# for grasping/ungrasping actions
# (the arm joints in this state have to be equal to
# gripper_approach_trajectory.points[0]).
# If this is an ungrasp action, the gripper joints
# in this state may be ignored, as they should not
# be part of gripper_approach_trajectory anyway.
sensor_msgs/JointState curr_joint_state


================================================================================
MSG: grasp_execution_msgs/GraspData
# An identifier for this particular grasp action
int32 id

# the grasp to perform
moveit_msgs/Grasp grasp 

# the name of the effector link (the one which the grasp refers to).
# This is needed to check whether according to /tf transforms,
# the link is at the right position (grasp.reach_pose) in order to
# accept the grasp. 
string effector_link_name


================================================================================
MSG: moveit_msgs/Grasp
# This message contains a description of a grasp that would be used
# with a particular end-effector to grasp an object, including how to
# approach it, grip it, etc.  This message does not contain any
# information about a \"grasp point\" (a position ON the object).
# Whatever generates this message should have already combined
# information about grasp points with information about the geometry
# of the end-effector to compute the grasp_pose in this message.

# A name for this grasp
string id

# The internal posture of the hand for the pre-grasp
# only positions are used
trajectory_msgs/JointTrajectory pre_grasp_posture

# The internal posture of the hand for the grasp
# positions and efforts are used
trajectory_msgs/JointTrajectory grasp_posture

# The position of the end-effector for the grasp.  This is the pose of
# the \"parent_link\" of the end-effector, not actually the pose of any
# link *in* the end-effector.  Typically this would be the pose of the
# most distal wrist link before the hand (end-effector) links began.
geometry_msgs/PoseStamped grasp_pose

# The estimated probability of success for this grasp, or some other
# measure of how \"good\" it is.
float64 grasp_quality

# The approach direction to take before picking an object
GripperTranslation pre_grasp_approach

# The retreat direction to take after a grasp has been completed (object is attached)
GripperTranslation post_grasp_retreat

# The retreat motion to perform when releasing the object; this information
# is not necessary for the grasp itself, but when releasing the object,
# the information will be necessary. The grasp used to perform a pickup
# is returned as part of the result, so this information is available for 
# later use.
GripperTranslation post_place_retreat

# the maximum contact force to use while grasping (<=0 to disable)
float32 max_contact_force

# an optional list of obstacles that we have semantic information about
# and that can be touched/pushed/moved in the course of grasping
string[] allowed_touch_objects

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: moveit_msgs/GripperTranslation
# defines a translation for the gripper, used in pickup or place tasks
# for example for lifting an object off a table or approaching the table for placing

# the direction of the translation
geometry_msgs/Vector3Stamped direction

# the desired translation distance
float32 desired_distance

# the min distance that must be considered feasible before the
# grasp is even attempted
float32 min_distance

================================================================================
MSG: geometry_msgs/Vector3Stamped
# This represents a Vector3 with reference coordinate frame and timestamp
Header header
Vector3 vector

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

")



(provide :grasp_execution_msgs/GraspGoal "4913bb3efa7b5af93ac24d63634d823b")


