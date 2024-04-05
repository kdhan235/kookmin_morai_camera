// Generated by gencpp from file Lidar_pkg/pointinfo.msg
// DO NOT EDIT!


#ifndef LIDAR_PKG_MESSAGE_POINTINFO_H
#define LIDAR_PKG_MESSAGE_POINTINFO_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace Lidar_pkg
{
template <class ContainerAllocator>
struct pointinfo_
{
  typedef pointinfo_<ContainerAllocator> Type;

  pointinfo_()
    : x(0.0)
    , y(0.0)
    , y_Min(0.0)
    , y_Max(0.0)
    , idx(0)
    , dist(0.0)  {
    }
  pointinfo_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , y_Min(0.0)
    , y_Max(0.0)
    , idx(0)
    , dist(0.0)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _y_Min_type;
  _y_Min_type y_Min;

   typedef float _y_Max_type;
  _y_Max_type y_Max;

   typedef int16_t _idx_type;
  _idx_type idx;

   typedef float _dist_type;
  _dist_type dist;





  typedef boost::shared_ptr< ::Lidar_pkg::pointinfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::Lidar_pkg::pointinfo_<ContainerAllocator> const> ConstPtr;

}; // struct pointinfo_

typedef ::Lidar_pkg::pointinfo_<std::allocator<void> > pointinfo;

typedef boost::shared_ptr< ::Lidar_pkg::pointinfo > pointinfoPtr;
typedef boost::shared_ptr< ::Lidar_pkg::pointinfo const> pointinfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::Lidar_pkg::pointinfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::Lidar_pkg::pointinfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::Lidar_pkg::pointinfo_<ContainerAllocator1> & lhs, const ::Lidar_pkg::pointinfo_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.y_Min == rhs.y_Min &&
    lhs.y_Max == rhs.y_Max &&
    lhs.idx == rhs.idx &&
    lhs.dist == rhs.dist;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::Lidar_pkg::pointinfo_<ContainerAllocator1> & lhs, const ::Lidar_pkg::pointinfo_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace Lidar_pkg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::Lidar_pkg::pointinfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::Lidar_pkg::pointinfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::Lidar_pkg::pointinfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::Lidar_pkg::pointinfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::Lidar_pkg::pointinfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::Lidar_pkg::pointinfo_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::Lidar_pkg::pointinfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5bf823e8b26f297f8df9324cb3bff675";
  }

  static const char* value(const ::Lidar_pkg::pointinfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5bf823e8b26f297fULL;
  static const uint64_t static_value2 = 0x8df9324cb3bff675ULL;
};

template<class ContainerAllocator>
struct DataType< ::Lidar_pkg::pointinfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Lidar_pkg/pointinfo";
  }

  static const char* value(const ::Lidar_pkg::pointinfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::Lidar_pkg::pointinfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"float32 x\n"
"float32 y\n"
"float32 y_Min\n"
"float32 y_Max\n"
"int16 idx\n"
"float32 dist \n"
;
  }

  static const char* value(const ::Lidar_pkg::pointinfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::Lidar_pkg::pointinfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.y_Min);
      stream.next(m.y_Max);
      stream.next(m.idx);
      stream.next(m.dist);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct pointinfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::Lidar_pkg::pointinfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::Lidar_pkg::pointinfo_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "y_Min: ";
    Printer<float>::stream(s, indent + "  ", v.y_Min);
    s << indent << "y_Max: ";
    Printer<float>::stream(s, indent + "  ", v.y_Max);
    s << indent << "idx: ";
    Printer<int16_t>::stream(s, indent + "  ", v.idx);
    s << indent << "dist: ";
    Printer<float>::stream(s, indent + "  ", v.dist);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LIDAR_PKG_MESSAGE_POINTINFO_H