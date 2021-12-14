; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"



declare i1 @_str_ne(i8* %lhs,i8* %rhs)
declare i1 @_str_le(i8* %lhs,i8* %rhs)
declare i8* @_str_concatenate(i8* %lhs,i8* %rhs)
declare i8* @getString()
declare i1 @_str_ge(i8* %lhs,i8* %rhs)
declare i1 @_str_lt(i8* %lhs,i8* %rhs)
declare i32 @getInt()
declare void @print(i8* %str_0)
declare void @println(i8* %str_0)
declare i32 @_str_ord(i8* %str,i32 %pos)
declare void @printInt(i32 %n_0)
declare void @printlnInt(i32 %n_0)
declare i8* @toString(i32 %i_0)
declare i1 @_str_eq(i8* %lhs,i8* %rhs)
declare i1 @_str_gt(i8* %lhs,i8* %rhs)

define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %slt = icmp slt i32 %i_0, 60
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body single_then_basicblock if_withoutelse_end_basicblock 
    %i_4 = load i32, i32* %i_addr
    %add = add i32 %i_4, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %i_1 = load i32, i32* %i_addr
    %sge = icmp sge i32 %i_1, 10
    %AND_addr = alloca i1
    store i1 %sge, i1* %AND_addr
    br i1 %sge, label %short_circuit_and_branch_AND, label %short_circuit_and_end_AND

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

short_circuit_and_end_AND:                                   ; preds = for_body short_circuit_and_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_and_branch_AND:                                ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %slt_0 = icmp slt i32 %i_2, 20
    store i1 %slt_0, i1* %AND_addr
    br label %short_circuit_and_end_AND

single_then_basicblock:                                      ; preds = short_circuit_and_end_AND 
    br label %for_step

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock short_circuit_and_end_AND 
    %i_3 = load i32, i32* %i_addr
    call void @printlnInt(i32 %i_3)
    br label %for_step

return_block0:                                               ; preds = for_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
