; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@check = dso_local global i1* null
@M = dso_local global i32 0
@N = dso_local global i32 0

@const_string0 = private unnamed_addr constant [4 x i8] c"yep\00", align 1

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
    %cnt_addr = alloca i32
    %tmp_addr = alloca i32
    %AND_addr = alloca i1
    %i_addr_0 = alloca i32
    %k_addr = alloca i32
    %P_addr = alloca i32*
    %phi_addr = alloca i32*
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %N = load i32, i32* @N
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @N
    %check = load i1*, i1** @check
    %N_0 = load i32, i32* @N
    %add = add i32 %N_0, 5
    %mul_bytes = mul i32 %add, 1
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %add, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i1*
    store i1* %array_addr, i1** @check
    store i32 0, i32* %i_addr
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body 
    %i = load i32, i32* %i_addr
    %N_1 = load i32, i32* @N
    %sle = icmp sle i32 %i, %N_1
    br i1 %sle, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %check_0 = load i1*, i1** @check
    %i_0 = load i32, i32* %i_addr
    %add_0 = add i32 %i_0, 1
    store i32 %add_0, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i1, i1* %check_0, i32 %i_0
    %load_result = load i1, i1* %getelementptr_reg
    store i1 true, i1* %getelementptr_reg
    br label %while_condition

while_end_merge:                                             ; preds = entrance_block0 while_condition 
    %N_2 = load i32, i32* @N
    %add_1 = add i32 %N_2, 5
    %mul_bytes_0 = mul i32 %add_1, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 %add_1, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** %phi_addr
    %N_3 = load i32, i32* @N
    %add_2 = add i32 %N_3, 5
    %mul_bytes_1 = mul i32 %add_2, 4
    %sum_bytes_1 = add i32 %mul_bytes_1, 4
    %malloca_1 = call i8* @_f_malloc(i32 %sum_bytes_1)
    %array_cast_i8_to_i32_1 = bitcast i8* %malloca_1 to i32*
    store i32 %add_2, i32* %array_cast_i8_to_i32_1
    %array_tmp_begin_i32_1 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_1, i32 1
    %array_addr_1 = bitcast i32* %array_tmp_begin_i32_1 to i32*
    store i32* %array_addr_1, i32** %P_addr
    %phi = load i32*, i32** %phi_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %phi, i32 1
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 1, i32* %getelementptr_reg_0
    %i_1 = load i32, i32* %i_addr
    store i32 2, i32* %i_addr
    br label %for_body

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_19 = load i32, i32* %i_addr
    %add_6 = add i32 %i_19, 1
    store i32 %add_6, i32* %i_addr
    br label %for_body

for_body:                                                    ; preds = for_step while_end_merge 
    %i_2 = load i32, i32* %i_addr
    %N_4 = load i32, i32* @N
    %sgt = icmp sgt i32 %i_2, %N_4
    br i1 %sgt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge:                                               ; preds = single_then_basicblock 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

single_then_basicblock:                                      ; preds = for_body 
    br label %for_end_merge

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body 
    %check_1 = load i1*, i1** @check
    %i_3 = load i32, i32* %i_addr
    %getelementptr_reg_1 = getelementptr inbounds i1, i1* %check_1, i32 %i_3
    %load_result_1 = load i1, i1* %getelementptr_reg_1
    br i1 %load_result_1, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

single_then_basicblock0:                                     ; preds = if_withoutelse_end_basicblock 
    %P = load i32*, i32** %P_addr
    %M = load i32, i32* @M
    %add_3 = add i32 %M, 1
    store i32 %add_3, i32* @M
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %P, i32 %add_3
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %i_4 = load i32, i32* %i_addr
    store i32 %i_4, i32* %getelementptr_reg_2
    %phi_0 = load i32*, i32** %phi_addr
    %i_5 = load i32, i32* %i_addr
    %getelementptr_reg_3 = getelementptr inbounds i32, i32* %phi_0, i32 %i_5
    %load_result_3 = load i32, i32* %getelementptr_reg_3
    %i_6 = load i32, i32* %i_addr
    %sub = sub i32 %i_6, 1
    store i32 %sub, i32* %getelementptr_reg_3
    br label %if_withoutelse_end_basicblock0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 if_withoutelse_end_basicblock 
    %i_7 = load i32, i32* %i_addr
    store i32 %i_7, i32* %k_addr
    %i_8 = load i32, i32* %i_addr_0
    store i32 1, i32* %i_addr_0
    br label %for_condition

for_condition:                                               ; preds = if_withoutelse_end_basicblock0 for_step0 
    %i_9 = load i32, i32* %i_addr_0
    %M_0 = load i32, i32* @M
    %sle_0 = icmp sle i32 %i_9, %M_0
    store i1 %sle_0, i1* %AND_addr
    br i1 %sle_0, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

for_step0:                                                   ; preds = for_body0 single_then_basicblock1 if_end_basicblock 
    %i_18 = load i32, i32* %i_addr_0
    %add_5 = add i32 %i_18, 1
    store i32 %add_5, i32* %i_addr_0
    br label %for_condition

for_body0:                                                   ; preds = for_condition short_circuit_AND_end_AND 
    %k_0 = load i32, i32* %k_addr
    %P_1 = load i32*, i32** %P_addr
    %i_11 = load i32, i32* %i_addr_0
    %getelementptr_reg_5 = getelementptr inbounds i32, i32* %P_1, i32 %i_11
    %load_result_5 = load i32, i32* %getelementptr_reg_5
    %mul_0 = mul i32 %k_0, %load_result_5
    store i32 %mul_0, i32* %tmp_addr
    %tmp = load i32, i32* %tmp_addr
    %N_6 = load i32, i32* @N
    %sgt_0 = icmp sgt i32 %tmp, %N_6
    br i1 %sgt_0, label %single_then_basicblock1, label %if_withoutelse_end_basicblock1

for_end_merge0:                                              ; preds = for_condition short_circuit_AND_end_AND then_basicblock 
    %phi_5 = load i32*, i32** %phi_addr
    %k_6 = load i32, i32* %k_addr
    %getelementptr_reg_16 = getelementptr inbounds i32, i32* %phi_5, i32 %k_6
    %load_result_16 = load i32, i32* %getelementptr_reg_16
    %call_toString = call i8* @toString(i32 %load_result_16)
    call void @println(i8* %call_toString)
    br label %for_step

short_circuit_AND_end_AND:                                   ; preds = for_condition short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %for_body0, label %for_end_merge0

short_circuit_AND_branch_AND:                                ; preds = for_condition 
    %k = load i32, i32* %k_addr
    %P_0 = load i32*, i32** %P_addr
    %i_10 = load i32, i32* %i_addr_0
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %P_0, i32 %i_10
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %mul = mul i32 %k, %load_result_4
    %N_5 = load i32, i32* @N
    %sle_1 = icmp sle i32 %mul, %N_5
    store i1 %sle_1, i1* %AND_addr
    br label %short_circuit_AND_end_AND

single_then_basicblock1:                                     ; preds = for_body0 
    br label %for_step0

if_withoutelse_end_basicblock1:                              ; preds = single_then_basicblock1 for_body0 
    %check_2 = load i1*, i1** @check
    %tmp_0 = load i32, i32* %tmp_addr
    %getelementptr_reg_6 = getelementptr inbounds i1, i1* %check_2, i32 %tmp_0
    %load_result_6 = load i1, i1* %getelementptr_reg_6
    store i1 false, i1* %getelementptr_reg_6
    %k_1 = load i32, i32* %k_addr
    call void @printlnInt(i32 %k_1)
    %i_12 = load i32, i32* %i_addr_0
    call void @printlnInt(i32 %i_12)
    %cnt = load i32, i32* %cnt_addr
    store i32 0, i32* %cnt_addr
    br label %for_condition0

for_condition0:                                              ; preds = if_withoutelse_end_basicblock1 for_step1 
    %cnt_0 = load i32, i32* %cnt_addr
    %N_7 = load i32, i32* @N
    %sle_2 = icmp sle i32 %cnt_0, %N_7
    br i1 %sle_2, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 if_withoutelse_end_basicblock2 
    %cnt_2 = load i32, i32* %cnt_addr
    %add_4 = add i32 %cnt_2, 1
    store i32 %add_4, i32* %cnt_addr
    br label %for_condition0

for_body1:                                                   ; preds = for_condition0 
    %check_3 = load i1*, i1** @check
    %i_13 = load i32, i32* %i_addr_0
    %getelementptr_reg_7 = getelementptr inbounds i1, i1* %check_3, i32 %i_13
    %load_result_7 = load i1, i1* %getelementptr_reg_7
    br i1 %load_result_7, label %single_then_basicblock2, label %if_withoutelse_end_basicblock2

for_end_merge1:                                              ; preds = for_condition0 
    %k_2 = load i32, i32* %k_addr
    %P_2 = load i32*, i32** %P_addr
    %i_14 = load i32, i32* %i_addr_0
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %P_2, i32 %i_14
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    %srem = srem i32 %k_2, %load_result_8
    %eq = icmp eq i32 %srem, 0
    br i1 %eq, label %then_basicblock, label %else_basicblock

single_then_basicblock2:                                     ; preds = for_body1 
    %cnt_1 = load i32, i32* %cnt_addr
    call void @printlnInt(i32 %cnt_1)
    %const_string_pointer = getelementptr inbounds [4 x i8], [4 x i8]* @const_string0, i32 0, i32 0
    call void @println(i8* %const_string_pointer)
    br label %if_withoutelse_end_basicblock2

if_withoutelse_end_basicblock2:                              ; preds = single_then_basicblock2 for_body1 
    br label %for_step1

then_basicblock:                                             ; preds = for_end_merge1 
    %phi_1 = load i32*, i32** %phi_addr
    %tmp_1 = load i32, i32* %tmp_addr
    %getelementptr_reg_9 = getelementptr inbounds i32, i32* %phi_1, i32 %tmp_1
    %load_result_9 = load i32, i32* %getelementptr_reg_9
    %phi_2 = load i32*, i32** %phi_addr
    %k_3 = load i32, i32* %k_addr
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %phi_2, i32 %k_3
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    %P_3 = load i32*, i32** %P_addr
    %i_15 = load i32, i32* %i_addr_0
    %getelementptr_reg_11 = getelementptr inbounds i32, i32* %P_3, i32 %i_15
    %load_result_11 = load i32, i32* %getelementptr_reg_11
    %mul_1 = mul i32 %load_result_10, %load_result_11
    store i32 %mul_1, i32* %getelementptr_reg_9
    br label %for_end_merge0

else_basicblock:                                             ; preds = for_end_merge1 
    %phi_3 = load i32*, i32** %phi_addr
    %k_4 = load i32, i32* %k_addr
    %P_4 = load i32*, i32** %P_addr
    %i_16 = load i32, i32* %i_addr_0
    %getelementptr_reg_12 = getelementptr inbounds i32, i32* %P_4, i32 %i_16
    %load_result_12 = load i32, i32* %getelementptr_reg_12
    %mul_2 = mul i32 %k_4, %load_result_12
    %getelementptr_reg_13 = getelementptr inbounds i32, i32* %phi_3, i32 %mul_2
    %load_result_13 = load i32, i32* %getelementptr_reg_13
    %phi_4 = load i32*, i32** %phi_addr
    %k_5 = load i32, i32* %k_addr
    %getelementptr_reg_14 = getelementptr inbounds i32, i32* %phi_4, i32 %k_5
    %load_result_14 = load i32, i32* %getelementptr_reg_14
    %P_5 = load i32*, i32** %P_addr
    %i_17 = load i32, i32* %i_addr_0
    %getelementptr_reg_15 = getelementptr inbounds i32, i32* %P_5, i32 %i_17
    %load_result_15 = load i32, i32* %getelementptr_reg_15
    %sub_0 = sub i32 %load_result_15, 1
    %mul_3 = mul i32 %load_result_14, %sub_0
    store i32 %mul_3, i32* %getelementptr_reg_13
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %for_step0

return_block0:                                               ; preds = for_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    store i32 0, i32* @M
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
