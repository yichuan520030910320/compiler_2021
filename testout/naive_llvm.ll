; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@tail = dso_local global i32 0
@targety = dso_local global i32 0
@targetx = dso_local global i32 0
@i = dso_local global i32 0
@j = dso_local global i32 0
@ylist = dso_local global i32* null
@N = dso_local global i32 0
@head = dso_local global i32 0
@dx = dso_local global i32* null
@dy = dso_local global i32* null
@now = dso_local global i32 0
@x = dso_local global i32 0
@y = dso_local global i32 0
@starty = dso_local global i32 0
@step = dso_local global i32** null
@startx = dso_local global i32 0
@xlist = dso_local global i32* null
@ok = dso_local global i32 0

@const_string0 = private unnamed_addr constant [14 x i8] c"no solution!\0A\00", align 1

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

define dso_local void @origin(i32 %N_para) {
entrance_block0:                                             
    %N_addr = alloca i32
    store i32 %N_para, i32* %N_addr
    %head = load i32, i32* @head
    store i32 0, i32* @head
    %tail = load i32, i32* @tail
    store i32 0, i32* @tail
    %step = load i32**, i32*** @step
    %N = load i32, i32* %N_addr
    %mul_bytes = mul i32 %N, 8
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %N, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32**
    store i32** %array_addr, i32*** @step
    %i = load i32, i32* @i
    store i32 0, i32* @i
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* @i
    %N_0 = load i32, i32* %N_addr
    %slt = icmp slt i32 %i_0, %N_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_3 = load i32, i32* @i
    %add_0 = add i32 %i_3, 1
    store i32 %add_0, i32* @i
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %step_0 = load i32**, i32*** @step
    %i_1 = load i32, i32* @i
    %getelementptr_reg = getelementptr inbounds i32*, i32** %step_0, i32 %i_1
    %load_result = load i32*, i32** %getelementptr_reg
    %N_1 = load i32, i32* %N_addr
    %mul_bytes_0 = mul i32 %N_1, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 %N_1, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** %getelementptr_reg
    %j = load i32, i32* @j
    store i32 0, i32* @j
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %j_0 = load i32, i32* @j
    %N_2 = load i32, i32* %N_addr
    %slt_0 = icmp slt i32 %j_0, %N_2
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %j_2 = load i32, i32* @j
    %add = add i32 %j_2, 1
    store i32 %add, i32* @j
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %step_1 = load i32**, i32*** @step
    %i_2 = load i32, i32* @i
    %getelementptr_reg_0 = getelementptr inbounds i32*, i32** %step_1, i32 %i_2
    %load_result_0 = load i32*, i32** %getelementptr_reg_0
    %j_1 = load i32, i32* @j
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %load_result_0, i32 %j_1
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    store i32 0, i32* %getelementptr_reg_1
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    br label %for_step

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local void @addList(i32 %x_para,i32 %y_para) {
entrance_block0:                                             
    %AND_addr_1 = alloca i1
    %AND_addr_0 = alloca i1
    %AND_addr = alloca i1
    %y_addr = alloca i32
    %x_addr = alloca i32
    store i32 %x_para, i32* %x_addr
    store i32 %y_para, i32* %y_addr
    %x = load i32, i32* %x_addr
    %call_check = call i1 @check(i32 %x)
    store i1 %call_check, i1* %AND_addr
    br i1 %call_check, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

short_circuit_AND_end_AND:                                   ; preds = entrance_block0 short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    store i1 %AND_short_circuit, i1* %AND_addr_0
    br i1 %AND_short_circuit, label %short_circuit_AND_branch_AND0, label %short_circuit_AND_end_AND0

short_circuit_AND_branch_AND:                                ; preds = entrance_block0 
    %y = load i32, i32* %y_addr
    %call_check_0 = call i1 @check(i32 %y)
    store i1 %call_check_0, i1* %AND_addr
    br label %short_circuit_AND_end_AND

short_circuit_AND_end_AND0:                                  ; preds = short_circuit_AND_end_AND short_circuit_AND_branch_AND0 
    %AND_short_circuit_0 = load i1, i1* %AND_addr_0
    br i1 %AND_short_circuit_0, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_AND_branch_AND0:                               ; preds = short_circuit_AND_end_AND 
    %step = load i32**, i32*** @step
    %x_0 = load i32, i32* %x_addr
    %getelementptr_reg = getelementptr inbounds i32*, i32** %step, i32 %x_0
    %load_result = load i32*, i32** %getelementptr_reg
    %y_0 = load i32, i32* %y_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_result, i32 %y_0
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %SUB_single_front = mul i32 1, -1
    %eq = icmp eq i32 %load_result_0, %SUB_single_front
    store i1 %eq, i1* %AND_addr_0
    br label %short_circuit_AND_end_AND0

single_then_basicblock:                                      ; preds = short_circuit_AND_end_AND0 
    %tail = load i32, i32* @tail
    %add = add i32 %tail, 1
    store i32 %add, i32* @tail
    %xlist = load i32*, i32** @xlist
    %tail_0 = load i32, i32* @tail
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %xlist, i32 %tail_0
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    %x_1 = load i32, i32* %x_addr
    store i32 %x_1, i32* %getelementptr_reg_1
    %ylist = load i32*, i32** @ylist
    %tail_1 = load i32, i32* @tail
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %ylist, i32 %tail_1
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %y_1 = load i32, i32* %y_addr
    store i32 %y_1, i32* %getelementptr_reg_2
    %step_0 = load i32**, i32*** @step
    %x_2 = load i32, i32* %x_addr
    %getelementptr_reg_3 = getelementptr inbounds i32*, i32** %step_0, i32 %x_2
    %load_result_3 = load i32*, i32** %getelementptr_reg_3
    %y_2 = load i32, i32* %y_addr
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %load_result_3, i32 %y_2
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %now = load i32, i32* @now
    %add_0 = add i32 %now, 1
    store i32 %add_0, i32* %getelementptr_reg_4
    %x_3 = load i32, i32* %x_addr
    %targetx = load i32, i32* @targetx
    %eq_0 = icmp eq i32 %x_3, %targetx
    store i1 %eq_0, i1* %AND_addr_1
    br i1 %eq_0, label %short_circuit_AND_branch_AND1, label %short_circuit_AND_end_AND1

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock short_circuit_AND_end_AND0 if_withoutelse_end_basicblock0 
    br label %return_block0

short_circuit_AND_end_AND1:                                  ; preds = single_then_basicblock short_circuit_AND_branch_AND1 
    %AND_short_circuit_1 = load i1, i1* %AND_addr_1
    br i1 %AND_short_circuit_1, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

short_circuit_AND_branch_AND1:                               ; preds = single_then_basicblock 
    %y_3 = load i32, i32* %y_addr
    %targety = load i32, i32* @targety
    %eq_1 = icmp eq i32 %y_3, %targety
    store i1 %eq_1, i1* %AND_addr_1
    br label %short_circuit_AND_end_AND1

single_then_basicblock0:                                     ; preds = short_circuit_AND_end_AND1 
    %ok = load i32, i32* @ok
    store i32 1, i32* @ok
    br label %if_withoutelse_end_basicblock0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 short_circuit_AND_end_AND1 
    br label %if_withoutelse_end_basicblock

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %return_register_infunction_addr = alloca i32
    call void @origin(i32 106)
    %N = load i32, i32* @N
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @N
    %targety = load i32, i32* @targety
    %N_0 = load i32, i32* @N
    %sub = sub i32 %N_0, 1
    store i32 %sub, i32* @targety
    %targetx = load i32, i32* @targetx
    %targety_0 = load i32, i32* @targety
    store i32 %targety_0, i32* @targetx
    %i = load i32, i32* @i
    store i32 0, i32* @i
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* @i
    %N_1 = load i32, i32* @N
    %slt = icmp slt i32 %i_0, %N_1
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_2 = load i32, i32* @i
    %add_0 = add i32 %i_2, 1
    store i32 %add_0, i32* @i
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %j = load i32, i32* @j
    store i32 0, i32* @j
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    %dx = load i32*, i32** @dx
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %dx, i32 0
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    %SUB_single_front_0 = mul i32 2, -1
    store i32 %SUB_single_front_0, i32* %getelementptr_reg_1
    %dy = load i32*, i32** @dy
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %dy, i32 0
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %SUB_single_front_1 = mul i32 1, -1
    store i32 %SUB_single_front_1, i32* %getelementptr_reg_2
    %dx_0 = load i32*, i32** @dx
    %getelementptr_reg_3 = getelementptr inbounds i32, i32* %dx_0, i32 1
    %load_result_3 = load i32, i32* %getelementptr_reg_3
    %SUB_single_front_2 = mul i32 2, -1
    store i32 %SUB_single_front_2, i32* %getelementptr_reg_3
    %dy_0 = load i32*, i32** @dy
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %dy_0, i32 1
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    store i32 1, i32* %getelementptr_reg_4
    %dx_1 = load i32*, i32** @dx
    %getelementptr_reg_5 = getelementptr inbounds i32, i32* %dx_1, i32 2
    %load_result_5 = load i32, i32* %getelementptr_reg_5
    store i32 2, i32* %getelementptr_reg_5
    %dy_1 = load i32*, i32** @dy
    %getelementptr_reg_6 = getelementptr inbounds i32, i32* %dy_1, i32 2
    %load_result_6 = load i32, i32* %getelementptr_reg_6
    %SUB_single_front_3 = mul i32 1, -1
    store i32 %SUB_single_front_3, i32* %getelementptr_reg_6
    %dx_2 = load i32*, i32** @dx
    %getelementptr_reg_7 = getelementptr inbounds i32, i32* %dx_2, i32 3
    %load_result_7 = load i32, i32* %getelementptr_reg_7
    store i32 2, i32* %getelementptr_reg_7
    %dy_2 = load i32*, i32** @dy
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %dy_2, i32 3
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    store i32 1, i32* %getelementptr_reg_8
    %dx_3 = load i32*, i32** @dx
    %getelementptr_reg_9 = getelementptr inbounds i32, i32* %dx_3, i32 4
    %load_result_9 = load i32, i32* %getelementptr_reg_9
    %SUB_single_front_4 = mul i32 1, -1
    store i32 %SUB_single_front_4, i32* %getelementptr_reg_9
    %dy_3 = load i32*, i32** @dy
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %dy_3, i32 4
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    %SUB_single_front_5 = mul i32 2, -1
    store i32 %SUB_single_front_5, i32* %getelementptr_reg_10
    %dx_4 = load i32*, i32** @dx
    %getelementptr_reg_11 = getelementptr inbounds i32, i32* %dx_4, i32 5
    %load_result_11 = load i32, i32* %getelementptr_reg_11
    %SUB_single_front_6 = mul i32 1, -1
    store i32 %SUB_single_front_6, i32* %getelementptr_reg_11
    %dy_4 = load i32*, i32** @dy
    %getelementptr_reg_12 = getelementptr inbounds i32, i32* %dy_4, i32 5
    %load_result_12 = load i32, i32* %getelementptr_reg_12
    store i32 2, i32* %getelementptr_reg_12
    %dx_5 = load i32*, i32** @dx
    %getelementptr_reg_13 = getelementptr inbounds i32, i32* %dx_5, i32 6
    %load_result_13 = load i32, i32* %getelementptr_reg_13
    store i32 1, i32* %getelementptr_reg_13
    %dy_5 = load i32*, i32** @dy
    %getelementptr_reg_14 = getelementptr inbounds i32, i32* %dy_5, i32 6
    %load_result_14 = load i32, i32* %getelementptr_reg_14
    %SUB_single_front_7 = mul i32 2, -1
    store i32 %SUB_single_front_7, i32* %getelementptr_reg_14
    %dx_6 = load i32*, i32** @dx
    %getelementptr_reg_15 = getelementptr inbounds i32, i32* %dx_6, i32 7
    %load_result_15 = load i32, i32* %getelementptr_reg_15
    store i32 1, i32* %getelementptr_reg_15
    %dy_6 = load i32*, i32** @dy
    %getelementptr_reg_16 = getelementptr inbounds i32, i32* %dy_6, i32 7
    %load_result_16 = load i32, i32* %getelementptr_reg_16
    store i32 2, i32* %getelementptr_reg_16
    br label %while_condition

for_condition0:                                              ; preds = for_body for_step0 
    %j_0 = load i32, i32* @j
    %N_2 = load i32, i32* @N
    %slt_0 = icmp slt i32 %j_0, %N_2
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %j_2 = load i32, i32* @j
    %add = add i32 %j_2, 1
    store i32 %add, i32* @j
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %step = load i32**, i32*** @step
    %i_1 = load i32, i32* @i
    %getelementptr_reg = getelementptr inbounds i32*, i32** %step, i32 %i_1
    %load_result = load i32*, i32** %getelementptr_reg
    %j_1 = load i32, i32* @j
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_result, i32 %j_1
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %SUB_single_front = mul i32 1, -1
    store i32 %SUB_single_front, i32* %getelementptr_reg_0
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    br label %for_step

while_condition:                                             ; preds = for_end_merge while_body if_withoutelse_end_basicblock 
    %head = load i32, i32* @head
    %tail = load i32, i32* @tail
    %sle = icmp sle i32 %head, %tail
    br i1 %sle, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %x = load i32, i32* @x
    %xlist = load i32*, i32** @xlist
    %head_0 = load i32, i32* @head
    %getelementptr_reg_17 = getelementptr inbounds i32, i32* %xlist, i32 %head_0
    %load_result_17 = load i32, i32* %getelementptr_reg_17
    store i32 %load_result_17, i32* @x
    %y = load i32, i32* @y
    %ylist = load i32*, i32** @ylist
    %head_1 = load i32, i32* @head
    %getelementptr_reg_18 = getelementptr inbounds i32, i32* %ylist, i32 %head_1
    %load_result_18 = load i32, i32* %getelementptr_reg_18
    store i32 %load_result_18, i32* @y
    %now = load i32, i32* @now
    %step_0 = load i32**, i32*** @step
    %x_0 = load i32, i32* @x
    %getelementptr_reg_19 = getelementptr inbounds i32*, i32** %step_0, i32 %x_0
    %load_result_19 = load i32*, i32** %getelementptr_reg_19
    %y_0 = load i32, i32* @y
    %getelementptr_reg_20 = getelementptr inbounds i32, i32* %load_result_19, i32 %y_0
    %load_result_20 = load i32, i32* %getelementptr_reg_20
    store i32 %load_result_20, i32* @now
    %j_3 = load i32, i32* @j
    store i32 0, i32* @j
    br label %for_condition1

while_end_merge:                                             ; preds = for_end_merge while_condition single_then_basicblock 
    %ok_0 = load i32, i32* @ok
    %eq_0 = icmp eq i32 %ok_0, 1
    br i1 %eq_0, label %then_basicblock, label %else_basicblock

for_condition1:                                              ; preds = while_body for_step1 
    %j_4 = load i32, i32* @j
    %slt_1 = icmp slt i32 %j_4, 8
    br i1 %slt_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 
    %j_7 = load i32, i32* @j
    %add_3 = add i32 %j_7, 1
    store i32 %add_3, i32* @j
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %x_1 = load i32, i32* @x
    %dx_7 = load i32*, i32** @dx
    %j_5 = load i32, i32* @j
    %getelementptr_reg_21 = getelementptr inbounds i32, i32* %dx_7, i32 %j_5
    %load_result_21 = load i32, i32* %getelementptr_reg_21
    %add_1 = add i32 %x_1, %load_result_21
    %y_1 = load i32, i32* @y
    %dy_7 = load i32*, i32** @dy
    %j_6 = load i32, i32* @j
    %getelementptr_reg_22 = getelementptr inbounds i32, i32* %dy_7, i32 %j_6
    %load_result_22 = load i32, i32* %getelementptr_reg_22
    %add_2 = add i32 %y_1, %load_result_22
    call void @addList(i32 %add_1, i32 %add_2)
    br label %for_step1

for_end_merge1:                                              ; preds = for_condition1 
    %ok = load i32, i32* @ok
    %eq = icmp eq i32 %ok, 1
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = for_end_merge1 
    br label %while_end_merge

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_end_merge1 
    %head_2 = load i32, i32* @head
    %add_4 = add i32 %head_2, 1
    store i32 %add_4, i32* @head
    br label %while_condition

then_basicblock:                                             ; preds = while_end_merge 
    %step_1 = load i32**, i32*** @step
    %targetx_0 = load i32, i32* @targetx
    %getelementptr_reg_23 = getelementptr inbounds i32*, i32** %step_1, i32 %targetx_0
    %load_result_23 = load i32*, i32** %getelementptr_reg_23
    %targety_1 = load i32, i32* @targety
    %getelementptr_reg_24 = getelementptr inbounds i32, i32* %load_result_23, i32 %targety_1
    %load_result_24 = load i32, i32* %getelementptr_reg_24
    %call_toString = call i8* @toString(i32 %load_result_24)
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
define dso_local i1 @check(i32 %a_para) {
entrance_block0:                                             
    %AND_addr = alloca i1
    %a_addr = alloca i32
    %return_register_infunction_addr = alloca i1
    store i32 %a_para, i32* %a_addr
    %a = load i32, i32* %a_addr
    %N = load i32, i32* @N
    %slt = icmp slt i32 %a, %N
    store i1 %slt, i1* %AND_addr
    br i1 %slt, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

short_circuit_AND_end_AND:                                   ; preds = entrance_block0 short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    store i1 %AND_short_circuit, i1* %return_register_infunction_addr
    br label %return_block0

short_circuit_AND_branch_AND:                                ; preds = entrance_block0 
    %a_0 = load i32, i32* %a_addr
    %sge = icmp sge i32 %a_0, 0
    store i1 %sge, i1* %AND_addr
    br label %short_circuit_AND_end_AND

return_block0:                                               ; preds = short_circuit_AND_end_AND 
    %returnval = load i1, i1* %return_register_infunction_addr
    ret i1 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    %mul_bytes = mul i32 12000, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 12000, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** @xlist
    %mul_bytes_0 = mul i32 12000, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 12000, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** @ylist
    %mul_bytes_1 = mul i32 8, 4
    %sum_bytes_1 = add i32 %mul_bytes_1, 4
    %malloca_1 = call i8* @_f_malloc(i32 %sum_bytes_1)
    %array_cast_i8_to_i32_1 = bitcast i8* %malloca_1 to i32*
    store i32 8, i32* %array_cast_i8_to_i32_1
    %array_tmp_begin_i32_1 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_1, i32 1
    %array_addr_1 = bitcast i32* %array_tmp_begin_i32_1 to i32*
    store i32* %array_addr_1, i32** @dx
    %mul_bytes_2 = mul i32 9, 4
    %sum_bytes_2 = add i32 %mul_bytes_2, 4
    %malloca_2 = call i8* @_f_malloc(i32 %sum_bytes_2)
    %array_cast_i8_to_i32_2 = bitcast i8* %malloca_2 to i32*
    store i32 9, i32* %array_cast_i8_to_i32_2
    %array_tmp_begin_i32_2 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_2, i32 1
    %array_addr_2 = bitcast i32* %array_tmp_begin_i32_2 to i32*
    store i32* %array_addr_2, i32** @dy
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
