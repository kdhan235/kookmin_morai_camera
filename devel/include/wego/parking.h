// Generated by gencpp from file wego/parking.msg
// DO NOT EDIT!


#ifndef WEGO_MESSAGE_PARKING_H
#define WEGO_MESSAGE_PARKING_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace wego
{
template <class ContainerAllocator>
struct parking_
{
  typedef parking_<ContainerAllocator> Type;

  parking_()
    : parking_flag(false)  {
    }
  parking_(const ContainerAllocator& _alloc)
    : parking_flag(false)  {
  (void)_alloc;
    }



   typedef uint8_t _parking_flag_type;
  _parking_flag_type parking_flag;





  typedef boost::shared_ptr< ::wego::parking_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wego::parking_<ContainerAllocator> const> ConstPtr;

}; // struct parking_

typedef ::wego::parking_<std::allocator<void> > parking;

typedef boost::shared_ptr< ::wego::parking > parkingPtr;
typedef boost::shared_ptr< ::wego::parking const> parkingConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wego::parking_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wego::parking_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::wego::parking_<ContainerAllocator1> & lhs, const ::wego::parking_<ContainerAllocator2> & rhs)
{
  return lhs.parking_flag == rhs.parking_flag;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::wego::parking_<ContainerAllocator1> & lhs, const ::wego::parking_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace wego

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wego::parking_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wego::parking_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wego::parking_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wego::parking_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wego::parking_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wego::parking_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wego::parking_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b81c6305dd609c21a5df33b1adb734fd";
  }

  static const char* value(const ::wego::parking_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb81c6305dd609c21ULL;
  static const uint64_t static_value2 = 0xa5df33b1adb734fdULL;
};

template<class ContainerAllocator>
struct DataType< ::wego::parking_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wego/parking";
  }

  static const char* value(const ::wego::parking_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wego::parking_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool parking_flag\n"
;
  }

  static const char* value(const ::wego::parking_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wego::parking_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.parking_flag);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct parking_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wego::parking_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::wego::parking_<ContainerAllocator>& v)
  {
    s << indent << "parking_flag: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.parking_flag);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WEGO_MESSAGE_PARKING_H
