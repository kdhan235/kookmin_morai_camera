; Auto-generated. Do not edit!


(cl:in-package wego-msg)


;//! \htmlinclude parking.msg.html

(cl:defclass <parking> (roslisp-msg-protocol:ros-message)
  ((parking_flag
    :reader parking_flag
    :initarg :parking_flag
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass parking (<parking>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <parking>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'parking)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wego-msg:<parking> is deprecated: use wego-msg:parking instead.")))

(cl:ensure-generic-function 'parking_flag-val :lambda-list '(m))
(cl:defmethod parking_flag-val ((m <parking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wego-msg:parking_flag-val is deprecated.  Use wego-msg:parking_flag instead.")
  (parking_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <parking>) ostream)
  "Serializes a message object of type '<parking>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'parking_flag) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <parking>) istream)
  "Deserializes a message object of type '<parking>"
    (cl:setf (cl:slot-value msg 'parking_flag) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<parking>)))
  "Returns string type for a message object of type '<parking>"
  "wego/parking")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'parking)))
  "Returns string type for a message object of type 'parking"
  "wego/parking")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<parking>)))
  "Returns md5sum for a message object of type '<parking>"
  "b81c6305dd609c21a5df33b1adb734fd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'parking)))
  "Returns md5sum for a message object of type 'parking"
  "b81c6305dd609c21a5df33b1adb734fd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<parking>)))
  "Returns full string definition for message of type '<parking>"
  (cl:format cl:nil "bool parking_flag~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'parking)))
  "Returns full string definition for message of type 'parking"
  (cl:format cl:nil "bool parking_flag~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <parking>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <parking>))
  "Converts a ROS message object to a list"
  (cl:list 'parking
    (cl:cons ':parking_flag (parking_flag msg))
))
