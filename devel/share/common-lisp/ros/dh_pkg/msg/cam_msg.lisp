; Auto-generated. Do not edit!


(cl:in-package dh_pkg-msg)


;//! \htmlinclude cam_msg.msg.html

(cl:defclass <cam_msg> (roslisp-msg-protocol:ros-message)
  ((mission
    :reader mission
    :initarg :mission
    :type cl:integer
    :initform 0)
   (is_stop_flag
    :reader is_stop_flag
    :initarg :is_stop_flag
    :type cl:boolean
    :initform cl:nil)
   (is_dynamic_obs
    :reader is_dynamic_obs
    :initarg :is_dynamic_obs
    :type cl:boolean
    :initform cl:nil)
   (mission_time
    :reader mission_time
    :initarg :mission_time
    :type cl:float
    :initform 0.0))
)

(cl:defclass cam_msg (<cam_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cam_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cam_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dh_pkg-msg:<cam_msg> is deprecated: use dh_pkg-msg:cam_msg instead.")))

(cl:ensure-generic-function 'mission-val :lambda-list '(m))
(cl:defmethod mission-val ((m <cam_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dh_pkg-msg:mission-val is deprecated.  Use dh_pkg-msg:mission instead.")
  (mission m))

(cl:ensure-generic-function 'is_stop_flag-val :lambda-list '(m))
(cl:defmethod is_stop_flag-val ((m <cam_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dh_pkg-msg:is_stop_flag-val is deprecated.  Use dh_pkg-msg:is_stop_flag instead.")
  (is_stop_flag m))

(cl:ensure-generic-function 'is_dynamic_obs-val :lambda-list '(m))
(cl:defmethod is_dynamic_obs-val ((m <cam_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dh_pkg-msg:is_dynamic_obs-val is deprecated.  Use dh_pkg-msg:is_dynamic_obs instead.")
  (is_dynamic_obs m))

(cl:ensure-generic-function 'mission_time-val :lambda-list '(m))
(cl:defmethod mission_time-val ((m <cam_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dh_pkg-msg:mission_time-val is deprecated.  Use dh_pkg-msg:mission_time instead.")
  (mission_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cam_msg>) ostream)
  "Serializes a message object of type '<cam_msg>"
  (cl:let* ((signed (cl:slot-value msg 'mission)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_stop_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_dynamic_obs) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mission_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cam_msg>) istream)
  "Deserializes a message object of type '<cam_msg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mission) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'is_stop_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_dynamic_obs) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mission_time) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cam_msg>)))
  "Returns string type for a message object of type '<cam_msg>"
  "dh_pkg/cam_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cam_msg)))
  "Returns string type for a message object of type 'cam_msg"
  "dh_pkg/cam_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cam_msg>)))
  "Returns md5sum for a message object of type '<cam_msg>"
  "5fed320ada716dbe6ac3b9244f0ae883")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cam_msg)))
  "Returns md5sum for a message object of type 'cam_msg"
  "5fed320ada716dbe6ac3b9244f0ae883")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cam_msg>)))
  "Returns full string definition for message of type '<cam_msg>"
  (cl:format cl:nil "int32 mission~%bool is_stop_flag~%bool is_dynamic_obs~%float32 mission_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cam_msg)))
  "Returns full string definition for message of type 'cam_msg"
  (cl:format cl:nil "int32 mission~%bool is_stop_flag~%bool is_dynamic_obs~%float32 mission_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cam_msg>))
  (cl:+ 0
     4
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cam_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'cam_msg
    (cl:cons ':mission (mission msg))
    (cl:cons ':is_stop_flag (is_stop_flag msg))
    (cl:cons ':is_dynamic_obs (is_dynamic_obs msg))
    (cl:cons ':mission_time (mission_time msg))
))
