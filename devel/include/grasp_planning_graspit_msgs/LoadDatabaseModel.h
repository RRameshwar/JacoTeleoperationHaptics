// Generated by gencpp from file grasp_planning_graspit_msgs/LoadDatabaseModel.msg
// DO NOT EDIT!


#ifndef GRASP_PLANNING_GRASPIT_MSGS_MESSAGE_LOADDATABASEMODEL_H
#define GRASP_PLANNING_GRASPIT_MSGS_MESSAGE_LOADDATABASEMODEL_H

#include <ros/service_traits.h>


#include <grasp_planning_graspit_msgs/LoadDatabaseModelRequest.h>
#include <grasp_planning_graspit_msgs/LoadDatabaseModelResponse.h>


namespace grasp_planning_graspit_msgs
{

struct LoadDatabaseModel
{

typedef LoadDatabaseModelRequest Request;
typedef LoadDatabaseModelResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct LoadDatabaseModel
} // namespace grasp_planning_graspit_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::grasp_planning_graspit_msgs::LoadDatabaseModel > {
  static const char* value()
  {
    return "8e7f810fdd6e19434987115ec75645ca";
  }

  static const char* value(const ::grasp_planning_graspit_msgs::LoadDatabaseModel&) { return value(); }
};

template<>
struct DataType< ::grasp_planning_graspit_msgs::LoadDatabaseModel > {
  static const char* value()
  {
    return "grasp_planning_graspit_msgs/LoadDatabaseModel";
  }

  static const char* value(const ::grasp_planning_graspit_msgs::LoadDatabaseModel&) { return value(); }
};


// service_traits::MD5Sum< ::grasp_planning_graspit_msgs::LoadDatabaseModelRequest> should match
// service_traits::MD5Sum< ::grasp_planning_graspit_msgs::LoadDatabaseModel >
template<>
struct MD5Sum< ::grasp_planning_graspit_msgs::LoadDatabaseModelRequest>
{
  static const char* value()
  {
    return MD5Sum< ::grasp_planning_graspit_msgs::LoadDatabaseModel >::value();
  }
  static const char* value(const ::grasp_planning_graspit_msgs::LoadDatabaseModelRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::grasp_planning_graspit_msgs::LoadDatabaseModelRequest> should match
// service_traits::DataType< ::grasp_planning_graspit_msgs::LoadDatabaseModel >
template<>
struct DataType< ::grasp_planning_graspit_msgs::LoadDatabaseModelRequest>
{
  static const char* value()
  {
    return DataType< ::grasp_planning_graspit_msgs::LoadDatabaseModel >::value();
  }
  static const char* value(const ::grasp_planning_graspit_msgs::LoadDatabaseModelRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::grasp_planning_graspit_msgs::LoadDatabaseModelResponse> should match
// service_traits::MD5Sum< ::grasp_planning_graspit_msgs::LoadDatabaseModel >
template<>
struct MD5Sum< ::grasp_planning_graspit_msgs::LoadDatabaseModelResponse>
{
  static const char* value()
  {
    return MD5Sum< ::grasp_planning_graspit_msgs::LoadDatabaseModel >::value();
  }
  static const char* value(const ::grasp_planning_graspit_msgs::LoadDatabaseModelResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::grasp_planning_graspit_msgs::LoadDatabaseModelResponse> should match
// service_traits::DataType< ::grasp_planning_graspit_msgs::LoadDatabaseModel >
template<>
struct DataType< ::grasp_planning_graspit_msgs::LoadDatabaseModelResponse>
{
  static const char* value()
  {
    return DataType< ::grasp_planning_graspit_msgs::LoadDatabaseModel >::value();
  }
  static const char* value(const ::grasp_planning_graspit_msgs::LoadDatabaseModelResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // GRASP_PLANNING_GRASPIT_MSGS_MESSAGE_LOADDATABASEMODEL_H
