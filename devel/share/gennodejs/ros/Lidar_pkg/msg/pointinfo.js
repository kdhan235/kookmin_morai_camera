// Auto-generated. Do not edit!

// (in-package Lidar_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class pointinfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.y_Min = null;
      this.y_Max = null;
      this.idx = null;
      this.dist = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('y_Min')) {
        this.y_Min = initObj.y_Min
      }
      else {
        this.y_Min = 0.0;
      }
      if (initObj.hasOwnProperty('y_Max')) {
        this.y_Max = initObj.y_Max
      }
      else {
        this.y_Max = 0.0;
      }
      if (initObj.hasOwnProperty('idx')) {
        this.idx = initObj.idx
      }
      else {
        this.idx = 0;
      }
      if (initObj.hasOwnProperty('dist')) {
        this.dist = initObj.dist
      }
      else {
        this.dist = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type pointinfo
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float32(obj.y, buffer, bufferOffset);
    // Serialize message field [y_Min]
    bufferOffset = _serializer.float32(obj.y_Min, buffer, bufferOffset);
    // Serialize message field [y_Max]
    bufferOffset = _serializer.float32(obj.y_Max, buffer, bufferOffset);
    // Serialize message field [idx]
    bufferOffset = _serializer.int16(obj.idx, buffer, bufferOffset);
    // Serialize message field [dist]
    bufferOffset = _serializer.float32(obj.dist, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type pointinfo
    let len;
    let data = new pointinfo(null);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y_Min]
    data.y_Min = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y_Max]
    data.y_Max = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [idx]
    data.idx = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [dist]
    data.dist = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 22;
  }

  static datatype() {
    // Returns string type for a message object
    return 'Lidar_pkg/pointinfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5bf823e8b26f297f8df9324cb3bff675';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float32 x
    float32 y
    float32 y_Min
    float32 y_Max
    int16 idx
    float32 dist 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new pointinfo(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.y_Min !== undefined) {
      resolved.y_Min = msg.y_Min;
    }
    else {
      resolved.y_Min = 0.0
    }

    if (msg.y_Max !== undefined) {
      resolved.y_Max = msg.y_Max;
    }
    else {
      resolved.y_Max = 0.0
    }

    if (msg.idx !== undefined) {
      resolved.idx = msg.idx;
    }
    else {
      resolved.idx = 0
    }

    if (msg.dist !== undefined) {
      resolved.dist = msg.dist;
    }
    else {
      resolved.dist = 0.0
    }

    return resolved;
    }
};

module.exports = pointinfo;
