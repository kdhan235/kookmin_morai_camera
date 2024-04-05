# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from Lidar_pkg/pointinfo.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class pointinfo(genpy.Message):
  _md5sum = "5bf823e8b26f297f8df9324cb3bff675"
  _type = "Lidar_pkg/pointinfo"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """
float32 x
float32 y
float32 y_Min
float32 y_Max
int16 idx
float32 dist 
"""
  __slots__ = ['x','y','y_Min','y_Max','idx','dist']
  _slot_types = ['float32','float32','float32','float32','int16','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       x,y,y_Min,y_Max,idx,dist

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(pointinfo, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.x is None:
        self.x = 0.
      if self.y is None:
        self.y = 0.
      if self.y_Min is None:
        self.y_Min = 0.
      if self.y_Max is None:
        self.y_Max = 0.
      if self.idx is None:
        self.idx = 0
      if self.dist is None:
        self.dist = 0.
    else:
      self.x = 0.
      self.y = 0.
      self.y_Min = 0.
      self.y_Max = 0.
      self.idx = 0
      self.dist = 0.

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
      buff.write(_get_struct_4fhf().pack(_x.x, _x.y, _x.y_Min, _x.y_Max, _x.idx, _x.dist))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 22
      (_x.x, _x.y, _x.y_Min, _x.y_Max, _x.idx, _x.dist,) = _get_struct_4fhf().unpack(str[start:end])
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
      buff.write(_get_struct_4fhf().pack(_x.x, _x.y, _x.y_Min, _x.y_Max, _x.idx, _x.dist))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 22
      (_x.x, _x.y, _x.y_Min, _x.y_Max, _x.idx, _x.dist,) = _get_struct_4fhf().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4fhf = None
def _get_struct_4fhf():
    global _struct_4fhf
    if _struct_4fhf is None:
        _struct_4fhf = struct.Struct("<4fhf")
    return _struct_4fhf
