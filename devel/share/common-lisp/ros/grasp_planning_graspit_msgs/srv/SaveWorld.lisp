; Auto-generated. Do not edit!


(cl:in-package grasp_planning_graspit_msgs-srv)


;//! \htmlinclude SaveWorld-request.msg.html

(cl:defclass <SaveWorld-request> (roslisp-msg-protocol:ros-message)
  ((filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform "")
   (asInventor
    :reader asInventor
    :initarg :asInventor
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SaveWorld-request (<SaveWorld-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveWorld-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveWorld-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_planning_graspit_msgs-srv:<SaveWorld-request> is deprecated: use grasp_planning_graspit_msgs-srv:SaveWorld-request instead.")))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <SaveWorld-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:filename-val is deprecated.  Use grasp_planning_graspit_msgs-srv:filename instead.")
  (filename m))

(cl:ensure-generic-function 'asInventor-val :lambda-list '(m))
(cl:defmethod asInventor-val ((m <SaveWorld-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:asInventor-val is deprecated.  Use grasp_planning_graspit_msgs-srv:asInventor instead.")
  (asInventor m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveWorld-request>) ostream)
  "Serializes a message object of type '<SaveWorld-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'asInventor) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveWorld-request>) istream)
  "Deserializes a message object of type '<SaveWorld-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'asInventor) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveWorld-request>)))
  "Returns string type for a service object of type '<SaveWorld-request>"
  "grasp_planning_graspit_msgs/SaveWorldRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveWorld-request)))
  "Returns string type for a service object of type 'SaveWorld-request"
  "grasp_planning_graspit_msgs/SaveWorldRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveWorld-request>)))
  "Returns md5sum for a message object of type '<SaveWorld-request>"
  "a1d346f50cae3ae405bf7dcb546c6ae3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveWorld-request)))
  "Returns md5sum for a message object of type 'SaveWorld-request"
  "a1d346f50cae3ae405bf7dcb546c6ae3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveWorld-request>)))
  "Returns full string definition for message of type '<SaveWorld-request>"
  (cl:format cl:nil "# Requests to save the currently loaded Graspit world as file~%~%# the filename where to save the world~%string filename~%~%# true if the file is to be saved as inventor.~%# will be saved as graspit world otherwise.~%bool asInventor ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveWorld-request)))
  "Returns full string definition for message of type 'SaveWorld-request"
  (cl:format cl:nil "# Requests to save the currently loaded Graspit world as file~%~%# the filename where to save the world~%string filename~%~%# true if the file is to be saved as inventor.~%# will be saved as graspit world otherwise.~%bool asInventor ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveWorld-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filename))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveWorld-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveWorld-request
    (cl:cons ':filename (filename msg))
    (cl:cons ':asInventor (asInventor msg))
))
;//! \htmlinclude SaveWorld-response.msg.html

(cl:defclass <SaveWorld-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SaveWorld-response (<SaveWorld-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveWorld-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveWorld-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_planning_graspit_msgs-srv:<SaveWorld-response> is deprecated: use grasp_planning_graspit_msgs-srv:SaveWorld-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SaveWorld-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_planning_graspit_msgs-srv:success-val is deprecated.  Use grasp_planning_graspit_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveWorld-response>) ostream)
  "Serializes a message object of type '<SaveWorld-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveWorld-response>) istream)
  "Deserializes a message object of type '<SaveWorld-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveWorld-response>)))
  "Returns string type for a service object of type '<SaveWorld-response>"
  "grasp_planning_graspit_msgs/SaveWorldResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveWorld-response)))
  "Returns string type for a service object of type 'SaveWorld-response"
  "grasp_planning_graspit_msgs/SaveWorldResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveWorld-response>)))
  "Returns md5sum for a message object of type '<SaveWorld-response>"
  "a1d346f50cae3ae405bf7dcb546c6ae3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveWorld-response)))
  "Returns md5sum for a message object of type 'SaveWorld-response"
  "a1d346f50cae3ae405bf7dcb546c6ae3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveWorld-response>)))
  "Returns full string definition for message of type '<SaveWorld-response>"
  (cl:format cl:nil "~%# success flag~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveWorld-response)))
  "Returns full string definition for message of type 'SaveWorld-response"
  (cl:format cl:nil "~%# success flag~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveWorld-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveWorld-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveWorld-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SaveWorld)))
  'SaveWorld-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SaveWorld)))
  'SaveWorld-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveWorld)))
  "Returns string type for a service object of type '<SaveWorld>"
  "grasp_planning_graspit_msgs/SaveWorld")