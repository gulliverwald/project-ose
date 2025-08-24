# # Nintendo 3DS toolchain file
# set(CMAKE_SYSTEM_NAME 3DS)
# set(CMAKE_SYSTEM_VERSION 1)

# # Define toolchain paths (adjust these to your devkitARM installation)
# if(DEFINED ENV{DEVKITARM})
#     set(DEVKITARM $ENV{DEVKITARM})
# else()
#     set(DEVKITARM /opt/devkitpro/devkitARM)
# endif()

# set(CMAKE_C_COMPILER ${DEVKITARM}/bin/arm-none-eabi-gcc)
# set(CMAKE_CXX_COMPILER ${DEVKITARM}/bin/arm-none-eabi-g++)
# set(CMAKE_ASM_COMPILER ${DEVKITARM}/bin/arm-none-eabi-gcc)

# # 3DS specific settings
# set(CMAKE_FIND_ROOT_PATH ${DEVKITARM}/arm-none-eabi ${DEVKITARM})
# set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
# set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# # 3DS libraries path
# if(DEFINED ENV{DEVKITPRO})
#     set(DEVKITPRO $ENV{DEVKITPRO})
# else()
#     set(DEVKITPRO /opt/devkitpro)
# endif()

# set(LIBCTRU ${DEVKITPRO}/libctru)
# set(CITRO3D ${DEVKITPRO}/citro3d)