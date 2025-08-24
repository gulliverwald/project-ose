@echo off
setlocal enabledelayedexpansion

set PLATFORM=%1
set BUILD_TYPE=%2

if "%PLATFORM%"=="" set PLATFORM=desktop
if "%BUILD_TYPE%"=="" set BUILD_TYPE=Release

echo Building for platform: %PLATFORM%
echo Build type: %BUILD_TYPE%

if not exist build mkdir build
if not exist build\%PLATFORM% mkdir build\%PLATFORM%
cd build\%PLATFORM%

if "%PLATFORM%"=="desktop" (
    cmake ..\.. -DCMAKE_BUILD_TYPE=%BUILD_TYPE%
) else if "%PLATFORM%"=="3ds" (
    cmake ..\.. -DCMAKE_TOOLCHAIN_FILE=..\..\cmake\Toolchains\3ds.cmake -DCMAKE_BUILD_TYPE=%BUILD_TYPE%
) else (
    echo Unknown platform: %PLATFORM%
    echo Available platforms: desktop, 3ds
    exit /b 1
)

cmake --build . --config %BUILD_TYPE%

:: Create symlink for compile_commands.json in project root for clangd
if exist compile_commands.json (
    cd ..\..
    if exist compile_commands.json del compile_commands.json
    mklink compile_commands.json build\%PLATFORM%\compile_commands.json
    cd build\%PLATFORM%
)

echo Build completed successfully!