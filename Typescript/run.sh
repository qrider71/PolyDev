#!/bin/bash

export NODE_OPTIONS=--max_old_space_size=4096
cd Node
node dist/algos.js $1
cd ..

