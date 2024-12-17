# <CMake Project Template for C++>
# Date Created:  <2024-09-11>
# Date Modified: <2024-09-11>
# Author : Minhazul Haque
# Project Name: <MyProject>
# Description:

cmake_minimum_required(VERSION 3.20)

project(MyProject VERSION 1.0 DESCRIPTION "" LANGUAGES CXX)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    message(
        FATAL_ERROR
        "In-source builds not allowed. Please make a new directory (called a build directory)"
        " and run CMake from there. You may need to remove CMakeCache.txt. "
    )
endif()

# Default Build type if not specified (set to "Release")
set(default_build_type "Release")
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(
        STATUS
        "Setting build type to '${default_build_type}' as none was specified."
    )
    set(CMAKE_BUILD_TYPE
        "${default_build_type}"
        CACHE STRING
        "Choose the type of build."
        FORCE
    )
    # Set the possible values of build type for cmake-gui
    set_property(
        CACHE CMAKE_BUILD_TYPE
        PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo"
    )
endif()

# Target Library
# add_library(Library_Name STATIC|SHARED|MODULE SRC1.cpp SRC1.h SRC2.cpp ...)
# add_library(one STATIC two.cpp three.h)

# Target Include Directories
target_include_directories(one PUBLIC include)

# Set compile standard feature to C++11, C++14 or C++17
target_compile_features(one PUBLIC cxx_std_17)
set_target_properties(myTarget PROPERTIES CXX_EXTENSIONS OFF)

# Target Executable
# add_executable(Executable_Name SRC1.cpp SRC1.h SRC2.cpp ...)
add_executable(one two.cpp three.h)

# Target Link Libraries
add_library(another STATIC another.cpp another.h)
target_link_libraries(another PUBLIC one)
