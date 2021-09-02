cmake_minimum_required(VERSION 3.13...3.20)

project(Quakespasm-Spiked LANGUAGES C)

# mkdir build
# cd build
# /Volumes/Storage/Applications/CMake.app/Contents/bin/cmake -GXcode -DCMAKE_PREFIX_PATH=/Volumes/ramdisk/zdoom-macos-deps/prefix -DCMAKE_EXE_LINKER_FLAGS="$(/Volumes/ramdisk/zdoom-macos-deps/prefix/bin/pkg-config --libs sdl2 vorbisfile)" ..

# TODO: add other platforms, Windows and Linux
# TODO: choose mod library, mikmod or xmp
# TODO: choose mp3 library, mad or mpg123
# TODO: choose vorbis library, tremor or vorbis
# TODO: make third-party library optional if possible

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

set(QUAKE_SOURCES
	quakespasm/Quake/bgmusic.c
	quakespasm/Quake/cd_null.c
	# quakespasm/Quake/cd_sdl.c
	quakespasm/Quake/cfgfile.c
	quakespasm/Quake/chase.c
	quakespasm/Quake/cl_demo.c
	quakespasm/Quake/cl_input.c
	quakespasm/Quake/cl_main.c
	quakespasm/Quake/cl_parse.c
	quakespasm/Quake/cl_tent.c
	quakespasm/Quake/cmd.c
	quakespasm/Quake/common.c
	quakespasm/Quake/console.c
	quakespasm/Quake/crc.c
	quakespasm/Quake/cvar.c
	quakespasm/Quake/fs_zip.c
	quakespasm/Quake/gl_draw.c
	quakespasm/Quake/gl_fog.c
	quakespasm/Quake/gl_mesh.c
	quakespasm/Quake/gl_model.c
	quakespasm/Quake/gl_refrag.c
	quakespasm/Quake/gl_rlight.c
	quakespasm/Quake/gl_rmain.c
	quakespasm/Quake/gl_rmisc.c
	quakespasm/Quake/gl_screen.c
	quakespasm/Quake/gl_sky.c
	quakespasm/Quake/gl_texmgr.c
	quakespasm/Quake/gl_vidsdl.c
	quakespasm/Quake/gl_warp.c
	quakespasm/Quake/host.c
	quakespasm/Quake/host_cmd.c
	quakespasm/Quake/image.c
	quakespasm/Quake/in_sdl.c
	quakespasm/Quake/keys.c
	# quakespasm/Quake/lodepng.c
	quakespasm/Quake/main_sdl.c
	quakespasm/Quake/mathlib.c
	quakespasm/Quake/mdfour.c
	quakespasm/Quake/menu.c
	quakespasm/Quake/net_bsd.c
	quakespasm/Quake/net_dgrm.c
	quakespasm/Quake/net_loop.c
	quakespasm/Quake/net_main.c
	quakespasm/Quake/net_udp.c
	# quakespasm/Quake/net_win.c
	# quakespasm/Quake/net_wins.c
	# quakespasm/Quake/net_wipx.c
	# quakespasm/Quake/pl_linux.c
	# quakespasm/Quake/pl_win.c
	quakespasm/Quake/pr_cmds.c
	quakespasm/Quake/pr_edict.c
	quakespasm/Quake/pr_exec.c
	quakespasm/Quake/pr_ext.c
	quakespasm/Quake/r_alias.c
	quakespasm/Quake/r_brush.c
	quakespasm/Quake/r_part.c
	quakespasm/Quake/r_part_fte.c
	quakespasm/Quake/r_sprite.c
	quakespasm/Quake/r_world.c
	quakespasm/Quake/sbar.c
	quakespasm/Quake/snd_codec.c
	quakespasm/Quake/snd_dma.c
	quakespasm/Quake/snd_flac.c
	quakespasm/Quake/snd_mem.c
	quakespasm/Quake/snd_mikmod.c
	quakespasm/Quake/snd_mix.c
	quakespasm/Quake/snd_mp3.c
	quakespasm/Quake/snd_mp3tag.c
	quakespasm/Quake/snd_mpg123.c
	quakespasm/Quake/snd_opus.c
	quakespasm/Quake/snd_sdl.c
	quakespasm/Quake/snd_umx.c
	quakespasm/Quake/snd_voip.c
	quakespasm/Quake/snd_vorbis.c
	quakespasm/Quake/snd_wave.c
	quakespasm/Quake/snd_xmp.c
	quakespasm/Quake/strlcat.c
	quakespasm/Quake/strlcpy.c
	quakespasm/Quake/sv_main.c
	quakespasm/Quake/sv_move.c
	quakespasm/Quake/sv_phys.c
	quakespasm/Quake/sv_user.c
	quakespasm/Quake/sys_sdl_unix.c
	# quakespasm/Quake/sys_sdl_win.c
	quakespasm/Quake/view.c
	quakespasm/Quake/wad.c
	quakespasm/Quake/world.c
	quakespasm/Quake/zone.c
	quakespasm/Quake/Makefile.darwin
	quakespasm/Quake/anorm_dots.h
	quakespasm/Quake/anorms.h
	quakespasm/Quake/arch_def.h
	quakespasm/Quake/bgmusic.h
	quakespasm/Quake/bspfile.h
	quakespasm/Quake/cdaudio.h
	quakespasm/Quake/cfgfile.h
	quakespasm/Quake/client.h
	quakespasm/Quake/cmd.h
	quakespasm/Quake/common.h
	quakespasm/Quake/console.h
	quakespasm/Quake/crc.h
	quakespasm/Quake/cvar.h
	quakespasm/Quake/draw.h
	quakespasm/Quake/filenames.h
	quakespasm/Quake/gl_model.h
	quakespasm/Quake/gl_texmgr.h
	quakespasm/Quake/gl_warp_sin.h
	quakespasm/Quake/glquake.h
	quakespasm/Quake/image.h
	quakespasm/Quake/input.h
	quakespasm/Quake/keys.h
	quakespasm/Quake/lodepng.h
	quakespasm/Quake/mathlib.h
	quakespasm/Quake/menu.h
	quakespasm/Quake/modelgen.h
	quakespasm/Quake/net.h
	quakespasm/Quake/net_defs.h
	quakespasm/Quake/net_dgrm.h
	quakespasm/Quake/net_loop.h
	quakespasm/Quake/net_sys.h
	quakespasm/Quake/net_udp.h
	# quakespasm/Quake/net_wins.h
	# quakespasm/Quake/net_wipx.h
	quakespasm/Quake/platform.h
	quakespasm/Quake/pr_comp.h
	quakespasm/Quake/progdefs.h
	quakespasm/Quake/progs.h
	quakespasm/Quake/protocol.h
	quakespasm/Quake/q_ctype.h
	quakespasm/Quake/q_sound.h
	quakespasm/Quake/q_stdinc.h
	quakespasm/Quake/qs_bmp.h
	quakespasm/Quake/quakedef.h
	quakespasm/Quake/render.h
	quakespasm/Quake/resource.h
	quakespasm/Quake/sbar.h
	quakespasm/Quake/screen.h
	quakespasm/Quake/server.h
	quakespasm/Quake/snd_codec.h
	quakespasm/Quake/snd_codeci.h
	quakespasm/Quake/snd_flac.h
	quakespasm/Quake/snd_mikmod.h
	quakespasm/Quake/snd_mp3.h
	quakespasm/Quake/snd_opus.h
	quakespasm/Quake/snd_umx.h
	quakespasm/Quake/snd_voip.h
	quakespasm/Quake/snd_vorbis.h
	quakespasm/Quake/snd_wave.h
	quakespasm/Quake/snd_xmp.h
	quakespasm/Quake/spritegn.h
	quakespasm/Quake/stb_image.h
	quakespasm/Quake/stb_image_write.h
	quakespasm/Quake/strl_fn.h
	quakespasm/Quake/sys.h
	quakespasm/Quake/vid.h
	quakespasm/Quake/view.h
	quakespasm/Quake/wad.h
	quakespasm/Quake/world.h
	quakespasm/Quake/wsaerror.h
	quakespasm/Quake/zone.h
	quakespasm/Quake/pl_osx.m
)

set(MACOS_SOURCES
	quakespasm/MacOSX/AppController.h
	quakespasm/MacOSX/QuakeArgument.h
	quakespasm/MacOSX/QuakeArguments.h
	quakespasm/MacOSX/ScreenInfo.h
	quakespasm/MacOSX/SDLApplication.h
	quakespasm/MacOSX/SDLMain.h
	quakespasm/MacOSX/AppController.m
	quakespasm/MacOSX/QuakeArgument.m
	quakespasm/MacOSX/QuakeArguments.m
	quakespasm/MacOSX/ScreenInfo.m
	quakespasm/MacOSX/SDLApplication.m
	quakespasm/MacOSX/SDLMain.m
)

set(MACOS_RESOURCES
	quakespasm/MacOSX/QuakeSpasm.icns
	quakespasm/MacOSX/English.lproj/Launcher.nib
)

set(CMAKE_OSX_DEPLOYMENT_TARGET "10.9")

add_executable(quakespasm-spiked MACOSX_BUNDLE)

target_compile_definitions(quakespasm-spiked PRIVATE
	# USE_CODEC_FLAC
	# USE_CODEC_MIKMOD
	# USE_CODEC_MP3
	# USE_CODEC_OPUS
	USE_CODEC_VORBIS
	USE_CODEC_UMX
	USE_CODEC_WAVE
	USE_SDL2
	USE_ZLIB
)

target_include_directories(quakespasm-spiked PRIVATE
	quakespasm/MacOSX
	quakespasm/Quake
)

target_sources(quakespasm-spiked PRIVATE
	${QUAKE_SOURCES}
	${MACOS_SOURCES}
	${MACOS_RESOURCES}
)

find_package(OpenGL REQUIRED)
set_property(TARGET OpenGL::GL PROPERTY IMPORTED_GLOBAL TRUE)
target_link_libraries(quakespasm-spiked PRIVATE OpenGL::GL)

find_package(SDL2 REQUIRED)
target_include_directories(quakespasm-spiked PRIVATE "${SDL2_INCLUDE_DIR}")
target_link_libraries(quakespasm-spiked PRIVATE "${SDL2_LIBRARY}")

find_package(Vorbis REQUIRED)
target_include_directories(quakespasm-spiked PRIVATE "${VORBIS_INCLUDE_DIR}")
target_link_libraries(quakespasm-spiked PRIVATE "${VORBISFILE_LIBRARY}")

find_package(ZLIB REQUIRED)
set_property(TARGET ZLIB::ZLIB PROPERTY IMPORTED_GLOBAL TRUE)
target_link_libraries(quakespasm-spiked PRIVATE ZLIB::ZLIB)

set_target_properties(quakespasm-spiked PROPERTIES
	MACOSX_BUNDLE_INFO_PLIST "${CMAKE_SOURCE_DIR}/quakespasm/MacOSX/Info.plist"
)

set_source_files_properties(${MACOS_RESOURCES} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
