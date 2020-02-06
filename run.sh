#!/bin/bash

clear

echo Starting all benchmarks ...

cd Java
./run.sh $1
cd ..

cd Swift
./run.sh $1
cd ..

cd CPP
./run.sh $1
cd ..

cd Python
./run.sh $1
cd ..

cd Haskell
./run.sh $1
cd ..

cd Fsharp
./run.sh $1
cd ..

cd Scala
./run.sh $1
cd ..
