#!/bin/bash

echo Building all ...

cd Java
./build.sh
cd ..

cd Kotlin
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

cd Scala
./run.sh 10
cd ..

cd ScalaNative
./build.sh
cd ..

cd Typescript
./run.sh 10
cd ..

