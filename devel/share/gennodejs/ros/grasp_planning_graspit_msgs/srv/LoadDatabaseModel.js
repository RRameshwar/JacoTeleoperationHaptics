// Auto-generated. Do not edit!

// (in-package grasp_planning_graspit_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class LoadDatabaseModelRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.model_id = null;
      this.model_pose = null;
      this.clear_other_models = null;
    }
    else {
      if (initObj.hasOwnProperty('model_id')) {
        this.model_id = initObj.model_id
      }
      else {
        this.model_id = 0;
      }
      if (initObj.hasOwnProperty('model_pose')) {
        this.model_pose = initObj.model_pose
      }
      else {
        this.model_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('clear_other_models')) {
        this.clear_other_models = initObj.clear_other_models
      }
      else {
        this.clear_other_models = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadDatabaseModelRequest
    // Serialize message field [model_id]
    bufferOffset = _serializer.int32(obj.model_id, buffer, bufferOffset);
    // Serialize message field [model_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.model_pose, buffer, bufferOffset);
    // Serialize message field [clear_other_models]
    bufferOffset = _serializer.bool(obj.clear_other_models, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadDatabaseModelRequest
    let len;
    let data = new LoadDatabaseModelRequest(null);
    // Deserialize message field [model_id]
    data.model_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [model_pose]
    data.model_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [clear_other_models]
    data.clear_other_models = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 61;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_planning_graspit_msgs/LoadDatabaseModelRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e0142126fa25500956c0574c8caa1798';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Instructs GraspIt to load a database model and place it at a given location in the world.
    # The current version only allows a single instance of any database object in the graspit world;
    # if the object is already in the world, it will be moved to the new location
    
    # the id of the model to be loaded
    int32 model_id
    
    # the pose of the model in the world
    geometry_msgs/Pose model_pose
    
    # whether any other models in the GraspIt world should be cleared
    # somewhat hack-ish, needed for wuick testing for the robust planner
    bool clear_other_models
    
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LoadDatabaseModelRequest(null);
    if (msg.model_id !== undefined) {
      resolved.model_id = msg.model_id;
    }
    else {
      resolved.model_id = 0
    }

    if (msg.model_pose !== undefined) {
      resolved.model_pose = geometry_msgs.msg.Pose.Resolve(msg.model_pose)
    }
    else {
      resolved.model_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.clear_other_models !== undefined) {
      resolved.clear_other_models = msg.clear_other_models;
    }
    else {
      resolved.clear_other_models = false
    }

    return resolved;
    }
};

class LoadDatabaseModelResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LoadDatabaseModelResponse
    // Serialize message field [result]
    bufferOffset = _serializer.int32(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LoadDatabaseModelResponse
    let len;
    let data = new LoadDatabaseModelResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_planning_graspit_msgs/LoadDatabaseModelResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '41e017e2964af6197c0f07ec9353afaf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    int32 LOAD_SUCCESS = 0
    int32 LOAD_FAILURE = 1
    int32 result
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LoadDatabaseModelResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = 0
    }

    return resolved;
    }
};

// Constants for message
LoadDatabaseModelResponse.Constants = {
  LOAD_SUCCESS: 0,
  LOAD_FAILURE: 1,
}

module.exports = {
  Request: LoadDatabaseModelRequest,
  Response: LoadDatabaseModelResponse,
  md5sum() { return '8e7f810fdd6e19434987115ec75645ca'; },
  datatype() { return 'grasp_planning_graspit_msgs/LoadDatabaseModel'; }
};
