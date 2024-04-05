
(cl:in-package :asdf)

(defsystem "code-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "min_idx" :depends-on ("_package_min_idx"))
    (:file "_package_min_idx" :depends-on ("_package"))
  ))