#!/bin/bash
set -ex

cmake ${CMAKE_ARGS} -G Ninja -S . -B build \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DUTF8CPP_ENABLE_TESTS=OFF
cmake --build build
cmake --install build

# Preserve the established include layout for existing consumers.
cp source/utf8.h "$PREFIX/include"
cp -r source/utf8 "$PREFIX/include"
