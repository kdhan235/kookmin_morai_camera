; Auto-generated. Do not edit!


(cl:in-package local_pkg-msg)


;//! \htmlinclude PosPos.msg.html

(cl:defclass <PosPos> (roslisp-msg-protocol:ros-message)
  ((PosX
    :reader PosX
    :initarg :PosX
    :type cl:float
    :initform 0.0)
   (PosY
    :reader PosY
    :initarg :PosY
    :type cl:float
    :initform 0.0)
   (heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0))
)

(cl:defclass PosPos (<PosPos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PosPos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PosPos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name local_pkg-msg:<PosPos> is deprecated: use local_pkg-msg:PosPos instead.")))

(cl:ensure-generic-function 'PosX-val :lambda-list '(m))
(cl:defmethod PosX-val ((m <PosPos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader local_pkg-msg:PosX-val is deprecated.  Use local_pkg-msg:PosX instead.")
  (PosX m))

(cl:ensure-generic-function 'PosY-val :lambda-list '(m))
(cl:defmethod PosY-val ((m <PosPos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader local_pkg-msg:PosY-val is deprecated.  Use local_pkg-msg:PosY instead.")
  (PosY m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <PosPos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader local_pkg-msg:heading-val is deprecated.  Use local_pkg-msg:heading instead.")
  (heading m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PosPos>) ostream)
  "Serializes a message object of type '<PosPos>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'PosX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'PosY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PosPos>) istream)
  "Deserializes a message object of type '<PosPos>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'PosX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'PosY) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PosPos>)))
  "Returns string type for a message object of type '<PosPos>"
  "local_pkg/PosPos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PosPos)))
  "Returns string type for a message object of type 'PosPos"
  "local_pkg/PosPos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PosPos>)))
  "Returns md5sum for a message object of type '<PosPos>"
  "0c9c4339b79ef16486c4ef9e069204ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PosPos)))
  "Returns md5sum for a message object of type 'PosPos"
  "0c9c4339b79ef16486c4ef9e069204ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PosPos>)))
  "Returns full string definition for message of type '<PosPos>"
  (cl:format cl:nil "float64 PosX~%float64 PosY~%float64 heading~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PosPos)))
  "Returns full string definition for message of type 'PosPos"
  (cl:format cl:nil "float64 PosX~%float64 PosY~%float64 heading~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PosPos>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PosPos>))
  "Converts a ROS message object to a list"
  (cl:list 'PosPos
    (cl:cons ':PosX (PosX msg))
    (cl:cons ':PosY (PosY msg))
    (cl:cons ':heading (heading msg))
))
