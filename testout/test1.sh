clang -S -emit-llvm builtin.c -o builtin.ll -O0
clang builtin.ll naive_llvm.ll -o code
./code < std.in >std.out
#./code < std.in

rm code