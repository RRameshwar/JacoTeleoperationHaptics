; Auto-generated. Do not edit!


(cl:in-package grasp_execution_msgs-msg)


;//! \htmlinclude GraspControlActionGoal.msg.html

(cl:defclass <GraspControlActionGoal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (goal_id
    :reader goal_id
    :initarg :goal_id
    :type actionlib_msgs-msg:GoalID
    :initform (cl:make-instance 'actionlib_msgs-msg:GoalID))
   (goal
    :reader goal
    :initarg :goal
    :type grasp_execution_msgs-msg:GraspControlGoal
    :initform (cl:make-instance 'grasp_execution_msgs-msg:GraspControlGoal)))
)

(cl:defclass GraspControlActionGoal (<GraspControlActionGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraspControlActionGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraspControlActionGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_execution_msgs-msg:<GraspControlActionGoal> is deprecated: use grasp_execution_msgs-msg:GraspControlActionGoal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GraspControlActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_execution_msgs-msg:header-val is deprecated.  Use grasp_execution_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'goal_id-val :lambda-list '(m))
(cl:defmethod goal_id-val ((m <GraspControlActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_execution_msgs-msg:goal_id-val is deprecated.  Use grasp_execution_msgs-msg:goal_id instead.")
  (goal_id m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <GraspControlActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_execution_msgs-msg:goal-val is deprecated.  Use grasp_execution_msgs-msg:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraspControlActionGoal>) ostream)
  "Serializes a message object of type '<GraspControlActionGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal_id) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraspControlActionGoal>) istream)
  "Deserializes a message object of type '<GraspControlActionGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal_id) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraspControlActionGoal>)))
  "Returns string type for a message object of type '<GraspControlActionGoal>"
  "grasp_execution_msgs/GraspControlActionGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraspControlActionGoal)))
  "Returns string type for a message object of type 'GraspControlActionGoal"
  "grasp_execution_msgs/GraspControlActionGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraspControlActionGoal>)))
  "Returns md5sum for a message object of type '<GraspControlActionGoal>"
  "8b19777d871cdc1e1abeb36327c1fda2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraspControlActionGoal)))
  "Returns md5sum for a message object of type 'GraspControlActionGoal"
  "8b19777d871cdc1e1abeb36327c1fda2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraspControlActionGoal>)))
  "Returns full string definition for message of type '<GraspControlActionGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%GraspControlGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: grasp_execution_msgs/GraspControlGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# This action sends a command to the hand to open or close the grasp.~%# It can be used like a JointTrajectory action. Alternatively, the joint~%# trajectory can be left unspecified, and the hand just closes.~%# Accepting nodes can handle force feedback control or stop closing~%# the fingers before the target joint state, if they are not moving any more. ~%~%# The target joint state. This may include the efforts which~%# the hand is to apply once the grip is closed.~%sensor_msgs/JointState target_joint_state~%~%# optional: if the gripper movement is more complex, it can be specified~%# as a joint trajectory action. In this case, target_joint_state should~%# be set to the last state in the JointTrajectory~%trajectory_msgs/JointTrajectory trajectory~%~%# If the joint trajectory is to be used instead of the simple closing action,~%# set this to true. If this is false, the trajectory field is ingnored.~%bool use_trajectory~%~%# true if this is an action to close the hand, false if it is opening.~%bool closing~%~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraspControlActionGoal)))
  "Returns full string definition for message of type 'GraspControlActionGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%GraspControlGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: grasp_execution_msgs/GraspControlGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# This action sends a command to the hand to open or close the grasp.~%# It can be used like a JointTrajectory action. Alternatively, the joint~%# trajectory can be left unspecified, and the hand just closes.~%# Accepting nodes can handle force feedback control or stop closing~%# the fingers before the target joint state, if they are not moving any more. ~%~%# The target joint state. This may include the efforts which~%# the hand is to apply once the grip is closed.~%sensor_msgs/JointState target_joint_state~%~%# optional: if the gripper movement is more complex, it can be specified~%# as a joint trajectory action. In this case, target_joint_state should~%# be set to the last state in the JointTrajectory~%trajectory_msgs/JointTrajectory trajectory~%~%# If the joint trajectory is to be used instead of the simple closing action,~%# set this to true. If this is false, the trajectory field is ingnored.~%bool use_trajectory~%~%# true if this is an action to close the hand, false if it is opening.~%bool closing~%~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraspControlActionGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraspControlActionGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'GraspControlActionGoal
    (cl:cons ':header (header msg))
    (cl:cons ':goal_id (goal_id msg))
    (cl:cons ':goal (goal msg))
))
