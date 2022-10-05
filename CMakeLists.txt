cmake_minimum_required(VERSION 3.23)
project(CPP_project)

set(CMAKE_CXX_STANDARD 20)

set(SOURCES src/main.cpp)
add_executable(executable ${SOURCES})
