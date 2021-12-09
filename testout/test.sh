clang -S -emit-llvm builtin.c -o builtin.ll -O0
clang builtin.ll naive_llvm.ll -o code
./code
rm code