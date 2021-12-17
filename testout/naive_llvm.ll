; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"


@const_string0 = private unnamed_addr constant [14 x i8] c"no solution!\0A\00", align 1

declare i1 @_str_ne(i8* %lhs,i8* %rhs)
declare i1 @_str_le(i8* %lhs,i8* %rhs)
declare i8* @_str_substring(i8* %str,i32 %left,i32 %right)
declare i8* @_str_concatenate(i8* %lhs,i8* %rhs)
declare i8* @getString()
declare i1 @_str_ge(i8* %lhs,i8* %rhs)
declare i1 @_str_lt(i8* %lhs,i8* %rhs)
declare i32 @getInt()
declare i32 @_str_length(i32* %str)
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
    call void @GLOBAL__sub_I_main.mx()
    %j_addr = alloca i32
    %i_addr = alloca i32
    %step_addr = alloca i32**
    %ylist_addr = alloca i32*
    %xlist_addr = alloca i32*
    %y_addr = alloca i32
    %x_addr = alloca i32
    %now_addr = alloca i32
    %ok_addr = alloca i32
    %tail_addr = alloca i32
    %targety_addr = alloca i32
    %targetx_addr = alloca i32
    %starty_addr = alloca i32
    %startx_addr = alloca i32
    %head_addr = alloca i32
    %N_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %N = load i32, i32* %N_addr
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* %N_addr
    %head = load i32, i32* %head_addr
    store i32 0, i32* %head_addr
    %tail = load i32, i32* %tail_addr
    store i32 0, i32* %tail_addr
    %startx = load i32, i32* %startx_addr
    store i32 0, i32* %startx_addr
    %starty = load i32, i32* %starty_addr
    store i32 0, i32* %starty_addr
    %targetx = load i32, i32* %targetx_addr
    %N_0 = load i32, i32* %N_addr
    %sub = sub i32 %N_0, 1
    store i32 %sub, i32* %targetx_addr
    %targety = load i32, i32* %targety_addr
    %N_1 = load i32, i32* %N_addr
    %sub_0 = sub i32 %N_1, 1
    store i32 %sub_0, i32* %targety_addr
    %x = load i32, i32* %x_addr
    store i32 0, i32* %x_addr
    %y = load i32, i32* %y_addr
    store i32 0, i32* %y_addr
    %now = load i32, i32* %now_addr
    store i32 0, i32* %now_addr
    %ok = load i32, i32* %ok_addr
    store i32 0, i32* %ok_addr
    %xlist = load i32*, i32** %xlist_addr
    %N_2 = load i32, i32* %N_addr
    %N_3 = load i32, i32* %N_addr
    %mul = mul i32 %N_2, %N_3
    %mul_bytes = mul i32 %mul, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 4, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %xlist_addr
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %N_4 = load i32, i32* %N_addr
    %N_5 = load i32, i32* %N_addr
    %mul_0 = mul i32 %N_4, %N_5
    %slt = icmp slt i32 %i_0, %mul_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %xlist_0 = load i32*, i32** %xlist_addr
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %xlist_0, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    store i32 0, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %ylist = load i32*, i32** %ylist_addr
    %N_6 = load i32, i32* %N_addr
    %N_7 = load i32, i32* %N_addr
    %mul_1 = mul i32 %N_6, %N_7
    %mul_bytes_0 = mul i32 %mul_1, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 4, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** %ylist_addr
    %i_3 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %i_4 = load i32, i32* %i_addr
    %N_8 = load i32, i32* %N_addr
    %N_9 = load i32, i32* %N_addr
    %mul_2 = mul i32 %N_8, %N_9
    %slt_0 = icmp slt i32 %i_4, %mul_2
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %i_6 = load i32, i32* %i_addr
    %add_0 = add i32 %i_6, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %ylist_0 = load i32*, i32** %ylist_addr
    %i_5 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %ylist_0, i32 %i_5
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 0, i32* %getelementptr_reg_0
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    %step = load i32**, i32*** %step_addr
    %N_10 = load i32, i32* %N_addr
    %mul_bytes_1 = mul i32 %N_10, 4
    %sum_bytes_1 = add i32 %mul_bytes_1, 4
    %malloca_1 = call i8* @_f_malloc(i32 %sum_bytes_1)
    %array_cast_i8_to_i32_1 = bitcast i8* %malloca_1 to i32*
    store i32 4, i32* %array_cast_i8_to_i32_1
    %array_tmp_begin_i32_1 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_1, i32 1
    %array_addr_1 = bitcast i32* %array_tmp_begin_i32_1 to i32*
    store i32* %array_addr_1, i32*** %step_addr
    %i_7 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition1

for_condition1:                                              ; preds = for_end_merge0 for_step1 
    %i_8 = load i32, i32* %i_addr
    %N_11 = load i32, i32* %N_addr
    %slt_1 = icmp slt i32 %i_8, %N_11
    br i1 %slt_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 for_end_merge2 
    %i_11 = load i32, i32* %i_addr
    %add_2 = add i32 %i_11, 1
    store i32 %add_2, i32* %i_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %step_0 = load i32**, i32*** %step_addr
    %i_9 = load i32, i32* %i_addr
    %getelementptr_reg_1 = getelementptr inbounds i32*, i32** %step_0, i32 %i_9
    %load_result_1 = load i32*, i32** %getelementptr_reg_1
    %N_12 = load i32, i32* %N_addr
    %mul_bytes_2 = mul i32 %N_12, 4
    %sum_bytes_2 = add i32 %mul_bytes_2, 4
    %malloca_2 = call i8* @_f_malloc(i32 %sum_bytes_2)
    %array_cast_i8_to_i32_2 = bitcast i8* %malloca_2 to i32*
    store i32 4, i32* %array_cast_i8_to_i32_2
    %array_tmp_begin_i32_2 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_2, i32 1
    %array_addr_2 = bitcast i32* %array_tmp_begin_i32_2 to i32*
    store i32* %array_addr_2, i32** %getelementptr_reg_1
    %j = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition2

for_end_merge1:                                              ; preds = for_condition1 
    %xlist_1 = load i32*, i32** %xlist_addr
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %xlist_1, i32 0
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %startx_0 = load i32, i32* %startx_addr
    store i32 %startx_0, i32* %getelementptr_reg_4
    %ylist_1 = load i32*, i32** %ylist_addr
    %getelementptr_reg_5 = getelementptr inbounds i32, i32* %ylist_1, i32 0
    %load_result_5 = load i32, i32* %getelementptr_reg_5
    %starty_0 = load i32, i32* %starty_addr
    store i32 %starty_0, i32* %getelementptr_reg_5
    %step_2 = load i32**, i32*** %step_addr
    %startx_1 = load i32, i32* %startx_addr
    %getelementptr_reg_6 = getelementptr inbounds i32*, i32** %step_2, i32 %startx_1
    %load_result_6 = load i32*, i32** %getelementptr_reg_6
    %starty_1 = load i32, i32* %starty_addr
    %getelementptr_reg_7 = getelementptr inbounds i32, i32* %load_result_6, i32 %starty_1
    %load_result_7 = load i32, i32* %getelementptr_reg_7
    store i32 0, i32* %getelementptr_reg_7
    br label %while_condition

for_condition2:                                              ; preds = for_body1 for_step2 
    %j_0 = load i32, i32* %j_addr
    %N_13 = load i32, i32* %N_addr
    %slt_2 = icmp slt i32 %j_0, %N_13
    br i1 %slt_2, label %for_body2, label %for_end_merge2

for_step2:                                                   ; preds = for_body2 
    %j_2 = load i32, i32* %j_addr
    %add_1 = add i32 %j_2, 1
    store i32 %add_1, i32* %j_addr
    br label %for_condition2

for_body2:                                                   ; preds = for_condition2 
    %step_1 = load i32**, i32*** %step_addr
    %i_10 = load i32, i32* %i_addr
    %getelementptr_reg_2 = getelementptr inbounds i32*, i32** %step_1, i32 %i_10
    %load_result_2 = load i32*, i32** %getelementptr_reg_2
    %j_1 = load i32, i32* %j_addr
    %getelementptr_reg_3 = getelementptr inbounds i32, i32* %load_result_2, i32 %j_1
    %load_result_3 = load i32, i32* %getelementptr_reg_3
    %SUB_single_front = mul i32 1, -1
    store i32 %SUB_single_front, i32* %getelementptr_reg_3
    br label %for_step2

for_end_merge2:                                              ; preds = for_condition2 
    br label %for_step1

while_condition:                                             ; preds = for_end_merge1 while_body if_withoutelse_end_basicblock15 
    %head_0 = load i32, i32* %head_addr
    %tail_0 = load i32, i32* %tail_addr
    %sle = icmp sle i32 %head_0, %tail_0
    br i1 %sle, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %now_0 = load i32, i32* %now_addr
    %step_3 = load i32**, i32*** %step_addr
    %xlist_2 = load i32*, i32** %xlist_addr
    %head_1 = load i32, i32* %head_addr
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %xlist_2, i32 %head_1
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    %getelementptr_reg_9 = getelementptr inbounds i32*, i32** %step_3, i32 %load_result_8
    %load_result_9 = load i32*, i32** %getelementptr_reg_9
    %ylist_2 = load i32*, i32** %ylist_addr
    %head_2 = load i32, i32* %head_addr
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %ylist_2, i32 %head_2
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    %getelementptr_reg_11 = getelementptr inbounds i32, i32* %load_result_9, i32 %load_result_10
    %load_result_11 = load i32, i32* %getelementptr_reg_11
    store i32 %load_result_11, i32* %now_addr
    %x_0 = load i32, i32* %x_addr
    %xlist_3 = load i32*, i32** %xlist_addr
    %head_3 = load i32, i32* %head_addr
    %getelementptr_reg_12 = getelementptr inbounds i32, i32* %xlist_3, i32 %head_3
    %load_result_12 = load i32, i32* %getelementptr_reg_12
    %sub_1 = sub i32 %load_result_12, 1
    store i32 %sub_1, i32* %x_addr
    %y_0 = load i32, i32* %y_addr
    %ylist_3 = load i32*, i32** %ylist_addr
    %head_4 = load i32, i32* %head_addr
    %getelementptr_reg_13 = getelementptr inbounds i32, i32* %ylist_3, i32 %head_4
    %load_result_13 = load i32, i32* %getelementptr_reg_13
    %sub_2 = sub i32 %load_result_13, 2
    store i32 %sub_2, i32* %y_addr
    %x_1 = load i32, i32* %x_addr
    %N_14 = load i32, i32* %N_addr
    %call_check = call i1 @check(i32 %x_1, i32 %N_14)
    %AND_addr = alloca i1
    store i1 %call_check, i1* %AND_addr
    br i1 %call_check, label %short_circuit_and_branch_AND, label %short_circuit_and_end_AND

while_end_merge:                                             ; preds = for_end_merge1 while_condition single_then_basicblock15 
    %ok_9 = load i32, i32* %ok_addr
    %eq_24 = icmp eq i32 %ok_9, 1
    br i1 %eq_24, label %then_basicblock, label %else_basicblock

short_circuit_and_end_AND:                                   ; preds = while_body short_circuit_and_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    %AND_addr = alloca i1
    store i1 %AND_short_circuit, i1* %AND_addr
    br i1 %AND_short_circuit, label %short_circuit_and_branch_AND0, label %short_circuit_and_end_AND0

short_circuit_and_branch_AND:                                ; preds = while_body 
    %y_1 = load i32, i32* %y_addr
    %N_15 = load i32, i32* %N_addr
    %call_check_0 = call i1 @check(i32 %y_1, i32 %N_15)
    store i1 %call_check_0, i1* %AND_addr
    br label %short_circuit_and_end_AND

short_circuit_and_end_AND0:                                  ; preds = short_circuit_and_end_AND short_circuit_and_branch_AND0 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_and_branch_AND0:                               ; preds = short_circuit_and_end_AND 
    %step_4 = load i32**, i32*** %step_addr
    %x_2 = load i32, i32* %x_addr
    %getelementptr_reg_14 = getelementptr inbounds i32*, i32** %step_4, i32 %x_2
    %load_result_14 = load i32*, i32** %getelementptr_reg_14
    %y_2 = load i32, i32* %y_addr
    %getelementptr_reg_15 = getelementptr inbounds i32, i32* %load_result_14, i32 %y_2
    %load_result_15 = load i32, i32* %getelementptr_reg_15
    %SUB_single_front_0 = mul i32 1, -1
    %eq = icmp eq i32 %load_result_15, %SUB_single_front_0
    store i1 %eq, i1* %AND_addr
    br label %short_circuit_and_end_AND0

single_then_basicblock:                                      ; preds = short_circuit_and_end_AND0 
    %tail_1 = load i32, i32* %tail_addr
    %tail_2 = load i32, i32* %tail_addr
    %add_3 = add i32 %tail_2, 1
    store i32 %add_3, i32* %tail_addr
    %xlist_4 = load i32*, i32** %xlist_addr
    %tail_3 = load i32, i32* %tail_addr
    %getelementptr_reg_16 = getelementptr inbounds i32, i32* %xlist_4, i32 %tail_3
    %load_result_16 = load i32, i32* %getelementptr_reg_16
    %x_3 = load i32, i32* %x_addr
    store i32 %x_3, i32* %getelementptr_reg_16
    %ylist_4 = load i32*, i32** %ylist_addr
    %tail_4 = load i32, i32* %tail_addr
    %getelementptr_reg_17 = getelementptr inbounds i32, i32* %ylist_4, i32 %tail_4
    %load_result_17 = load i32, i32* %getelementptr_reg_17
    %y_3 = load i32, i32* %y_addr
    store i32 %y_3, i32* %getelementptr_reg_17
    %step_5 = load i32**, i32*** %step_addr
    %x_4 = load i32, i32* %x_addr
    %getelementptr_reg_18 = getelementptr inbounds i32*, i32** %step_5, i32 %x_4
    %load_result_18 = load i32*, i32** %getelementptr_reg_18
    %y_4 = load i32, i32* %y_addr
    %getelementptr_reg_19 = getelementptr inbounds i32, i32* %load_result_18, i32 %y_4
    %load_result_19 = load i32, i32* %getelementptr_reg_19
    %now_1 = load i32, i32* %now_addr
    %add_4 = add i32 %now_1, 1
    store i32 %add_4, i32* %getelementptr_reg_19
    %x_5 = load i32, i32* %x_addr
    %targetx_0 = load i32, i32* %targetx_addr
    %eq_0 = icmp eq i32 %x_5, %targetx_0
    %AND_addr = alloca i1
    store i1 %eq_0, i1* %AND_addr
    br i1 %eq_0, label %short_circuit_and_branch_AND1, label %short_circuit_and_end_AND1

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock short_circuit_and_end_AND0 if_withoutelse_end_basicblock0 
    %x_6 = load i32, i32* %x_addr
    %xlist_5 = load i32*, i32** %xlist_addr
    %head_5 = load i32, i32* %head_addr
    %getelementptr_reg_20 = getelementptr inbounds i32, i32* %xlist_5, i32 %head_5
    %load_result_20 = load i32, i32* %getelementptr_reg_20
    %sub_3 = sub i32 %load_result_20, 1
    store i32 %sub_3, i32* %x_addr
    %y_6 = load i32, i32* %y_addr
    %ylist_5 = load i32*, i32** %ylist_addr
    %head_6 = load i32, i32* %head_addr
    %getelementptr_reg_21 = getelementptr inbounds i32, i32* %ylist_5, i32 %head_6
    %load_result_21 = load i32, i32* %getelementptr_reg_21
    %add_5 = add i32 %load_result_21, 2
    store i32 %add_5, i32* %y_addr
    %x_7 = load i32, i32* %x_addr
    %N_16 = load i32, i32* %N_addr
    %call_check_1 = call i1 @check(i32 %x_7, i32 %N_16)
    %AND_addr = alloca i1
    store i1 %call_check_1, i1* %AND_addr
    br i1 %call_check_1, label %short_circuit_and_branch_AND2, label %short_circuit_and_end_AND2

short_circuit_and_end_AND1:                                  ; preds = single_then_basicblock short_circuit_and_branch_AND1 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

short_circuit_and_branch_AND1:                               ; preds = single_then_basicblock 
    %y_5 = load i32, i32* %y_addr
    %targety_0 = load i32, i32* %targety_addr
    %eq_1 = icmp eq i32 %y_5, %targety_0
    store i1 %eq_1, i1* %AND_addr
    br label %short_circuit_and_end_AND1

single_then_basicblock0:                                     ; preds = short_circuit_and_end_AND1 
    %ok_0 = load i32, i32* %ok_addr
    store i32 1, i32* %ok_addr
    br label %if_withoutelse_end_basicblock0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 short_circuit_and_end_AND1 
    br label %if_withoutelse_end_basicblock

short_circuit_and_end_AND2:                                  ; preds = if_withoutelse_end_basicblock short_circuit_and_branch_AND2 
    %AND_short_circuit = load i1, i1* %AND_addr
    %AND_addr = alloca i1
    store i1 %AND_short_circuit, i1* %AND_addr
    br i1 %AND_short_circuit, label %short_circuit_and_branch_AND3, label %short_circuit_and_end_AND3

short_circuit_and_branch_AND2:                               ; preds = if_withoutelse_end_basicblock 
    %y_7 = load i32, i32* %y_addr
    %N_17 = load i32, i32* %N_addr
    %call_check_2 = call i1 @check(i32 %y_7, i32 %N_17)
    store i1 %call_check_2, i1* %AND_addr
    br label %short_circuit_and_end_AND2

short_circuit_and_end_AND3:                                  ; preds = short_circuit_and_end_AND2 short_circuit_and_branch_AND3 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock1, label %if_withoutelse_end_basicblock1

short_circuit_and_branch_AND3:                               ; preds = short_circuit_and_end_AND2 
    %step_6 = load i32**, i32*** %step_addr
    %x_8 = load i32, i32* %x_addr
    %getelementptr_reg_22 = getelementptr inbounds i32*, i32** %step_6, i32 %x_8
    %load_result_22 = load i32*, i32** %getelementptr_reg_22
    %y_8 = load i32, i32* %y_addr
    %getelementptr_reg_23 = getelementptr inbounds i32, i32* %load_result_22, i32 %y_8
    %load_result_23 = load i32, i32* %getelementptr_reg_23
    %SUB_single_front_1 = mul i32 1, -1
    %eq_2 = icmp eq i32 %load_result_23, %SUB_single_front_1
    store i1 %eq_2, i1* %AND_addr
    br label %short_circuit_and_end_AND3

single_then_basicblock1:                                     ; preds = short_circuit_and_end_AND3 
    %tail_5 = load i32, i32* %tail_addr
    %tail_6 = load i32, i32* %tail_addr
    %add_6 = add i32 %tail_6, 1
    store i32 %add_6, i32* %tail_addr
    %xlist_6 = load i32*, i32** %xlist_addr
    %tail_7 = load i32, i32* %tail_addr
    %getelementptr_reg_24 = getelementptr inbounds i32, i32* %xlist_6, i32 %tail_7
    %load_result_24 = load i32, i32* %getelementptr_reg_24
    %x_9 = load i32, i32* %x_addr
    store i32 %x_9, i32* %getelementptr_reg_24
    %ylist_6 = load i32*, i32** %ylist_addr
    %tail_8 = load i32, i32* %tail_addr
    %getelementptr_reg_25 = getelementptr inbounds i32, i32* %ylist_6, i32 %tail_8
    %load_result_25 = load i32, i32* %getelementptr_reg_25
    %y_9 = load i32, i32* %y_addr
    store i32 %y_9, i32* %getelementptr_reg_25
    %step_7 = load i32**, i32*** %step_addr
    %x_10 = load i32, i32* %x_addr
    %getelementptr_reg_26 = getelementptr inbounds i32*, i32** %step_7, i32 %x_10
    %load_result_26 = load i32*, i32** %getelementptr_reg_26
    %y_10 = load i32, i32* %y_addr
    %getelementptr_reg_27 = getelementptr inbounds i32, i32* %load_result_26, i32 %y_10
    %load_result_27 = load i32, i32* %getelementptr_reg_27
    %now_2 = load i32, i32* %now_addr
    %add_7 = add i32 %now_2, 1
    store i32 %add_7, i32* %getelementptr_reg_27
    %x_11 = load i32, i32* %x_addr
    %targetx_1 = load i32, i32* %targetx_addr
    %eq_3 = icmp eq i32 %x_11, %targetx_1
    %AND_addr = alloca i1
    store i1 %eq_3, i1* %AND_addr
    br i1 %eq_3, label %short_circuit_and_branch_AND4, label %short_circuit_and_end_AND4

if_withoutelse_end_basicblock1:                              ; preds = single_then_basicblock1 short_circuit_and_end_AND3 if_withoutelse_end_basicblock2 
    %x_12 = load i32, i32* %x_addr
    %xlist_7 = load i32*, i32** %xlist_addr
    %head_7 = load i32, i32* %head_addr
    %getelementptr_reg_28 = getelementptr inbounds i32, i32* %xlist_7, i32 %head_7
    %load_result_28 = load i32, i32* %getelementptr_reg_28
    %add_8 = add i32 %load_result_28, 1
    store i32 %add_8, i32* %x_addr
    %y_12 = load i32, i32* %y_addr
    %ylist_7 = load i32*, i32** %ylist_addr
    %head_8 = load i32, i32* %head_addr
    %getelementptr_reg_29 = getelementptr inbounds i32, i32* %ylist_7, i32 %head_8
    %load_result_29 = load i32, i32* %getelementptr_reg_29
    %sub_4 = sub i32 %load_result_29, 2
    store i32 %sub_4, i32* %y_addr
    %x_13 = load i32, i32* %x_addr
    %N_18 = load i32, i32* %N_addr
    %call_check_3 = call i1 @check(i32 %x_13, i32 %N_18)
    %AND_addr = alloca i1
    store i1 %call_check_3, i1* %AND_addr
    br i1 %call_check_3, label %short_circuit_and_branch_AND5, label %short_circuit_and_end_AND5

short_circuit_and_end_AND4:                                  ; preds = single_then_basicblock1 short_circuit_and_branch_AND4 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock2, label %if_withoutelse_end_basicblock2

short_circuit_and_branch_AND4:                               ; preds = single_then_basicblock1 
    %y_11 = load i32, i32* %y_addr
    %targety_1 = load i32, i32* %targety_addr
    %eq_4 = icmp eq i32 %y_11, %targety_1
    store i1 %eq_4, i1* %AND_addr
    br label %short_circuit_and_end_AND4

single_then_basicblock2:                                     ; preds = short_circuit_and_end_AND4 
    %ok_1 = load i32, i32* %ok_addr
    store i32 1, i32* %ok_addr
    br label %if_withoutelse_end_basicblock2

if_withoutelse_end_basicblock2:                              ; preds = single_then_basicblock2 short_circuit_and_end_AND4 
    br label %if_withoutelse_end_basicblock1

short_circuit_and_end_AND5:                                  ; preds = if_withoutelse_end_basicblock1 short_circuit_and_branch_AND5 
    %AND_short_circuit = load i1, i1* %AND_addr
    %AND_addr = alloca i1
    store i1 %AND_short_circuit, i1* %AND_addr
    br i1 %AND_short_circuit, label %short_circuit_and_branch_AND6, label %short_circuit_and_end_AND6

short_circuit_and_branch_AND5:                               ; preds = if_withoutelse_end_basicblock1 
    %y_13 = load i32, i32* %y_addr
    %N_19 = load i32, i32* %N_addr
    %call_check_4 = call i1 @check(i32 %y_13, i32 %N_19)
    store i1 %call_check_4, i1* %AND_addr
    br label %short_circuit_and_end_AND5

short_circuit_and_end_AND6:                                  ; preds = short_circuit_and_end_AND5 short_circuit_and_branch_AND6 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock3, label %if_withoutelse_end_basicblock3

short_circuit_and_branch_AND6:                               ; preds = short_circuit_and_end_AND5 
    %step_8 = load i32**, i32*** %step_addr
    %x_14 = load i32, i32* %x_addr
    %getelementptr_reg_30 = getelementptr inbounds i32*, i32** %step_8, i32 %x_14
    %load_result_30 = load i32*, i32** %getelementptr_reg_30
    %y_14 = load i32, i32* %y_addr
    %getelementptr_reg_31 = getelementptr inbounds i32, i32* %load_result_30, i32 %y_14
    %load_result_31 = load i32, i32* %getelementptr_reg_31
    %SUB_single_front_2 = mul i32 1, -1
    %eq_5 = icmp eq i32 %load_result_31, %SUB_single_front_2
    store i1 %eq_5, i1* %AND_addr
    br label %short_circuit_and_end_AND6

single_then_basicblock3:                                     ; preds = short_circuit_and_end_AND6 
    %tail_9 = load i32, i32* %tail_addr
    %tail_10 = load i32, i32* %tail_addr
    %add_9 = add i32 %tail_10, 1
    store i32 %add_9, i32* %tail_addr
    %xlist_8 = load i32*, i32** %xlist_addr
    %tail_11 = load i32, i32* %tail_addr
    %getelementptr_reg_32 = getelementptr inbounds i32, i32* %xlist_8, i32 %tail_11
    %load_result_32 = load i32, i32* %getelementptr_reg_32
    %x_15 = load i32, i32* %x_addr
    store i32 %x_15, i32* %getelementptr_reg_32
    %ylist_8 = load i32*, i32** %ylist_addr
    %tail_12 = load i32, i32* %tail_addr
    %getelementptr_reg_33 = getelementptr inbounds i32, i32* %ylist_8, i32 %tail_12
    %load_result_33 = load i32, i32* %getelementptr_reg_33
    %y_15 = load i32, i32* %y_addr
    store i32 %y_15, i32* %getelementptr_reg_33
    %step_9 = load i32**, i32*** %step_addr
    %x_16 = load i32, i32* %x_addr
    %getelementptr_reg_34 = getelementptr inbounds i32*, i32** %step_9, i32 %x_16
    %load_result_34 = load i32*, i32** %getelementptr_reg_34
    %y_16 = load i32, i32* %y_addr
    %getelementptr_reg_35 = getelementptr inbounds i32, i32* %load_result_34, i32 %y_16
    %load_result_35 = load i32, i32* %getelementptr_reg_35
    %now_3 = load i32, i32* %now_addr
    %add_10 = add i32 %now_3, 1
    store i32 %add_10, i32* %getelementptr_reg_35
    %x_17 = load i32, i32* %x_addr
    %targetx_2 = load i32, i32* %targetx_addr
    %eq_6 = icmp eq i32 %x_17, %targetx_2
    %AND_addr = alloca i1
    store i1 %eq_6, i1* %AND_addr
    br i1 %eq_6, label %short_circuit_and_branch_AND7, label %short_circuit_and_end_AND7

if_withoutelse_end_basicblock3:                              ; preds = single_then_basicblock3 short_circuit_and_end_AND6 if_withoutelse_end_basicblock4 
    %x_18 = load i32, i32* %x_addr
    %xlist_9 = load i32*, i32** %xlist_addr
    %head_9 = load i32, i32* %head_addr
    %getelementptr_reg_36 = getelementptr inbounds i32, i32* %xlist_9, i32 %head_9
    %load_result_36 = load i32, i32* %getelementptr_reg_36
    %add_11 = add i32 %load_result_36, 1
    store i32 %add_11, i32* %x_addr
    %y_18 = load i32, i32* %y_addr
    %ylist_9 = load i32*, i32** %ylist_addr
    %head_10 = load i32, i32* %head_addr
    %getelementptr_reg_37 = getelementptr inbounds i32, i32* %ylist_9, i32 %head_10
    %load_result_37 = load i32, i32* %getelementptr_reg_37
    %add_12 = add i32 %load_result_37, 2
    store i32 %add_12, i32* %y_addr
    %x_19 = load i32, i32* %x_addr
    %N_20 = load i32, i32* %N_addr
    %call_check_5 = call i1 @check(i32 %x_19, i32 %N_20)
    %AND_addr = alloca i1
    store i1 %call_check_5, i1* %AND_addr
    br i1 %call_check_5, label %short_circuit_and_branch_AND8, label %short_circuit_and_end_AND8

short_circuit_and_end_AND7:                                  ; preds = single_then_basicblock3 short_circuit_and_branch_AND7 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock4, label %if_withoutelse_end_basicblock4

short_circuit_and_branch_AND7:                               ; preds = single_then_basicblock3 
    %y_17 = load i32, i32* %y_addr
    %targety_2 = load i32, i32* %targety_addr
    %eq_7 = icmp eq i32 %y_17, %targety_2
    store i1 %eq_7, i1* %AND_addr
    br label %short_circuit_and_end_AND7

single_then_basicblock4:                                     ; preds = short_circuit_and_end_AND7 
    %ok_2 = load i32, i32* %ok_addr
    store i32 1, i32* %ok_addr
    br label %if_withoutelse_end_basicblock4

if_withoutelse_end_basicblock4:                              ; preds = single_then_basicblock4 short_circuit_and_end_AND7 
    br label %if_withoutelse_end_basicblock3

short_circuit_and_end_AND8:                                  ; preds = if_withoutelse_end_basicblock3 short_circuit_and_branch_AND8 
    %AND_short_circuit = load i1, i1* %AND_addr
    %AND_addr = alloca i1
    store i1 %AND_short_circuit, i1* %AND_addr
    br i1 %AND_short_circuit, label %short_circuit_and_branch_AND9, label %short_circuit_and_end_AND9

short_circuit_and_branch_AND8:                               ; preds = if_withoutelse_end_basicblock3 
    %y_19 = load i32, i32* %y_addr
    %N_21 = load i32, i32* %N_addr
    %call_check_6 = call i1 @check(i32 %y_19, i32 %N_21)
    store i1 %call_check_6, i1* %AND_addr
    br label %short_circuit_and_end_AND8

short_circuit_and_end_AND9:                                  ; preds = short_circuit_and_end_AND8 short_circuit_and_branch_AND9 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock5, label %if_withoutelse_end_basicblock5

short_circuit_and_branch_AND9:                               ; preds = short_circuit_and_end_AND8 
    %step_10 = load i32**, i32*** %step_addr
    %x_20 = load i32, i32* %x_addr
    %getelementptr_reg_38 = getelementptr inbounds i32*, i32** %step_10, i32 %x_20
    %load_result_38 = load i32*, i32** %getelementptr_reg_38
    %y_20 = load i32, i32* %y_addr
    %getelementptr_reg_39 = getelementptr inbounds i32, i32* %load_result_38, i32 %y_20
    %load_result_39 = load i32, i32* %getelementptr_reg_39
    %SUB_single_front_3 = mul i32 1, -1
    %eq_8 = icmp eq i32 %load_result_39, %SUB_single_front_3
    store i1 %eq_8, i1* %AND_addr
    br label %short_circuit_and_end_AND9

single_then_basicblock5:                                     ; preds = short_circuit_and_end_AND9 
    %tail_13 = load i32, i32* %tail_addr
    %tail_14 = load i32, i32* %tail_addr
    %add_13 = add i32 %tail_14, 1
    store i32 %add_13, i32* %tail_addr
    %xlist_10 = load i32*, i32** %xlist_addr
    %tail_15 = load i32, i32* %tail_addr
    %getelementptr_reg_40 = getelementptr inbounds i32, i32* %xlist_10, i32 %tail_15
    %load_result_40 = load i32, i32* %getelementptr_reg_40
    %x_21 = load i32, i32* %x_addr
    store i32 %x_21, i32* %getelementptr_reg_40
    %ylist_10 = load i32*, i32** %ylist_addr
    %tail_16 = load i32, i32* %tail_addr
    %getelementptr_reg_41 = getelementptr inbounds i32, i32* %ylist_10, i32 %tail_16
    %load_result_41 = load i32, i32* %getelementptr_reg_41
    %y_21 = load i32, i32* %y_addr
    store i32 %y_21, i32* %getelementptr_reg_41
    %step_11 = load i32**, i32*** %step_addr
    %x_22 = load i32, i32* %x_addr
    %getelementptr_reg_42 = getelementptr inbounds i32*, i32** %step_11, i32 %x_22
    %load_result_42 = load i32*, i32** %getelementptr_reg_42
    %y_22 = load i32, i32* %y_addr
    %getelementptr_reg_43 = getelementptr inbounds i32, i32* %load_result_42, i32 %y_22
    %load_result_43 = load i32, i32* %getelementptr_reg_43
    %now_4 = load i32, i32* %now_addr
    %add_14 = add i32 %now_4, 1
    store i32 %add_14, i32* %getelementptr_reg_43
    %x_23 = load i32, i32* %x_addr
    %targetx_3 = load i32, i32* %targetx_addr
    %eq_9 = icmp eq i32 %x_23, %targetx_3
    %AND_addr = alloca i1
    store i1 %eq_9, i1* %AND_addr
    br i1 %eq_9, label %short_circuit_and_branch_AND10, label %short_circuit_and_end_AND10

if_withoutelse_end_basicblock5:                              ; preds = single_then_basicblock5 short_circuit_and_end_AND9 if_withoutelse_end_basicblock6 
    %x_24 = load i32, i32* %x_addr
    %xlist_11 = load i32*, i32** %xlist_addr
    %head_11 = load i32, i32* %head_addr
    %getelementptr_reg_44 = getelementptr inbounds i32, i32* %xlist_11, i32 %head_11
    %load_result_44 = load i32, i32* %getelementptr_reg_44
    %sub_5 = sub i32 %load_result_44, 2
    store i32 %sub_5, i32* %x_addr
    %y_24 = load i32, i32* %y_addr
    %ylist_11 = load i32*, i32** %ylist_addr
    %head_12 = load i32, i32* %head_addr
    %getelementptr_reg_45 = getelementptr inbounds i32, i32* %ylist_11, i32 %head_12
    %load_result_45 = load i32, i32* %getelementptr_reg_45
    %sub_6 = sub i32 %load_result_45, 1
    store i32 %sub_6, i32* %y_addr
    %x_25 = load i32, i32* %x_addr
    %N_22 = load i32, i32* %N_addr
    %call_check_7 = call i1 @check(i32 %x_25, i32 %N_22)
    %AND_addr = alloca i1
    store i1 %call_check_7, i1* %AND_addr
    br i1 %call_check_7, label %short_circuit_and_branch_AND11, label %short_circuit_and_end_AND11

short_circuit_and_end_AND10:                                 ; preds = single_then_basicblock5 short_circuit_and_branch_AND10 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock6, label %if_withoutelse_end_basicblock6

short_circuit_and_branch_AND10:                              ; preds = single_then_basicblock5 
    %y_23 = load i32, i32* %y_addr
    %targety_3 = load i32, i32* %targety_addr
    %eq_10 = icmp eq i32 %y_23, %targety_3
    store i1 %eq_10, i1* %AND_addr
    br label %short_circuit_and_end_AND10

single_then_basicblock6:                                     ; preds = short_circuit_and_end_AND10 
    %ok_3 = load i32, i32* %ok_addr
    store i32 1, i32* %ok_addr
    br label %if_withoutelse_end_basicblock6

if_withoutelse_end_basicblock6:                              ; preds = single_then_basicblock6 short_circuit_and_end_AND10 
    br label %if_withoutelse_end_basicblock5

short_circuit_and_end_AND11:                                 ; preds = if_withoutelse_end_basicblock5 short_circuit_and_branch_AND11 
    %AND_short_circuit = load i1, i1* %AND_addr
    %AND_addr = alloca i1
    store i1 %AND_short_circuit, i1* %AND_addr
    br i1 %AND_short_circuit, label %short_circuit_and_branch_AND12, label %short_circuit_and_end_AND12

short_circuit_and_branch_AND11:                              ; preds = if_withoutelse_end_basicblock5 
    %y_25 = load i32, i32* %y_addr
    %N_23 = load i32, i32* %N_addr
    %call_check_8 = call i1 @check(i32 %y_25, i32 %N_23)
    store i1 %call_check_8, i1* %AND_addr
    br label %short_circuit_and_end_AND11

short_circuit_and_end_AND12:                                 ; preds = short_circuit_and_end_AND11 short_circuit_and_branch_AND12 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock7, label %if_withoutelse_end_basicblock7

short_circuit_and_branch_AND12:                              ; preds = short_circuit_and_end_AND11 
    %step_12 = load i32**, i32*** %step_addr
    %x_26 = load i32, i32* %x_addr
    %getelementptr_reg_46 = getelementptr inbounds i32*, i32** %step_12, i32 %x_26
    %load_result_46 = load i32*, i32** %getelementptr_reg_46
    %y_26 = load i32, i32* %y_addr
    %getelementptr_reg_47 = getelementptr inbounds i32, i32* %load_result_46, i32 %y_26
    %load_result_47 = load i32, i32* %getelementptr_reg_47
    %SUB_single_front_4 = mul i32 1, -1
    %eq_11 = icmp eq i32 %load_result_47, %SUB_single_front_4
    store i1 %eq_11, i1* %AND_addr
    br label %short_circuit_and_end_AND12

single_then_basicblock7:                                     ; preds = short_circuit_and_end_AND12 
    %tail_17 = load i32, i32* %tail_addr
    %tail_18 = load i32, i32* %tail_addr
    %add_15 = add i32 %tail_18, 1
    store i32 %add_15, i32* %tail_addr
    %xlist_12 = load i32*, i32** %xlist_addr
    %tail_19 = load i32, i32* %tail_addr
    %getelementptr_reg_48 = getelementptr inbounds i32, i32* %xlist_12, i32 %tail_19
    %load_result_48 = load i32, i32* %getelementptr_reg_48
    %x_27 = load i32, i32* %x_addr
    store i32 %x_27, i32* %getelementptr_reg_48
    %ylist_12 = load i32*, i32** %ylist_addr
    %tail_20 = load i32, i32* %tail_addr
    %getelementptr_reg_49 = getelementptr inbounds i32, i32* %ylist_12, i32 %tail_20
    %load_result_49 = load i32, i32* %getelementptr_reg_49
    %y_27 = load i32, i32* %y_addr
    store i32 %y_27, i32* %getelementptr_reg_49
    %step_13 = load i32**, i32*** %step_addr
    %x_28 = load i32, i32* %x_addr
    %getelementptr_reg_50 = getelementptr inbounds i32*, i32** %step_13, i32 %x_28
    %load_result_50 = load i32*, i32** %getelementptr_reg_50
    %y_28 = load i32, i32* %y_addr
    %getelementptr_reg_51 = getelementptr inbounds i32, i32* %load_result_50, i32 %y_28
    %load_result_51 = load i32, i32* %getelementptr_reg_51
    %now_5 = load i32, i32* %now_addr
    %add_16 = add i32 %now_5, 1
    store i32 %add_16, i32* %getelementptr_reg_51
    %x_29 = load i32, i32* %x_addr
    %targetx_4 = load i32, i32* %targetx_addr
    %eq_12 = icmp eq i32 %x_29, %targetx_4
    %AND_addr = alloca i1
    store i1 %eq_12, i1* %AND_addr
    br i1 %eq_12, label %short_circuit_and_branch_AND13, label %short_circuit_and_end_AND13

if_withoutelse_end_basicblock7:                              ; preds = single_then_basicblock7 short_circuit_and_end_AND12 if_withoutelse_end_basicblock8 
    %x_30 = load i32, i32* %x_addr
    %xlist_13 = load i32*, i32** %xlist_addr
    %head_13 = load i32, i32* %head_addr
    %getelementptr_reg_52 = getelementptr inbounds i32, i32* %xlist_13, i32 %head_13
    %load_result_52 = load i32, i32* %getelementptr_reg_52
    %sub_7 = sub i32 %load_result_52, 2
    store i32 %sub_7, i32* %x_addr
    %y_30 = load i32, i32* %y_addr
    %ylist_13 = load i32*, i32** %ylist_addr
    %head_14 = load i32, i32* %head_addr
    %getelementptr_reg_53 = getelementptr inbounds i32, i32* %ylist_13, i32 %head_14
    %load_result_53 = load i32, i32* %getelementptr_reg_53
    %add_17 = add i32 %load_result_53, 1
    store i32 %add_17, i32* %y_addr
    %x_31 = load i32, i32* %x_addr
    %N_24 = load i32, i32* %N_addr
    %call_check_9 = call i1 @check(i32 %x_31, i32 %N_24)
    %AND_addr = alloca i1
    store i1 %call_check_9, i1* %AND_addr
    br i1 %call_check_9, label %short_circuit_and_branch_AND14, label %short_circuit_and_end_AND14

short_circuit_and_end_AND13:                                 ; preds = single_then_basicblock7 short_circuit_and_branch_AND13 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock8, label %if_withoutelse_end_basicblock8

short_circuit_and_branch_AND13:                              ; preds = single_then_basicblock7 
    %y_29 = load i32, i32* %y_addr
    %targety_4 = load i32, i32* %targety_addr
    %eq_13 = icmp eq i32 %y_29, %targety_4
    store i1 %eq_13, i1* %AND_addr
    br label %short_circuit_and_end_AND13

single_then_basicblock8:                                     ; preds = short_circuit_and_end_AND13 
    %ok_4 = load i32, i32* %ok_addr
    store i32 1, i32* %ok_addr
    br label %if_withoutelse_end_basicblock8

if_withoutelse_end_basicblock8:                              ; preds = single_then_basicblock8 short_circuit_and_end_AND13 
    br label %if_withoutelse_end_basicblock7

short_circuit_and_end_AND14:                                 ; preds = if_withoutelse_end_basicblock7 short_circuit_and_branch_AND14 
    %AND_short_circuit = load i1, i1* %AND_addr
    %AND_addr = alloca i1
    store i1 %AND_short_circuit, i1* %AND_addr
    br i1 %AND_short_circuit, label %short_circuit_and_branch_AND15, label %short_circuit_and_end_AND15

short_circuit_and_branch_AND14:                              ; preds = if_withoutelse_end_basicblock7 
    %y_31 = load i32, i32* %y_addr
    %N_25 = load i32, i32* %N_addr
    %call_check_10 = call i1 @check(i32 %y_31, i32 %N_25)
    store i1 %call_check_10, i1* %AND_addr
    br label %short_circuit_and_end_AND14

short_circuit_and_end_AND15:                                 ; preds = short_circuit_and_end_AND14 short_circuit_and_branch_AND15 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock9, label %if_withoutelse_end_basicblock9

short_circuit_and_branch_AND15:                              ; preds = short_circuit_and_end_AND14 
    %step_14 = load i32**, i32*** %step_addr
    %x_32 = load i32, i32* %x_addr
    %getelementptr_reg_54 = getelementptr inbounds i32*, i32** %step_14, i32 %x_32
    %load_result_54 = load i32*, i32** %getelementptr_reg_54
    %y_32 = load i32, i32* %y_addr
    %getelementptr_reg_55 = getelementptr inbounds i32, i32* %load_result_54, i32 %y_32
    %load_result_55 = load i32, i32* %getelementptr_reg_55
    %SUB_single_front_5 = mul i32 1, -1
    %eq_14 = icmp eq i32 %load_result_55, %SUB_single_front_5
    store i1 %eq_14, i1* %AND_addr
    br label %short_circuit_and_end_AND15

single_then_basicblock9:                                     ; preds = short_circuit_and_end_AND15 
    %tail_21 = load i32, i32* %tail_addr
    %tail_22 = load i32, i32* %tail_addr
    %add_18 = add i32 %tail_22, 1
    store i32 %add_18, i32* %tail_addr
    %xlist_14 = load i32*, i32** %xlist_addr
    %tail_23 = load i32, i32* %tail_addr
    %getelementptr_reg_56 = getelementptr inbounds i32, i32* %xlist_14, i32 %tail_23
    %load_result_56 = load i32, i32* %getelementptr_reg_56
    %x_33 = load i32, i32* %x_addr
    store i32 %x_33, i32* %getelementptr_reg_56
    %ylist_14 = load i32*, i32** %ylist_addr
    %tail_24 = load i32, i32* %tail_addr
    %getelementptr_reg_57 = getelementptr inbounds i32, i32* %ylist_14, i32 %tail_24
    %load_result_57 = load i32, i32* %getelementptr_reg_57
    %y_33 = load i32, i32* %y_addr
    store i32 %y_33, i32* %getelementptr_reg_57
    %step_15 = load i32**, i32*** %step_addr
    %x_34 = load i32, i32* %x_addr
    %getelementptr_reg_58 = getelementptr inbounds i32*, i32** %step_15, i32 %x_34
    %load_result_58 = load i32*, i32** %getelementptr_reg_58
    %y_34 = load i32, i32* %y_addr
    %getelementptr_reg_59 = getelementptr inbounds i32, i32* %load_result_58, i32 %y_34
    %load_result_59 = load i32, i32* %getelementptr_reg_59
    %now_6 = load i32, i32* %now_addr
    %add_19 = add i32 %now_6, 1
    store i32 %add_19, i32* %getelementptr_reg_59
    %x_35 = load i32, i32* %x_addr
    %targetx_5 = load i32, i32* %targetx_addr
    %eq_15 = icmp eq i32 %x_35, %targetx_5
    %AND_addr = alloca i1
    store i1 %eq_15, i1* %AND_addr
    br i1 %eq_15, label %short_circuit_and_branch_AND16, label %short_circuit_and_end_AND16

if_withoutelse_end_basicblock9:                              ; preds = single_then_basicblock9 short_circuit_and_end_AND15 if_withoutelse_end_basicblock10 
    %x_36 = load i32, i32* %x_addr
    %xlist_15 = load i32*, i32** %xlist_addr
    %head_15 = load i32, i32* %head_addr
    %getelementptr_reg_60 = getelementptr inbounds i32, i32* %xlist_15, i32 %head_15
    %load_result_60 = load i32, i32* %getelementptr_reg_60
    %add_20 = add i32 %load_result_60, 2
    store i32 %add_20, i32* %x_addr
    %y_36 = load i32, i32* %y_addr
    %ylist_15 = load i32*, i32** %ylist_addr
    %head_16 = load i32, i32* %head_addr
    %getelementptr_reg_61 = getelementptr inbounds i32, i32* %ylist_15, i32 %head_16
    %load_result_61 = load i32, i32* %getelementptr_reg_61
    %sub_8 = sub i32 %load_result_61, 1
    store i32 %sub_8, i32* %y_addr
    %x_37 = load i32, i32* %x_addr
    %N_26 = load i32, i32* %N_addr
    %call_check_11 = call i1 @check(i32 %x_37, i32 %N_26)
    %AND_addr = alloca i1
    store i1 %call_check_11, i1* %AND_addr
    br i1 %call_check_11, label %short_circuit_and_branch_AND17, label %short_circuit_and_end_AND17

short_circuit_and_end_AND16:                                 ; preds = single_then_basicblock9 short_circuit_and_branch_AND16 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock10, label %if_withoutelse_end_basicblock10

short_circuit_and_branch_AND16:                              ; preds = single_then_basicblock9 
    %y_35 = load i32, i32* %y_addr
    %targety_5 = load i32, i32* %targety_addr
    %eq_16 = icmp eq i32 %y_35, %targety_5
    store i1 %eq_16, i1* %AND_addr
    br label %short_circuit_and_end_AND16

single_then_basicblock10:                                    ; preds = short_circuit_and_end_AND16 
    %ok_5 = load i32, i32* %ok_addr
    store i32 1, i32* %ok_addr
    br label %if_withoutelse_end_basicblock10

if_withoutelse_end_basicblock10:                             ; preds = single_then_basicblock10 short_circuit_and_end_AND16 
    br label %if_withoutelse_end_basicblock9

short_circuit_and_end_AND17:                                 ; preds = if_withoutelse_end_basicblock9 short_circuit_and_branch_AND17 
    %AND_short_circuit = load i1, i1* %AND_addr
    %AND_addr = alloca i1
    store i1 %AND_short_circuit, i1* %AND_addr
    br i1 %AND_short_circuit, label %short_circuit_and_branch_AND18, label %short_circuit_and_end_AND18

short_circuit_and_branch_AND17:                              ; preds = if_withoutelse_end_basicblock9 
    %y_37 = load i32, i32* %y_addr
    %N_27 = load i32, i32* %N_addr
    %call_check_12 = call i1 @check(i32 %y_37, i32 %N_27)
    store i1 %call_check_12, i1* %AND_addr
    br label %short_circuit_and_end_AND17

short_circuit_and_end_AND18:                                 ; preds = short_circuit_and_end_AND17 short_circuit_and_branch_AND18 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock11, label %if_withoutelse_end_basicblock11

short_circuit_and_branch_AND18:                              ; preds = short_circuit_and_end_AND17 
    %step_16 = load i32**, i32*** %step_addr
    %x_38 = load i32, i32* %x_addr
    %getelementptr_reg_62 = getelementptr inbounds i32*, i32** %step_16, i32 %x_38
    %load_result_62 = load i32*, i32** %getelementptr_reg_62
    %y_38 = load i32, i32* %y_addr
    %getelementptr_reg_63 = getelementptr inbounds i32, i32* %load_result_62, i32 %y_38
    %load_result_63 = load i32, i32* %getelementptr_reg_63
    %SUB_single_front_6 = mul i32 1, -1
    %eq_17 = icmp eq i32 %load_result_63, %SUB_single_front_6
    store i1 %eq_17, i1* %AND_addr
    br label %short_circuit_and_end_AND18

single_then_basicblock11:                                    ; preds = short_circuit_and_end_AND18 
    %tail_25 = load i32, i32* %tail_addr
    %tail_26 = load i32, i32* %tail_addr
    %add_21 = add i32 %tail_26, 1
    store i32 %add_21, i32* %tail_addr
    %xlist_16 = load i32*, i32** %xlist_addr
    %tail_27 = load i32, i32* %tail_addr
    %getelementptr_reg_64 = getelementptr inbounds i32, i32* %xlist_16, i32 %tail_27
    %load_result_64 = load i32, i32* %getelementptr_reg_64
    %x_39 = load i32, i32* %x_addr
    store i32 %x_39, i32* %getelementptr_reg_64
    %ylist_16 = load i32*, i32** %ylist_addr
    %tail_28 = load i32, i32* %tail_addr
    %getelementptr_reg_65 = getelementptr inbounds i32, i32* %ylist_16, i32 %tail_28
    %load_result_65 = load i32, i32* %getelementptr_reg_65
    %y_39 = load i32, i32* %y_addr
    store i32 %y_39, i32* %getelementptr_reg_65
    %step_17 = load i32**, i32*** %step_addr
    %x_40 = load i32, i32* %x_addr
    %getelementptr_reg_66 = getelementptr inbounds i32*, i32** %step_17, i32 %x_40
    %load_result_66 = load i32*, i32** %getelementptr_reg_66
    %y_40 = load i32, i32* %y_addr
    %getelementptr_reg_67 = getelementptr inbounds i32, i32* %load_result_66, i32 %y_40
    %load_result_67 = load i32, i32* %getelementptr_reg_67
    %now_7 = load i32, i32* %now_addr
    %add_22 = add i32 %now_7, 1
    store i32 %add_22, i32* %getelementptr_reg_67
    %x_41 = load i32, i32* %x_addr
    %targetx_6 = load i32, i32* %targetx_addr
    %eq_18 = icmp eq i32 %x_41, %targetx_6
    %AND_addr = alloca i1
    store i1 %eq_18, i1* %AND_addr
    br i1 %eq_18, label %short_circuit_and_branch_AND19, label %short_circuit_and_end_AND19

if_withoutelse_end_basicblock11:                             ; preds = single_then_basicblock11 short_circuit_and_end_AND18 if_withoutelse_end_basicblock12 
    %x_42 = load i32, i32* %x_addr
    %xlist_17 = load i32*, i32** %xlist_addr
    %head_17 = load i32, i32* %head_addr
    %getelementptr_reg_68 = getelementptr inbounds i32, i32* %xlist_17, i32 %head_17
    %load_result_68 = load i32, i32* %getelementptr_reg_68
    %add_23 = add i32 %load_result_68, 2
    store i32 %add_23, i32* %x_addr
    %y_42 = load i32, i32* %y_addr
    %ylist_17 = load i32*, i32** %ylist_addr
    %head_18 = load i32, i32* %head_addr
    %getelementptr_reg_69 = getelementptr inbounds i32, i32* %ylist_17, i32 %head_18
    %load_result_69 = load i32, i32* %getelementptr_reg_69
    %add_24 = add i32 %load_result_69, 1
    store i32 %add_24, i32* %y_addr
    %x_43 = load i32, i32* %x_addr
    %N_28 = load i32, i32* %N_addr
    %call_check_13 = call i1 @check(i32 %x_43, i32 %N_28)
    %AND_addr = alloca i1
    store i1 %call_check_13, i1* %AND_addr
    br i1 %call_check_13, label %short_circuit_and_branch_AND20, label %short_circuit_and_end_AND20

short_circuit_and_end_AND19:                                 ; preds = single_then_basicblock11 short_circuit_and_branch_AND19 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock12, label %if_withoutelse_end_basicblock12

short_circuit_and_branch_AND19:                              ; preds = single_then_basicblock11 
    %y_41 = load i32, i32* %y_addr
    %targety_6 = load i32, i32* %targety_addr
    %eq_19 = icmp eq i32 %y_41, %targety_6
    store i1 %eq_19, i1* %AND_addr
    br label %short_circuit_and_end_AND19

single_then_basicblock12:                                    ; preds = short_circuit_and_end_AND19 
    %ok_6 = load i32, i32* %ok_addr
    store i32 1, i32* %ok_addr
    br label %if_withoutelse_end_basicblock12

if_withoutelse_end_basicblock12:                             ; preds = single_then_basicblock12 short_circuit_and_end_AND19 
    br label %if_withoutelse_end_basicblock11

short_circuit_and_end_AND20:                                 ; preds = if_withoutelse_end_basicblock11 short_circuit_and_branch_AND20 
    %AND_short_circuit = load i1, i1* %AND_addr
    %AND_addr = alloca i1
    store i1 %AND_short_circuit, i1* %AND_addr
    br i1 %AND_short_circuit, label %short_circuit_and_branch_AND21, label %short_circuit_and_end_AND21

short_circuit_and_branch_AND20:                              ; preds = if_withoutelse_end_basicblock11 
    %y_43 = load i32, i32* %y_addr
    %N_29 = load i32, i32* %N_addr
    %call_check_14 = call i1 @check(i32 %y_43, i32 %N_29)
    store i1 %call_check_14, i1* %AND_addr
    br label %short_circuit_and_end_AND20

short_circuit_and_end_AND21:                                 ; preds = short_circuit_and_end_AND20 short_circuit_and_branch_AND21 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock13, label %if_withoutelse_end_basicblock13

short_circuit_and_branch_AND21:                              ; preds = short_circuit_and_end_AND20 
    %step_18 = load i32**, i32*** %step_addr
    %x_44 = load i32, i32* %x_addr
    %getelementptr_reg_70 = getelementptr inbounds i32*, i32** %step_18, i32 %x_44
    %load_result_70 = load i32*, i32** %getelementptr_reg_70
    %y_44 = load i32, i32* %y_addr
    %getelementptr_reg_71 = getelementptr inbounds i32, i32* %load_result_70, i32 %y_44
    %load_result_71 = load i32, i32* %getelementptr_reg_71
    %SUB_single_front_7 = mul i32 1, -1
    %eq_20 = icmp eq i32 %load_result_71, %SUB_single_front_7
    store i1 %eq_20, i1* %AND_addr
    br label %short_circuit_and_end_AND21

single_then_basicblock13:                                    ; preds = short_circuit_and_end_AND21 
    %tail_29 = load i32, i32* %tail_addr
    %tail_30 = load i32, i32* %tail_addr
    %add_25 = add i32 %tail_30, 1
    store i32 %add_25, i32* %tail_addr
    %xlist_18 = load i32*, i32** %xlist_addr
    %tail_31 = load i32, i32* %tail_addr
    %getelementptr_reg_72 = getelementptr inbounds i32, i32* %xlist_18, i32 %tail_31
    %load_result_72 = load i32, i32* %getelementptr_reg_72
    %x_45 = load i32, i32* %x_addr
    store i32 %x_45, i32* %getelementptr_reg_72
    %ylist_18 = load i32*, i32** %ylist_addr
    %tail_32 = load i32, i32* %tail_addr
    %getelementptr_reg_73 = getelementptr inbounds i32, i32* %ylist_18, i32 %tail_32
    %load_result_73 = load i32, i32* %getelementptr_reg_73
    %y_45 = load i32, i32* %y_addr
    store i32 %y_45, i32* %getelementptr_reg_73
    %step_19 = load i32**, i32*** %step_addr
    %x_46 = load i32, i32* %x_addr
    %getelementptr_reg_74 = getelementptr inbounds i32*, i32** %step_19, i32 %x_46
    %load_result_74 = load i32*, i32** %getelementptr_reg_74
    %y_46 = load i32, i32* %y_addr
    %getelementptr_reg_75 = getelementptr inbounds i32, i32* %load_result_74, i32 %y_46
    %load_result_75 = load i32, i32* %getelementptr_reg_75
    %now_8 = load i32, i32* %now_addr
    %add_26 = add i32 %now_8, 1
    store i32 %add_26, i32* %getelementptr_reg_75
    %x_47 = load i32, i32* %x_addr
    %targetx_7 = load i32, i32* %targetx_addr
    %eq_21 = icmp eq i32 %x_47, %targetx_7
    %AND_addr = alloca i1
    store i1 %eq_21, i1* %AND_addr
    br i1 %eq_21, label %short_circuit_and_branch_AND22, label %short_circuit_and_end_AND22

if_withoutelse_end_basicblock13:                             ; preds = single_then_basicblock13 short_circuit_and_end_AND21 if_withoutelse_end_basicblock14 
    %ok_8 = load i32, i32* %ok_addr
    %eq_23 = icmp eq i32 %ok_8, 1
    br i1 %eq_23, label %single_then_basicblock15, label %if_withoutelse_end_basicblock15

short_circuit_and_end_AND22:                                 ; preds = single_then_basicblock13 short_circuit_and_branch_AND22 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock14, label %if_withoutelse_end_basicblock14

short_circuit_and_branch_AND22:                              ; preds = single_then_basicblock13 
    %y_47 = load i32, i32* %y_addr
    %targety_7 = load i32, i32* %targety_addr
    %eq_22 = icmp eq i32 %y_47, %targety_7
    store i1 %eq_22, i1* %AND_addr
    br label %short_circuit_and_end_AND22

single_then_basicblock14:                                    ; preds = short_circuit_and_end_AND22 
    %ok_7 = load i32, i32* %ok_addr
    store i32 1, i32* %ok_addr
    br label %if_withoutelse_end_basicblock14

if_withoutelse_end_basicblock14:                             ; preds = single_then_basicblock14 short_circuit_and_end_AND22 
    br label %if_withoutelse_end_basicblock13

single_then_basicblock15:                                    ; preds = if_withoutelse_end_basicblock13 
    br label %while_end_merge

if_withoutelse_end_basicblock15:                             ; preds = single_then_basicblock15 if_withoutelse_end_basicblock13 
    %head_19 = load i32, i32* %head_addr
    %head_20 = load i32, i32* %head_addr
    %add_27 = add i32 %head_20, 1
    store i32 %add_27, i32* %head_addr
    br label %while_condition

then_basicblock:                                             ; preds = while_end_merge 
    %step_20 = load i32**, i32*** %step_addr
    %targetx_8 = load i32, i32* %targetx_addr
    %getelementptr_reg_76 = getelementptr inbounds i32*, i32** %step_20, i32 %targetx_8
    %load_result_76 = load i32*, i32** %getelementptr_reg_76
    %targety_8 = load i32, i32* %targety_addr
    %getelementptr_reg_77 = getelementptr inbounds i32, i32* %load_result_76, i32 %targety_8
    %load_result_77 = load i32, i32* %getelementptr_reg_77
    %call_toString = call i8* @toString(i32 %load_result_77)
    call void @println(i8* %call_toString)
    br label %if_end_basicblock

else_basicblock:                                             ; preds = while_end_merge 
    %const_string_pointer = getelementptr inbounds [14 x i8], [14 x i8]* @const_string0, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = if_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i1 @check(i32 %a_para,i32 %N_para) {
entrance_block0:                                             
    %N_addr = alloca i32
    %a_addr = alloca i32
    %return_register_infunction_addr = alloca i1
    store i32 %a_para, i32* %a_addr
    store i32 %N_para, i32* %N_addr
    %a = load i32, i32* %a_addr
    %N = load i32, i32* %N_addr
    %slt = icmp slt i32 %a, %N
    %AND_addr = alloca i1
    store i1 %slt, i1* %AND_addr
    br i1 %slt, label %short_circuit_and_branch_AND, label %short_circuit_and_end_AND

short_circuit_and_end_AND:                                   ; preds = entrance_block0 short_circuit_and_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    store i1 %AND_short_circuit, i1* %return_register_infunction_addr
    br label %return_block0

short_circuit_and_branch_AND:                                ; preds = entrance_block0 
    %a_0 = load i32, i32* %a_addr
    %sge = icmp sge i32 %a_0, 0
    store i1 %sge, i1* %AND_addr
    br label %short_circuit_and_end_AND

return_block0:                                               ; preds = short_circuit_and_end_AND 
    %returnval = load i1, i1* %return_register_infunction_addr
    ret i1 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
