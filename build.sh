#!/usr/bin/env bash

rm -r src/*.cxx
rm -r include/*.h

cd src
fastrtpsgen -example x64Linux2.6gcc ../idl/*.idl
rm make*

cd ..
mv src/*.h include

rm -rf build
mkdir build
cd build
cmake ..
make
