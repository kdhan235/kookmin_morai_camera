// Auto-generated. Do not edit!

// (in-package dh_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class cam_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mission = null;
      this.is_stop_flag = null;
      this.is_dynamic_obs = null;
      this.mission_time = null;
    }
    else {
      if (initObj.hasOwnProperty('mission')) {
        this.mission = initObj.mission
      }
      else {
        this.mission = 0;
      }
      if (initObj.hasOwnProperty('is_stop_flag')) {
        this.is_stop_flag = initObj.is_stop_flag
      }
      else {
        this.is_stop_flag = false;
      }
      if (initObj.hasOwnProperty('is_dynamic_obs')) {
        this.is_dynamic_obs = initObj.is_dynamic_obs
      }
      else {
        this.is_dynamic_obs = false;
      }
      if (initObj.hasOwnProperty('mission_time')) {
        this.mission_time = initObj.mission_time
      }
      else {
        this.mission_time = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cam_msg
    // Serialize message field [mission]
    bufferOffset = _serializer.int32(obj.mission, buffer, bufferOffset);
    // Serialize message field [is_stop_flag]
    bufferOffset = _serializer.bool(obj.is_stop_flag, buffer, bufferOffset);
    // Serialize message field [is_dynamic_obs]
    bufferOffset = _serializer.bool(obj.is_dynamic_obs, buffer, bufferOffset);
    // Serialize message field [mission_time]
    bufferOffset = _serializer.float32(obj.mission_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cam_msg
    let len;
    let data = new cam_msg(null);
    // Deserialize message field [mission]
    data.mission = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [is_stop_flag]
    data.is_stop_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_dynamic_obs]
    data.is_dynamic_obs = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [mission_time]
    data.mission_time = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dh_pkg/cam_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5fed320ada716dbe6ac3b9244f0ae883';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 mission
    bool is_stop_flag
    bool is_dynamic_obs
    float32 mission_time
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new cam_msg(null);
    if (msg.mission !== undefined) {
      resolved.mission = msg.mission;
    }
    else {
      resolved.mission = 0
    }

    if (msg.is_stop_flag !== undefined) {
      resolved.is_stop_flag = msg.is_stop_flag;
    }
    else {
      resolved.is_stop_flag = false
    }

    if (msg.is_dynamic_obs !== undefined) {
      resolved.is_dynamic_obs = msg.is_dynamic_obs;
    }
    else {
      resolved.is_dynamic_obs = false
    }

    if (msg.mission_time !== undefined) {
      resolved.mission_time = msg.mission_time;
    }
    else {
      resolved.mission_time = 0.0
    }

    return resolved;
    }
};

module.exports = cam_msg;
