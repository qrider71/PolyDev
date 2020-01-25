#!/bin/bash

echo Building Swift ...
cd MreAlgos
swift package clean
swift package update
swift build -c release
