// Auto-generated. Do not edit!

// (in-package grasp_execution_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let GraspGoal = require('./GraspGoal.js');
let actionlib_msgs = _finder('actionlib_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class GraspActionGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.goal_id = null;
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('goal_id')) {
        this.goal_id = initObj.goal_id
      }
      else {
        this.goal_id = new actionlib_msgs.msg.GoalID();
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = new GraspGoal();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraspActionGoal
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [goal_id]
    bufferOffset = actionlib_msgs.msg.GoalID.serialize(obj.goal_id, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = GraspGoal.serialize(obj.goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraspActionGoal
    let len;
    let data = new GraspActionGoal(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [goal_id]
    data.goal_id = actionlib_msgs.msg.GoalID.deserialize(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = GraspGoal.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += actionlib_msgs.msg.GoalID.getMessageSize(object.goal_id);
    length += GraspGoal.getMessageSize(object.goal);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'grasp_execution_msgs/GraspActionGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd7e0f500a2cd74e04525e295c7517b6b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    
    Header header
    actionlib_msgs/GoalID goal_id
    GraspGoal goal
    
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
    MSG: actionlib_msgs/GoalID
    # The stamp should store the time at which this goal was requested.
    # It is used by an action server when it tries to preempt all
    # goals that were requested before a certain time
    time stamp
    
    # The id provides a way to associate feedback and
    # result message with specific goal requests. The id
    # specified must be unique.
    string id
    
    
    ================================================================================
    MSG: grasp_execution_msgs/GraspGoal
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
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
    # information about a "grasp point" (a position ON the object).
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
    # the "parent_link" of the end-effector, not actually the pose of any
    # link *in* the end-effector.  Typically this would be the pose of the
    # most distal wrist link before the hand (end-effector) links began.
    geometry_msgs/PoseStamped grasp_pose
    
    # The estimated probability of success for this grasp, or some other
    # measure of how "good" it is.
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraspActionGoal(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.goal_id !== undefined) {
      resolved.goal_id = actionlib_msgs.msg.GoalID.Resolve(msg.goal_id)
    }
    else {
      resolved.goal_id = new actionlib_msgs.msg.GoalID()
    }

    if (msg.goal !== undefined) {
      resolved.goal = GraspGoal.Resolve(msg.goal)
    }
    else {
      resolved.goal = new GraspGoal()
    }

    return resolved;
    }
};

module.exports = GraspActionGoal;
