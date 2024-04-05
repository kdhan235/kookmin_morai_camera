;; Auto-generated. Do not edit!


(when (boundp 'dh_pkg::cam_msg)
  (if (not (find-package "DH_PKG"))
    (make-package "DH_PKG"))
  (shadow 'cam_msg (find-package "DH_PKG")))
(unless (find-package "DH_PKG::CAM_MSG")
  (make-package "DH_PKG::CAM_MSG"))

(in-package "ROS")
;;//! \htmlinclude cam_msg.msg.html


(defclass dh_pkg::cam_msg
  :super ros::object
  :slots (_mission _is_stop_flag _is_dynamic_obs _mission_time ))

(defmethod dh_pkg::cam_msg
  (:init
   (&key
    ((:mission __mission) 0)
    ((:is_stop_flag __is_stop_flag) nil)
    ((:is_dynamic_obs __is_dynamic_obs) nil)
    ((:mission_time __mission_time) 0.0)
    )
   (send-super :init)
   (setq _mission (round __mission))
   (setq _is_stop_flag __is_stop_flag)
   (setq _is_dynamic_obs __is_dynamic_obs)
   (setq _mission_time (float __mission_time))
   self)
  (:mission
   (&optional __mission)
   (if __mission (setq _mission __mission)) _mission)
  (:is_stop_flag
   (&optional (__is_stop_flag :null))
   (if (not (eq __is_stop_flag :null)) (setq _is_stop_flag __is_stop_flag)) _is_stop_flag)
  (:is_dynamic_obs
   (&optional (__is_dynamic_obs :null))
   (if (not (eq __is_dynamic_obs :null)) (setq _is_dynamic_obs __is_dynamic_obs)) _is_dynamic_obs)
  (:mission_time
   (&optional __mission_time)
   (if __mission_time (setq _mission_time __mission_time)) _mission_time)
  (:serialization-length
   ()
   (+
    ;; int32 _mission
    4
    ;; bool _is_stop_flag
    1
    ;; bool _is_dynamic_obs
    1
    ;; float32 _mission_time
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _mission
       (write-long _mission s)
     ;; bool _is_stop_flag
       (if _is_stop_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_dynamic_obs
       (if _is_dynamic_obs (write-byte -1 s) (write-byte 0 s))
     ;; float32 _mission_time
       (sys::poke _mission_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _mission
     (setq _mission (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _is_stop_flag
     (setq _is_stop_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_dynamic_obs
     (setq _is_dynamic_obs (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _mission_time
     (setq _mission_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get dh_pkg::cam_msg :md5sum-) "5fed320ada716dbe6ac3b9244f0ae883")
(setf (get dh_pkg::cam_msg :datatype-) "dh_pkg/cam_msg")
(setf (get dh_pkg::cam_msg :definition-)
      "int32 mission
bool is_stop_flag
bool is_dynamic_obs
float32 mission_time

")



(provide :dh_pkg/cam_msg "5fed320ada716dbe6ac3b9244f0ae883")


