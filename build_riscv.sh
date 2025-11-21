#!/bin/sh

mkdir -p build
rm -rf build/*
cd build

/opt/riscv/bin/riscv64-unknown-linux-gnu-gcc -B /opt/riscv/bin/ -S ../train_gpt2.c
/opt/riscv/bin/riscv64-unknown-linux-gnu-as -march=rv64i train_gpt2.s -o train_gpt2.o
/opt/riscv/bin/riscv64-unknown-linux-gnu-gcc -B /opt/riscv/bin/ -static train_gpt2.o -o train_gpt2.bin -lm

cd ..
