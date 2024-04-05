
(cl:in-package :asdf)

(defsystem "wego-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "parking" :depends-on ("_package_parking"))
    (:file "_package_parking" :depends-on ("_package"))
  ))