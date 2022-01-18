; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@p = dso_local global i32 0
@i = dso_local global i32 0
@k = dso_local global i32 0
@n = dso_local global i32 0

@const_string3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@const_string1 = private unnamed_addr constant [2 x i8] c"(\00", align 1
@const_string2 = private unnamed_addr constant [3 x i8] c") \00", align 1
@const_string0 = private unnamed_addr constant [4 x i8] c"<< \00", align 1
@const_string4 = private unnamed_addr constant [4 x i8] c">> \00", align 1

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
    %n = load i32, i32* @n
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @n
    %p = load i32, i32* @p
    %call_getInt_0 = call i32 @getInt()
    store i32 %call_getInt_0, i32* @p
    %k = load i32, i32* @k
    %call_getInt_1 = call i32 @getInt()
    store i32 %call_getInt_1, i32* @k
    %p_0 = load i32, i32* @p
    %k_0 = load i32, i32* @k
    %sub = sub i32 %p_0, %k_0
    %sgt = icmp sgt i32 %sub, 1
    br i1 %sgt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %const_string_pointer = getelementptr inbounds [4 x i8], [4 x i8]* @const_string0, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %i = load i32, i32* @i
    %p_1 = load i32, i32* @p
    %k_1 = load i32, i32* @k
    %sub_0 = sub i32 %p_1, %k_1
    store i32 %sub_0, i32* @i
    br label %for_condition

for_condition:                                               ; preds = if_withoutelse_end_basicblock for_step 
    %i_0 = load i32, i32* @i
    %p_2 = load i32, i32* @p
    %k_2 = load i32, i32* @k
    %add = add i32 %p_2, %k_2
    %sle = icmp sle i32 %i_0, %add
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body if_withoutelse_end_basicblock0 
    %i_6 = load i32, i32* @i
    %add_0 = add i32 %i_6, 1
    store i32 %add_0, i32* @i
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %i_1 = load i32, i32* @i
    %sle_0 = icmp sle i32 1, %i_1
    store i1 %sle_0, i1* %AND_addr
    br i1 %sle_0, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

for_end_merge:                                               ; preds = for_condition 
    %p_4 = load i32, i32* @p
    %k_3 = load i32, i32* @k
    %add_1 = add i32 %p_4, %k_3
    %n_1 = load i32, i32* @n
    %slt = icmp slt i32 %add_1, %n_1
    br i1 %slt, label %single_then_basicblock1, label %if_withoutelse_end_basicblock1

short_circuit_AND_end_AND:                                   ; preds = for_body short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

short_circuit_AND_branch_AND:                                ; preds = for_body 
    %i_2 = load i32, i32* @i
    %n_0 = load i32, i32* @n
    %sle_1 = icmp sle i32 %i_2, %n_0
    store i1 %sle_1, i1* %AND_addr
    br label %short_circuit_AND_end_AND

single_then_basicblock0:                                     ; preds = short_circuit_AND_end_AND 
    %i_3 = load i32, i32* @i
    %p_3 = load i32, i32* @p
    %eq = icmp eq i32 %i_3, %p_3
    br i1 %eq, label %then_basicblock, label %else_basicblock

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 short_circuit_AND_end_AND if_end_basicblock 
    br label %for_step

then_basicblock:                                             ; preds = single_then_basicblock0 
    %const_string_pointer_0 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string1, i32 0, i32 0
    call void @print(i8* %const_string_pointer_0)
    %i_4 = load i32, i32* @i
    %call_toString = call i8* @toString(i32 %i_4)
    call void @print(i8* %call_toString)
    %const_string_pointer_1 = getelementptr inbounds [3 x i8], [3 x i8]* @const_string2, i32 0, i32 0
    call void @print(i8* %const_string_pointer_1)
    br label %if_end_basicblock

else_basicblock:                                             ; preds = single_then_basicblock0 
    %i_5 = load i32, i32* @i
    call void @printInt(i32 %i_5)
    %const_string_pointer_2 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string3, i32 0, i32 0
    call void @print(i8* %const_string_pointer_2)
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %if_withoutelse_end_basicblock0

single_then_basicblock1:                                     ; preds = for_end_merge 
    %const_string_pointer_3 = getelementptr inbounds [4 x i8], [4 x i8]* @const_string4, i32 0, i32 0
    call void @print(i8* %const_string_pointer_3)
    br label %if_withoutelse_end_basicblock1

if_withoutelse_end_basicblock1:                              ; preds = single_then_basicblock1 for_end_merge 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = if_withoutelse_end_basicblock1 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
