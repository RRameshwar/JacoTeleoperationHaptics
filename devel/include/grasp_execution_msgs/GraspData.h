// Generated by gencpp from file grasp_execution_msgs/GraspData.msg
// DO NOT EDIT!


#ifndef GRASP_EXECUTION_MSGS_MESSAGE_GRASPDATA_H
#define GRASP_EXECUTION_MSGS_MESSAGE_GRASPDATA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <moveit_msgs/Grasp.h>

namespace grasp_execution_msgs
{
template <class ContainerAllocator>
struct GraspData_
{
  typedef GraspData_<ContainerAllocator> Type;

  GraspData_()
    : id(0)
    , grasp()
    , effector_link_name()  {
    }
  GraspData_(const ContainerAllocator& _alloc)
    : id(0)
    , grasp(_alloc)
    , effector_link_name(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _id_type;
  _id_type id;

   typedef  ::moveit_msgs::Grasp_<ContainerAllocator>  _grasp_type;
  _grasp_type grasp;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _effector_link_name_type;
  _effector_link_name_type effector_link_name;





  typedef boost::shared_ptr< ::grasp_execution_msgs::GraspData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::grasp_execution_msgs::GraspData_<ContainerAllocator> const> ConstPtr;

}; // struct GraspData_

typedef ::grasp_execution_msgs::GraspData_<std::allocator<void> > GraspData;

typedef boost::shared_ptr< ::grasp_execution_msgs::GraspData > GraspDataPtr;
typedef boost::shared_ptr< ::grasp_execution_msgs::GraspData const> GraspDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::grasp_execution_msgs::GraspData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::grasp_execution_msgs::GraspData_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::grasp_execution_msgs::GraspData_<ContainerAllocator1> & lhs, const ::grasp_execution_msgs::GraspData_<ContainerAllocator2> & rhs)
{
  return lhs.id == rhs.id &&
    lhs.grasp == rhs.grasp &&
    lhs.effector_link_name == rhs.effector_link_name;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::grasp_execution_msgs::GraspData_<ContainerAllocator1> & lhs, const ::grasp_execution_msgs::GraspData_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace grasp_execution_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::grasp_execution_msgs::GraspData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::grasp_execution_msgs::GraspData_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::grasp_execution_msgs::GraspData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::grasp_execution_msgs::GraspData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::grasp_execution_msgs::GraspData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::grasp_execution_msgs::GraspData_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::grasp_execution_msgs::GraspData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "17366bcaaaefb782506d4305e5e6f7b0";
  }

  static const char* value(const ::grasp_execution_msgs::GraspData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x17366bcaaaefb782ULL;
  static const uint64_t static_value2 = 0x506d4305e5e6f7b0ULL;
};

template<class ContainerAllocator>
struct DataType< ::grasp_execution_msgs::GraspData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "grasp_execution_msgs/GraspData";
  }

  static const char* value(const ::grasp_execution_msgs::GraspData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::grasp_execution_msgs::GraspData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# An identifier for this particular grasp action\n"
"int32 id\n"
"\n"
"# the grasp to perform\n"
"moveit_msgs/Grasp grasp \n"
"\n"
"# the name of the effector link (the one which the grasp refers to).\n"
"# This is needed to check whether according to /tf transforms,\n"
"# the link is at the right position (grasp.reach_pose) in order to\n"
"# accept the grasp. \n"
"string effector_link_name\n"
"\n"
"\n"
"================================================================================\n"
"MSG: moveit_msgs/Grasp\n"
"# This message contains a description of a grasp that would be used\n"
"# with a particular end-effector to grasp an object, including how to\n"
"# approach it, grip it, etc.  This message does not contain any\n"
"# information about a \"grasp point\" (a position ON the object).\n"
"# Whatever generates this message should have already combined\n"
"# information about grasp points with information about the geometry\n"
"# of the end-effector to compute the grasp_pose in this message.\n"
"\n"
"# A name for this grasp\n"
"string id\n"
"\n"
"# The internal posture of the hand for the pre-grasp\n"
"# only positions are used\n"
"trajectory_msgs/JointTrajectory pre_grasp_posture\n"
"\n"
"# The internal posture of the hand for the grasp\n"
"# positions and efforts are used\n"
"trajectory_msgs/JointTrajectory grasp_posture\n"
"\n"
"# The position of the end-effector for the grasp.  This is the pose of\n"
"# the \"parent_link\" of the end-effector, not actually the pose of any\n"
"# link *in* the end-effector.  Typically this would be the pose of the\n"
"# most distal wrist link before the hand (end-effector) links began.\n"
"geometry_msgs/PoseStamped grasp_pose\n"
"\n"
"# The estimated probability of success for this grasp, or some other\n"
"# measure of how \"good\" it is.\n"
"float64 grasp_quality\n"
"\n"
"# The approach direction to take before picking an object\n"
"GripperTranslation pre_grasp_approach\n"
"\n"
"# The retreat direction to take after a grasp has been completed (object is attached)\n"
"GripperTranslation post_grasp_retreat\n"
"\n"
"# The retreat motion to perform when releasing the object; this information\n"
"# is not necessary for the grasp itself, but when releasing the object,\n"
"# the information will be necessary. The grasp used to perform a pickup\n"
"# is returned as part of the result, so this information is available for \n"
"# later use.\n"
"GripperTranslation post_place_retreat\n"
"\n"
"# the maximum contact force to use while grasping (<=0 to disable)\n"
"float32 max_contact_force\n"
"\n"
"# an optional list of obstacles that we have semantic information about\n"
"# and that can be touched/pushed/moved in the course of grasping\n"
"string[] allowed_touch_objects\n"
"\n"
"================================================================================\n"
"MSG: trajectory_msgs/JointTrajectory\n"
"Header header\n"
"string[] joint_names\n"
"JointTrajectoryPoint[] points\n"
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
"MSG: geometry_msgs/PoseStamped\n"
"# A Pose with reference coordinate frame and timestamp\n"
"Header header\n"
"Pose pose\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: moveit_msgs/GripperTranslation\n"
"# defines a translation for the gripper, used in pickup or place tasks\n"
"# for example for lifting an object off a table or approaching the table for placing\n"
"\n"
"# the direction of the translation\n"
"geometry_msgs/Vector3Stamped direction\n"
"\n"
"# the desired translation distance\n"
"float32 desired_distance\n"
"\n"
"# the min distance that must be considered feasible before the\n"
"# grasp is even attempted\n"
"float32 min_distance\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3Stamped\n"
"# This represents a Vector3 with reference coordinate frame and timestamp\n"
"Header header\n"
"Vector3 vector\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::grasp_execution_msgs::GraspData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::grasp_execution_msgs::GraspData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.grasp);
      stream.next(m.effector_link_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GraspData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::grasp_execution_msgs::GraspData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::grasp_execution_msgs::GraspData_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.id);
    s << indent << "grasp: ";
    s << std::endl;
    Printer< ::moveit_msgs::Grasp_<ContainerAllocator> >::stream(s, indent + "  ", v.grasp);
    s << indent << "effector_link_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.effector_link_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GRASP_EXECUTION_MSGS_MESSAGE_GRASPDATA_H