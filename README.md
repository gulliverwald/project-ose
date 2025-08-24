# Project OSE Game

A cross-platform game built with raylib supporting Windows, Linux, and Nintendo 3DS.

## Building

### Desktop (Windows/Linux/macOS)
```bash
./build.sh desktop Release
```

### Nintendo 3DS
```bash
./build.sh 3ds Release
```

### Windows
```cmd
build.bat desktop Release
```

## Project Structure

- `src/core/` - Shared game engine code
- `src/platforms/` - Platform-specific implementations
- `cmake/` - CMake modules and toolchain files
- `assets/` - Game resources
- `build/` - Build outputs

## Prerequisites

### Desktop
- CMake 3.16+
- C++17 compiler
- Raylib (automatically fetched)

### Nintendo 3DS
- devkitARM
- libctru
- citro3d