; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@col = dso_local global i32* null
@d = dso_local global i32** null
@row = dso_local global i32* null
@N = dso_local global i32 0

@const_string2 = private unnamed_addr constant [1 x i8] c"\00", align 1
@const_string0 = private unnamed_addr constant [3 x i8] c" O\00", align 1
@const_string1 = private unnamed_addr constant [3 x i8] c" .\00", align 1

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

define dso_local void @printBoard() {
entrance_block0:                                             
    %j_addr = alloca i32
    %i_addr = alloca i32
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i = load i32, i32* %i_addr
    %N = load i32, i32* @N
    %slt = icmp slt i32 %i, %N
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_end_merge0 
    %i_1 = load i32, i32* %i_addr
    %add_0 = add i32 %i_1, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store i32 0, i32* %j_addr
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    %const_string_pointer_2 = getelementptr inbounds [1 x i8], [1 x i8]* @const_string2, i32 0, i32 0
    call void @println(i8* %const_string_pointer_2)
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %j = load i32, i32* %j_addr
    %N_0 = load i32, i32* @N
    %slt_0 = icmp slt i32 %j, %N_0
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = if_end_basicblock 
    %j_1 = load i32, i32* %j_addr
    %add = add i32 %j_1, 1
    store i32 %add, i32* %j_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %col = load i32*, i32** @col
    %i_0 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %col, i32 %i_0
    %load_result = load i32, i32* %getelementptr_reg
    %j_0 = load i32, i32* %j_addr
    %eq = icmp eq i32 %load_result, %j_0
    br i1 %eq, label %then_basicblock, label %else_basicblock

for_end_merge0:                                              ; preds = for_condition0 
    %const_string_pointer_1 = getelementptr inbounds [1 x i8], [1 x i8]* @const_string2, i32 0, i32 0
    call void @println(i8* %const_string_pointer_1)
    br label %for_step

then_basicblock:                                             ; preds = for_body0 
    %const_string_pointer = getelementptr inbounds [3 x i8], [3 x i8]* @const_string0, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    br label %if_end_basicblock

else_basicblock:                                             ; preds = for_body0 
    %const_string_pointer_0 = getelementptr inbounds [3 x i8], [3 x i8]* @const_string1, i32 0, i32 0
    call void @print(i8* %const_string_pointer_0)
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %for_step0

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local void @search(i32 %c_para) {
entrance_block0:                                             
    %AND_addr_0 = alloca i1
    %AND_addr = alloca i1
    %r_addr = alloca i32
    %c_addr = alloca i32
    store i32 %c_para, i32* %c_addr
    %c = load i32, i32* %c_addr
    %N = load i32, i32* @N
    %eq = icmp eq i32 %c, %N
    br i1 %eq, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = entrance_block0 
    call void @printBoard()
    br label %if_end_basicblock

else_basicblock:                                             ; preds = entrance_block0 
    store i32 0, i32* %r_addr
    br label %for_condition

if_end_basicblock:                                           ; preds = then_basicblock for_end_merge 
    br label %return_block0

for_condition:                                               ; preds = else_basicblock for_step 
    %r = load i32, i32* %r_addr
    %N_0 = load i32, i32* @N
    %slt = icmp slt i32 %r, %N_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = if_withoutelse_end_basicblock 
    %r_10 = load i32, i32* %r_addr
    %add_6 = add i32 %r_10, 1
    store i32 %add_6, i32* %r_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %row = load i32*, i32** @row
    %r_0 = load i32, i32* %r_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %row, i32 %r_0
    %load_result = load i32, i32* %getelementptr_reg
    %eq_0 = icmp eq i32 %load_result, 0
    store i1 %eq_0, i1* %AND_addr
    br i1 %eq_0, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

for_end_merge:                                               ; preds = for_condition 
    br label %if_end_basicblock

short_circuit_AND_end_AND:                                   ; preds = for_body short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    store i1 %AND_short_circuit, i1* %AND_addr_0
    br i1 %AND_short_circuit, label %short_circuit_AND_branch_AND0, label %short_circuit_AND_end_AND0

short_circuit_AND_branch_AND:                                ; preds = for_body 
    %d = load i32**, i32*** @d
    %getelementptr_reg_0 = getelementptr inbounds i32*, i32** %d, i32 0
    %load_result_0 = load i32*, i32** %getelementptr_reg_0
    %r_1 = load i32, i32* %r_addr
    %c_0 = load i32, i32* %c_addr
    %add = add i32 %r_1, %c_0
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %load_result_0, i32 %add
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    %eq_1 = icmp eq i32 %load_result_1, 0
    store i1 %eq_1, i1* %AND_addr
    br label %short_circuit_AND_end_AND

short_circuit_AND_end_AND0:                                  ; preds = short_circuit_AND_end_AND short_circuit_AND_branch_AND0 
    %AND_short_circuit_0 = load i1, i1* %AND_addr_0
    br i1 %AND_short_circuit_0, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_AND_branch_AND0:                               ; preds = short_circuit_AND_end_AND 
    %d_0 = load i32**, i32*** @d
    %getelementptr_reg_2 = getelementptr inbounds i32*, i32** %d_0, i32 1
    %load_result_2 = load i32*, i32** %getelementptr_reg_2
    %r_2 = load i32, i32* %r_addr
    %N_1 = load i32, i32* @N
    %add_0 = add i32 %r_2, %N_1
    %sub = sub i32 %add_0, 1
    %c_1 = load i32, i32* %c_addr
    %sub_0 = sub i32 %sub, %c_1
    %getelementptr_reg_3 = getelementptr inbounds i32, i32* %load_result_2, i32 %sub_0
    %load_result_3 = load i32, i32* %getelementptr_reg_3
    %eq_2 = icmp eq i32 %load_result_3, 0
    store i1 %eq_2, i1* %AND_addr_0
    br label %short_circuit_AND_end_AND0

single_then_basicblock:                                      ; preds = short_circuit_AND_end_AND0 
    %d_1 = load i32**, i32*** @d
    %getelementptr_reg_4 = getelementptr inbounds i32*, i32** %d_1, i32 1
    %load_result_4 = load i32*, i32** %getelementptr_reg_4
    %r_3 = load i32, i32* %r_addr
    %N_2 = load i32, i32* @N
    %add_1 = add i32 %r_3, %N_2
    %sub_1 = sub i32 %add_1, 1
    %c_2 = load i32, i32* %c_addr
    %sub_2 = sub i32 %sub_1, %c_2
    %getelementptr_reg_5 = getelementptr inbounds i32, i32* %load_result_4, i32 %sub_2
    %load_result_5 = load i32, i32* %getelementptr_reg_5
    store i32 1, i32* %getelementptr_reg_5
    %d_2 = load i32**, i32*** @d
    %getelementptr_reg_6 = getelementptr inbounds i32*, i32** %d_2, i32 0
    %load_result_6 = load i32*, i32** %getelementptr_reg_6
    %r_4 = load i32, i32* %r_addr
    %c_3 = load i32, i32* %c_addr
    %add_2 = add i32 %r_4, %c_3
    %getelementptr_reg_7 = getelementptr inbounds i32, i32* %load_result_6, i32 %add_2
    %load_result_7 = load i32, i32* %getelementptr_reg_7
    store i32 1, i32* %getelementptr_reg_7
    %row_0 = load i32*, i32** @row
    %r_5 = load i32, i32* %r_addr
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %row_0, i32 %r_5
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    store i32 1, i32* %getelementptr_reg_8
    %col = load i32*, i32** @col
    %c_4 = load i32, i32* %c_addr
    %getelementptr_reg_9 = getelementptr inbounds i32, i32* %col, i32 %c_4
    %load_result_9 = load i32, i32* %getelementptr_reg_9
    %r_6 = load i32, i32* %r_addr
    store i32 %r_6, i32* %getelementptr_reg_9
    %c_5 = load i32, i32* %c_addr
    %add_3 = add i32 %c_5, 1
    call void @search(i32 %add_3)
    %row_1 = load i32*, i32** @row
    %r_7 = load i32, i32* %r_addr
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %row_1, i32 %r_7
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    store i32 0, i32* %getelementptr_reg_10
    %d_3 = load i32**, i32*** @d
    %getelementptr_reg_11 = getelementptr inbounds i32*, i32** %d_3, i32 0
    %load_result_11 = load i32*, i32** %getelementptr_reg_11
    %r_8 = load i32, i32* %r_addr
    %c_6 = load i32, i32* %c_addr
    %add_4 = add i32 %r_8, %c_6
    %getelementptr_reg_12 = getelementptr inbounds i32, i32* %load_result_11, i32 %add_4
    %load_result_12 = load i32, i32* %getelementptr_reg_12
    store i32 0, i32* %getelementptr_reg_12
    %d_4 = load i32**, i32*** @d
    %getelementptr_reg_13 = getelementptr inbounds i32*, i32** %d_4, i32 1
    %load_result_13 = load i32*, i32** %getelementptr_reg_13
    %r_9 = load i32, i32* %r_addr
    %N_3 = load i32, i32* @N
    %add_5 = add i32 %r_9, %N_3
    %sub_3 = sub i32 %add_5, 1
    %c_7 = load i32, i32* %c_addr
    %sub_4 = sub i32 %sub_3, %c_7
    %getelementptr_reg_14 = getelementptr inbounds i32, i32* %load_result_13, i32 %sub_4
    %load_result_14 = load i32, i32* %getelementptr_reg_14
    store i32 0, i32* %getelementptr_reg_14
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = short_circuit_AND_end_AND0 single_then_basicblock 
    br label %for_step

return_block0:                                               ; preds = if_end_basicblock 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %j_addr = alloca i32
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i = load i32, i32* %i_addr
    %slt = icmp slt i32 %i, 8
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %row = load i32*, i32** @row
    %i_0 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %row, i32 %i_0
    %load_result = load i32, i32* %getelementptr_reg
    store i32 0, i32* %getelementptr_reg
    %col = load i32*, i32** @col
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %col, i32 %i_1
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 0, i32* %getelementptr_reg_0
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    store i32 0, i32* %i_addr
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %i_3 = load i32, i32* %i_addr
    %slt_0 = icmp slt i32 %i_3, 2
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_end_merge1 
    %i_6 = load i32, i32* %i_addr
    %add_3 = add i32 %i_6, 1
    store i32 %add_3, i32* %i_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %d = load i32**, i32*** @d
    %i_4 = load i32, i32* %i_addr
    %getelementptr_reg_1 = getelementptr inbounds i32*, i32** %d, i32 %i_4
    %load_result_1 = load i32*, i32** %getelementptr_reg_1
    %add_0 = add i32 8, 8
    %sub = sub i32 %add_0, 1
    %mul_bytes = mul i32 %sub, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %sub, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %getelementptr_reg_1
    store i32 0, i32* %j_addr
    br label %for_condition1

for_end_merge0:                                              ; preds = for_condition0 
    call void @search(i32 0)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

for_condition1:                                              ; preds = for_body0 for_step1 
    %j = load i32, i32* %j_addr
    %add_1 = add i32 8, 8
    %sub_0 = sub i32 %add_1, 1
    %slt_1 = icmp slt i32 %j, %sub_0
    br i1 %slt_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 
    %j_1 = load i32, i32* %j_addr
    %add_2 = add i32 %j_1, 1
    store i32 %add_2, i32* %j_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %d_0 = load i32**, i32*** @d
    %i_5 = load i32, i32* %i_addr
    %getelementptr_reg_2 = getelementptr inbounds i32*, i32** %d_0, i32 %i_5
    %load_result_2 = load i32*, i32** %getelementptr_reg_2
    %j_0 = load i32, i32* %j_addr
    %getelementptr_reg_3 = getelementptr inbounds i32, i32* %load_result_2, i32 %j_0
    %load_result_3 = load i32, i32* %getelementptr_reg_3
    store i32 0, i32* %getelementptr_reg_3
    br label %for_step1

for_end_merge1:                                              ; preds = for_condition1 
    br label %for_step0

return_block0:                                               ; preds = for_end_merge0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    store i32 8, i32* @N
    %mul_bytes = mul i32 8, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 8, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** @row
    %mul_bytes_0 = mul i32 8, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 8, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** @col
    %mul_bytes_1 = mul i32 2, 8
    %sum_bytes_1 = add i32 %mul_bytes_1, 4
    %malloca_1 = call i8* @_f_malloc(i32 %sum_bytes_1)
    %array_cast_i8_to_i32_1 = bitcast i8* %malloca_1 to i32*
    store i32 2, i32* %array_cast_i8_to_i32_1
    %array_tmp_begin_i32_1 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_1, i32 1
    %array_addr_1 = bitcast i32* %array_tmp_begin_i32_1 to i32**
    store i32** %array_addr_1, i32*** @d
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
