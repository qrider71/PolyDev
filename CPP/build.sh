#!/bin/bash

cd MreAlgos/MreAlgos

echo Building CPP
rm -rf .build/
mkdir .build
g++ -O3 -std=c++2a main.cpp -o .build/MreAlgos

