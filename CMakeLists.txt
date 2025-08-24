cmake_minimum_required(VERSION 3.16)
project(ProjectOSE VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(platform)

# Set default build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build." FORCE)
endif()

# Platform-specific configurations
if(PLATFORM_DESKTOP)
    message(STATUS "Building for Desktop (Windows/Linux/macOS)")
    set(RAYLIB_TARGET desktop)
# elseif(PLATFORM_3DS)
#     message(STATUS "Building for Nintendo 3DS")
#     set(RAYLIB_TARGET 3ds)
#     # 3DS specific settings
#     set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/3ds.cmake)
endif()

# Find or build raylib
find_package(raylib QUIET)
if(NOT raylib_FOUND)
    include(FetchContent)
    FetchContent_Declare(
        raylib
        GIT_REPOSITORY https://github.com/raysan5/raylib.git
        GIT_TAG 5.0
    )
    FetchContent_MakeAvailable(raylib)
endif()

# Add subdirectories
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/core)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/platforms)