#!/bin/bash

echo Building Rust ...
cd mre_algos
cargo clean
cargo build --release

