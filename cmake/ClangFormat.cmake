# Add clang-format target for code formatting
find_program(CLANG_FORMAT_EXECUTABLE "clang-format")
if(CLANG_FORMAT_EXECUTABLE)
	message(STATUS "Found clang-format: ${CLANG_FORMAT_EXECUTABLE}")

	# Set the style to use for clang-format if not specified
	if(NOT DEFINED CLANG_FORMAT_STYLE)
		set(CLANG_FORMAT_STYLE "file")  # Uses .clang-format file in the project root
	endif()

	# Define source file extensions to be formatted
	set(CLANG_FORMAT_SOURCE_EXTENSIONS
		".cpp"
		".hpp"
		".c"
		".h"
	)

	# Get all source files
	set(SOURCE_FILES_PATTERN "")
	foreach(ext ${CLANG_FORMAT_SOURCE_EXTENSIONS})
		list(APPEND SOURCE_FILES_PATTERN "${CMAKE_SOURCE_DIR}/src/*${ext}")
	endforeach()
	file(GLOB_RECURSE ALL_SOURCE_FILES ${SOURCE_FILES_PATTERN})
	# message(STATUS "Source files to format: ${ALL_SOURCE_FILES}")

	add_custom_target(format
		COMMAND ${CLANG_FORMAT_EXECUTABLE} -style=${CLANG_FORMAT_STYLE} -i ${ALL_SOURCE_FILES}
		COMMENT "Formatting source code with clang-format"
		VERBATIM
	)
	
	message(STATUS "clang-format found: ${CLANG_FORMAT_EXECUTABLE}")
	message(STATUS "Format target added. Use 'cmake --build build --target format' to format the code.")
else()
	message(STATUS "clang-format not found. Format target not created.")
endif()
