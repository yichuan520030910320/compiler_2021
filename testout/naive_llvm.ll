; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@kkk = dso_local global i32 0


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
    %j_addr = alloca i32
    store i32 0, i32* %j_addr
    %i_addr = alloca i32
    store i32 0, i32* %i_addr
    %sum_addr = alloca i32
    store i32 0, i32* %sum_addr
    %n_addr = alloca i32
    store i32 0, i32* %n_addr
    %return_register_infunction_addr = alloca i32
    store i32 10, i32* %n_addr
    store i32 0, i32* %sum_addr
    %i = load i32, i32* %i_addr
    store i32 1, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %n = load i32, i32* %n_addr
    %sle = icmp sle i32 %i_0, %n
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add_0 = add i32 %i_2, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %sum = load i32, i32* %sum_addr
    %sum_0 = load i32, i32* %sum_addr
    %i_1 = load i32, i32* %i_addr
    %add = add i32 %sum_0, %i_1
    store i32 %add, i32* %sum_addr
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %j = load i32, i32* %j_addr
    store i32 1, i32* %j_addr
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %j_0 = load i32, i32* %j_addr
    %n_0 = load i32, i32* %n_addr
    %sle_0 = icmp sle i32 %j_0, %n_0
    br i1 %sle_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %j_2 = load i32, i32* %j_addr
    %add_3 = add i32 %j_2, 1
    store i32 %add_3, i32* %j_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %sum_1 = load i32, i32* %sum_addr
    %sum_2 = load i32, i32* %sum_addr
    %add_1 = add i32 %sum_2, 10
    %j_1 = load i32, i32* %j_addr
    %add_2 = add i32 %add_1, %j_1
    store i32 %add_2, i32* %sum_addr
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    %sum_3 = load i32, i32* %sum_addr
    call void @printlnInt(i32 %sum_3)
    %sum_4 = load i32, i32* %sum_addr
    store i32 %sum_4, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = for_end_merge0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
