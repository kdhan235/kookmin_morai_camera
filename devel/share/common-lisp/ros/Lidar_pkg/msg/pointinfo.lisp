; Auto-generated. Do not edit!


(cl:in-package Lidar_pkg-msg)


;//! \htmlinclude pointinfo.msg.html

(cl:defclass <pointinfo> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (y_Min
    :reader y_Min
    :initarg :y_Min
    :type cl:float
    :initform 0.0)
   (y_Max
    :reader y_Max
    :initarg :y_Max
    :type cl:float
    :initform 0.0)
   (idx
    :reader idx
    :initarg :idx
    :type cl:fixnum
    :initform 0)
   (dist
    :reader dist
    :initarg :dist
    :type cl:float
    :initform 0.0))
)

(cl:defclass pointinfo (<pointinfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pointinfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pointinfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Lidar_pkg-msg:<pointinfo> is deprecated: use Lidar_pkg-msg:pointinfo instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <pointinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Lidar_pkg-msg:x-val is deprecated.  Use Lidar_pkg-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <pointinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Lidar_pkg-msg:y-val is deprecated.  Use Lidar_pkg-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'y_Min-val :lambda-list '(m))
(cl:defmethod y_Min-val ((m <pointinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Lidar_pkg-msg:y_Min-val is deprecated.  Use Lidar_pkg-msg:y_Min instead.")
  (y_Min m))

(cl:ensure-generic-function 'y_Max-val :lambda-list '(m))
(cl:defmethod y_Max-val ((m <pointinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Lidar_pkg-msg:y_Max-val is deprecated.  Use Lidar_pkg-msg:y_Max instead.")
  (y_Max m))

(cl:ensure-generic-function 'idx-val :lambda-list '(m))
(cl:defmethod idx-val ((m <pointinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Lidar_pkg-msg:idx-val is deprecated.  Use Lidar_pkg-msg:idx instead.")
  (idx m))

(cl:ensure-generic-function 'dist-val :lambda-list '(m))
(cl:defmethod dist-val ((m <pointinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Lidar_pkg-msg:dist-val is deprecated.  Use Lidar_pkg-msg:dist instead.")
  (dist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pointinfo>) ostream)
  "Serializes a message object of type '<pointinfo>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_Min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_Max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'idx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pointinfo>) istream)
  "Deserializes a message object of type '<pointinfo>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_Min) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_Max) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'idx) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dist) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pointinfo>)))
  "Returns string type for a message object of type '<pointinfo>"
  "Lidar_pkg/pointinfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pointinfo)))
  "Returns string type for a message object of type 'pointinfo"
  "Lidar_pkg/pointinfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pointinfo>)))
  "Returns md5sum for a message object of type '<pointinfo>"
  "5bf823e8b26f297f8df9324cb3bff675")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pointinfo)))
  "Returns md5sum for a message object of type 'pointinfo"
  "5bf823e8b26f297f8df9324cb3bff675")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pointinfo>)))
  "Returns full string definition for message of type '<pointinfo>"
  (cl:format cl:nil "~%float32 x~%float32 y~%float32 y_Min~%float32 y_Max~%int16 idx~%float32 dist ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pointinfo)))
  "Returns full string definition for message of type 'pointinfo"
  (cl:format cl:nil "~%float32 x~%float32 y~%float32 y_Min~%float32 y_Max~%int16 idx~%float32 dist ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pointinfo>))
  (cl:+ 0
     4
     4
     4
     4
     2
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pointinfo>))
  "Converts a ROS message object to a list"
  (cl:list 'pointinfo
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':y_Min (y_Min msg))
    (cl:cons ':y_Max (y_Max msg))
    (cl:cons ':idx (idx msg))
    (cl:cons ':dist (dist msg))
))
