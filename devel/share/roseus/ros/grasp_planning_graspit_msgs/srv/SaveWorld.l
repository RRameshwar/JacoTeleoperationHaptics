;; Auto-generated. Do not edit!


(when (boundp 'grasp_planning_graspit_msgs::SaveWorld)
  (if (not (find-package "GRASP_PLANNING_GRASPIT_MSGS"))
    (make-package "GRASP_PLANNING_GRASPIT_MSGS"))
  (shadow 'SaveWorld (find-package "GRASP_PLANNING_GRASPIT_MSGS")))
(unless (find-package "GRASP_PLANNING_GRASPIT_MSGS::SAVEWORLD")
  (make-package "GRASP_PLANNING_GRASPIT_MSGS::SAVEWORLD"))
(unless (find-package "GRASP_PLANNING_GRASPIT_MSGS::SAVEWORLDREQUEST")
  (make-package "GRASP_PLANNING_GRASPIT_MSGS::SAVEWORLDREQUEST"))
(unless (find-package "GRASP_PLANNING_GRASPIT_MSGS::SAVEWORLDRESPONSE")
  (make-package "GRASP_PLANNING_GRASPIT_MSGS::SAVEWORLDRESPONSE"))

(in-package "ROS")





(defclass grasp_planning_graspit_msgs::SaveWorldRequest
  :super ros::object
  :slots (_filename _asInventor ))

(defmethod grasp_planning_graspit_msgs::SaveWorldRequest
  (:init
   (&key
    ((:filename __filename) "")
    ((:asInventor __asInventor) nil)
    )
   (send-super :init)
   (setq _filename (string __filename))
   (setq _asInventor __asInventor)
   self)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:asInventor
   (&optional __asInventor)
   (if __asInventor (setq _asInventor __asInventor)) _asInventor)
  (:serialization-length
   ()
   (+
    ;; string _filename
    4 (length _filename)
    ;; bool _asInventor
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;; bool _asInventor
       (if _asInventor (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _asInventor
     (setq _asInventor (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass grasp_planning_graspit_msgs::SaveWorldResponse
  :super ros::object
  :slots (_success ))

(defmethod grasp_planning_graspit_msgs::SaveWorldResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass grasp_planning_graspit_msgs::SaveWorld
  :super ros::object
  :slots ())

(setf (get grasp_planning_graspit_msgs::SaveWorld :md5sum-) "a1d346f50cae3ae405bf7dcb546c6ae3")
(setf (get grasp_planning_graspit_msgs::SaveWorld :datatype-) "grasp_planning_graspit_msgs/SaveWorld")
(setf (get grasp_planning_graspit_msgs::SaveWorld :request) grasp_planning_graspit_msgs::SaveWorldRequest)
(setf (get grasp_planning_graspit_msgs::SaveWorld :response) grasp_planning_graspit_msgs::SaveWorldResponse)

(defmethod grasp_planning_graspit_msgs::SaveWorldRequest
  (:response () (instance grasp_planning_graspit_msgs::SaveWorldResponse :init)))

(setf (get grasp_planning_graspit_msgs::SaveWorldRequest :md5sum-) "a1d346f50cae3ae405bf7dcb546c6ae3")
(setf (get grasp_planning_graspit_msgs::SaveWorldRequest :datatype-) "grasp_planning_graspit_msgs/SaveWorldRequest")
(setf (get grasp_planning_graspit_msgs::SaveWorldRequest :definition-)
      "# Requests to save the currently loaded Graspit world as file

# the filename where to save the world
string filename

# true if the file is to be saved as inventor.
# will be saved as graspit world otherwise.
bool asInventor 

---

# success flag
bool success

")

(setf (get grasp_planning_graspit_msgs::SaveWorldResponse :md5sum-) "a1d346f50cae3ae405bf7dcb546c6ae3")
(setf (get grasp_planning_graspit_msgs::SaveWorldResponse :datatype-) "grasp_planning_graspit_msgs/SaveWorldResponse")
(setf (get grasp_planning_graspit_msgs::SaveWorldResponse :definition-)
      "# Requests to save the currently loaded Graspit world as file

# the filename where to save the world
string filename

# true if the file is to be saved as inventor.
# will be saved as graspit world otherwise.
bool asInventor 

---

# success flag
bool success

")



(provide :grasp_planning_graspit_msgs/SaveWorld "a1d346f50cae3ae405bf7dcb546c6ae3")


