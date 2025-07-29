#[[

Date Created: <2024-09-11>
Date Modified:  <2024-09-11>
Author :  Minhazul Haque
Project Name: <MyProject>
Description:

]]

cmake_minimum_required(VERSION 3.20)

project(MyProject LANGUAGES CXX)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
  message(
    FATAL_ERROR
      "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there. You may need to remove CMakeCache.txt. "
  )
endif()

# Default Build type if not specified (set to "Release")
set(default_build_type "Release")
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(
    STATUS
      "Setting build type to '${default_build_type}' as none was specified.")
  set(CMAKE_BUILD_TYPE
      "${default_build_type}"
      CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
                                               "MinSizeRel" "RelWithDebInfo")
endif()

# enable FetchContent
include(FetchContent)

# declare dependency
FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG v2.13.7)

FetchContent_MakeAvailable(Catch2)

# Target Executable add_executable(Executable_Name SRC1.cpp SRC1.h SRC2.cpp ...)
add_executable(MyProject src/main.cpp)

# Target Library
add_library(MyLibrary STATIC src/library.cpp)

# Target Include Directories
target_include_directories(MyProject PUBLIC include)

# Set compile standard feature to C++11, C++14 or C++17
target_compile_features(MyProject PUBLIC cxx_std_17)
set_target_properties(MyProject PROPERTIES CXX_EXTENSIONS OFF)

# Target Link Libraries
target_link_libraries(MyProject PUBLIC MyLibrary)
