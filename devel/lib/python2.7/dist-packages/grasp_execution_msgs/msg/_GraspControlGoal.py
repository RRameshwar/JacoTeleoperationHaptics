# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from grasp_execution_msgs/GraspControlGoal.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy
import sensor_msgs.msg
import std_msgs.msg
import trajectory_msgs.msg

class GraspControlGoal(genpy.Message):
  _md5sum = "f165f7e4a930636e7a3721777f2e4b0c"
  _type = "grasp_execution_msgs/GraspControlGoal"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# This action sends a command to the hand to open or close the grasp.
# It can be used like a JointTrajectory action. Alternatively, the joint
# trajectory can be left unspecified, and the hand just closes.
# Accepting nodes can handle force feedback control or stop closing
# the fingers before the target joint state, if they are not moving any more. 

# The target joint state. This may include the efforts which
# the hand is to apply once the grip is closed.
sensor_msgs/JointState target_joint_state

# optional: if the gripper movement is more complex, it can be specified
# as a joint trajectory action. In this case, target_joint_state should
# be set to the last state in the JointTrajectory
trajectory_msgs/JointTrajectory trajectory

# If the joint trajectory is to be used instead of the simple closing action,
# set this to true. If this is false, the trajectory field is ingnored.
bool use_trajectory

# true if this is an action to close the hand, false if it is opening.
bool closing


================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points
================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start
"""
  __slots__ = ['target_joint_state','trajectory','use_trajectory','closing']
  _slot_types = ['sensor_msgs/JointState','trajectory_msgs/JointTrajectory','bool','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       target_joint_state,trajectory,use_trajectory,closing

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(GraspControlGoal, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.target_joint_state is None:
        self.target_joint_state = sensor_msgs.msg.JointState()
      if self.trajectory is None:
        self.trajectory = trajectory_msgs.msg.JointTrajectory()
      if self.use_trajectory is None:
        self.use_trajectory = False
      if self.closing is None:
        self.closing = False
    else:
      self.target_joint_state = sensor_msgs.msg.JointState()
      self.trajectory = trajectory_msgs.msg.JointTrajectory()
      self.use_trajectory = False
      self.closing = False

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.target_joint_state.header.seq, _x.target_joint_state.header.stamp.secs, _x.target_joint_state.header.stamp.nsecs))
      _x = self.target_joint_state.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.target_joint_state.name)
      buff.write(_struct_I.pack(length))
      for val1 in self.target_joint_state.name:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.target_joint_state.position)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.target_joint_state.position))
      length = len(self.target_joint_state.velocity)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.target_joint_state.velocity))
      length = len(self.target_joint_state.effort)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.target_joint_state.effort))
      _x = self
      buff.write(_get_struct_3I().pack(_x.trajectory.header.seq, _x.trajectory.header.stamp.secs, _x.trajectory.header.stamp.nsecs))
      _x = self.trajectory.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.trajectory.joint_names)
      buff.write(_struct_I.pack(length))
      for val1 in self.trajectory.joint_names:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.trajectory.points)
      buff.write(_struct_I.pack(length))
      for val1 in self.trajectory.points:
        length = len(val1.positions)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(struct.pack(pattern, *val1.positions))
        length = len(val1.velocities)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(struct.pack(pattern, *val1.velocities))
        length = len(val1.accelerations)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(struct.pack(pattern, *val1.accelerations))
        length = len(val1.effort)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(struct.pack(pattern, *val1.effort))
        _v1 = val1.time_from_start
        _x = _v1
        buff.write(_get_struct_2i().pack(_x.secs, _x.nsecs))
      _x = self
      buff.write(_get_struct_2B().pack(_x.use_trajectory, _x.closing))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.target_joint_state is None:
        self.target_joint_state = sensor_msgs.msg.JointState()
      if self.trajectory is None:
        self.trajectory = trajectory_msgs.msg.JointTrajectory()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.target_joint_state.header.seq, _x.target_joint_state.header.stamp.secs, _x.target_joint_state.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.target_joint_state.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.target_joint_state.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.target_joint_state.name = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.target_joint_state.name.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.target_joint_state.position = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.target_joint_state.velocity = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.target_joint_state.effort = struct.unpack(pattern, str[start:end])
      _x = self
      start = end
      end += 12
      (_x.trajectory.header.seq, _x.trajectory.header.stamp.secs, _x.trajectory.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.trajectory.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.trajectory.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.trajectory.joint_names = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.trajectory.joint_names.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.trajectory.points = []
      for i in range(0, length):
        val1 = trajectory_msgs.msg.JointTrajectoryPoint()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        end += struct.calcsize(pattern)
        val1.positions = struct.unpack(pattern, str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        end += struct.calcsize(pattern)
        val1.velocities = struct.unpack(pattern, str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        end += struct.calcsize(pattern)
        val1.accelerations = struct.unpack(pattern, str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        end += struct.calcsize(pattern)
        val1.effort = struct.unpack(pattern, str[start:end])
        _v2 = val1.time_from_start
        _x = _v2
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2i().unpack(str[start:end])
        self.trajectory.points.append(val1)
      _x = self
      start = end
      end += 2
      (_x.use_trajectory, _x.closing,) = _get_struct_2B().unpack(str[start:end])
      self.use_trajectory = bool(self.use_trajectory)
      self.closing = bool(self.closing)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.target_joint_state.header.seq, _x.target_joint_state.header.stamp.secs, _x.target_joint_state.header.stamp.nsecs))
      _x = self.target_joint_state.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.target_joint_state.name)
      buff.write(_struct_I.pack(length))
      for val1 in self.target_joint_state.name:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.target_joint_state.position)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.target_joint_state.position.tostring())
      length = len(self.target_joint_state.velocity)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.target_joint_state.velocity.tostring())
      length = len(self.target_joint_state.effort)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.target_joint_state.effort.tostring())
      _x = self
      buff.write(_get_struct_3I().pack(_x.trajectory.header.seq, _x.trajectory.header.stamp.secs, _x.trajectory.header.stamp.nsecs))
      _x = self.trajectory.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.trajectory.joint_names)
      buff.write(_struct_I.pack(length))
      for val1 in self.trajectory.joint_names:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.trajectory.points)
      buff.write(_struct_I.pack(length))
      for val1 in self.trajectory.points:
        length = len(val1.positions)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(val1.positions.tostring())
        length = len(val1.velocities)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(val1.velocities.tostring())
        length = len(val1.accelerations)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(val1.accelerations.tostring())
        length = len(val1.effort)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(val1.effort.tostring())
        _v3 = val1.time_from_start
        _x = _v3
        buff.write(_get_struct_2i().pack(_x.secs, _x.nsecs))
      _x = self
      buff.write(_get_struct_2B().pack(_x.use_trajectory, _x.closing))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.target_joint_state is None:
        self.target_joint_state = sensor_msgs.msg.JointState()
      if self.trajectory is None:
        self.trajectory = trajectory_msgs.msg.JointTrajectory()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.target_joint_state.header.seq, _x.target_joint_state.header.stamp.secs, _x.target_joint_state.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.target_joint_state.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.target_joint_state.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.target_joint_state.name = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.target_joint_state.name.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.target_joint_state.position = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.target_joint_state.velocity = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.target_joint_state.effort = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      _x = self
      start = end
      end += 12
      (_x.trajectory.header.seq, _x.trajectory.header.stamp.secs, _x.trajectory.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.trajectory.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.trajectory.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.trajectory.joint_names = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.trajectory.joint_names.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.trajectory.points = []
      for i in range(0, length):
        val1 = trajectory_msgs.msg.JointTrajectoryPoint()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        end += struct.calcsize(pattern)
        val1.positions = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        end += struct.calcsize(pattern)
        val1.velocities = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        end += struct.calcsize(pattern)
        val1.accelerations = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        end += struct.calcsize(pattern)
        val1.effort = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
        _v4 = val1.time_from_start
        _x = _v4
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2i().unpack(str[start:end])
        self.trajectory.points.append(val1)
      _x = self
      start = end
      end += 2
      (_x.use_trajectory, _x.closing,) = _get_struct_2B().unpack(str[start:end])
      self.use_trajectory = bool(self.use_trajectory)
      self.closing = bool(self.closing)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2B = None
def _get_struct_2B():
    global _struct_2B
    if _struct_2B is None:
        _struct_2B = struct.Struct("<2B")
    return _struct_2B
_struct_2i = None
def _get_struct_2i():
    global _struct_2i
    if _struct_2i is None:
        _struct_2i = struct.Struct("<2i")
    return _struct_2i
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
