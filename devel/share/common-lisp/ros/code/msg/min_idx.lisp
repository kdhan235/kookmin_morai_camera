; Auto-generated. Do not edit!


(cl:in-package code-msg)


;//! \htmlinclude min_idx.msg.html

(cl:defclass <min_idx> (roslisp-msg-protocol:ros-message)
  ((min_idx
    :reader min_idx
    :initarg :min_idx
    :type cl:integer
    :initform 0))
)

(cl:defclass min_idx (<min_idx>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <min_idx>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'min_idx)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name code-msg:<min_idx> is deprecated: use code-msg:min_idx instead.")))

(cl:ensure-generic-function 'min_idx-val :lambda-list '(m))
(cl:defmethod min_idx-val ((m <min_idx>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader code-msg:min_idx-val is deprecated.  Use code-msg:min_idx instead.")
  (min_idx m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <min_idx>) ostream)
  "Serializes a message object of type '<min_idx>"
  (cl:let* ((signed (cl:slot-value msg 'min_idx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <min_idx>) istream)
  "Deserializes a message object of type '<min_idx>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'min_idx) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<min_idx>)))
  "Returns string type for a message object of type '<min_idx>"
  "code/min_idx")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'min_idx)))
  "Returns string type for a message object of type 'min_idx"
  "code/min_idx")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<min_idx>)))
  "Returns md5sum for a message object of type '<min_idx>"
  "6115d68580f96e7315468c7a398d1b04")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'min_idx)))
  "Returns md5sum for a message object of type 'min_idx"
  "6115d68580f96e7315468c7a398d1b04")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<min_idx>)))
  "Returns full string definition for message of type '<min_idx>"
  (cl:format cl:nil "int32 min_idx~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'min_idx)))
  "Returns full string definition for message of type 'min_idx"
  (cl:format cl:nil "int32 min_idx~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <min_idx>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <min_idx>))
  "Converts a ROS message object to a list"
  (cl:list 'min_idx
    (cl:cons ':min_idx (min_idx msg))
))
