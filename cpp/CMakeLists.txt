# CMake Project Template for C++

# Date Created:  2024-09-11

# Date Modified: 2024-09-11

# Author : Minhazul Haque

# Project Name: MyProject

# Description:

cmake_minimum_required(VERSION 3.15...3.30)

project(
  MyProject
  VERSION 1.0
  DESCRIPTION "Very nice project"
  LANGUAGES CXX)

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

# Target Library

# Build a Library instead of executable. Can be STATIC or SHARED or MODULE type.
# HEADER ONLY Library use INTERFACE instead and can not be followed by
# filenames. Can also make an ALIAS library with an existing library. Benefit to
# this is that you can make libraries with :: in the name. Ex: OpenMP::OpenMP
# etc.

# add_library(Library_Name STATIC|SHARED|MODULE SRC1.cpp SRC1.h SRC2.cpp ...)

add_library(one STATIC two.cpp three.h)

# Target Include Directories

# Adds an include directory to a target. PUBLIC doesn’t mean much for an
# executable; for a library it lets CMake know that any targets that link to
# this target must also need that include directory. Other options are PRIVATE
# (only affect the current target, not dependencies), and INTERFACE (only needed
# for dependencies).

target_include_directories(one PUBLIC include)

# Set compile standard feature to C++11, C++14 or C++17

target_compile_features(one PUBLIC cxx_std_17)
set_target_properties(myTarget PROPERTIES CXX_EXTENSIONS OFF)

# Target Executable

# Build a executable target, Essentially the exe file or the output binary
# executable Executable_Name is both the name of the executable file generated,
# and the name of the CMake target created Source file list comes next. Headers
# added are essentially ignored but is a good practice to add.

# add_executable(Executable_Name SRC1.cpp SRC1.h SRC2.cpp ...)

add_executable(one two.cpp three.h)

# Target Link Libraries

# It takes a target (another) and adds a dependency if a target is given. If no
# target of that name (one) exists, then it adds a link to a library called one
# on your path (hence the name of the command). Or you can give it a full path
# to a library. Or a linker flag. Targets can have include directories, linked
# libraries (or linked targets), compile options, compile definitions, compile
# features, and more.

add_library(another STATIC another.cpp another.h)
target_link_libraries(another PUBLIC one)
