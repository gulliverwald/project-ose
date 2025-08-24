add_executable(ProjectOSEDesktop
    source/main.cc
)

target_include_directories(ProjectOSEDesktop PUBLIC
    include
)

target_link_libraries(ProjectOSEDesktop PRIVATE
    core
    raylib
)

if(PLATFORM_WINDOWS)
    if(MSVC)
        target_compile_definitions(ProjectOSEDesktop PRIVATE _CRT_SECURE_NO_WARNINGS)
    endif()
endif()

# Copy assets to build directory
add_custom_command(TARGET ProjectOSEDesktop POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_SOURCE_DIR}/assets
    $<TARGET_FILE_DIR:ProjectOSEDesktop>/assets
)

set_target_properties(ProjectOSEDesktop PROPERTIES OUTPUT_NAME "game")