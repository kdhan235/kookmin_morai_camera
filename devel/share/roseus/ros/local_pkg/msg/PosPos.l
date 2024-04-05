;; Auto-generated. Do not edit!


(when (boundp 'local_pkg::PosPos)
  (if (not (find-package "LOCAL_PKG"))
    (make-package "LOCAL_PKG"))
  (shadow 'PosPos (find-package "LOCAL_PKG")))
(unless (find-package "LOCAL_PKG::POSPOS")
  (make-package "LOCAL_PKG::POSPOS"))

(in-package "ROS")
;;//! \htmlinclude PosPos.msg.html


(defclass local_pkg::PosPos
  :super ros::object
  :slots (_PosX _PosY _heading ))

(defmethod local_pkg::PosPos
  (:init
   (&key
    ((:PosX __PosX) 0.0)
    ((:PosY __PosY) 0.0)
    ((:heading __heading) 0.0)
    )
   (send-super :init)
   (setq _PosX (float __PosX))
   (setq _PosY (float __PosY))
   (setq _heading (float __heading))
   self)
  (:PosX
   (&optional __PosX)
   (if __PosX (setq _PosX __PosX)) _PosX)
  (:PosY
   (&optional __PosY)
   (if __PosY (setq _PosY __PosY)) _PosY)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:serialization-length
   ()
   (+
    ;; float64 _PosX
    8
    ;; float64 _PosY
    8
    ;; float64 _heading
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _PosX
       (sys::poke _PosX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _PosY
       (sys::poke _PosY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _PosX
     (setq _PosX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _PosY
     (setq _PosY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _heading
     (setq _heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get local_pkg::PosPos :md5sum-) "0c9c4339b79ef16486c4ef9e069204ef")
(setf (get local_pkg::PosPos :datatype-) "local_pkg/PosPos")
(setf (get local_pkg::PosPos :definition-)
      "float64 PosX
float64 PosY
float64 heading

")



(provide :local_pkg/PosPos "0c9c4339b79ef16486c4ef9e069204ef")


