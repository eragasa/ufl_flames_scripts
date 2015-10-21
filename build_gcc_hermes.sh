#!/bin/bash

GCC_VERSION=4.9.3
WORK_DIR=$HOME/src/
INSTALL_DIR=$HOME/usr/local/gcc/4.9.3

# get source code
cd $WORK_DIR
wget http://www.netgull.com/gcc/releases/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.bz2
tar -xf gcc-${GCC_VERSION}.tar.bz2

# get prerequisites
cd gcc-${GCC_VERSION}
./contrib/download_prerequisites

# create the build directory
cd ..
mkdir gcc-build
cd gcc-build

# build
../gcc-${GCC_VERSION}/configure \
  --prefix=${INSTALL_DIR}       \
  --enable-shared               \
  --enable-threads=posix        \
  --enable-__cxa_atexit         \
  --enable-clocale=gnu          \
  --disable-multilib            \
  --enable-languages=c,c++,fortran,objc,obj-c++ \
&& make \
&& make install
