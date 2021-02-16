; Auto-generated. Do not edit!


(cl:in-package grasp_execution_msgs-msg)


;//! \htmlinclude GraspControlResult.msg.html

(cl:defclass <GraspControlResult> (roslisp-msg-protocol:ros-message)
  ((execution_time
    :reader execution_time
    :initarg :execution_time
    :type cl:real
    :initform 0)
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GraspControlResult (<GraspControlResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraspControlResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraspControlResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_execution_msgs-msg:<GraspControlResult> is deprecated: use grasp_execution_msgs-msg:GraspControlResult instead.")))

(cl:ensure-generic-function 'execution_time-val :lambda-list '(m))
(cl:defmethod execution_time-val ((m <GraspControlResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_execution_msgs-msg:execution_time-val is deprecated.  Use grasp_execution_msgs-msg:execution_time instead.")
  (execution_time m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GraspControlResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_execution_msgs-msg:success-val is deprecated.  Use grasp_execution_msgs-msg:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraspControlResult>) ostream)
  "Serializes a message object of type '<GraspControlResult>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'execution_time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'execution_time) (cl:floor (cl:slot-value msg 'execution_time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraspControlResult>) istream)
  "Deserializes a message object of type '<GraspControlResult>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'execution_time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraspControlResult>)))
  "Returns string type for a message object of type '<GraspControlResult>"
  "grasp_execution_msgs/GraspControlResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraspControlResult)))
  "Returns string type for a message object of type 'GraspControlResult"
  "grasp_execution_msgs/GraspControlResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraspControlResult>)))
  "Returns md5sum for a message object of type '<GraspControlResult>"
  "da147b8123fb1e17e5e9698bb785b256")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraspControlResult)))
  "Returns md5sum for a message object of type 'GraspControlResult"
  "da147b8123fb1e17e5e9698bb785b256")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraspControlResult>)))
  "Returns full string definition for message of type '<GraspControlResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# the final execution time~%duration execution_time~%~%# successfully done the grasp~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraspControlResult)))
  "Returns full string definition for message of type 'GraspControlResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# the final execution time~%duration execution_time~%~%# successfully done the grasp~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraspControlResult>))
  (cl:+ 0
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraspControlResult>))
  "Converts a ROS message object to a list"
  (cl:list 'GraspControlResult
    (cl:cons ':execution_time (execution_time msg))
    (cl:cons ':success (success msg))
))
