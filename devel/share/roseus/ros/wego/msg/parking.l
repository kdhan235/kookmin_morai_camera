;; Auto-generated. Do not edit!


(when (boundp 'wego::parking)
  (if (not (find-package "WEGO"))
    (make-package "WEGO"))
  (shadow 'parking (find-package "WEGO")))
(unless (find-package "WEGO::PARKING")
  (make-package "WEGO::PARKING"))

(in-package "ROS")
;;//! \htmlinclude parking.msg.html


(defclass wego::parking
  :super ros::object
  :slots (_parking_flag ))

(defmethod wego::parking
  (:init
   (&key
    ((:parking_flag __parking_flag) nil)
    )
   (send-super :init)
   (setq _parking_flag __parking_flag)
   self)
  (:parking_flag
   (&optional (__parking_flag :null))
   (if (not (eq __parking_flag :null)) (setq _parking_flag __parking_flag)) _parking_flag)
  (:serialization-length
   ()
   (+
    ;; bool _parking_flag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _parking_flag
       (if _parking_flag (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _parking_flag
     (setq _parking_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get wego::parking :md5sum-) "b81c6305dd609c21a5df33b1adb734fd")
(setf (get wego::parking :datatype-) "wego/parking")
(setf (get wego::parking :definition-)
      "bool parking_flag
")



(provide :wego/parking "b81c6305dd609c21a5df33b1adb734fd")


