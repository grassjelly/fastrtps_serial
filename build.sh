#!/usr/bin/env bash

cd src
rm -r *.cxx
rm -r *.h

fastrtpsgen -example x64Linux2.6gcc ../idl/*.idl
rm make*

cd ..
mkdir include
mv src/*.h include

rm -rf build
mkdir build
cd build
cmake ..
make
