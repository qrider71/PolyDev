#!/bin/bash

echo Building Rust ...
cd mre_algos
cargo clippy
cargo fmt
cargo clean
cargo build --release

