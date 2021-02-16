; Auto-generated. Do not edit!


(cl:in-package grasp_planning_graspit_msgs-srv)


;//! \htmlinclude AddToDatabase-request.msg.html

(cl:defclass <AddToDatabase-request> (roslisp-msg-protocol:ros-message)
  ((filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform "")
   (isRobot
    :reader isRobot
    :initarg :isRobot
    :type cl:boolean
    :initform cl:nil)
   (asGraspable
    :reader asGraspable
    :initarg :asGraspable
    :type cl:boolean
    :initform cl:nil)
   (modelName
    :reader modelName
    :initarg :modelName
    :type cl:string
    :initform "")
   (jointNames
    :reader jointNames
    :initarg :jointNames
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass AddToDatabase-request (<AddToDatabase-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddToDatabase-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddToDatabase-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_planning_graspit_msgs-srv:<AddToDatabase-request> is deprecated: use grasp_planning_graspit_msgs-srv:AddToDatabase-request instead.")))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <AddToDatabase-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:filename-val is deprecated.  Use grasp_planning_graspit_msgs-srv:filename instead.")
  (filename m))

(cl:ensure-generic-function 'isRobot-val :lambda-list '(m))
(cl:defmethod isRobot-val ((m <AddToDatabase-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:isRobot-val is deprecated.  Use grasp_planning_graspit_msgs-srv:isRobot instead.")
  (isRobot m))

(cl:ensure-generic-function 'asGraspable-val :lambda-list '(m))
(cl:defmethod asGraspable-val ((m <AddToDatabase-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:asGraspable-val is deprecated.  Use grasp_planning_graspit_msgs-srv:asGraspable instead.")
  (asGraspable m))

(cl:ensure-generic-function 'modelName-val :lambda-list '(m))
(cl:defmethod modelName-val ((m <AddToDatabase-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:modelName-val is deprecated.  Use grasp_planning_graspit_msgs-srv:modelName instead.")
  (modelName m))

(cl:ensure-generic-function 'jointNames-val :lambda-list '(m))
(cl:defmethod jointNames-val ((m <AddToDatabase-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:jointNames-val is deprecated.  Use grasp_planning_graspit_msgs-srv:jointNames instead.")
  (jointNames m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddToDatabase-request>) ostream)
  "Serializes a message object of type '<AddToDatabase-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isRobot) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'asGraspable) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'modelName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'modelName))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'jointNames))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'jointNames))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddToDatabase-request>) istream)
  "Deserializes a message object of type '<AddToDatabase-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'isRobot) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'asGraspable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'modelName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'modelName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'jointNames) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'jointNames)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddToDatabase-request>)))
  "Returns string type for a service object of type '<AddToDatabase-request>"
  "grasp_planning_graspit_msgs/AddToDatabaseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddToDatabase-request)))
  "Returns string type for a service object of type 'AddToDatabase-request"
  "grasp_planning_graspit_msgs/AddToDatabaseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddToDatabase-request>)))
  "Returns md5sum for a message object of type '<AddToDatabase-request>"
  "1d861bc118bc160b1e8a75f648c6112e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddToDatabase-request)))
  "Returns md5sum for a message object of type 'AddToDatabase-request"
  "1d861bc118bc160b1e8a75f648c6112e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddToDatabase-request>)))
  "Returns full string definition for message of type '<AddToDatabase-request>"
  (cl:format cl:nil "# Requests to add a Graspit model to the database~%# This does not load it into the current GraspIt world.~%# Request loading of the databse into the GraspIt world~%# needs to be done with another service.~%~%# the GraspIt! XML file to load. Can only be a robot or~%# object file. Adding whole worlds to databases is not~%# supported.~%string filename~%~%# true if the file is a robot file, false if it is an object file~%bool isRobot~%~%# only used if isRobot=false: Load the object as graspable~%# object. If false, the object is loaded as obstacle. ~%bool asGraspable~%~%# set a unique model name for the database. If a model~%# with this name exists in the database already, the service~%# request will fail, and you have to try another name.~%string modelName~%~%# if this is a robot file, this array contains the URDF finger~%# joint names in the order they are specified in the graspit file.~%string[] jointNames~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddToDatabase-request)))
  "Returns full string definition for message of type 'AddToDatabase-request"
  (cl:format cl:nil "# Requests to add a Graspit model to the database~%# This does not load it into the current GraspIt world.~%# Request loading of the databse into the GraspIt world~%# needs to be done with another service.~%~%# the GraspIt! XML file to load. Can only be a robot or~%# object file. Adding whole worlds to databases is not~%# supported.~%string filename~%~%# true if the file is a robot file, false if it is an object file~%bool isRobot~%~%# only used if isRobot=false: Load the object as graspable~%# object. If false, the object is loaded as obstacle. ~%bool asGraspable~%~%# set a unique model name for the database. If a model~%# with this name exists in the database already, the service~%# request will fail, and you have to try another name.~%string modelName~%~%# if this is a robot file, this array contains the URDF finger~%# joint names in the order they are specified in the graspit file.~%string[] jointNames~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddToDatabase-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filename))
     1
     1
     4 (cl:length (cl:slot-value msg 'modelName))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'jointNames) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddToDatabase-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddToDatabase-request
    (cl:cons ':filename (filename msg))
    (cl:cons ':isRobot (isRobot msg))
    (cl:cons ':asGraspable (asGraspable msg))
    (cl:cons ':modelName (modelName msg))
    (cl:cons ':jointNames (jointNames msg))
))
;//! \htmlinclude AddToDatabase-response.msg.html

(cl:defclass <AddToDatabase-response> (roslisp-msg-protocol:ros-message)
  ((returnCode
    :reader returnCode
    :initarg :returnCode
    :type cl:integer
    :initform 0)
   (modelID
    :reader modelID
    :initarg :modelID
    :type cl:integer
    :initform 0))
)

(cl:defclass AddToDatabase-response (<AddToDatabase-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddToDatabase-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddToDatabase-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_planning_graspit_msgs-srv:<AddToDatabase-response> is deprecated: use grasp_planning_graspit_msgs-srv:AddToDatabase-response instead.")))

(cl:ensure-generic-function 'returnCode-val :lambda-list '(m))
(cl:defmethod returnCode-val ((m <AddToDatabase-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:returnCode-val is deprecated.  Use grasp_planning_graspit_msgs-srv:returnCode instead.")
  (returnCode m))

(cl:ensure-generic-function 'modelID-val :lambda-list '(m))
(cl:defmethod modelID-val ((m <AddToDatabase-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:modelID-val is deprecated.  Use grasp_planning_graspit_msgs-srv:modelID instead.")
  (modelID m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<AddToDatabase-response>)))
    "Constants for message type '<AddToDatabase-response>"
  '((:SUCCESS . 0)
    (:MODEL_EXISTS . 1)
    (:FILE_NOT_FOUND . 2)
    (:NOT_READY . 3)
    (:NO_NAME . 4)
    (:OTHER_ERROR . 5))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'AddToDatabase-response)))
    "Constants for message type 'AddToDatabase-response"
  '((:SUCCESS . 0)
    (:MODEL_EXISTS . 1)
    (:FILE_NOT_FOUND . 2)
    (:NOT_READY . 3)
    (:NO_NAME . 4)
    (:OTHER_ERROR . 5))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddToDatabase-response>) ostream)
  "Serializes a message object of type '<AddToDatabase-response>"
  (cl:let* ((signed (cl:slot-value msg 'returnCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'modelID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddToDatabase-response>) istream)
  "Deserializes a message object of type '<AddToDatabase-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'returnCode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'modelID) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddToDatabase-response>)))
  "Returns string type for a service object of type '<AddToDatabase-response>"
  "grasp_planning_graspit_msgs/AddToDatabaseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddToDatabase-response)))
  "Returns string type for a service object of type 'AddToDatabase-response"
  "grasp_planning_graspit_msgs/AddToDatabaseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddToDatabase-response>)))
  "Returns md5sum for a message object of type '<AddToDatabase-response>"
  "1d861bc118bc160b1e8a75f648c6112e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddToDatabase-response)))
  "Returns md5sum for a message object of type 'AddToDatabase-response"
  "1d861bc118bc160b1e8a75f648c6112e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddToDatabase-response>)))
  "Returns full string definition for message of type '<AddToDatabase-response>"
  (cl:format cl:nil "~%~%# success flag (see return codes below)~%int32 returnCode~%~%# returns the model ID which was assigned to this loaded~%# model in the database.~%int32 modelID~%~%~%~%~%# adding to database successful.~%int32 SUCCESS = 0~%~%# model with this name exists in database.~%int32 MODEL_EXISTS = 1 ~%~%# could nto find the file.~%int32 FILE_NOT_FOUND = 2~%~%# graspit world not ready to take objects.~%int32 NOT_READY = 3~%~%# cannot add a model with empty name~%int32 NO_NAME = 4~%~%# other error occurred. ~%int32 OTHER_ERROR = 5~%~%~%~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddToDatabase-response)))
  "Returns full string definition for message of type 'AddToDatabase-response"
  (cl:format cl:nil "~%~%# success flag (see return codes below)~%int32 returnCode~%~%# returns the model ID which was assigned to this loaded~%# model in the database.~%int32 modelID~%~%~%~%~%# adding to database successful.~%int32 SUCCESS = 0~%~%# model with this name exists in database.~%int32 MODEL_EXISTS = 1 ~%~%# could nto find the file.~%int32 FILE_NOT_FOUND = 2~%~%# graspit world not ready to take objects.~%int32 NOT_READY = 3~%~%# cannot add a model with empty name~%int32 NO_NAME = 4~%~%# other error occurred. ~%int32 OTHER_ERROR = 5~%~%~%~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddToDatabase-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddToDatabase-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddToDatabase-response
    (cl:cons ':returnCode (returnCode msg))
    (cl:cons ':modelID (modelID msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddToDatabase)))
  'AddToDatabase-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddToDatabase)))
  'AddToDatabase-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddToDatabase)))
  "Returns string type for a service object of type '<AddToDatabase>"
  "grasp_planning_graspit_msgs/AddToDatabase")