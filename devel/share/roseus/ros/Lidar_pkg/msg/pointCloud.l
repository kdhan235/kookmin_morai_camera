;; Auto-generated. Do not edit!


(when (boundp 'Lidar_pkg::pointCloud)
  (if (not (find-package "LIDAR_PKG"))
    (make-package "LIDAR_PKG"))
  (shadow 'pointCloud (find-package "LIDAR_PKG")))
(unless (find-package "LIDAR_PKG::POINTCLOUD")
  (make-package "LIDAR_PKG::POINTCLOUD"))

(in-package "ROS")
;;//! \htmlinclude pointCloud.msg.html


(defclass Lidar_pkg::pointCloud
  :super ros::object
  :slots (_size _points ))

(defmethod Lidar_pkg::pointCloud
  (:init
   (&key
    ((:size __size) 0)
    ((:points __points) ())
    )
   (send-super :init)
   (setq _size (round __size))
   (setq _points __points)
   self)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; int32 _size
    4
    ;; Lidar_pkg/pointinfo[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _size
       (write-long _size s)
     ;; Lidar_pkg/pointinfo[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _size
     (setq _size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; Lidar_pkg/pointinfo[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance Lidar_pkg::pointinfo :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get Lidar_pkg::pointCloud :md5sum-) "606afa31f19383ae907939cc5ebf0442")
(setf (get Lidar_pkg::pointCloud :datatype-) "Lidar_pkg/pointCloud")
(setf (get Lidar_pkg::pointCloud :definition-)
      "int32 size
pointinfo[] points 

================================================================================
MSG: Lidar_pkg/pointinfo

float32 x
float32 y
float32 y_Min
float32 y_Max
int16 idx
float32 dist 

")



(provide :Lidar_pkg/pointCloud "606afa31f19383ae907939cc5ebf0442")


