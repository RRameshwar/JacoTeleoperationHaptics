// Generated by gencpp from file grasp_execution_msgs/GraspControlActionGoal.msg
// DO NOT EDIT!


#ifndef GRASP_EXECUTION_MSGS_MESSAGE_GRASPCONTROLACTIONGOAL_H
#define GRASP_EXECUTION_MSGS_MESSAGE_GRASPCONTROLACTIONGOAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <actionlib_msgs/GoalID.h>
#include <grasp_execution_msgs/GraspControlGoal.h>

namespace grasp_execution_msgs
{
template <class ContainerAllocator>
struct GraspControlActionGoal_
{
  typedef GraspControlActionGoal_<ContainerAllocator> Type;

  GraspControlActionGoal_()
    : header()
    , goal_id()
    , goal()  {
    }
  GraspControlActionGoal_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , goal_id(_alloc)
    , goal(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::actionlib_msgs::GoalID_<ContainerAllocator>  _goal_id_type;
  _goal_id_type goal_id;

   typedef  ::grasp_execution_msgs::GraspControlGoal_<ContainerAllocator>  _goal_type;
  _goal_type goal;





  typedef boost::shared_ptr< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> const> ConstPtr;

}; // struct GraspControlActionGoal_

typedef ::grasp_execution_msgs::GraspControlActionGoal_<std::allocator<void> > GraspControlActionGoal;

typedef boost::shared_ptr< ::grasp_execution_msgs::GraspControlActionGoal > GraspControlActionGoalPtr;
typedef boost::shared_ptr< ::grasp_execution_msgs::GraspControlActionGoal const> GraspControlActionGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator1> & lhs, const ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.goal_id == rhs.goal_id &&
    lhs.goal == rhs.goal;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator1> & lhs, const ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace grasp_execution_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8b19777d871cdc1e1abeb36327c1fda2";
  }

  static const char* value(const ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8b19777d871cdc1eULL;
  static const uint64_t static_value2 = 0x1abeb36327c1fda2ULL;
};

template<class ContainerAllocator>
struct DataType< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "grasp_execution_msgs/GraspControlActionGoal";
  }

  static const char* value(const ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
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
;
  }

  static const char* value(const ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.goal_id);
      stream.next(m.goal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GraspControlActionGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::grasp_execution_msgs::GraspControlActionGoal_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "goal_id: ";
    s << std::endl;
    Printer< ::actionlib_msgs::GoalID_<ContainerAllocator> >::stream(s, indent + "  ", v.goal_id);
    s << indent << "goal: ";
    s << std::endl;
    Printer< ::grasp_execution_msgs::GraspControlGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.goal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GRASP_EXECUTION_MSGS_MESSAGE_GRASPCONTROLACTIONGOAL_H
