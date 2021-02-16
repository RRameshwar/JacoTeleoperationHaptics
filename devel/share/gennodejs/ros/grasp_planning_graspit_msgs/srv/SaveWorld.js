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

class SaveWorldRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.filename = null;
      this.asInventor = null;
    }
    else {
      if (initObj.hasOwnProperty('filename')) {
        this.filename = initObj.filename
      }
      else {
        this.filename = '';
      }
      if (initObj.hasOwnProperty('asInventor')) {
        this.asInventor = initObj.asInventor
      }
      else {
        this.asInventor = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SaveWorldRequest
    // Serialize message field [filename]
    bufferOffset = _serializer.string(obj.filename, buffer, bufferOffset);
    // Serialize message field [asInventor]
    bufferOffset = _serializer.bool(obj.asInventor, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SaveWorldRequest
    let len;
    let data = new SaveWorldRequest(null);
    // Deserialize message field [filename]
    data.filename = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [asInventor]
    data.asInventor = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.filename.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_planning_graspit_msgs/SaveWorldRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd532c01918bb577315564f3464093652';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Requests to save the currently loaded Graspit world as file
    
    # the filename where to save the world
    string filename
    
    # true if the file is to be saved as inventor.
    # will be saved as graspit world otherwise.
    bool asInventor 
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SaveWorldRequest(null);
    if (msg.filename !== undefined) {
      resolved.filename = msg.filename;
    }
    else {
      resolved.filename = ''
    }

    if (msg.asInventor !== undefined) {
      resolved.asInventor = msg.asInventor;
    }
    else {
      resolved.asInventor = false
    }

    return resolved;
    }
};

class SaveWorldResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SaveWorldResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SaveWorldResponse
    let len;
    let data = new SaveWorldResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_planning_graspit_msgs/SaveWorldResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # success flag
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SaveWorldResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: SaveWorldRequest,
  Response: SaveWorldResponse,
  md5sum() { return 'a1d346f50cae3ae405bf7dcb546c6ae3'; },
  datatype() { return 'grasp_planning_graspit_msgs/SaveWorld'; }
};
