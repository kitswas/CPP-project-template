cmake_minimum_required(VERSION 3.16)
project(CPP_project)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON) # Without this CXX_STANDARD may fall back to a lower version

# Some compiler flags for GCC and Clang, disable if unwanted
if("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang" OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "GNU") 
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic -Wconversion -Wnull-dereference -Wold-style-cast")
	set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -g -DDEBUG")
	# set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Werror") # Uncomment to treat warnings as errors in debug builds
	set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O2 -s -DNDEBUG -fstack-protector-all")
endif()

include(FetchContent)
FetchContent_Declare(
	doxygen-awesome-css
	URL https://github.com/jothepro/doxygen-awesome-css/archive/refs/tags/v2.3.4.zip
	DOWNLOAD_EXTRACT_TIMESTAMP ON
)
FetchContent_MakeAvailable(doxygen-awesome-css)
# Save the location the files were cloned into
# This allows us to get the path to doxygen-awesome.css
FetchContent_GetProperties(doxygen-awesome-css SOURCE_DIR AWESOME_CSS_DIR)
# Generate the Doxyfile
set(DOXYFILE_IN Doxyfile)
set(DOXYFILE_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)
configure_file(${DOXYFILE_IN} ${DOXYFILE_OUT} @ONLY)

add_custom_target(
	doc
	COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_SOURCE_DIR}/docs
	COMMAND doxygen ${DOXYFILE_OUT}
	WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
	COMMENT "Generating documentation with Doxygen"
	VERBATIM
)

set(SOURCES src/main.cpp)
add_executable(executable ${SOURCES})
