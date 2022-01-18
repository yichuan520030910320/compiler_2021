; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32* null

@const_string0 = private unnamed_addr constant [1 x i8] c"\00", align 1

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
    %b_addr = alloca i32**
    %return_register_infunction_addr = alloca i32
    %mul_bytes = mul i32 4, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 4, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32**
    store i32** %array_addr, i32*** %b_addr
    %b = load i32**, i32*** %b_addr
    %getelementptr_reg = getelementptr inbounds i32*, i32** %b, i32 0
    %load_result = load i32*, i32** %getelementptr_reg
    %a = load i32*, i32** @a
    store i32* %a, i32** %getelementptr_reg
    %b_0 = load i32**, i32*** %b_addr
    %getelementptr_reg_0 = getelementptr inbounds i32*, i32** %b_0, i32 1
    %load_result_0 = load i32*, i32** %getelementptr_reg_0
    %a_0 = load i32*, i32** @a
    store i32* %a_0, i32** %getelementptr_reg_0
    %b_1 = load i32**, i32*** %b_addr
    %getelementptr_reg_1 = getelementptr inbounds i32*, i32** %b_1, i32 2
    %load_result_1 = load i32*, i32** %getelementptr_reg_1
    %a_1 = load i32*, i32** @a
    store i32* %a_1, i32** %getelementptr_reg_1
    %b_2 = load i32**, i32*** %b_addr
    %getelementptr_reg_2 = getelementptr inbounds i32*, i32** %b_2, i32 3
    %load_result_2 = load i32*, i32** %getelementptr_reg_2
    %a_2 = load i32*, i32** @a
    store i32* %a_2, i32** %getelementptr_reg_2
    %b_3 = load i32**, i32*** %b_addr
    %bitcast_i32 = bitcast i32** %b_3 to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %call_toString = call i8* @toString(i32 %size_load)
    call void @println(i8* %call_toString)
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %b_4 = load i32**, i32*** %b_addr
    %getelementptr_reg_3 = getelementptr inbounds i32*, i32** %b_4, i32 0
    %load_result_3 = load i32*, i32** %getelementptr_reg_3
    %bitcast_i32_0 = bitcast i32* %load_result_3 to i32*
    %gep_size_0 = getelementptr inbounds i32, i32* %bitcast_i32_0, i32 -1
    %size_load_0 = load i32, i32* %gep_size_0
    %slt = icmp slt i32 %i_0, %size_load_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %b_5 = load i32**, i32*** %b_addr
    %getelementptr_reg_4 = getelementptr inbounds i32*, i32** %b_5, i32 0
    %load_result_4 = load i32*, i32** %getelementptr_reg_4
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg_5 = getelementptr inbounds i32, i32* %load_result_4, i32 %i_1
    %load_result_5 = load i32, i32* %getelementptr_reg_5
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* %getelementptr_reg_5
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %i_3 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %i_4 = load i32, i32* %i_addr
    %b_6 = load i32**, i32*** %b_addr
    %getelementptr_reg_6 = getelementptr inbounds i32*, i32** %b_6, i32 1
    %load_result_6 = load i32*, i32** %getelementptr_reg_6
    %bitcast_i32_1 = bitcast i32* %load_result_6 to i32*
    %gep_size_1 = getelementptr inbounds i32, i32* %bitcast_i32_1, i32 -1
    %size_load_1 = load i32, i32* %gep_size_1
    %slt_0 = icmp slt i32 %i_4, %size_load_1
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %i_6 = load i32, i32* %i_addr
    %add_0 = add i32 %i_6, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %b_7 = load i32**, i32*** %b_addr
    %getelementptr_reg_7 = getelementptr inbounds i32*, i32** %b_7, i32 1
    %load_result_7 = load i32*, i32** %getelementptr_reg_7
    %i_5 = load i32, i32* %i_addr
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %load_result_7, i32 %i_5
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    %call_toString_0 = call i8* @toString(i32 %load_result_8)
    call void @print(i8* %call_toString_0)
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    %const_string_pointer = getelementptr inbounds [1 x i8], [1 x i8]* @const_string0, i32 0, i32 0
    call void @println(i8* %const_string_pointer)
    %i_7 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition1

for_condition1:                                              ; preds = for_end_merge0 for_step1 
    %i_8 = load i32, i32* %i_addr
    %b_8 = load i32**, i32*** %b_addr
    %getelementptr_reg_9 = getelementptr inbounds i32*, i32** %b_8, i32 2
    %load_result_9 = load i32*, i32** %getelementptr_reg_9
    %bitcast_i32_2 = bitcast i32* %load_result_9 to i32*
    %gep_size_2 = getelementptr inbounds i32, i32* %bitcast_i32_2, i32 -1
    %size_load_2 = load i32, i32* %gep_size_2
    %slt_1 = icmp slt i32 %i_8, %size_load_2
    br i1 %slt_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 
    %i_10 = load i32, i32* %i_addr
    %add_1 = add i32 %i_10, 1
    store i32 %add_1, i32* %i_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %b_9 = load i32**, i32*** %b_addr
    %getelementptr_reg_10 = getelementptr inbounds i32*, i32** %b_9, i32 2
    %load_result_10 = load i32*, i32** %getelementptr_reg_10
    %i_9 = load i32, i32* %i_addr
    %getelementptr_reg_11 = getelementptr inbounds i32, i32* %load_result_10, i32 %i_9
    %load_result_11 = load i32, i32* %getelementptr_reg_11
    store i32 0, i32* %getelementptr_reg_11
    br label %for_step1

for_end_merge1:                                              ; preds = for_condition1 
    %i_11 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition2

for_condition2:                                              ; preds = for_end_merge1 for_step2 
    %i_12 = load i32, i32* %i_addr
    %b_10 = load i32**, i32*** %b_addr
    %getelementptr_reg_12 = getelementptr inbounds i32*, i32** %b_10, i32 3
    %load_result_12 = load i32*, i32** %getelementptr_reg_12
    %bitcast_i32_3 = bitcast i32* %load_result_12 to i32*
    %gep_size_3 = getelementptr inbounds i32, i32* %bitcast_i32_3, i32 -1
    %size_load_3 = load i32, i32* %gep_size_3
    %slt_2 = icmp slt i32 %i_12, %size_load_3
    br i1 %slt_2, label %for_body2, label %for_end_merge2

for_step2:                                                   ; preds = for_body2 
    %i_14 = load i32, i32* %i_addr
    %add_2 = add i32 %i_14, 1
    store i32 %add_2, i32* %i_addr
    br label %for_condition2

for_body2:                                                   ; preds = for_condition2 
    %b_11 = load i32**, i32*** %b_addr
    %getelementptr_reg_13 = getelementptr inbounds i32*, i32** %b_11, i32 3
    %load_result_13 = load i32*, i32** %getelementptr_reg_13
    %i_13 = load i32, i32* %i_addr
    %getelementptr_reg_14 = getelementptr inbounds i32, i32* %load_result_13, i32 %i_13
    %load_result_14 = load i32, i32* %getelementptr_reg_14
    %call_toString_1 = call i8* @toString(i32 %load_result_14)
    call void @print(i8* %call_toString_1)
    br label %for_step2

for_end_merge2:                                              ; preds = for_condition2 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = for_end_merge2 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    %mul_bytes = mul i32 4, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 4, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** @a
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
