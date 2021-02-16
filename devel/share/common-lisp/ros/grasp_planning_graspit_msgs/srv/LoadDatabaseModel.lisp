; Auto-generated. Do not edit!


(cl:in-package grasp_planning_graspit_msgs-srv)


;//! \htmlinclude LoadDatabaseModel-request.msg.html

(cl:defclass <LoadDatabaseModel-request> (roslisp-msg-protocol:ros-message)
  ((model_id
    :reader model_id
    :initarg :model_id
    :type cl:integer
    :initform 0)
   (model_pose
    :reader model_pose
    :initarg :model_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (clear_other_models
    :reader clear_other_models
    :initarg :clear_other_models
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LoadDatabaseModel-request (<LoadDatabaseModel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadDatabaseModel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadDatabaseModel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_planning_graspit_msgs-srv:<LoadDatabaseModel-request> is deprecated: use grasp_planning_graspit_msgs-srv:LoadDatabaseModel-request instead.")))

(cl:ensure-generic-function 'model_id-val :lambda-list '(m))
(cl:defmethod model_id-val ((m <LoadDatabaseModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:model_id-val is deprecated.  Use grasp_planning_graspit_msgs-srv:model_id instead.")
  (model_id m))

(cl:ensure-generic-function 'model_pose-val :lambda-list '(m))
(cl:defmethod model_pose-val ((m <LoadDatabaseModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:model_pose-val is deprecated.  Use grasp_planning_graspit_msgs-srv:model_pose instead.")
  (model_pose m))

(cl:ensure-generic-function 'clear_other_models-val :lambda-list '(m))
(cl:defmethod clear_other_models-val ((m <LoadDatabaseModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:clear_other_models-val is deprecated.  Use grasp_planning_graspit_msgs-srv:clear_other_models instead.")
  (clear_other_models m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadDatabaseModel-request>) ostream)
  "Serializes a message object of type '<LoadDatabaseModel-request>"
  (cl:let* ((signed (cl:slot-value msg 'model_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'model_pose) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clear_other_models) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadDatabaseModel-request>) istream)
  "Deserializes a message object of type '<LoadDatabaseModel-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'model_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'model_pose) istream)
    (cl:setf (cl:slot-value msg 'clear_other_models) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadDatabaseModel-request>)))
  "Returns string type for a service object of type '<LoadDatabaseModel-request>"
  "grasp_planning_graspit_msgs/LoadDatabaseModelRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadDatabaseModel-request)))
  "Returns string type for a service object of type 'LoadDatabaseModel-request"
  "grasp_planning_graspit_msgs/LoadDatabaseModelRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadDatabaseModel-request>)))
  "Returns md5sum for a message object of type '<LoadDatabaseModel-request>"
  "8e7f810fdd6e19434987115ec75645ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadDatabaseModel-request)))
  "Returns md5sum for a message object of type 'LoadDatabaseModel-request"
  "8e7f810fdd6e19434987115ec75645ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadDatabaseModel-request>)))
  "Returns full string definition for message of type '<LoadDatabaseModel-request>"
  (cl:format cl:nil "# Instructs GraspIt to load a database model and place it at a given location in the world.~%# The current version only allows a single instance of any database object in the graspit world;~%# if the object is already in the world, it will be moved to the new location~%~%# the id of the model to be loaded~%int32 model_id~%~%# the pose of the model in the world~%geometry_msgs/Pose model_pose~%~%# whether any other models in the GraspIt world should be cleared~%# somewhat hack-ish, needed for wuick testing for the robust planner~%bool clear_other_models~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadDatabaseModel-request)))
  "Returns full string definition for message of type 'LoadDatabaseModel-request"
  (cl:format cl:nil "# Instructs GraspIt to load a database model and place it at a given location in the world.~%# The current version only allows a single instance of any database object in the graspit world;~%# if the object is already in the world, it will be moved to the new location~%~%# the id of the model to be loaded~%int32 model_id~%~%# the pose of the model in the world~%geometry_msgs/Pose model_pose~%~%# whether any other models in the GraspIt world should be cleared~%# somewhat hack-ish, needed for wuick testing for the robust planner~%bool clear_other_models~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadDatabaseModel-request>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'model_pose))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadDatabaseModel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadDatabaseModel-request
    (cl:cons ':model_id (model_id msg))
    (cl:cons ':model_pose (model_pose msg))
    (cl:cons ':clear_other_models (clear_other_models msg))
))
;//! \htmlinclude LoadDatabaseModel-response.msg.html

(cl:defclass <LoadDatabaseModel-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass LoadDatabaseModel-response (<LoadDatabaseModel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadDatabaseModel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadDatabaseModel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_planning_graspit_msgs-srv:<LoadDatabaseModel-response> is deprecated: use grasp_planning_graspit_msgs-srv:LoadDatabaseModel-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <LoadDatabaseModel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:result-val is deprecated.  Use grasp_planning_graspit_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<LoadDatabaseModel-response>)))
    "Constants for message type '<LoadDatabaseModel-response>"
  '((:LOAD_SUCCESS . 0)
    (:LOAD_FAILURE . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'LoadDatabaseModel-response)))
    "Constants for message type 'LoadDatabaseModel-response"
  '((:LOAD_SUCCESS . 0)
    (:LOAD_FAILURE . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadDatabaseModel-response>) ostream)
  "Serializes a message object of type '<LoadDatabaseModel-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadDatabaseModel-response>) istream)
  "Deserializes a message object of type '<LoadDatabaseModel-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadDatabaseModel-response>)))
  "Returns string type for a service object of type '<LoadDatabaseModel-response>"
  "grasp_planning_graspit_msgs/LoadDatabaseModelResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadDatabaseModel-response)))
  "Returns string type for a service object of type 'LoadDatabaseModel-response"
  "grasp_planning_graspit_msgs/LoadDatabaseModelResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadDatabaseModel-response>)))
  "Returns md5sum for a message object of type '<LoadDatabaseModel-response>"
  "8e7f810fdd6e19434987115ec75645ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadDatabaseModel-response)))
  "Returns md5sum for a message object of type 'LoadDatabaseModel-response"
  "8e7f810fdd6e19434987115ec75645ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadDatabaseModel-response>)))
  "Returns full string definition for message of type '<LoadDatabaseModel-response>"
  (cl:format cl:nil "~%int32 LOAD_SUCCESS = 0~%int32 LOAD_FAILURE = 1~%int32 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadDatabaseModel-response)))
  "Returns full string definition for message of type 'LoadDatabaseModel-response"
  (cl:format cl:nil "~%int32 LOAD_SUCCESS = 0~%int32 LOAD_FAILURE = 1~%int32 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadDatabaseModel-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadDatabaseModel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadDatabaseModel-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadDatabaseModel)))
  'LoadDatabaseModel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadDatabaseModel)))
  'LoadDatabaseModel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadDatabaseModel)))
  "Returns string type for a service object of type '<LoadDatabaseModel>"
  "grasp_planning_graspit_msgs/LoadDatabaseModel")