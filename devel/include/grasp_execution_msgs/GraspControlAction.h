// Generated by gencpp from file grasp_execution_msgs/GraspControlAction.msg
// DO NOT EDIT!


#ifndef GRASP_EXECUTION_MSGS_MESSAGE_GRASPCONTROLACTION_H
#define GRASP_EXECUTION_MSGS_MESSAGE_GRASPCONTROLACTION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <grasp_execution_msgs/GraspControlActionGoal.h>
#include <grasp_execution_msgs/GraspControlActionResult.h>
#include <grasp_execution_msgs/GraspControlActionFeedback.h>

namespace grasp_execution_msgs
{
template <class ContainerAllocator>
struct GraspControlAction_
{
  typedef GraspControlAction_<ContainerAllocator> Type;

  GraspControlAction_()
    : action_goal()
    , action_result()
    , action_feedback()  {
    }
  GraspControlAction_(const ContainerAllocator& _alloc)
    : action_goal(_alloc)
    , action_result(_alloc)
    , action_feedback(_alloc)  {
  (void)_alloc;
    }



   typedef  ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator>  _action_goal_type;
  _action_goal_type action_goal;

   typedef  ::grasp_execution_msgs::GraspControlActionResult_<ContainerAllocator>  _action_result_type;
  _action_result_type action_result;

   typedef  ::grasp_execution_msgs::GraspControlActionFeedback_<ContainerAllocator>  _action_feedback_type;
  _action_feedback_type action_feedback;





  typedef boost::shared_ptr< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> const> ConstPtr;

}; // struct GraspControlAction_

typedef ::grasp_execution_msgs::GraspControlAction_<std::allocator<void> > GraspControlAction;

typedef boost::shared_ptr< ::grasp_execution_msgs::GraspControlAction > GraspControlActionPtr;
typedef boost::shared_ptr< ::grasp_execution_msgs::GraspControlAction const> GraspControlActionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator1> & lhs, const ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator2> & rhs)
{
  return lhs.action_goal == rhs.action_goal &&
    lhs.action_result == rhs.action_result &&
    lhs.action_feedback == rhs.action_feedback;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator1> & lhs, const ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace grasp_execution_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d2181950a3abf347cf645c1445a2d4ee";
  }

  static const char* value(const ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd2181950a3abf347ULL;
  static const uint64_t static_value2 = 0xcf645c1445a2d4eeULL;
};

template<class ContainerAllocator>
struct DataType< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "grasp_execution_msgs/GraspControlAction";
  }

  static const char* value(const ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"GraspControlActionGoal action_goal\n"
"GraspControlActionResult action_result\n"
"GraspControlActionFeedback action_feedback\n"
"\n"
"================================================================================\n"
"MSG: grasp_execution_msgs/GraspControlActionGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalID goal_id\n"
"GraspControlGoal goal\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalID\n"
"# The stamp should store the time at which this goal was requested.\n"
"# It is used by an action server when it tries to preempt all\n"
"# goals that were requested before a certain time\n"
"time stamp\n"
"\n"
"# The id provides a way to associate feedback and\n"
"# result message with specific goal requests. The id\n"
"# specified must be unique.\n"
"string id\n"
"\n"
"\n"
"================================================================================\n"
"MSG: grasp_execution_msgs/GraspControlGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# This action sends a command to the hand to open or close the grasp.\n"
"# It can be used like a JointTrajectory action. Alternatively, the joint\n"
"# trajectory can be left unspecified, and the hand just closes.\n"
"# Accepting nodes can handle force feedback control or stop closing\n"
"# the fingers before the target joint state, if they are not moving any more. \n"
"\n"
"# The target joint state. This may include the efforts which\n"
"# the hand is to apply once the grip is closed.\n"
"sensor_msgs/JointState target_joint_state\n"
"\n"
"# optional: if the gripper movement is more complex, it can be specified\n"
"# as a joint trajectory action. In this case, target_joint_state should\n"
"# be set to the last state in the JointTrajectory\n"
"trajectory_msgs/JointTrajectory trajectory\n"
"\n"
"# If the joint trajectory is to be used instead of the simple closing action,\n"
"# set this to true. If this is false, the trajectory field is ingnored.\n"
"bool use_trajectory\n"
"\n"
"# true if this is an action to close the hand, false if it is opening.\n"
"bool closing\n"
"\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/JointState\n"
"# This is a message that holds data to describe the state of a set of torque controlled joints. \n"
"#\n"
"# The state of each joint (revolute or prismatic) is defined by:\n"
"#  * the position of the joint (rad or m),\n"
"#  * the velocity of the joint (rad/s or m/s) and \n"
"#  * the effort that is applied in the joint (Nm or N).\n"
"#\n"
"# Each joint is uniquely identified by its name\n"
"# The header specifies the time at which the joint states were recorded. All the joint states\n"
"# in one message have to be recorded at the same time.\n"
"#\n"
"# This message consists of a multiple arrays, one for each part of the joint state. \n"
"# The goal is to make each of the fields optional. When e.g. your joints have no\n"
"# effort associated with them, you can leave the effort array empty. \n"
"#\n"
"# All arrays in this message should have the same size, or be empty.\n"
"# This is the only way to uniquely associate the joint name with the correct\n"
"# states.\n"
"\n"
"\n"
"Header header\n"
"\n"
"string[] name\n"
"float64[] position\n"
"float64[] velocity\n"
"float64[] effort\n"
"\n"
"================================================================================\n"
"MSG: trajectory_msgs/JointTrajectory\n"
"Header header\n"
"string[] joint_names\n"
"JointTrajectoryPoint[] points\n"
"================================================================================\n"
"MSG: trajectory_msgs/JointTrajectoryPoint\n"
"# Each trajectory point specifies either positions[, velocities[, accelerations]]\n"
"# or positions[, effort] for the trajectory to be executed.\n"
"# All specified values are in the same order as the joint names in JointTrajectory.msg\n"
"\n"
"float64[] positions\n"
"float64[] velocities\n"
"float64[] accelerations\n"
"float64[] effort\n"
"duration time_from_start\n"
"\n"
"================================================================================\n"
"MSG: grasp_execution_msgs/GraspControlActionResult\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalStatus status\n"
"GraspControlResult result\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalStatus\n"
"GoalID goal_id\n"
"uint8 status\n"
"uint8 PENDING         = 0   # The goal has yet to be processed by the action server\n"
"uint8 ACTIVE          = 1   # The goal is currently being processed by the action server\n"
"uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing\n"
"                            #   and has since completed its execution (Terminal State)\n"
"uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)\n"
"uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due\n"
"                            #    to some failure (Terminal State)\n"
"uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,\n"
"                            #    because the goal was unattainable or invalid (Terminal State)\n"
"uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing\n"
"                            #    and has not yet completed execution\n"
"uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,\n"
"                            #    but the action server has not yet confirmed that the goal is canceled\n"
"uint8 RECALLED        = 8   # The goal received a cancel request before it started executing\n"
"                            #    and was successfully cancelled (Terminal State)\n"
"uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be\n"
"                            #    sent over the wire by an action server\n"
"\n"
"#Allow for the user to associate a string with GoalStatus for debugging\n"
"string text\n"
"\n"
"\n"
"================================================================================\n"
"MSG: grasp_execution_msgs/GraspControlResult\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"# the final execution time\n"
"duration execution_time\n"
"\n"
"# successfully done the grasp\n"
"bool success\n"
"\n"
"\n"
"================================================================================\n"
"MSG: grasp_execution_msgs/GraspControlActionFeedback\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalStatus status\n"
"GraspControlFeedback feedback\n"
"\n"
"================================================================================\n"
"MSG: grasp_execution_msgs/GraspControlFeedback\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
;
  }

  static const char* value(const ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.action_goal);
      stream.next(m.action_result);
      stream.next(m.action_feedback);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GraspControlAction_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::grasp_execution_msgs::GraspControlAction_<ContainerAllocator>& v)
  {
    s << indent << "action_goal: ";
    s << std::endl;
    Printer< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.action_goal);
    s << indent << "action_result: ";
    s << std::endl;
    Printer< ::grasp_execution_msgs::GraspControlActionResult_<ContainerAllocator> >::stream(s, indent + "  ", v.action_result);
    s << indent << "action_feedback: ";
    s << std::endl;
    Printer< ::grasp_execution_msgs::GraspControlActionFeedback_<ContainerAllocator> >::stream(s, indent + "  ", v.action_feedback);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GRASP_EXECUTION_MSGS_MESSAGE_GRASPCONTROLACTION_H
