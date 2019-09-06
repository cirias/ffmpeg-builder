#!/bin/bash

set -e
set -x

OUTPUT_DIR=$1

mkdir /tmp/pkgs

# x264
cd /tmp/pkgs
wget https://code.videolan.org/videolan/x264/-/archive/34c06d1c17ad968fbdda153cb772f77ee31b3095/x264-34c06d1c17ad968fbdda153cb772f77ee31b3095.tar.gz
tar xzf x264-34c06d1c17ad968fbdda153cb772f77ee31b3095.tar.gz
cd x264-34c06d1c17ad968fbdda153cb772f77ee31b3095
./configure --prefix=${OUTPUT_DIR} --bit-depth=8 --chroma-format=all --enable-static --enable-pic --enable-strip --disable-cli --disable-gpl --disable-avs --disable-ffms --disable-swscale --disable-gpac --disable-lsmash
make install
 
# gperf
cd /tmp/pkgs
wget http://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz
tar xzf gperf-3.1.tar.gz
cd gperf-3.1
./configure --prefix=${OUTPUT_DIR} --enable-pic
make install

# zlib
cd /tmp/pkgs
wget https://github.com/madler/zlib/archive/v1.2.11.tar.gz
tar vxzf v1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=${OUTPUT_DIR} --static
make install

# libpng
cd /tmp/pkgs
wget https://download.sourceforge.net/libpng/libpng-1.6.36.tar.gz
tar vxzf libpng-1.6.36.tar.gz
cd libpng-1.6.36
CFLAGS=-I${OUTPUT_DIR}/include CPPFLAGS=-I${OUTPUT_DIR}/include LDFLAGS=-L${OUTPUT_DIR}/lib ./configure --prefix=${OUTPUT_DIR} --disable-shared --enable-static
make install

rm -rf /tmp/pkgs
