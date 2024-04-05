# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from local_pkg/VescState.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class VescState(genpy.Message):
  _md5sum = "81214bb4c1945e7c159bd76ec397ac04"
  _type = "local_pkg/VescState"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# Vedder VESC open source motor controller state (telemetry)

# fault codes
int32 FAULT_CODE_NONE=0
int32 FAULT_CODE_OVER_VOLTAGE=1
int32 FAULT_CODE_UNDER_VOLTAGE=2
int32 FAULT_CODE_DRV8302=3
int32 FAULT_CODE_ABS_OVER_CURRENT=4
int32 FAULT_CODE_OVER_TEMP_FET=5
int32 FAULT_CODE_OVER_TEMP_MOTOR=6

float64 voltage_input        # input voltage (volt)
float64 temperature_pcb      # temperature of printed circuit board (degrees Celsius)
float64 current_motor        # motor current (ampere)
float64 current_input        # input current (ampere)
float64 speed                # motor electrical speed (revolutions per minute) 
float64 duty_cycle           # duty cycle (0 to 1)
float64 charge_drawn         # electric charge drawn from input (ampere-hour)
float64 charge_regen         # electric charge regenerated to input (ampere-hour)
float64 energy_drawn         # energy drawn from input (watt-hour)
float64 energy_regen         # energy regenerated to input (watt-hour)
float64 displacement         # net tachometer (counts)
float64 distance_traveled    # total tachnometer (counts)
int32   fault_code
"""
  # Pseudo-constants
  FAULT_CODE_NONE = 0
  FAULT_CODE_OVER_VOLTAGE = 1
  FAULT_CODE_UNDER_VOLTAGE = 2
  FAULT_CODE_DRV8302 = 3
  FAULT_CODE_ABS_OVER_CURRENT = 4
  FAULT_CODE_OVER_TEMP_FET = 5
  FAULT_CODE_OVER_TEMP_MOTOR = 6

  __slots__ = ['voltage_input','temperature_pcb','current_motor','current_input','speed','duty_cycle','charge_drawn','charge_regen','energy_drawn','energy_regen','displacement','distance_traveled','fault_code']
  _slot_types = ['float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       voltage_input,temperature_pcb,current_motor,current_input,speed,duty_cycle,charge_drawn,charge_regen,energy_drawn,energy_regen,displacement,distance_traveled,fault_code

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(VescState, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.voltage_input is None:
        self.voltage_input = 0.
      if self.temperature_pcb is None:
        self.temperature_pcb = 0.
      if self.current_motor is None:
        self.current_motor = 0.
      if self.current_input is None:
        self.current_input = 0.
      if self.speed is None:
        self.speed = 0.
      if self.duty_cycle is None:
        self.duty_cycle = 0.
      if self.charge_drawn is None:
        self.charge_drawn = 0.
      if self.charge_regen is None:
        self.charge_regen = 0.
      if self.energy_drawn is None:
        self.energy_drawn = 0.
      if self.energy_regen is None:
        self.energy_regen = 0.
      if self.displacement is None:
        self.displacement = 0.
      if self.distance_traveled is None:
        self.distance_traveled = 0.
      if self.fault_code is None:
        self.fault_code = 0
    else:
      self.voltage_input = 0.
      self.temperature_pcb = 0.
      self.current_motor = 0.
      self.current_input = 0.
      self.speed = 0.
      self.duty_cycle = 0.
      self.charge_drawn = 0.
      self.charge_regen = 0.
      self.energy_drawn = 0.
      self.energy_regen = 0.
      self.displacement = 0.
      self.distance_traveled = 0.
      self.fault_code = 0

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
      buff.write(_get_struct_12di().pack(_x.voltage_input, _x.temperature_pcb, _x.current_motor, _x.current_input, _x.speed, _x.duty_cycle, _x.charge_drawn, _x.charge_regen, _x.energy_drawn, _x.energy_regen, _x.displacement, _x.distance_traveled, _x.fault_code))
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
      end += 100
      (_x.voltage_input, _x.temperature_pcb, _x.current_motor, _x.current_input, _x.speed, _x.duty_cycle, _x.charge_drawn, _x.charge_regen, _x.energy_drawn, _x.energy_regen, _x.displacement, _x.distance_traveled, _x.fault_code,) = _get_struct_12di().unpack(str[start:end])
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
      buff.write(_get_struct_12di().pack(_x.voltage_input, _x.temperature_pcb, _x.current_motor, _x.current_input, _x.speed, _x.duty_cycle, _x.charge_drawn, _x.charge_regen, _x.energy_drawn, _x.energy_regen, _x.displacement, _x.distance_traveled, _x.fault_code))
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
      end += 100
      (_x.voltage_input, _x.temperature_pcb, _x.current_motor, _x.current_input, _x.speed, _x.duty_cycle, _x.charge_drawn, _x.charge_regen, _x.energy_drawn, _x.energy_regen, _x.displacement, _x.distance_traveled, _x.fault_code,) = _get_struct_12di().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_12di = None
def _get_struct_12di():
    global _struct_12di
    if _struct_12di is None:
        _struct_12di = struct.Struct("<12di")
    return _struct_12di
