# Platform detection and configuration

# Detect platform
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(PLATFORM_WINDOWS TRUE)
    set(PLATFORM_DESKTOP TRUE)
    set(PLATFORM_NAME "Windows")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(PLATFORM_LINUX TRUE)
    set(PLATFORM_DESKTOP TRUE)
    set(PLATFORM_NAME "Linux")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(PLATFORM_MACOS TRUE)
    set(PLATFORM_DESKTOP TRUE)
    set(PLATFORM_NAME "macOS")
elseif(CMAKE_SYSTEM_NAME STREQUAL "3DS")
    set(PLATFORM_3DS TRUE)
    set(PLATFORM_NAME "3DS")
else()
    set(PLATFORM_UNKNOWN TRUE)
    set(PLATFORM_NAME "Unknown")
endif()

# Platform-specific compiler flags
if(PLATFORM_WINDOWS)
    # Windows specific flags
    add_compile_definitions(PLATFORM_WINDOWS)
    if(MSVC)
        add_compile_options(/W4)
    endif()
elseif(PLATFORM_LINUX)
    # Linux specific flags
    add_compile_definitions(PLATFORM_LINUX)
    add_compile_options(-Wall -Wextra)
elseif(PLATFORM_MACOS)
    # macOS specific flags
    add_compile_definitions(PLATFORM_MACOS)
    add_compile_options(-Wall -Wextra)
elseif(PLATFORM_3DS)
    # 3DS specific flags
    add_compile_definitions(PLATFORM_3DS)
    add_compile_options(-Wall -Wextra -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft)
endif()

message(STATUS "Detected platform: ${PLATFORM_NAME}")