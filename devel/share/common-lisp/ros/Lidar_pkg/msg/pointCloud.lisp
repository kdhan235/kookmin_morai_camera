; Auto-generated. Do not edit!


(cl:in-package Lidar_pkg-msg)


;//! \htmlinclude pointCloud.msg.html

(cl:defclass <pointCloud> (roslisp-msg-protocol:ros-message)
  ((size
    :reader size
    :initarg :size
    :type cl:integer
    :initform 0)
   (points
    :reader points
    :initarg :points
    :type (cl:vector Lidar_pkg-msg:pointinfo)
   :initform (cl:make-array 0 :element-type 'Lidar_pkg-msg:pointinfo :initial-element (cl:make-instance 'Lidar_pkg-msg:pointinfo))))
)

(cl:defclass pointCloud (<pointCloud>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pointCloud>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pointCloud)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Lidar_pkg-msg:<pointCloud> is deprecated: use Lidar_pkg-msg:pointCloud instead.")))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <pointCloud>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Lidar_pkg-msg:size-val is deprecated.  Use Lidar_pkg-msg:size instead.")
  (size m))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <pointCloud>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Lidar_pkg-msg:points-val is deprecated.  Use Lidar_pkg-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pointCloud>) ostream)
  "Serializes a message object of type '<pointCloud>"
  (cl:let* ((signed (cl:slot-value msg 'size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pointCloud>) istream)
  "Deserializes a message object of type '<pointCloud>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'size) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'Lidar_pkg-msg:pointinfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pointCloud>)))
  "Returns string type for a message object of type '<pointCloud>"
  "Lidar_pkg/pointCloud")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pointCloud)))
  "Returns string type for a message object of type 'pointCloud"
  "Lidar_pkg/pointCloud")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pointCloud>)))
  "Returns md5sum for a message object of type '<pointCloud>"
  "606afa31f19383ae907939cc5ebf0442")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pointCloud)))
  "Returns md5sum for a message object of type 'pointCloud"
  "606afa31f19383ae907939cc5ebf0442")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pointCloud>)))
  "Returns full string definition for message of type '<pointCloud>"
  (cl:format cl:nil "int32 size~%pointinfo[] points ~%~%================================================================================~%MSG: Lidar_pkg/pointinfo~%~%float32 x~%float32 y~%float32 y_Min~%float32 y_Max~%int16 idx~%float32 dist ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pointCloud)))
  "Returns full string definition for message of type 'pointCloud"
  (cl:format cl:nil "int32 size~%pointinfo[] points ~%~%================================================================================~%MSG: Lidar_pkg/pointinfo~%~%float32 x~%float32 y~%float32 y_Min~%float32 y_Max~%int16 idx~%float32 dist ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pointCloud>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pointCloud>))
  "Converts a ROS message object to a list"
  (cl:list 'pointCloud
    (cl:cons ':size (size msg))
    (cl:cons ':points (points msg))
))
