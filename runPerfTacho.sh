#!/bin/bash

clear

echo Starting all benchmarks ...

cd Java
perftacho -tachoRepeat=10 -tachoRegEx -tachoTag=Java ./run.sh $1
cd ..

cd Kotlin
perftacho -tachoRepeat=10 -tachoRegEx -tachoTag=Kotlin ./run.sh $1
cd ..

cd Swift
perftacho -tachoRepeat=10 -tachoRegEx -tachoTag=Swift ./run.sh $1
cd ..

cd CPP
perftacho -tachoRepeat=10 -tachoRegEx -tachoTag=CPP ./run.sh $1
cd ..

cd Rust
perftacho -tachoRepeat=10 -tachoRegEx -tachoTag=Rust ./run.sh $1
cd ..

cd Python
perftacho -tachoRepeat=10 -tachoRegEx -tachoTag=Python ./run.sh $1
cd ..

cd Haskell
perftacho -tachoRepeat=10 -tachoRegEx="(\-?\d+[\.]?\d*)(s)" -tachoTag=Haskell ./run.sh $1
cd ..

cd Fsharp
perftacho -tachoRepeat=10 -tachoRegEx -tachoTag=Fsharp ./run.sh $1
cd ..

cd Scala
perftacho -tachoRepeat=10 -tachoRegEx -tachoTag=Scala ./run.sh $1
cd ..

cd ScalaNative
perftacho -tachoRepeat=10 -tachoRegEx -tachoTag=ScalaNative ./run.sh $1
cd ..

cd Julia
perftacho -tachoRepeat=10 -tachoRegEx="\[(\-?\d+[\.,]?\d*)\s?milliseconds\]" -tachoTag=Julia ./run.sh $1
cd ..

cd Typescript
perftacho -tachoRepeat=10 -tachoRegEx -tachoTag=Typescript ./run.sh $1
cd ..
