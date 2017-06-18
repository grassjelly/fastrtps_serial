cmake_minimum_required(VERSION 2.8.12)
project("fastrtps_serial")

# Find requirements
set(fastcdr_DIR "$ENV{FASTRTPSHOME}/build/install/lib/fastcdr/cmake")
set(fastrtps_DIR "$ENV{FASTRTPSHOME}/build/install/lib/fastrtps/cmake")

find_package(fastrtps REQUIRED)
find_package(fastcdr REQUIRED)

# Set C++11
include(CheckCXXCompilerFlag)
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_COMPILER_IS_CLANG OR
        CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    check_cxx_compiler_flag(--std=c++11 SUPPORTS_CXX11)
    if(SUPPORTS_CXX11)
        add_compile_options(--std=c++11)
    else()
        message(FATAL_ERROR "Compiler doesn't support C++11")
    endif()
endif()

#FastRTPS App Source Codes
file(GLOB MAIN_SOURCE src/*.cxx)

#Serial library Source Codes
file(GLOB SERIAL_SOURCE lib/serial/*.cc)

include_directories(
  include
	lib/serial
)

#Add the serial library
add_library(serial_lib
	${SERIAL_SOURCE}
)

#generate executable
add_executable(app ${MAIN_SOURCE})
target_link_libraries(app serial_lib fastrtps fastcdr)
