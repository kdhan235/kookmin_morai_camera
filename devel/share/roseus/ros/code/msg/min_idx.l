;; Auto-generated. Do not edit!


(when (boundp 'code::min_idx)
  (if (not (find-package "CODE"))
    (make-package "CODE"))
  (shadow 'min_idx (find-package "CODE")))
(unless (find-package "CODE::MIN_IDX")
  (make-package "CODE::MIN_IDX"))

(in-package "ROS")
;;//! \htmlinclude min_idx.msg.html


(defclass code::min_idx
  :super ros::object
  :slots (_min_idx ))

(defmethod code::min_idx
  (:init
   (&key
    ((:min_idx __min_idx) 0)
    )
   (send-super :init)
   (setq _min_idx (round __min_idx))
   self)
  (:min_idx
   (&optional __min_idx)
   (if __min_idx (setq _min_idx __min_idx)) _min_idx)
  (:serialization-length
   ()
   (+
    ;; int32 _min_idx
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _min_idx
       (write-long _min_idx s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _min_idx
     (setq _min_idx (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get code::min_idx :md5sum-) "6115d68580f96e7315468c7a398d1b04")
(setf (get code::min_idx :datatype-) "code/min_idx")
(setf (get code::min_idx :definition-)
      "int32 min_idx
")



(provide :code/min_idx "6115d68580f96e7315468c7a398d1b04")


