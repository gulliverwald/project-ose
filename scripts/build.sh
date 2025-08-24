#!/bin/bash
set -e

PLATFORM=${1:-desktop}
BUILD_TYPE=${2:-Release}

echo "Building for platform: $PLATFORM"
echo "Build type: $BUILD_TYPE"

mkdir -p build/$PLATFORM
cd build/$PLATFORM

case $PLATFORM in
    "desktop")
        cmake ../.. -DCMAKE_BUILD_TYPE=$BUILD_TYPE
        ;;
    "3ds")
        cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../cmake/Toolchains/3ds.cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE
        ;;
    *)
        echo "Unknown platform: $PLATFORM"
        echo "Available platforms: desktop, 3ds"
        exit 1
        ;;
esac

make -j$(nproc)

# Create symlink for compile_commands.json in project root for clangd
if [ -f compile_commands.json ]; then
    ln -sf build/$PLATFORM/compile_commands.json ../../compile_commands.json
fi

echo "Build completed successfully!"