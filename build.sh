#!/bin/bash

echo Building all ...

cd Java
./build.sh
cd ..

cd Swift
./build.sh
cd ..

cd CPP
./build.sh
cd ..


