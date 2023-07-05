#!/bin/bash

# 1) put this file to flare-engine/distribution/emscripten
# 2) then execute ./make_hero.sh

cd "`dirname "$0"`"
cd ../../

rm -rf emscripten/*
mkdir -p emscripten

FLARE_GAME_PATH="../flare-game"

if [ ! -d "$FLARE_GAME_PATH" ]; then
    FLARE_GAME_PATH=""
fi

if [ "$1" ]; then
    FLARE_GAME_PATH="$1"
else
    FLARE_GAME_PATH="../hero"
fi

if [ -z "$FLARE_GAME_PATH" ]; then
    echo "Usage: $0 <path to flare-game>"
    exit 1
fi

cp -r "$FLARE_GAME_PATH"/mods/hero_geos mods/hero_geos

#cmake .

emcc \
	-v \
	-Isrc/ \
	src/*.cpp \
	-O3 \
	-s ASSERTIONS=1 \
	-s ALLOW_MEMORY_GROWTH=1 \
	-s USE_SDL=2 \
	-s USE_SDL_IMAGE=2 \
	-s SDL2_IMAGE_FORMATS='["png"]' \
	-s USE_SDL_TTF=2 \
	-s USE_SDL_MIXER=2 \
	-s "EXTRA_EXPORTED_RUNTIME_METHODS=['print']" \
	-lidbfs.js \
	--preload-file mods \
	--use-preload-cache \
	-o emscripten/index.html

rm -rf mods/hero_geos

cp distribution/emscripten_template.html emscripten/index.html
