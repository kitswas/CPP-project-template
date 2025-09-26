cmake_minimum_required(VERSION 3.16)
project(CPP_project)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON) # Without this CXX_STANDARD may fall back to a lower version

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(Doxygen)
include(OpenSSFHardening)
# set(CLANG_FORMAT_STYLE "file") # Set the style to use for clang-format
# include(ClangFormat) # Uncomment to use clang-format, remember to remove .editorconfig

set(SOURCES src/main.cpp)
add_executable(executable ${SOURCES})

openssf_harden_target(executable)
