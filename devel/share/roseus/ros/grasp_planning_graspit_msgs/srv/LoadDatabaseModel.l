;; Auto-generated. Do not edit!


(when (boundp 'grasp_planning_graspit_msgs::LoadDatabaseModel)
  (if (not (find-package "GRASP_PLANNING_GRASPIT_MSGS"))
    (make-package "GRASP_PLANNING_GRASPIT_MSGS"))
  (shadow 'LoadDatabaseModel (find-package "GRASP_PLANNING_GRASPIT_MSGS")))
(unless (find-package "GRASP_PLANNING_GRASPIT_MSGS::LOADDATABASEMODEL")
  (make-package "GRASP_PLANNING_GRASPIT_MSGS::LOADDATABASEMODEL"))
(unless (find-package "GRASP_PLANNING_GRASPIT_MSGS::LOADDATABASEMODELREQUEST")
  (make-package "GRASP_PLANNING_GRASPIT_MSGS::LOADDATABASEMODELREQUEST"))
(unless (find-package "GRASP_PLANNING_GRASPIT_MSGS::LOADDATABASEMODELRESPONSE")
  (make-package "GRASP_PLANNING_GRASPIT_MSGS::LOADDATABASEMODELRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass grasp_planning_graspit_msgs::LoadDatabaseModelRequest
  :super ros::object
  :slots (_model_id _model_pose _clear_other_models ))

(defmethod grasp_planning_graspit_msgs::LoadDatabaseModelRequest
  (:init
   (&key
    ((:model_id __model_id) 0)
    ((:model_pose __model_pose) (instance geometry_msgs::Pose :init))
    ((:clear_other_models __clear_other_models) nil)
    )
   (send-super :init)
   (setq _model_id (round __model_id))
   (setq _model_pose __model_pose)
   (setq _clear_other_models __clear_other_models)
   self)
  (:model_id
   (&optional __model_id)
   (if __model_id (setq _model_id __model_id)) _model_id)
  (:model_pose
   (&rest __model_pose)
   (if (keywordp (car __model_pose))
       (send* _model_pose __model_pose)
     (progn
       (if __model_pose (setq _model_pose (car __model_pose)))
       _model_pose)))
  (:clear_other_models
   (&optional __clear_other_models)
   (if __clear_other_models (setq _clear_other_models __clear_other_models)) _clear_other_models)
  (:serialization-length
   ()
   (+
    ;; int32 _model_id
    4
    ;; geometry_msgs/Pose _model_pose
    (send _model_pose :serialization-length)
    ;; bool _clear_other_models
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _model_id
       (write-long _model_id s)
     ;; geometry_msgs/Pose _model_pose
       (send _model_pose :serialize s)
     ;; bool _clear_other_models
       (if _clear_other_models (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _model_id
     (setq _model_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Pose _model_pose
     (send _model_pose :deserialize buf ptr-) (incf ptr- (send _model_pose :serialization-length))
   ;; bool _clear_other_models
     (setq _clear_other_models (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(intern "*LOAD_SUCCESS*" (find-package "GRASP_PLANNING_GRASPIT_MSGS::LOADDATABASEMODELRESPONSE"))
(shadow '*LOAD_SUCCESS* (find-package "GRASP_PLANNING_GRASPIT_MSGS::LOADDATABASEMODELRESPONSE"))
(defconstant grasp_planning_graspit_msgs::LoadDatabaseModelResponse::*LOAD_SUCCESS* 0)
(intern "*LOAD_FAILURE*" (find-package "GRASP_PLANNING_GRASPIT_MSGS::LOADDATABASEMODELRESPONSE"))
(shadow '*LOAD_FAILURE* (find-package "GRASP_PLANNING_GRASPIT_MSGS::LOADDATABASEMODELRESPONSE"))
(defconstant grasp_planning_graspit_msgs::LoadDatabaseModelResponse::*LOAD_FAILURE* 1)
(defclass grasp_planning_graspit_msgs::LoadDatabaseModelResponse
  :super ros::object
  :slots (_result ))

(defmethod grasp_planning_graspit_msgs::LoadDatabaseModelResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _result
       (write-long _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass grasp_planning_graspit_msgs::LoadDatabaseModel
  :super ros::object
  :slots ())

(setf (get grasp_planning_graspit_msgs::LoadDatabaseModel :md5sum-) "8e7f810fdd6e19434987115ec75645ca")
(setf (get grasp_planning_graspit_msgs::LoadDatabaseModel :datatype-) "grasp_planning_graspit_msgs/LoadDatabaseModel")
(setf (get grasp_planning_graspit_msgs::LoadDatabaseModel :request) grasp_planning_graspit_msgs::LoadDatabaseModelRequest)
(setf (get grasp_planning_graspit_msgs::LoadDatabaseModel :response) grasp_planning_graspit_msgs::LoadDatabaseModelResponse)

(defmethod grasp_planning_graspit_msgs::LoadDatabaseModelRequest
  (:response () (instance grasp_planning_graspit_msgs::LoadDatabaseModelResponse :init)))

(setf (get grasp_planning_graspit_msgs::LoadDatabaseModelRequest :md5sum-) "8e7f810fdd6e19434987115ec75645ca")
(setf (get grasp_planning_graspit_msgs::LoadDatabaseModelRequest :datatype-) "grasp_planning_graspit_msgs/LoadDatabaseModelRequest")
(setf (get grasp_planning_graspit_msgs::LoadDatabaseModelRequest :definition-)
      "# Instructs GraspIt to load a database model and place it at a given location in the world.
# The current version only allows a single instance of any database object in the graspit world;
# if the object is already in the world, it will be moved to the new location

# the id of the model to be loaded
int32 model_id

# the pose of the model in the world
geometry_msgs/Pose model_pose

# whether any other models in the GraspIt world should be cleared
# somewhat hack-ish, needed for wuick testing for the robust planner
bool clear_other_models


================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---

int32 LOAD_SUCCESS = 0
int32 LOAD_FAILURE = 1
int32 result
")

(setf (get grasp_planning_graspit_msgs::LoadDatabaseModelResponse :md5sum-) "8e7f810fdd6e19434987115ec75645ca")
(setf (get grasp_planning_graspit_msgs::LoadDatabaseModelResponse :datatype-) "grasp_planning_graspit_msgs/LoadDatabaseModelResponse")
(setf (get grasp_planning_graspit_msgs::LoadDatabaseModelResponse :definition-)
      "# Instructs GraspIt to load a database model and place it at a given location in the world.
# The current version only allows a single instance of any database object in the graspit world;
# if the object is already in the world, it will be moved to the new location

# the id of the model to be loaded
int32 model_id

# the pose of the model in the world
geometry_msgs/Pose model_pose

# whether any other models in the GraspIt world should be cleared
# somewhat hack-ish, needed for wuick testing for the robust planner
bool clear_other_models


================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---

int32 LOAD_SUCCESS = 0
int32 LOAD_FAILURE = 1
int32 result
")



(provide :grasp_planning_graspit_msgs/LoadDatabaseModel "8e7f810fdd6e19434987115ec75645ca")


