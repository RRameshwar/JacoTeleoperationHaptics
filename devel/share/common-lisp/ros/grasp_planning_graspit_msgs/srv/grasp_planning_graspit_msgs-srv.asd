
(cl:in-package :asdf)

(defsystem "grasp_planning_graspit_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "AddToDatabase" :depends-on ("_package_AddToDatabase"))
    (:file "_package_AddToDatabase" :depends-on ("_package"))
    (:file "LoadDatabaseModel" :depends-on ("_package_LoadDatabaseModel"))
    (:file "_package_LoadDatabaseModel" :depends-on ("_package"))
    (:file "SaveWorld" :depends-on ("_package_SaveWorld"))
    (:file "_package_SaveWorld" :depends-on ("_package"))
  ))