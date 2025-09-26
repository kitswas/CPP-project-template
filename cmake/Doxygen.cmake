find_program(DOXYGEN_EXECUTABLE doxygen)
if(DOXYGEN_EXECUTABLE)
	message(STATUS "Found Doxygen: ${DOXYGEN_EXECUTABLE}")

	include(FetchContent)
	FetchContent_Declare(
		doxygen-awesome-css
		URL https://github.com/jothepro/doxygen-awesome-css/archive/refs/tags/v2.4.0.zip
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

	message(STATUS "Doxygen documentation will be generated in ${CMAKE_SOURCE_DIR}/docs")
	message(STATUS "Run cmake --build build --target doc to generate the documentation")
	
	set_target_properties(doc PROPERTIES FOLDER "Documentation")
else()
	message(STATUS "Doxygen not found, documentation generation target not created")
endif()
