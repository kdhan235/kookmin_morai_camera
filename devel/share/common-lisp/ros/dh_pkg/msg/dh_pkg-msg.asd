
(cl:in-package :asdf)

(defsystem "dh_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "cam_msg" :depends-on ("_package_cam_msg"))
    (:file "_package_cam_msg" :depends-on ("_package"))
  ))