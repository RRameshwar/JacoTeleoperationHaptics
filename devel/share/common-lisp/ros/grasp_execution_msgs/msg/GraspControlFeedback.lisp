; Auto-generated. Do not edit!


(cl:in-package grasp_execution_msgs-msg)


;//! \htmlinclude GraspControlFeedback.msg.html

(cl:defclass <GraspControlFeedback> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GraspControlFeedback (<GraspControlFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraspControlFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraspControlFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_execution_msgs-msg:<GraspControlFeedback> is deprecated: use grasp_execution_msgs-msg:GraspControlFeedback instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraspControlFeedback>) ostream)
  "Serializes a message object of type '<GraspControlFeedback>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraspControlFeedback>) istream)
  "Deserializes a message object of type '<GraspControlFeedback>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraspControlFeedback>)))
  "Returns string type for a message object of type '<GraspControlFeedback>"
  "grasp_execution_msgs/GraspControlFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraspControlFeedback)))
  "Returns string type for a message object of type 'GraspControlFeedback"
  "grasp_execution_msgs/GraspControlFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraspControlFeedback>)))
  "Returns md5sum for a message object of type '<GraspControlFeedback>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraspControlFeedback)))
  "Returns md5sum for a message object of type 'GraspControlFeedback"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraspControlFeedback>)))
  "Returns full string definition for message of type '<GraspControlFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraspControlFeedback)))
  "Returns full string definition for message of type 'GraspControlFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraspControlFeedback>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraspControlFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'GraspControlFeedback
))
