;; Auto-generated. Do not edit!


(when (boundp 'Lidar_pkg::pointinfo)
  (if (not (find-package "LIDAR_PKG"))
    (make-package "LIDAR_PKG"))
  (shadow 'pointinfo (find-package "LIDAR_PKG")))
(unless (find-package "LIDAR_PKG::POINTINFO")
  (make-package "LIDAR_PKG::POINTINFO"))

(in-package "ROS")
;;//! \htmlinclude pointinfo.msg.html


(defclass Lidar_pkg::pointinfo
  :super ros::object
  :slots (_x _y _y_Min _y_Max _idx _dist ))

(defmethod Lidar_pkg::pointinfo
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:y_Min __y_Min) 0.0)
    ((:y_Max __y_Max) 0.0)
    ((:idx __idx) 0)
    ((:dist __dist) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _y_Min (float __y_Min))
   (setq _y_Max (float __y_Max))
   (setq _idx (round __idx))
   (setq _dist (float __dist))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:y_Min
   (&optional __y_Min)
   (if __y_Min (setq _y_Min __y_Min)) _y_Min)
  (:y_Max
   (&optional __y_Max)
   (if __y_Max (setq _y_Max __y_Max)) _y_Max)
  (:idx
   (&optional __idx)
   (if __idx (setq _idx __idx)) _idx)
  (:dist
   (&optional __dist)
   (if __dist (setq _dist __dist)) _dist)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _y_Min
    4
    ;; float32 _y_Max
    4
    ;; int16 _idx
    2
    ;; float32 _dist
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_Min
       (sys::poke _y_Min (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_Max
       (sys::poke _y_Max (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16 _idx
       (write-word _idx s)
     ;; float32 _dist
       (sys::poke _dist (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_Min
     (setq _y_Min (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_Max
     (setq _y_Max (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16 _idx
     (setq _idx (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _dist
     (setq _dist (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get Lidar_pkg::pointinfo :md5sum-) "5bf823e8b26f297f8df9324cb3bff675")
(setf (get Lidar_pkg::pointinfo :datatype-) "Lidar_pkg/pointinfo")
(setf (get Lidar_pkg::pointinfo :definition-)
      "
float32 x
float32 y
float32 y_Min
float32 y_Max
int16 idx
float32 dist 

")



(provide :Lidar_pkg/pointinfo "5bf823e8b26f297f8df9324cb3bff675")


