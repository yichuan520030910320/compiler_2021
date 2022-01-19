; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@A = dso_local global i32 0
@B = dso_local global i32 0
@C = dso_local global i32 0

@const_string0 = private unnamed_addr constant [2 x i8] c" \00", align 1

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
    %AND_addr = alloca i1
    %return_register_infunction_addr = alloca i32
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body 
    %C = load i32, i32* @C
    %shl = shl i32 1, 29
    %slt = icmp slt i32 %C, %shl
    store i1 %slt, i1* %AND_addr
    br i1 %slt, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

while_body:                                                  ; preds = while_condition short_circuit_AND_end_AND 
    br label %while_condition

while_end_merge:                                             ; preds = entrance_block0 short_circuit_AND_end_AND 
    %A = load i32, i32* @A
    %call_toString = call i8* @toString(i32 %A)
    %const_string_pointer = getelementptr inbounds [2 x i8], [2 x i8]* @const_string0, i32 0, i32 0
    %string_add = call i8* @_str_concatenate(i8* %call_toString, i8* %const_string_pointer)
    %B = load i32, i32* @B
    %call_toString_0 = call i8* @toString(i32 %B)
    %string_add_0 = call i8* @_str_concatenate(i8* %string_add, i8* %call_toString_0)
    %const_string_pointer_0 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string0, i32 0, i32 0
    %string_add_1 = call i8* @_str_concatenate(i8* %string_add_0, i8* %const_string_pointer_0)
    %C_1 = load i32, i32* @C
    %call_toString_1 = call i8* @toString(i32 %C_1)
    %string_add_2 = call i8* @_str_concatenate(i8* %string_add_1, i8* %call_toString_1)
    call void @println(i8* %string_add_2)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

short_circuit_AND_end_AND:                                   ; preds = while_condition short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %while_body, label %while_end_merge

short_circuit_AND_branch_AND:                                ; preds = while_condition 
    %C_0 = load i32, i32* @C
    %shl_0 = shl i32 1, 29
    %SUB_single_front = mul i32 %shl_0, -1
    %sgt = icmp sgt i32 %C_0, %SUB_single_front
    store i1 %sgt, i1* %AND_addr
    br label %short_circuit_AND_end_AND

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    store i32 1, i32* @A
    store i32 1, i32* @B
    %SUB_single_front = mul i32 75, -1
    store i32 %SUB_single_front, i32* @C
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
