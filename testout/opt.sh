clang -S -emit-llvm builtin.c -o builtin.ll -O0
clang builtin.ll optllvm.ll -o code
#./code < std.in >std.out
#./code < std.in
./code
rm code