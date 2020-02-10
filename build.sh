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

cd Rust
./build.sh
cd ..

cd Haskell
./build.sh
cd ..

cd Fsharp
./build.sh
cd ..

