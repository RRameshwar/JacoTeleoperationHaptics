// Auto-generated. Do not edit!

// (in-package grasp_planning_graspit_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class AddToDatabaseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.filename = null;
      this.isRobot = null;
      this.asGraspable = null;
      this.modelName = null;
      this.jointNames = null;
    }
    else {
      if (initObj.hasOwnProperty('filename')) {
        this.filename = initObj.filename
      }
      else {
        this.filename = '';
      }
      if (initObj.hasOwnProperty('isRobot')) {
        this.isRobot = initObj.isRobot
      }
      else {
        this.isRobot = false;
      }
      if (initObj.hasOwnProperty('asGraspable')) {
        this.asGraspable = initObj.asGraspable
      }
      else {
        this.asGraspable = false;
      }
      if (initObj.hasOwnProperty('modelName')) {
        this.modelName = initObj.modelName
      }
      else {
        this.modelName = '';
      }
      if (initObj.hasOwnProperty('jointNames')) {
        this.jointNames = initObj.jointNames
      }
      else {
        this.jointNames = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddToDatabaseRequest
    // Serialize message field [filename]
    bufferOffset = _serializer.string(obj.filename, buffer, bufferOffset);
    // Serialize message field [isRobot]
    bufferOffset = _serializer.bool(obj.isRobot, buffer, bufferOffset);
    // Serialize message field [asGraspable]
    bufferOffset = _serializer.bool(obj.asGraspable, buffer, bufferOffset);
    // Serialize message field [modelName]
    bufferOffset = _serializer.string(obj.modelName, buffer, bufferOffset);
    // Serialize message field [jointNames]
    bufferOffset = _arraySerializer.string(obj.jointNames, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddToDatabaseRequest
    let len;
    let data = new AddToDatabaseRequest(null);
    // Deserialize message field [filename]
    data.filename = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [isRobot]
    data.isRobot = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [asGraspable]
    data.asGraspable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [modelName]
    data.modelName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [jointNames]
    data.jointNames = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.filename.length;
    length += object.modelName.length;
    object.jointNames.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 14;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_planning_graspit_msgs/AddToDatabaseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5ab6c9f30acc0ca8b3199d205c07915a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Requests to add a Graspit model to the database
    # This does not load it into the current GraspIt world.
    # Request loading of the databse into the GraspIt world
    # needs to be done with another service.
    
    # the GraspIt! XML file to load. Can only be a robot or
    # object file. Adding whole worlds to databases is not
    # supported.
    string filename
    
    # true if the file is a robot file, false if it is an object file
    bool isRobot
    
    # only used if isRobot=false: Load the object as graspable
    # object. If false, the object is loaded as obstacle. 
    bool asGraspable
    
    # set a unique model name for the database. If a model
    # with this name exists in the database already, the service
    # request will fail, and you have to try another name.
    string modelName
    
    # if this is a robot file, this array contains the URDF finger
    # joint names in the order they are specified in the graspit file.
    string[] jointNames
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddToDatabaseRequest(null);
    if (msg.filename !== undefined) {
      resolved.filename = msg.filename;
    }
    else {
      resolved.filename = ''
    }

    if (msg.isRobot !== undefined) {
      resolved.isRobot = msg.isRobot;
    }
    else {
      resolved.isRobot = false
    }

    if (msg.asGraspable !== undefined) {
      resolved.asGraspable = msg.asGraspable;
    }
    else {
      resolved.asGraspable = false
    }

    if (msg.modelName !== undefined) {
      resolved.modelName = msg.modelName;
    }
    else {
      resolved.modelName = ''
    }

    if (msg.jointNames !== undefined) {
      resolved.jointNames = msg.jointNames;
    }
    else {
      resolved.jointNames = []
    }

    return resolved;
    }
};

class AddToDatabaseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.returnCode = null;
      this.modelID = null;
    }
    else {
      if (initObj.hasOwnProperty('returnCode')) {
        this.returnCode = initObj.returnCode
      }
      else {
        this.returnCode = 0;
      }
      if (initObj.hasOwnProperty('modelID')) {
        this.modelID = initObj.modelID
      }
      else {
        this.modelID = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddToDatabaseResponse
    // Serialize message field [returnCode]
    bufferOffset = _serializer.int32(obj.returnCode, buffer, bufferOffset);
    // Serialize message field [modelID]
    bufferOffset = _serializer.int32(obj.modelID, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddToDatabaseResponse
    let len;
    let data = new AddToDatabaseResponse(null);
    // Deserialize message field [returnCode]
    data.returnCode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [modelID]
    data.modelID = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_planning_graspit_msgs/AddToDatabaseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fce6766e0f7863d40768bb95aba1132d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    # success flag (see return codes below)
    int32 returnCode
    
    # returns the model ID which was assigned to this loaded
    # model in the database.
    int32 modelID
    
    
    
    
    # adding to database successful.
    int32 SUCCESS = 0
    
    # model with this name exists in database.
    int32 MODEL_EXISTS = 1 
    
    # could nto find the file.
    int32 FILE_NOT_FOUND = 2
    
    # graspit world not ready to take objects.
    int32 NOT_READY = 3
    
    # cannot add a model with empty name
    int32 NO_NAME = 4
    
    # other error occurred. 
    int32 OTHER_ERROR = 5
    
    
    
    
    
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddToDatabaseResponse(null);
    if (msg.returnCode !== undefined) {
      resolved.returnCode = msg.returnCode;
    }
    else {
      resolved.returnCode = 0
    }

    if (msg.modelID !== undefined) {
      resolved.modelID = msg.modelID;
    }
    else {
      resolved.modelID = 0
    }

    return resolved;
    }
};

// Constants for message
AddToDatabaseResponse.Constants = {
  SUCCESS: 0,
  MODEL_EXISTS: 1,
  FILE_NOT_FOUND: 2,
  NOT_READY: 3,
  NO_NAME: 4,
  OTHER_ERROR: 5,
}

module.exports = {
  Request: AddToDatabaseRequest,
  Response: AddToDatabaseResponse,
  md5sum() { return '1d861bc118bc160b1e8a75f648c6112e'; },
  datatype() { return 'grasp_planning_graspit_msgs/AddToDatabase'; }
};
