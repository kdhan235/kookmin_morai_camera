# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "code: 1 messages, 0 services")

set(MSG_I_FLAGS "-Icode:/home/autonav/km_ws/src/code/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Ilocal_pkg:/home/autonav/km_ws/src/local_pkg/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(code_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/autonav/km_ws/src/code/msg/min_idx.msg" NAME_WE)
add_custom_target(_code_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "code" "/home/autonav/km_ws/src/code/msg/min_idx.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(code
  "/home/autonav/km_ws/src/code/msg/min_idx.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/code
)

### Generating Services

### Generating Module File
_generate_module_cpp(code
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/code
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(code_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(code_generate_messages code_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/autonav/km_ws/src/code/msg/min_idx.msg" NAME_WE)
add_dependencies(code_generate_messages_cpp _code_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(code_gencpp)
add_dependencies(code_gencpp code_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS code_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(code
  "/home/autonav/km_ws/src/code/msg/min_idx.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/code
)

### Generating Services

### Generating Module File
_generate_module_eus(code
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/code
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(code_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(code_generate_messages code_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/autonav/km_ws/src/code/msg/min_idx.msg" NAME_WE)
add_dependencies(code_generate_messages_eus _code_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(code_geneus)
add_dependencies(code_geneus code_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS code_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(code
  "/home/autonav/km_ws/src/code/msg/min_idx.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/code
)

### Generating Services

### Generating Module File
_generate_module_lisp(code
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/code
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(code_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(code_generate_messages code_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/autonav/km_ws/src/code/msg/min_idx.msg" NAME_WE)
add_dependencies(code_generate_messages_lisp _code_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(code_genlisp)
add_dependencies(code_genlisp code_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS code_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(code
  "/home/autonav/km_ws/src/code/msg/min_idx.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/code
)

### Generating Services

### Generating Module File
_generate_module_nodejs(code
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/code
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(code_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(code_generate_messages code_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/autonav/km_ws/src/code/msg/min_idx.msg" NAME_WE)
add_dependencies(code_generate_messages_nodejs _code_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(code_gennodejs)
add_dependencies(code_gennodejs code_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS code_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(code
  "/home/autonav/km_ws/src/code/msg/min_idx.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/code
)

### Generating Services

### Generating Module File
_generate_module_py(code
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/code
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(code_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(code_generate_messages code_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/autonav/km_ws/src/code/msg/min_idx.msg" NAME_WE)
add_dependencies(code_generate_messages_py _code_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(code_genpy)
add_dependencies(code_genpy code_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS code_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/code)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/code
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(code_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET local_pkg_generate_messages_cpp)
  add_dependencies(code_generate_messages_cpp local_pkg_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/code)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/code
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(code_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET local_pkg_generate_messages_eus)
  add_dependencies(code_generate_messages_eus local_pkg_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/code)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/code
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(code_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET local_pkg_generate_messages_lisp)
  add_dependencies(code_generate_messages_lisp local_pkg_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/code)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/code
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(code_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET local_pkg_generate_messages_nodejs)
  add_dependencies(code_generate_messages_nodejs local_pkg_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/code)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/code\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/code
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(code_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET local_pkg_generate_messages_py)
  add_dependencies(code_generate_messages_py local_pkg_generate_messages_py)
endif()
