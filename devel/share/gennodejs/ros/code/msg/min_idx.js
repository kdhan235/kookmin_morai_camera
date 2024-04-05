// Auto-generated. Do not edit!

// (in-package code.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class min_idx {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.min_idx = null;
    }
    else {
      if (initObj.hasOwnProperty('min_idx')) {
        this.min_idx = initObj.min_idx
      }
      else {
        this.min_idx = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type min_idx
    // Serialize message field [min_idx]
    bufferOffset = _serializer.int32(obj.min_idx, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type min_idx
    let len;
    let data = new min_idx(null);
    // Deserialize message field [min_idx]
    data.min_idx = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'code/min_idx';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6115d68580f96e7315468c7a398d1b04';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 min_idx
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new min_idx(null);
    if (msg.min_idx !== undefined) {
      resolved.min_idx = msg.min_idx;
    }
    else {
      resolved.min_idx = 0
    }

    return resolved;
    }
};

module.exports = min_idx;
