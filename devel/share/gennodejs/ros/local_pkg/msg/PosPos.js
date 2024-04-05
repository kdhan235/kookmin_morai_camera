// Auto-generated. Do not edit!

// (in-package local_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PosPos {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.PosX = null;
      this.PosY = null;
      this.heading = null;
    }
    else {
      if (initObj.hasOwnProperty('PosX')) {
        this.PosX = initObj.PosX
      }
      else {
        this.PosX = 0.0;
      }
      if (initObj.hasOwnProperty('PosY')) {
        this.PosY = initObj.PosY
      }
      else {
        this.PosY = 0.0;
      }
      if (initObj.hasOwnProperty('heading')) {
        this.heading = initObj.heading
      }
      else {
        this.heading = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PosPos
    // Serialize message field [PosX]
    bufferOffset = _serializer.float64(obj.PosX, buffer, bufferOffset);
    // Serialize message field [PosY]
    bufferOffset = _serializer.float64(obj.PosY, buffer, bufferOffset);
    // Serialize message field [heading]
    bufferOffset = _serializer.float64(obj.heading, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PosPos
    let len;
    let data = new PosPos(null);
    // Deserialize message field [PosX]
    data.PosX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [PosY]
    data.PosY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [heading]
    data.heading = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'local_pkg/PosPos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0c9c4339b79ef16486c4ef9e069204ef';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 PosX
    float64 PosY
    float64 heading
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PosPos(null);
    if (msg.PosX !== undefined) {
      resolved.PosX = msg.PosX;
    }
    else {
      resolved.PosX = 0.0
    }

    if (msg.PosY !== undefined) {
      resolved.PosY = msg.PosY;
    }
    else {
      resolved.PosY = 0.0
    }

    if (msg.heading !== undefined) {
      resolved.heading = msg.heading;
    }
    else {
      resolved.heading = 0.0
    }

    return resolved;
    }
};

module.exports = PosPos;
