#!/bin/bash

cd MreAlgos
sbt --error "run $1"
cd ..
