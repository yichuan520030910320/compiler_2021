; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"



declare i1 @_str_ne(i8* %lhs,i8* %rhs)
declare i1 @_str_le(i8* %lhs,i8* %rhs)
declare i8* @_str_substring(i8* %str,i32 %left,i32 %right)
declare i8* @_str_concatenate(i8* %lhs,i8* %rhs)
declare i8* @getString()
declare i1 @_str_ge(i8* %lhs,i8* %rhs)
declare i1 @_str_lt(i8* %lhs,i8* %rhs)
declare i32 @getInt()
declare i32 @_str_length(i8* %str)
declare void @print(i8* %str_0)
declare void @println(i8* %str_0)
declare i32 @_str_ord(i8* %str,i32 %pos)
declare i8* @_f_malloc(i32 %n)
declare void @printInt(i32 %n_0)
declare void @printlnInt(i32 %n_0)
declare i8* @toString(i32 %i_0)
declare i32 @_str_parseInt(i8* %str)
declare i1 @_str_eq(i8* %lhs,i8* %rhs)
declare i1 @_str_gt(i8* %lhs,i8* %rhs)

define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %i_addr = alloca i32
    %f2_addr = alloca i32
    %f1_addr = alloca i32
    %f0_addr = alloca i32
    %n_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 10, i32* %n_addr
    store i32 0, i32* %f0_addr
    store i32 1, i32* %f1_addr
    %i = load i32, i32* %i_addr
    store i32 1, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %n = load i32, i32* %n_addr
    %slt = icmp slt i32 %i_0, %n
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_1 = load i32, i32* %i_addr
    %add_0 = add i32 %i_1, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %f2 = load i32, i32* %f2_addr
    %f0 = load i32, i32* %f0_addr
    %f1 = load i32, i32* %f1_addr
    %add = add i32 %f0, %f1
    store i32 %add, i32* %f2_addr
    %f0_0 = load i32, i32* %f0_addr
    %f1_0 = load i32, i32* %f1_addr
    store i32 %f1_0, i32* %f0_addr
    %f1_1 = load i32, i32* %f1_addr
    %f2_0 = load i32, i32* %f2_addr
    store i32 %f2_0, i32* %f1_addr
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %f2_1 = load i32, i32* %f2_addr
    call void @printlnInt(i32 %f2_1)
    br label %return_block0

return_block0:                                               ; preds = for_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
