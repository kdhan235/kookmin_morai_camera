
(cl:in-package :asdf)

(defsystem "Lidar_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "pointCloud" :depends-on ("_package_pointCloud"))
    (:file "_package_pointCloud" :depends-on ("_package"))
    (:file "pointinfo" :depends-on ("_package_pointinfo"))
    (:file "_package_pointinfo" :depends-on ("_package"))
  ))