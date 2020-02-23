#!/bin/bash

export NODE_OPTIONS=--max_old_space_size=4096
cd node
npm test $1
cd ..

