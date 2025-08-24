add_library(core STATIC
    source/engine.cc
    source/player_character.cc
)

target_include_directories(core PUBLIC
    include
)

target_link_libraries(core PUBLIC raylib)

# Platform-specific linking
# if(PLATFORM_3DS)
#     target_link_libraries(core PUBLIC
#         ${LIBCTRU}/lib/libctru.a
#         ${CITRO3D}/lib/libcitro3d.a
#     )
#     target_include_directories(core PUBLIC
#         ${LIBCTRU}/include
#         ${CITRO3D}/include
#     )
# endif()