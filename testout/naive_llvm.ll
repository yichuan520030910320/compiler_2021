; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@prime = dso_local global i32* null
@res = dso_local global i32* null
@Comb = dso_local global i32** null
@b = dso_local global i32* null
@Mod = dso_local global i32 0
@C = dso_local global i32 0
@ksm = dso_local global i32** null
@g = dso_local global i32*** null
@fm = dso_local global i32** null
@fn = dso_local global i32* null
@Sum = dso_local global i32*** null
@m = dso_local global i32* null
@M = dso_local global i32 0
@N = dso_local global i32 0
@p = dso_local global i32** null
@q = dso_local global i32** null
@v = dso_local global i32* null
@tot = dso_local global i32 0
@fc = dso_local global i32* null


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

define dso_local void @Calculate_Ksm() {
entrance_block0:                                             
    %j_addr = alloca i32
    %i_addr = alloca i32
    %i = load i32, i32* %i_addr
    store i32 1, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %M = load i32, i32* @M
    %sle = icmp sle i32 %i_0, %M
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_5 = load i32, i32* %i_addr
    %add_0 = add i32 %i_5, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %ksm = load i32**, i32*** @ksm
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32*, i32** %ksm, i32 %i_1
    %load_result = load i32*, i32** %getelementptr_reg
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_result, i32 0
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 1, i32* %getelementptr_reg_0
    %j = load i32, i32* %j_addr
    store i32 1, i32* %j_addr
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %j_0 = load i32, i32* %j_addr
    %C = load i32, i32* @C
    %sub = sub i32 %C, 2
    %sle_0 = icmp sle i32 %j_0, %sub
    br i1 %sle_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %j_3 = load i32, i32* %j_addr
    %add = add i32 %j_3, 1
    store i32 %add, i32* %j_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %ksm_0 = load i32**, i32*** @ksm
    %i_2 = load i32, i32* %i_addr
    %getelementptr_reg_1 = getelementptr inbounds i32*, i32** %ksm_0, i32 %i_2
    %load_result_1 = load i32*, i32** %getelementptr_reg_1
    %j_1 = load i32, i32* %j_addr
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %load_result_1, i32 %j_1
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %ksm_1 = load i32**, i32*** @ksm
    %i_3 = load i32, i32* %i_addr
    %getelementptr_reg_3 = getelementptr inbounds i32*, i32** %ksm_1, i32 %i_3
    %load_result_3 = load i32*, i32** %getelementptr_reg_3
    %j_2 = load i32, i32* %j_addr
    %sub_0 = sub i32 %j_2, 1
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %load_result_3, i32 %sub_0
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %i_4 = load i32, i32* %i_addr
    %mul = mul i32 %load_result_4, %i_4
    %Mod = load i32, i32* @Mod
    %srem = srem i32 %mul, %Mod
    store i32 %srem, i32* %getelementptr_reg_2
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    br label %for_step

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local void @init() {
entrance_block0:                                             
    %k_addr = alloca i32
    %j_addr = alloca i32
    %i_addr = alloca i32
    %tot = load i32, i32* @tot
    store i32 0, i32* @tot
    %C = load i32, i32* @C
    store i32 0, i32* @C
    %M = load i32, i32* @M
    store i32 0, i32* @M
    %N = load i32, i32* @N
    store i32 0, i32* @N
    %g = load i32***, i32**** @g
    %mul_bytes = mul i32 6, 8
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 6, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32***
    store i32*** %array_addr, i32**** @g
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %slt = icmp slt i32 %i_0, 6
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_4 = load i32, i32* %i_addr
    %add_1 = add i32 %i_4, 1
    store i32 %add_1, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %g_0 = load i32***, i32**** @g
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32**, i32*** %g_0, i32 %i_1
    %load_result = load i32**, i32*** %getelementptr_reg
    %mul_bytes_0 = mul i32 100001, 8
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 100001, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32**
    store i32** %array_addr_0, i32*** %getelementptr_reg
    %j = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    %Sum = load i32***, i32**** @Sum
    %mul_bytes_2 = mul i32 6, 8
    %sum_bytes_2 = add i32 %mul_bytes_2, 4
    %malloca_2 = call i8* @_f_malloc(i32 %sum_bytes_2)
    %array_cast_i8_to_i32_2 = bitcast i8* %malloca_2 to i32*
    store i32 6, i32* %array_cast_i8_to_i32_2
    %array_tmp_begin_i32_2 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_2, i32 1
    %array_addr_2 = bitcast i32* %array_tmp_begin_i32_2 to i32***
    store i32*** %array_addr_2, i32**** @Sum
    %i_5 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition2

for_condition0:                                              ; preds = for_body for_step0 
    %j_0 = load i32, i32* %j_addr
    %slt_0 = icmp slt i32 %j_0, 100001
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 for_end_merge1 
    %j_3 = load i32, i32* %j_addr
    %add_0 = add i32 %j_3, 1
    store i32 %add_0, i32* %j_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %g_1 = load i32***, i32**** @g
    %i_2 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32**, i32*** %g_1, i32 %i_2
    %load_result_0 = load i32**, i32*** %getelementptr_reg_0
    %j_1 = load i32, i32* %j_addr
    %getelementptr_reg_1 = getelementptr inbounds i32*, i32** %load_result_0, i32 %j_1
    %load_result_1 = load i32*, i32** %getelementptr_reg_1
    %mul_bytes_1 = mul i32 15, 4
    %sum_bytes_1 = add i32 %mul_bytes_1, 4
    %malloca_1 = call i8* @_f_malloc(i32 %sum_bytes_1)
    %array_cast_i8_to_i32_1 = bitcast i8* %malloca_1 to i32*
    store i32 15, i32* %array_cast_i8_to_i32_1
    %array_tmp_begin_i32_1 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_1, i32 1
    %array_addr_1 = bitcast i32* %array_tmp_begin_i32_1 to i32*
    store i32* %array_addr_1, i32** %getelementptr_reg_1
    %k = load i32, i32* %k_addr
    store i32 0, i32* %k_addr
    br label %for_condition1

for_end_merge0:                                              ; preds = for_condition0 
    br label %for_step

for_condition1:                                              ; preds = for_body0 for_step1 
    %k_0 = load i32, i32* %k_addr
    %slt_1 = icmp slt i32 %k_0, 15
    br i1 %slt_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 
    %k_2 = load i32, i32* %k_addr
    %add = add i32 %k_2, 1
    store i32 %add, i32* %k_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %g_2 = load i32***, i32**** @g
    %i_3 = load i32, i32* %i_addr
    %getelementptr_reg_2 = getelementptr inbounds i32**, i32*** %g_2, i32 %i_3
    %load_result_2 = load i32**, i32*** %getelementptr_reg_2
    %j_2 = load i32, i32* %j_addr
    %getelementptr_reg_3 = getelementptr inbounds i32*, i32** %load_result_2, i32 %j_2
    %load_result_3 = load i32*, i32** %getelementptr_reg_3
    %k_1 = load i32, i32* %k_addr
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %load_result_3, i32 %k_1
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    store i32 0, i32* %getelementptr_reg_4
    br label %for_step1

for_end_merge1:                                              ; preds = for_condition1 
    br label %for_step0

for_condition2:                                              ; preds = for_end_merge for_step2 
    %i_6 = load i32, i32* %i_addr
    %slt_2 = icmp slt i32 %i_6, 6
    br i1 %slt_2, label %for_body2, label %for_end_merge2

for_step2:                                                   ; preds = for_body2 for_end_merge3 
    %i_10 = load i32, i32* %i_addr
    %add_4 = add i32 %i_10, 1
    store i32 %add_4, i32* %i_addr
    br label %for_condition2

for_body2:                                                   ; preds = for_condition2 
    %Sum_0 = load i32***, i32**** @Sum
    %i_7 = load i32, i32* %i_addr
    %getelementptr_reg_5 = getelementptr inbounds i32**, i32*** %Sum_0, i32 %i_7
    %load_result_5 = load i32**, i32*** %getelementptr_reg_5
    %mul_bytes_3 = mul i32 100001, 8
    %sum_bytes_3 = add i32 %mul_bytes_3, 4
    %malloca_3 = call i8* @_f_malloc(i32 %sum_bytes_3)
    %array_cast_i8_to_i32_3 = bitcast i8* %malloca_3 to i32*
    store i32 100001, i32* %array_cast_i8_to_i32_3
    %array_tmp_begin_i32_3 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_3, i32 1
    %array_addr_3 = bitcast i32* %array_tmp_begin_i32_3 to i32**
    store i32** %array_addr_3, i32*** %getelementptr_reg_5
    %j_4 = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition3

for_end_merge2:                                              ; preds = for_condition2 
    %fm = load i32**, i32*** @fm
    %mul_bytes_5 = mul i32 1001, 8
    %sum_bytes_5 = add i32 %mul_bytes_5, 4
    %malloca_5 = call i8* @_f_malloc(i32 %sum_bytes_5)
    %array_cast_i8_to_i32_5 = bitcast i8* %malloca_5 to i32*
    store i32 1001, i32* %array_cast_i8_to_i32_5
    %array_tmp_begin_i32_5 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_5, i32 1
    %array_addr_5 = bitcast i32* %array_tmp_begin_i32_5 to i32**
    store i32** %array_addr_5, i32*** @fm
    %i_11 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition5

for_condition3:                                              ; preds = for_body2 for_step3 
    %j_5 = load i32, i32* %j_addr
    %slt_3 = icmp slt i32 %j_5, 100001
    br i1 %slt_3, label %for_body3, label %for_end_merge3

for_step3:                                                   ; preds = for_body3 for_end_merge4 
    %j_8 = load i32, i32* %j_addr
    %add_3 = add i32 %j_8, 1
    store i32 %add_3, i32* %j_addr
    br label %for_condition3

for_body3:                                                   ; preds = for_condition3 
    %Sum_1 = load i32***, i32**** @Sum
    %i_8 = load i32, i32* %i_addr
    %getelementptr_reg_6 = getelementptr inbounds i32**, i32*** %Sum_1, i32 %i_8
    %load_result_6 = load i32**, i32*** %getelementptr_reg_6
    %j_6 = load i32, i32* %j_addr
    %getelementptr_reg_7 = getelementptr inbounds i32*, i32** %load_result_6, i32 %j_6
    %load_result_7 = load i32*, i32** %getelementptr_reg_7
    %mul_bytes_4 = mul i32 15, 4
    %sum_bytes_4 = add i32 %mul_bytes_4, 4
    %malloca_4 = call i8* @_f_malloc(i32 %sum_bytes_4)
    %array_cast_i8_to_i32_4 = bitcast i8* %malloca_4 to i32*
    store i32 15, i32* %array_cast_i8_to_i32_4
    %array_tmp_begin_i32_4 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_4, i32 1
    %array_addr_4 = bitcast i32* %array_tmp_begin_i32_4 to i32*
    store i32* %array_addr_4, i32** %getelementptr_reg_7
    %k_3 = load i32, i32* %k_addr
    store i32 0, i32* %k_addr
    br label %for_condition4

for_end_merge3:                                              ; preds = for_condition3 
    br label %for_step2

for_condition4:                                              ; preds = for_body3 for_step4 
    %k_4 = load i32, i32* %k_addr
    %slt_4 = icmp slt i32 %k_4, 15
    br i1 %slt_4, label %for_body4, label %for_end_merge4

for_step4:                                                   ; preds = for_body4 
    %k_6 = load i32, i32* %k_addr
    %add_2 = add i32 %k_6, 1
    store i32 %add_2, i32* %k_addr
    br label %for_condition4

for_body4:                                                   ; preds = for_condition4 
    %Sum_2 = load i32***, i32**** @Sum
    %i_9 = load i32, i32* %i_addr
    %getelementptr_reg_8 = getelementptr inbounds i32**, i32*** %Sum_2, i32 %i_9
    %load_result_8 = load i32**, i32*** %getelementptr_reg_8
    %j_7 = load i32, i32* %j_addr
    %getelementptr_reg_9 = getelementptr inbounds i32*, i32** %load_result_8, i32 %j_7
    %load_result_9 = load i32*, i32** %getelementptr_reg_9
    %k_5 = load i32, i32* %k_addr
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %load_result_9, i32 %k_5
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    store i32 0, i32* %getelementptr_reg_10
    br label %for_step4

for_end_merge4:                                              ; preds = for_condition4 
    br label %for_step3

for_condition5:                                              ; preds = for_end_merge2 for_step5 
    %i_12 = load i32, i32* %i_addr
    %slt_5 = icmp slt i32 %i_12, 1001
    br i1 %slt_5, label %for_body5, label %for_end_merge5

for_step5:                                                   ; preds = for_body5 for_end_merge6 
    %i_15 = load i32, i32* %i_addr
    %add_6 = add i32 %i_15, 1
    store i32 %add_6, i32* %i_addr
    br label %for_condition5

for_body5:                                                   ; preds = for_condition5 
    %fm_0 = load i32**, i32*** @fm
    %i_13 = load i32, i32* %i_addr
    %getelementptr_reg_11 = getelementptr inbounds i32*, i32** %fm_0, i32 %i_13
    %load_result_11 = load i32*, i32** %getelementptr_reg_11
    %mul_bytes_6 = mul i32 13, 4
    %sum_bytes_6 = add i32 %mul_bytes_6, 4
    %malloca_6 = call i8* @_f_malloc(i32 %sum_bytes_6)
    %array_cast_i8_to_i32_6 = bitcast i8* %malloca_6 to i32*
    store i32 13, i32* %array_cast_i8_to_i32_6
    %array_tmp_begin_i32_6 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_6, i32 1
    %array_addr_6 = bitcast i32* %array_tmp_begin_i32_6 to i32*
    store i32* %array_addr_6, i32** %getelementptr_reg_11
    %j_9 = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition6

for_end_merge5:                                              ; preds = for_condition5 
    %ksm = load i32**, i32*** @ksm
    %mul_bytes_7 = mul i32 100001, 8
    %sum_bytes_7 = add i32 %mul_bytes_7, 4
    %malloca_7 = call i8* @_f_malloc(i32 %sum_bytes_7)
    %array_cast_i8_to_i32_7 = bitcast i8* %malloca_7 to i32*
    store i32 100001, i32* %array_cast_i8_to_i32_7
    %array_tmp_begin_i32_7 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_7, i32 1
    %array_addr_7 = bitcast i32* %array_tmp_begin_i32_7 to i32**
    store i32** %array_addr_7, i32*** @ksm
    %i_16 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition7

for_condition6:                                              ; preds = for_body5 for_step6 
    %j_10 = load i32, i32* %j_addr
    %slt_6 = icmp slt i32 %j_10, 13
    br i1 %slt_6, label %for_body6, label %for_end_merge6

for_step6:                                                   ; preds = for_body6 
    %j_12 = load i32, i32* %j_addr
    %add_5 = add i32 %j_12, 1
    store i32 %add_5, i32* %j_addr
    br label %for_condition6

for_body6:                                                   ; preds = for_condition6 
    %fm_1 = load i32**, i32*** @fm
    %i_14 = load i32, i32* %i_addr
    %getelementptr_reg_12 = getelementptr inbounds i32*, i32** %fm_1, i32 %i_14
    %load_result_12 = load i32*, i32** %getelementptr_reg_12
    %j_11 = load i32, i32* %j_addr
    %getelementptr_reg_13 = getelementptr inbounds i32, i32* %load_result_12, i32 %j_11
    %load_result_13 = load i32, i32* %getelementptr_reg_13
    store i32 0, i32* %getelementptr_reg_13
    br label %for_step6

for_end_merge6:                                              ; preds = for_condition6 
    br label %for_step5

for_condition7:                                              ; preds = for_end_merge5 for_step7 
    %i_17 = load i32, i32* %i_addr
    %slt_7 = icmp slt i32 %i_17, 100001
    br i1 %slt_7, label %for_body7, label %for_end_merge7

for_step7:                                                   ; preds = for_body7 for_end_merge8 
    %i_20 = load i32, i32* %i_addr
    %add_8 = add i32 %i_20, 1
    store i32 %add_8, i32* %i_addr
    br label %for_condition7

for_body7:                                                   ; preds = for_condition7 
    %ksm_0 = load i32**, i32*** @ksm
    %i_18 = load i32, i32* %i_addr
    %getelementptr_reg_14 = getelementptr inbounds i32*, i32** %ksm_0, i32 %i_18
    %load_result_14 = load i32*, i32** %getelementptr_reg_14
    %mul_bytes_8 = mul i32 21, 4
    %sum_bytes_8 = add i32 %mul_bytes_8, 4
    %malloca_8 = call i8* @_f_malloc(i32 %sum_bytes_8)
    %array_cast_i8_to_i32_8 = bitcast i8* %malloca_8 to i32*
    store i32 21, i32* %array_cast_i8_to_i32_8
    %array_tmp_begin_i32_8 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_8, i32 1
    %array_addr_8 = bitcast i32* %array_tmp_begin_i32_8 to i32*
    store i32* %array_addr_8, i32** %getelementptr_reg_14
    %j_13 = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition8

for_end_merge7:                                              ; preds = for_condition7 
    %p = load i32**, i32*** @p
    %mul_bytes_9 = mul i32 21, 8
    %sum_bytes_9 = add i32 %mul_bytes_9, 4
    %malloca_9 = call i8* @_f_malloc(i32 %sum_bytes_9)
    %array_cast_i8_to_i32_9 = bitcast i8* %malloca_9 to i32*
    store i32 21, i32* %array_cast_i8_to_i32_9
    %array_tmp_begin_i32_9 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_9, i32 1
    %array_addr_9 = bitcast i32* %array_tmp_begin_i32_9 to i32**
    store i32** %array_addr_9, i32*** @p
    %i_21 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition9

for_condition8:                                              ; preds = for_body7 for_step8 
    %j_14 = load i32, i32* %j_addr
    %slt_8 = icmp slt i32 %j_14, 21
    br i1 %slt_8, label %for_body8, label %for_end_merge8

for_step8:                                                   ; preds = for_body8 
    %j_16 = load i32, i32* %j_addr
    %add_7 = add i32 %j_16, 1
    store i32 %add_7, i32* %j_addr
    br label %for_condition8

for_body8:                                                   ; preds = for_condition8 
    %ksm_1 = load i32**, i32*** @ksm
    %i_19 = load i32, i32* %i_addr
    %getelementptr_reg_15 = getelementptr inbounds i32*, i32** %ksm_1, i32 %i_19
    %load_result_15 = load i32*, i32** %getelementptr_reg_15
    %j_15 = load i32, i32* %j_addr
    %getelementptr_reg_16 = getelementptr inbounds i32, i32* %load_result_15, i32 %j_15
    %load_result_16 = load i32, i32* %getelementptr_reg_16
    store i32 0, i32* %getelementptr_reg_16
    br label %for_step8

for_end_merge8:                                              ; preds = for_condition8 
    br label %for_step7

for_condition9:                                              ; preds = for_end_merge7 for_step9 
    %i_22 = load i32, i32* %i_addr
    %slt_9 = icmp slt i32 %i_22, 21
    br i1 %slt_9, label %for_body9, label %for_end_merge9

for_step9:                                                   ; preds = for_body9 for_end_merge10 
    %i_25 = load i32, i32* %i_addr
    %add_10 = add i32 %i_25, 1
    store i32 %add_10, i32* %i_addr
    br label %for_condition9

for_body9:                                                   ; preds = for_condition9 
    %p_0 = load i32**, i32*** @p
    %i_23 = load i32, i32* %i_addr
    %getelementptr_reg_17 = getelementptr inbounds i32*, i32** %p_0, i32 %i_23
    %load_result_17 = load i32*, i32** %getelementptr_reg_17
    %mul_bytes_10 = mul i32 21, 4
    %sum_bytes_10 = add i32 %mul_bytes_10, 4
    %malloca_10 = call i8* @_f_malloc(i32 %sum_bytes_10)
    %array_cast_i8_to_i32_10 = bitcast i8* %malloca_10 to i32*
    store i32 21, i32* %array_cast_i8_to_i32_10
    %array_tmp_begin_i32_10 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_10, i32 1
    %array_addr_10 = bitcast i32* %array_tmp_begin_i32_10 to i32*
    store i32* %array_addr_10, i32** %getelementptr_reg_17
    %j_17 = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition10

for_end_merge9:                                              ; preds = for_condition9 
    %q = load i32**, i32*** @q
    %mul_bytes_11 = mul i32 21, 8
    %sum_bytes_11 = add i32 %mul_bytes_11, 4
    %malloca_11 = call i8* @_f_malloc(i32 %sum_bytes_11)
    %array_cast_i8_to_i32_11 = bitcast i8* %malloca_11 to i32*
    store i32 21, i32* %array_cast_i8_to_i32_11
    %array_tmp_begin_i32_11 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_11, i32 1
    %array_addr_11 = bitcast i32* %array_tmp_begin_i32_11 to i32**
    store i32** %array_addr_11, i32*** @q
    %i_26 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition11

for_condition10:                                             ; preds = for_body9 for_step10 
    %j_18 = load i32, i32* %j_addr
    %slt_10 = icmp slt i32 %j_18, 21
    br i1 %slt_10, label %for_body10, label %for_end_merge10

for_step10:                                                  ; preds = for_body10 
    %j_20 = load i32, i32* %j_addr
    %add_9 = add i32 %j_20, 1
    store i32 %add_9, i32* %j_addr
    br label %for_condition10

for_body10:                                                  ; preds = for_condition10 
    %p_1 = load i32**, i32*** @p
    %i_24 = load i32, i32* %i_addr
    %getelementptr_reg_18 = getelementptr inbounds i32*, i32** %p_1, i32 %i_24
    %load_result_18 = load i32*, i32** %getelementptr_reg_18
    %j_19 = load i32, i32* %j_addr
    %getelementptr_reg_19 = getelementptr inbounds i32, i32* %load_result_18, i32 %j_19
    %load_result_19 = load i32, i32* %getelementptr_reg_19
    store i32 0, i32* %getelementptr_reg_19
    br label %for_step10

for_end_merge10:                                             ; preds = for_condition10 
    br label %for_step9

for_condition11:                                             ; preds = for_end_merge9 for_step11 
    %i_27 = load i32, i32* %i_addr
    %slt_11 = icmp slt i32 %i_27, 21
    br i1 %slt_11, label %for_body11, label %for_end_merge11

for_step11:                                                  ; preds = for_body11 for_end_merge12 
    %i_30 = load i32, i32* %i_addr
    %add_12 = add i32 %i_30, 1
    store i32 %add_12, i32* %i_addr
    br label %for_condition11

for_body11:                                                  ; preds = for_condition11 
    %q_0 = load i32**, i32*** @q
    %i_28 = load i32, i32* %i_addr
    %getelementptr_reg_20 = getelementptr inbounds i32*, i32** %q_0, i32 %i_28
    %load_result_20 = load i32*, i32** %getelementptr_reg_20
    %mul_bytes_12 = mul i32 100001, 4
    %sum_bytes_12 = add i32 %mul_bytes_12, 4
    %malloca_12 = call i8* @_f_malloc(i32 %sum_bytes_12)
    %array_cast_i8_to_i32_12 = bitcast i8* %malloca_12 to i32*
    store i32 100001, i32* %array_cast_i8_to_i32_12
    %array_tmp_begin_i32_12 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_12, i32 1
    %array_addr_12 = bitcast i32* %array_tmp_begin_i32_12 to i32*
    store i32* %array_addr_12, i32** %getelementptr_reg_20
    %j_21 = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition12

for_end_merge11:                                             ; preds = for_condition11 
    %Comb = load i32**, i32*** @Comb
    %mul_bytes_13 = mul i32 100001, 8
    %sum_bytes_13 = add i32 %mul_bytes_13, 4
    %malloca_13 = call i8* @_f_malloc(i32 %sum_bytes_13)
    %array_cast_i8_to_i32_13 = bitcast i8* %malloca_13 to i32*
    store i32 100001, i32* %array_cast_i8_to_i32_13
    %array_tmp_begin_i32_13 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_13, i32 1
    %array_addr_13 = bitcast i32* %array_tmp_begin_i32_13 to i32**
    store i32** %array_addr_13, i32*** @Comb
    %i_31 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition13

for_condition12:                                             ; preds = for_body11 for_step12 
    %j_22 = load i32, i32* %j_addr
    %slt_12 = icmp slt i32 %j_22, 100001
    br i1 %slt_12, label %for_body12, label %for_end_merge12

for_step12:                                                  ; preds = for_body12 
    %j_24 = load i32, i32* %j_addr
    %add_11 = add i32 %j_24, 1
    store i32 %add_11, i32* %j_addr
    br label %for_condition12

for_body12:                                                  ; preds = for_condition12 
    %q_1 = load i32**, i32*** @q
    %i_29 = load i32, i32* %i_addr
    %getelementptr_reg_21 = getelementptr inbounds i32*, i32** %q_1, i32 %i_29
    %load_result_21 = load i32*, i32** %getelementptr_reg_21
    %j_23 = load i32, i32* %j_addr
    %getelementptr_reg_22 = getelementptr inbounds i32, i32* %load_result_21, i32 %j_23
    %load_result_22 = load i32, i32* %getelementptr_reg_22
    store i32 0, i32* %getelementptr_reg_22
    br label %for_step12

for_end_merge12:                                             ; preds = for_condition12 
    br label %for_step11

for_condition13:                                             ; preds = for_end_merge11 for_step13 
    %i_32 = load i32, i32* %i_addr
    %slt_13 = icmp slt i32 %i_32, 100001
    br i1 %slt_13, label %for_body13, label %for_end_merge13

for_step13:                                                  ; preds = for_body13 for_end_merge14 
    %i_35 = load i32, i32* %i_addr
    %add_14 = add i32 %i_35, 1
    store i32 %add_14, i32* %i_addr
    br label %for_condition13

for_body13:                                                  ; preds = for_condition13 
    %Comb_0 = load i32**, i32*** @Comb
    %i_33 = load i32, i32* %i_addr
    %getelementptr_reg_23 = getelementptr inbounds i32*, i32** %Comb_0, i32 %i_33
    %load_result_23 = load i32*, i32** %getelementptr_reg_23
    %mul_bytes_14 = mul i32 21, 4
    %sum_bytes_14 = add i32 %mul_bytes_14, 4
    %malloca_14 = call i8* @_f_malloc(i32 %sum_bytes_14)
    %array_cast_i8_to_i32_14 = bitcast i8* %malloca_14 to i32*
    store i32 21, i32* %array_cast_i8_to_i32_14
    %array_tmp_begin_i32_14 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_14, i32 1
    %array_addr_14 = bitcast i32* %array_tmp_begin_i32_14 to i32*
    store i32* %array_addr_14, i32** %getelementptr_reg_23
    %j_25 = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition14

for_end_merge13:                                             ; preds = for_condition13 
    %fn = load i32*, i32** @fn
    %mul_bytes_15 = mul i32 1001, 4
    %sum_bytes_15 = add i32 %mul_bytes_15, 4
    %malloca_15 = call i8* @_f_malloc(i32 %sum_bytes_15)
    %array_cast_i8_to_i32_15 = bitcast i8* %malloca_15 to i32*
    store i32 1001, i32* %array_cast_i8_to_i32_15
    %array_tmp_begin_i32_15 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_15, i32 1
    %array_addr_15 = bitcast i32* %array_tmp_begin_i32_15 to i32*
    store i32* %array_addr_15, i32** @fn
    %i_36 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition15

for_condition14:                                             ; preds = for_body13 for_step14 
    %j_26 = load i32, i32* %j_addr
    %slt_14 = icmp slt i32 %j_26, 21
    br i1 %slt_14, label %for_body14, label %for_end_merge14

for_step14:                                                  ; preds = for_body14 
    %j_28 = load i32, i32* %j_addr
    %add_13 = add i32 %j_28, 1
    store i32 %add_13, i32* %j_addr
    br label %for_condition14

for_body14:                                                  ; preds = for_condition14 
    %Comb_1 = load i32**, i32*** @Comb
    %i_34 = load i32, i32* %i_addr
    %getelementptr_reg_24 = getelementptr inbounds i32*, i32** %Comb_1, i32 %i_34
    %load_result_24 = load i32*, i32** %getelementptr_reg_24
    %j_27 = load i32, i32* %j_addr
    %getelementptr_reg_25 = getelementptr inbounds i32, i32* %load_result_24, i32 %j_27
    %load_result_25 = load i32, i32* %getelementptr_reg_25
    store i32 0, i32* %getelementptr_reg_25
    br label %for_step14

for_end_merge14:                                             ; preds = for_condition14 
    br label %for_step13

for_condition15:                                             ; preds = for_end_merge13 for_step15 
    %i_37 = load i32, i32* %i_addr
    %slt_15 = icmp slt i32 %i_37, 1001
    br i1 %slt_15, label %for_body15, label %for_end_merge15

for_step15:                                                  ; preds = for_body15 
    %i_39 = load i32, i32* %i_addr
    %add_15 = add i32 %i_39, 1
    store i32 %add_15, i32* %i_addr
    br label %for_condition15

for_body15:                                                  ; preds = for_condition15 
    %fn_0 = load i32*, i32** @fn
    %i_38 = load i32, i32* %i_addr
    %getelementptr_reg_26 = getelementptr inbounds i32, i32* %fn_0, i32 %i_38
    %load_result_26 = load i32, i32* %getelementptr_reg_26
    store i32 0, i32* %getelementptr_reg_26
    br label %for_step15

for_end_merge15:                                             ; preds = for_condition15 
    %fc = load i32*, i32** @fc
    %mul_bytes_16 = mul i32 1001, 4
    %sum_bytes_16 = add i32 %mul_bytes_16, 4
    %malloca_16 = call i8* @_f_malloc(i32 %sum_bytes_16)
    %array_cast_i8_to_i32_16 = bitcast i8* %malloca_16 to i32*
    store i32 1001, i32* %array_cast_i8_to_i32_16
    %array_tmp_begin_i32_16 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_16, i32 1
    %array_addr_16 = bitcast i32* %array_tmp_begin_i32_16 to i32*
    store i32* %array_addr_16, i32** @fc
    %i_40 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition16

for_condition16:                                             ; preds = for_end_merge15 for_step16 
    %i_41 = load i32, i32* %i_addr
    %slt_16 = icmp slt i32 %i_41, 1001
    br i1 %slt_16, label %for_body16, label %for_end_merge16

for_step16:                                                  ; preds = for_body16 
    %i_43 = load i32, i32* %i_addr
    %add_16 = add i32 %i_43, 1
    store i32 %add_16, i32* %i_addr
    br label %for_condition16

for_body16:                                                  ; preds = for_condition16 
    %fc_0 = load i32*, i32** @fc
    %i_42 = load i32, i32* %i_addr
    %getelementptr_reg_27 = getelementptr inbounds i32, i32* %fc_0, i32 %i_42
    %load_result_27 = load i32, i32* %getelementptr_reg_27
    store i32 0, i32* %getelementptr_reg_27
    br label %for_step16

for_end_merge16:                                             ; preds = for_condition16 
    %m = load i32*, i32** @m
    %mul_bytes_17 = mul i32 1001, 4
    %sum_bytes_17 = add i32 %mul_bytes_17, 4
    %malloca_17 = call i8* @_f_malloc(i32 %sum_bytes_17)
    %array_cast_i8_to_i32_17 = bitcast i8* %malloca_17 to i32*
    store i32 1001, i32* %array_cast_i8_to_i32_17
    %array_tmp_begin_i32_17 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_17, i32 1
    %array_addr_17 = bitcast i32* %array_tmp_begin_i32_17 to i32*
    store i32* %array_addr_17, i32** @m
    %i_44 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition17

for_condition17:                                             ; preds = for_end_merge16 for_step17 
    %i_45 = load i32, i32* %i_addr
    %slt_17 = icmp slt i32 %i_45, 1001
    br i1 %slt_17, label %for_body17, label %for_end_merge17

for_step17:                                                  ; preds = for_body17 
    %i_47 = load i32, i32* %i_addr
    %add_17 = add i32 %i_47, 1
    store i32 %add_17, i32* %i_addr
    br label %for_condition17

for_body17:                                                  ; preds = for_condition17 
    %m_0 = load i32*, i32** @m
    %i_46 = load i32, i32* %i_addr
    %getelementptr_reg_28 = getelementptr inbounds i32, i32* %m_0, i32 %i_46
    %load_result_28 = load i32, i32* %getelementptr_reg_28
    store i32 0, i32* %getelementptr_reg_28
    br label %for_step17

for_end_merge17:                                             ; preds = for_condition17 
    %res = load i32*, i32** @res
    %mul_bytes_18 = mul i32 1001, 4
    %sum_bytes_18 = add i32 %mul_bytes_18, 4
    %malloca_18 = call i8* @_f_malloc(i32 %sum_bytes_18)
    %array_cast_i8_to_i32_18 = bitcast i8* %malloca_18 to i32*
    store i32 1001, i32* %array_cast_i8_to_i32_18
    %array_tmp_begin_i32_18 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_18, i32 1
    %array_addr_18 = bitcast i32* %array_tmp_begin_i32_18 to i32*
    store i32* %array_addr_18, i32** @res
    %i_48 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition18

for_condition18:                                             ; preds = for_end_merge17 for_step18 
    %i_49 = load i32, i32* %i_addr
    %slt_18 = icmp slt i32 %i_49, 1001
    br i1 %slt_18, label %for_body18, label %for_end_merge18

for_step18:                                                  ; preds = for_body18 
    %i_51 = load i32, i32* %i_addr
    %add_18 = add i32 %i_51, 1
    store i32 %add_18, i32* %i_addr
    br label %for_condition18

for_body18:                                                  ; preds = for_condition18 
    %res_0 = load i32*, i32** @res
    %i_50 = load i32, i32* %i_addr
    %getelementptr_reg_29 = getelementptr inbounds i32, i32* %res_0, i32 %i_50
    %load_result_29 = load i32, i32* %getelementptr_reg_29
    store i32 0, i32* %getelementptr_reg_29
    br label %for_step18

for_end_merge18:                                             ; preds = for_condition18 
    %b = load i32*, i32** @b
    %mul_bytes_19 = mul i32 1001, 4
    %sum_bytes_19 = add i32 %mul_bytes_19, 4
    %malloca_19 = call i8* @_f_malloc(i32 %sum_bytes_19)
    %array_cast_i8_to_i32_19 = bitcast i8* %malloca_19 to i32*
    store i32 1001, i32* %array_cast_i8_to_i32_19
    %array_tmp_begin_i32_19 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_19, i32 1
    %array_addr_19 = bitcast i32* %array_tmp_begin_i32_19 to i32*
    store i32* %array_addr_19, i32** @b
    %i_52 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition19

for_condition19:                                             ; preds = for_end_merge18 for_step19 
    %i_53 = load i32, i32* %i_addr
    %slt_19 = icmp slt i32 %i_53, 1001
    br i1 %slt_19, label %for_body19, label %for_end_merge19

for_step19:                                                  ; preds = for_body19 
    %i_55 = load i32, i32* %i_addr
    %add_19 = add i32 %i_55, 1
    store i32 %add_19, i32* %i_addr
    br label %for_condition19

for_body19:                                                  ; preds = for_condition19 
    %b_0 = load i32*, i32** @b
    %i_54 = load i32, i32* %i_addr
    %getelementptr_reg_30 = getelementptr inbounds i32, i32* %b_0, i32 %i_54
    %load_result_30 = load i32, i32* %getelementptr_reg_30
    store i32 0, i32* %getelementptr_reg_30
    br label %for_step19

for_end_merge19:                                             ; preds = for_condition19 
    %v = load i32*, i32** @v
    %mul_bytes_20 = mul i32 100001, 4
    %sum_bytes_20 = add i32 %mul_bytes_20, 4
    %malloca_20 = call i8* @_f_malloc(i32 %sum_bytes_20)
    %array_cast_i8_to_i32_20 = bitcast i8* %malloca_20 to i32*
    store i32 100001, i32* %array_cast_i8_to_i32_20
    %array_tmp_begin_i32_20 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_20, i32 1
    %array_addr_20 = bitcast i32* %array_tmp_begin_i32_20 to i32*
    store i32* %array_addr_20, i32** @v
    %i_56 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition20

for_condition20:                                             ; preds = for_end_merge19 for_step20 
    %i_57 = load i32, i32* %i_addr
    %slt_20 = icmp slt i32 %i_57, 100001
    br i1 %slt_20, label %for_body20, label %for_end_merge20

for_step20:                                                  ; preds = for_body20 
    %i_59 = load i32, i32* %i_addr
    %add_20 = add i32 %i_59, 1
    store i32 %add_20, i32* %i_addr
    br label %for_condition20

for_body20:                                                  ; preds = for_condition20 
    %v_0 = load i32*, i32** @v
    %i_58 = load i32, i32* %i_addr
    %getelementptr_reg_31 = getelementptr inbounds i32, i32* %v_0, i32 %i_58
    %load_result_31 = load i32, i32* %getelementptr_reg_31
    store i32 0, i32* %getelementptr_reg_31
    br label %for_step20

for_end_merge20:                                             ; preds = for_condition20 
    %prime = load i32*, i32** @prime
    %mul_bytes_21 = mul i32 100001, 4
    %sum_bytes_21 = add i32 %mul_bytes_21, 4
    %malloca_21 = call i8* @_f_malloc(i32 %sum_bytes_21)
    %array_cast_i8_to_i32_21 = bitcast i8* %malloca_21 to i32*
    store i32 100001, i32* %array_cast_i8_to_i32_21
    %array_tmp_begin_i32_21 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_21, i32 1
    %array_addr_21 = bitcast i32* %array_tmp_begin_i32_21 to i32*
    store i32* %array_addr_21, i32** @prime
    %i_60 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition21

for_condition21:                                             ; preds = for_end_merge20 for_step21 
    %i_61 = load i32, i32* %i_addr
    %slt_21 = icmp slt i32 %i_61, 100001
    br i1 %slt_21, label %for_body21, label %for_end_merge21

for_step21:                                                  ; preds = for_body21 
    %i_63 = load i32, i32* %i_addr
    %add_21 = add i32 %i_63, 1
    store i32 %add_21, i32* %i_addr
    br label %for_condition21

for_body21:                                                  ; preds = for_condition21 
    %prime_0 = load i32*, i32** @prime
    %i_62 = load i32, i32* %i_addr
    %getelementptr_reg_32 = getelementptr inbounds i32, i32* %prime_0, i32 %i_62
    %load_result_32 = load i32, i32* %getelementptr_reg_32
    store i32 0, i32* %getelementptr_reg_32
    br label %for_step21

for_end_merge21:                                             ; preds = for_condition21 
    br label %return_block0

return_block0:                                               ; preds = for_end_merge21 
    ret void
}
define dso_local i32 @Ksm(i32 %P_para,i32 %x_para) {
entrance_block0:                                             
    %tmp_addr = alloca i32
    %x_addr = alloca i32
    %P_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %P_para, i32* %P_addr
    store i32 %x_para, i32* %x_addr
    %x = load i32, i32* %x_addr
    %eq = icmp eq i32 %x, 0
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i32 1, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %x_0 = load i32, i32* %x_addr
    %eq_0 = icmp eq i32 %x_0, 1
    br i1 %eq_0, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

single_then_basicblock0:                                     ; preds = if_withoutelse_end_basicblock 
    %P = load i32, i32* %P_addr
    %Mod = load i32, i32* @Mod
    %srem = srem i32 %P, %Mod
    store i32 %srem, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 if_withoutelse_end_basicblock 
    %tmp = load i32, i32* %tmp_addr
    %P_0 = load i32, i32* %P_addr
    %x_1 = load i32, i32* %x_addr
    %ashr = ashr i32 %x_1, 1
    %call_Ksm = call i32 @Ksm(i32 %P_0, i32 %ashr)
    store i32 %call_Ksm, i32* %tmp_addr
    %x_2 = load i32, i32* %x_addr
    %srem_0 = srem i32 %x_2, 2
    %eq_1 = icmp eq i32 %srem_0, 1
    br i1 %eq_1, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = if_withoutelse_end_basicblock0 
    %tmp_0 = load i32, i32* %tmp_addr
    %tmp_1 = load i32, i32* %tmp_addr
    %mul = mul i32 %tmp_0, %tmp_1
    %Mod_0 = load i32, i32* @Mod
    %srem_1 = srem i32 %mul, %Mod_0
    %P_1 = load i32, i32* %P_addr
    %mul_0 = mul i32 %srem_1, %P_1
    %Mod_1 = load i32, i32* @Mod
    %srem_2 = srem i32 %mul_0, %Mod_1
    store i32 %srem_2, i32* %return_register_infunction_addr
    br label %return_block0

else_basicblock:                                             ; preds = if_withoutelse_end_basicblock0 
    %tmp_2 = load i32, i32* %tmp_addr
    %tmp_3 = load i32, i32* %tmp_addr
    %mul_1 = mul i32 %tmp_2, %tmp_3
    %Mod_2 = load i32, i32* @Mod
    %srem_3 = srem i32 %mul_1, %Mod_2
    store i32 %srem_3, i32* %return_register_infunction_addr
    br label %return_block0

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock single_then_basicblock0 then_basicblock else_basicblock if_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @Calculate_p() {
entrance_block0:                                             
    %tmp_addr = alloca i32
    %j_addr = alloca i32
    %i_addr = alloca i32
    %p = load i32**, i32*** @p
    %getelementptr_reg = getelementptr inbounds i32*, i32** %p, i32 0
    %load_result = load i32*, i32** %getelementptr_reg
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_result, i32 0
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 1, i32* %getelementptr_reg_0
    %p_0 = load i32**, i32*** @p
    %getelementptr_reg_1 = getelementptr inbounds i32*, i32** %p_0, i32 1
    %load_result_1 = load i32*, i32** %getelementptr_reg_1
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %load_result_1, i32 1
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    store i32 1, i32* %getelementptr_reg_2
    %p_1 = load i32**, i32*** @p
    %getelementptr_reg_3 = getelementptr inbounds i32*, i32** %p_1, i32 1
    %load_result_3 = load i32*, i32** %getelementptr_reg_3
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %load_result_3, i32 0
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %Mod = load i32, i32* @Mod
    %sub = sub i32 %Mod, 1
    store i32 %sub, i32* %getelementptr_reg_4
    %i = load i32, i32* %i_addr
    store i32 2, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %C = load i32, i32* @C
    %sub_0 = sub i32 %C, 2
    %sle = icmp sle i32 %i_0, %sub_0
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge1 
    %i_10 = load i32, i32* %i_addr
    %add_3 = add i32 %i_10, 1
    store i32 %add_3, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %tmp = load i32, i32* %tmp_addr
    %i_1 = load i32, i32* %i_addr
    %Mod_0 = load i32, i32* @Mod
    %sub_1 = sub i32 %Mod_0, 2
    %call_Ksm = call i32 @Ksm(i32 %i_1, i32 %sub_1)
    store i32 %call_Ksm, i32* %tmp_addr
    %j = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %j_0 = load i32, i32* %j_addr
    %i_2 = load i32, i32* %i_addr
    %slt = icmp slt i32 %j_0, %i_2
    br i1 %slt, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %j_3 = load i32, i32* %j_addr
    %add_0 = add i32 %j_3, 1
    store i32 %add_0, i32* %j_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %p_2 = load i32**, i32*** @p
    %i_3 = load i32, i32* %i_addr
    %getelementptr_reg_5 = getelementptr inbounds i32*, i32** %p_2, i32 %i_3
    %load_result_5 = load i32*, i32** %getelementptr_reg_5
    %j_1 = load i32, i32* %j_addr
    %add = add i32 %j_1, 1
    %getelementptr_reg_6 = getelementptr inbounds i32, i32* %load_result_5, i32 %add
    %load_result_6 = load i32, i32* %getelementptr_reg_6
    %p_3 = load i32**, i32*** @p
    %i_4 = load i32, i32* %i_addr
    %sub_2 = sub i32 %i_4, 1
    %getelementptr_reg_7 = getelementptr inbounds i32*, i32** %p_3, i32 %sub_2
    %load_result_7 = load i32*, i32** %getelementptr_reg_7
    %j_2 = load i32, i32* %j_addr
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %load_result_7, i32 %j_2
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    store i32 %load_result_8, i32* %getelementptr_reg_6
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    %j_4 = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition1

for_condition1:                                              ; preds = for_end_merge0 for_step1 
    %j_5 = load i32, i32* %j_addr
    %i_5 = load i32, i32* %i_addr
    %sle_0 = icmp sle i32 %j_5, %i_5
    br i1 %sle_0, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 
    %j_9 = load i32, i32* %j_addr
    %add_2 = add i32 %j_9, 1
    store i32 %add_2, i32* %j_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %p_4 = load i32**, i32*** @p
    %i_6 = load i32, i32* %i_addr
    %getelementptr_reg_9 = getelementptr inbounds i32*, i32** %p_4, i32 %i_6
    %load_result_9 = load i32*, i32** %getelementptr_reg_9
    %j_6 = load i32, i32* %j_addr
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %load_result_9, i32 %j_6
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    %p_5 = load i32**, i32*** @p
    %i_7 = load i32, i32* %i_addr
    %getelementptr_reg_11 = getelementptr inbounds i32*, i32** %p_5, i32 %i_7
    %load_result_11 = load i32*, i32** %getelementptr_reg_11
    %j_7 = load i32, i32* %j_addr
    %getelementptr_reg_12 = getelementptr inbounds i32, i32* %load_result_11, i32 %j_7
    %load_result_12 = load i32, i32* %getelementptr_reg_12
    %p_6 = load i32**, i32*** @p
    %i_8 = load i32, i32* %i_addr
    %sub_3 = sub i32 %i_8, 1
    %getelementptr_reg_13 = getelementptr inbounds i32*, i32** %p_6, i32 %sub_3
    %load_result_13 = load i32*, i32** %getelementptr_reg_13
    %j_8 = load i32, i32* %j_addr
    %getelementptr_reg_14 = getelementptr inbounds i32, i32* %load_result_13, i32 %j_8
    %load_result_14 = load i32, i32* %getelementptr_reg_14
    %i_9 = load i32, i32* %i_addr
    %mul = mul i32 %load_result_14, %i_9
    %Mod_1 = load i32, i32* @Mod
    %srem = srem i32 %mul, %Mod_1
    %sub_4 = sub i32 %load_result_12, %srem
    %Mod_2 = load i32, i32* @Mod
    %add_1 = add i32 %sub_4, %Mod_2
    %tmp_0 = load i32, i32* %tmp_addr
    %mul_0 = mul i32 %add_1, %tmp_0
    %Mod_3 = load i32, i32* @Mod
    %srem_0 = srem i32 %mul_0, %Mod_3
    store i32 %srem_0, i32* %getelementptr_reg_10
    br label %for_step1

for_end_merge1:                                              ; preds = for_condition1 
    br label %for_step

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local void @Calculate_Comb() {
entrance_block0:                                             
    %j_addr = alloca i32
    %i_addr = alloca i32
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %M = load i32, i32* @M
    %sle = icmp sle i32 %i_0, %M
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %Comb = load i32**, i32*** @Comb
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32*, i32** %Comb, i32 %i_1
    %load_result = load i32*, i32** %getelementptr_reg
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_result, i32 0
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 1, i32* %getelementptr_reg_0
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %i_3 = load i32, i32* %i_addr
    store i32 1, i32* %i_addr
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %i_4 = load i32, i32* %i_addr
    %M_0 = load i32, i32* @M
    %sle_0 = icmp sle i32 %i_4, %M_0
    br i1 %sle_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 for_end_merge1 
    %i_11 = load i32, i32* %i_addr
    %add_2 = add i32 %i_11, 1
    store i32 %add_2, i32* %i_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %j = load i32, i32* %j_addr
    store i32 1, i32* %j_addr
    br label %for_condition1

for_end_merge0:                                              ; preds = for_condition0 
    br label %return_block0

for_condition1:                                              ; preds = for_body0 for_step1 
    %j_0 = load i32, i32* %j_addr
    %C = load i32, i32* @C
    %sle_1 = icmp sle i32 %j_0, %C
    br i1 %sle_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 if_withoutelse_end_basicblock 
    %j_7 = load i32, i32* %j_addr
    %add_1 = add i32 %j_7, 1
    store i32 %add_1, i32* %j_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %Comb_0 = load i32**, i32*** @Comb
    %i_5 = load i32, i32* %i_addr
    %getelementptr_reg_1 = getelementptr inbounds i32*, i32** %Comb_0, i32 %i_5
    %load_result_1 = load i32*, i32** %getelementptr_reg_1
    %j_1 = load i32, i32* %j_addr
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %load_result_1, i32 %j_1
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %Comb_1 = load i32**, i32*** @Comb
    %i_6 = load i32, i32* %i_addr
    %sub = sub i32 %i_6, 1
    %getelementptr_reg_3 = getelementptr inbounds i32*, i32** %Comb_1, i32 %sub
    %load_result_3 = load i32*, i32** %getelementptr_reg_3
    %j_2 = load i32, i32* %j_addr
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %load_result_3, i32 %j_2
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %Comb_2 = load i32**, i32*** @Comb
    %i_7 = load i32, i32* %i_addr
    %sub_0 = sub i32 %i_7, 1
    %getelementptr_reg_5 = getelementptr inbounds i32*, i32** %Comb_2, i32 %sub_0
    %load_result_5 = load i32*, i32** %getelementptr_reg_5
    %j_3 = load i32, i32* %j_addr
    %sub_1 = sub i32 %j_3, 1
    %getelementptr_reg_6 = getelementptr inbounds i32, i32* %load_result_5, i32 %sub_1
    %load_result_6 = load i32, i32* %getelementptr_reg_6
    %add_0 = add i32 %load_result_4, %load_result_6
    store i32 %add_0, i32* %getelementptr_reg_2
    %Comb_3 = load i32**, i32*** @Comb
    %i_8 = load i32, i32* %i_addr
    %getelementptr_reg_7 = getelementptr inbounds i32*, i32** %Comb_3, i32 %i_8
    %load_result_7 = load i32*, i32** %getelementptr_reg_7
    %j_4 = load i32, i32* %j_addr
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %load_result_7, i32 %j_4
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    %Mod = load i32, i32* @Mod
    %sge = icmp sge i32 %load_result_8, %Mod
    br i1 %sge, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge1:                                              ; preds = for_condition1 
    br label %for_step0

single_then_basicblock:                                      ; preds = for_body1 
    %Comb_4 = load i32**, i32*** @Comb
    %i_9 = load i32, i32* %i_addr
    %getelementptr_reg_9 = getelementptr inbounds i32*, i32** %Comb_4, i32 %i_9
    %load_result_9 = load i32*, i32** %getelementptr_reg_9
    %j_5 = load i32, i32* %j_addr
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %load_result_9, i32 %j_5
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    %Comb_5 = load i32**, i32*** @Comb
    %i_10 = load i32, i32* %i_addr
    %getelementptr_reg_11 = getelementptr inbounds i32*, i32** %Comb_5, i32 %i_10
    %load_result_11 = load i32*, i32** %getelementptr_reg_11
    %j_6 = load i32, i32* %j_addr
    %getelementptr_reg_12 = getelementptr inbounds i32, i32* %load_result_11, i32 %j_6
    %load_result_12 = load i32, i32* %getelementptr_reg_12
    %Mod_0 = load i32, i32* @Mod
    %sub_2 = sub i32 %load_result_12, %Mod_0
    store i32 %sub_2, i32* %getelementptr_reg_10
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body1 
    br label %for_step1

return_block0:                                               ; preds = for_end_merge0 
    ret void
}
define dso_local void @Euler(i32 %x_para) {
entrance_block0:                                             
    %AND_addr = alloca i1
    %j_addr = alloca i32
    %i_addr = alloca i32
    %x_addr = alloca i32
    store i32 %x_para, i32* %x_addr
    %tot = load i32, i32* @tot
    store i32 0, i32* @tot
    %q = load i32**, i32*** @q
    %x = load i32, i32* %x_addr
    %getelementptr_reg = getelementptr inbounds i32*, i32** %q, i32 %x
    %load_result = load i32*, i32** %getelementptr_reg
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_result, i32 1
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 1, i32* %getelementptr_reg_0
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %slt = icmp slt i32 %i_0, 100001
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %v = load i32*, i32** @v
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %v, i32 %i_1
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    store i32 0, i32* %getelementptr_reg_1
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %i_3 = load i32, i32* %i_addr
    store i32 2, i32* %i_addr
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %i_4 = load i32, i32* %i_addr
    %M = load i32, i32* @M
    %sle = icmp sle i32 %i_4, %M
    br i1 %sle, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 for_end_merge1 
    %i_16 = load i32, i32* %i_addr
    %add_3 = add i32 %i_16, 1
    store i32 %add_3, i32* %i_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %v_0 = load i32*, i32** @v
    %i_5 = load i32, i32* %i_addr
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %v_0, i32 %i_5
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %eq = icmp eq i32 %load_result_2, 0
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge0:                                              ; preds = for_condition0 
    br label %return_block0

single_then_basicblock:                                      ; preds = for_body0 
    %prime = load i32*, i32** @prime
    %tot_0 = load i32, i32* @tot
    %add_0 = add i32 %tot_0, 1
    store i32 %add_0, i32* @tot
    %getelementptr_reg_3 = getelementptr inbounds i32, i32* %prime, i32 %add_0
    %load_result_3 = load i32, i32* %getelementptr_reg_3
    %i_6 = load i32, i32* %i_addr
    store i32 %i_6, i32* %getelementptr_reg_3
    %q_0 = load i32**, i32*** @q
    %x_0 = load i32, i32* %x_addr
    %getelementptr_reg_4 = getelementptr inbounds i32*, i32** %q_0, i32 %x_0
    %load_result_4 = load i32*, i32** %getelementptr_reg_4
    %i_7 = load i32, i32* %i_addr
    %getelementptr_reg_5 = getelementptr inbounds i32, i32* %load_result_4, i32 %i_7
    %load_result_5 = load i32, i32* %getelementptr_reg_5
    %ksm = load i32**, i32*** @ksm
    %i_8 = load i32, i32* %i_addr
    %getelementptr_reg_6 = getelementptr inbounds i32*, i32** %ksm, i32 %i_8
    %load_result_6 = load i32*, i32** %getelementptr_reg_6
    %x_1 = load i32, i32* %x_addr
    %getelementptr_reg_7 = getelementptr inbounds i32, i32* %load_result_6, i32 %x_1
    %load_result_7 = load i32, i32* %getelementptr_reg_7
    %Mod = load i32, i32* @Mod
    %add_1 = add i32 %load_result_7, %Mod
    %sub = sub i32 %add_1, 1
    %Mod_0 = load i32, i32* @Mod
    %srem = srem i32 %sub, %Mod_0
    store i32 %srem, i32* %getelementptr_reg_5
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body0 
    %j = load i32, i32* %j_addr
    store i32 1, i32* %j_addr
    br label %for_condition1

for_condition1:                                              ; preds = if_withoutelse_end_basicblock for_step1 
    %j_0 = load i32, i32* %j_addr
    %tot_1 = load i32, i32* @tot
    %sle_0 = icmp sle i32 %j_0, %tot_1
    store i1 %sle_0, i1* %AND_addr
    br i1 %sle_0, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

for_step1:                                                   ; preds = for_body1 if_end_basicblock 
    %j_8 = load i32, i32* %j_addr
    %add_2 = add i32 %j_8, 1
    store i32 %add_2, i32* %j_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 short_circuit_AND_end_AND 
    %v_1 = load i32*, i32** @v
    %prime_1 = load i32*, i32** @prime
    %j_2 = load i32, i32* %j_addr
    %getelementptr_reg_9 = getelementptr inbounds i32, i32* %prime_1, i32 %j_2
    %load_result_9 = load i32, i32* %getelementptr_reg_9
    %i_10 = load i32, i32* %i_addr
    %mul_0 = mul i32 %load_result_9, %i_10
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %v_1, i32 %mul_0
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    store i32 1, i32* %getelementptr_reg_10
    %i_11 = load i32, i32* %i_addr
    %prime_2 = load i32*, i32** @prime
    %j_3 = load i32, i32* %j_addr
    %getelementptr_reg_11 = getelementptr inbounds i32, i32* %prime_2, i32 %j_3
    %load_result_11 = load i32, i32* %getelementptr_reg_11
    %srem_0 = srem i32 %i_11, %load_result_11
    %eq_0 = icmp eq i32 %srem_0, 0
    br i1 %eq_0, label %then_basicblock, label %else_basicblock

for_end_merge1:                                              ; preds = for_condition1 short_circuit_AND_end_AND then_basicblock 
    br label %for_step0

short_circuit_AND_end_AND:                                   ; preds = for_condition1 short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %for_body1, label %for_end_merge1

short_circuit_AND_branch_AND:                                ; preds = for_condition1 
    %prime_0 = load i32*, i32** @prime
    %j_1 = load i32, i32* %j_addr
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %prime_0, i32 %j_1
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    %i_9 = load i32, i32* %i_addr
    %mul = mul i32 %load_result_8, %i_9
    %M_0 = load i32, i32* @M
    %sle_1 = icmp sle i32 %mul, %M_0
    store i1 %sle_1, i1* %AND_addr
    br label %short_circuit_AND_end_AND

then_basicblock:                                             ; preds = for_body1 
    %q_1 = load i32**, i32*** @q
    %x_2 = load i32, i32* %x_addr
    %getelementptr_reg_12 = getelementptr inbounds i32*, i32** %q_1, i32 %x_2
    %load_result_12 = load i32*, i32** %getelementptr_reg_12
    %i_12 = load i32, i32* %i_addr
    %prime_3 = load i32*, i32** @prime
    %j_4 = load i32, i32* %j_addr
    %getelementptr_reg_13 = getelementptr inbounds i32, i32* %prime_3, i32 %j_4
    %load_result_13 = load i32, i32* %getelementptr_reg_13
    %mul_1 = mul i32 %i_12, %load_result_13
    %getelementptr_reg_14 = getelementptr inbounds i32, i32* %load_result_12, i32 %mul_1
    %load_result_14 = load i32, i32* %getelementptr_reg_14
    %q_2 = load i32**, i32*** @q
    %x_3 = load i32, i32* %x_addr
    %getelementptr_reg_15 = getelementptr inbounds i32*, i32** %q_2, i32 %x_3
    %load_result_15 = load i32*, i32** %getelementptr_reg_15
    %i_13 = load i32, i32* %i_addr
    %getelementptr_reg_16 = getelementptr inbounds i32, i32* %load_result_15, i32 %i_13
    %load_result_16 = load i32, i32* %getelementptr_reg_16
    %ksm_0 = load i32**, i32*** @ksm
    %prime_4 = load i32*, i32** @prime
    %j_5 = load i32, i32* %j_addr
    %getelementptr_reg_17 = getelementptr inbounds i32, i32* %prime_4, i32 %j_5
    %load_result_17 = load i32, i32* %getelementptr_reg_17
    %getelementptr_reg_18 = getelementptr inbounds i32*, i32** %ksm_0, i32 %load_result_17
    %load_result_18 = load i32*, i32** %getelementptr_reg_18
    %x_4 = load i32, i32* %x_addr
    %getelementptr_reg_19 = getelementptr inbounds i32, i32* %load_result_18, i32 %x_4
    %load_result_19 = load i32, i32* %getelementptr_reg_19
    %mul_2 = mul i32 %load_result_16, %load_result_19
    %Mod_1 = load i32, i32* @Mod
    %srem_1 = srem i32 %mul_2, %Mod_1
    store i32 %srem_1, i32* %getelementptr_reg_14
    br label %for_end_merge1

else_basicblock:                                             ; preds = for_body1 
    %q_3 = load i32**, i32*** @q
    %x_5 = load i32, i32* %x_addr
    %getelementptr_reg_20 = getelementptr inbounds i32*, i32** %q_3, i32 %x_5
    %load_result_20 = load i32*, i32** %getelementptr_reg_20
    %i_14 = load i32, i32* %i_addr
    %prime_5 = load i32*, i32** @prime
    %j_6 = load i32, i32* %j_addr
    %getelementptr_reg_21 = getelementptr inbounds i32, i32* %prime_5, i32 %j_6
    %load_result_21 = load i32, i32* %getelementptr_reg_21
    %mul_3 = mul i32 %i_14, %load_result_21
    %getelementptr_reg_22 = getelementptr inbounds i32, i32* %load_result_20, i32 %mul_3
    %load_result_22 = load i32, i32* %getelementptr_reg_22
    %q_4 = load i32**, i32*** @q
    %x_6 = load i32, i32* %x_addr
    %getelementptr_reg_23 = getelementptr inbounds i32*, i32** %q_4, i32 %x_6
    %load_result_23 = load i32*, i32** %getelementptr_reg_23
    %i_15 = load i32, i32* %i_addr
    %getelementptr_reg_24 = getelementptr inbounds i32, i32* %load_result_23, i32 %i_15
    %load_result_24 = load i32, i32* %getelementptr_reg_24
    %q_5 = load i32**, i32*** @q
    %x_7 = load i32, i32* %x_addr
    %getelementptr_reg_25 = getelementptr inbounds i32*, i32** %q_5, i32 %x_7
    %load_result_25 = load i32*, i32** %getelementptr_reg_25
    %prime_6 = load i32*, i32** @prime
    %j_7 = load i32, i32* %j_addr
    %getelementptr_reg_26 = getelementptr inbounds i32, i32* %prime_6, i32 %j_7
    %load_result_26 = load i32, i32* %getelementptr_reg_26
    %getelementptr_reg_27 = getelementptr inbounds i32, i32* %load_result_25, i32 %load_result_26
    %load_result_27 = load i32, i32* %getelementptr_reg_27
    %mul_4 = mul i32 %load_result_24, %load_result_27
    %Mod_2 = load i32, i32* @Mod
    %srem_2 = srem i32 %mul_4, %Mod_2
    store i32 %srem_2, i32* %getelementptr_reg_22
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %for_step1

return_block0:                                               ; preds = for_end_merge0 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %j_addr = alloca i32
    %tmp3_addr = alloca i32
    %tmp2_addr = alloca i32
    %tmp1_addr = alloca i32
    %get_addr = alloca i32
    %i_addr = alloca i32
    %tmp_addr = alloca i32
    %temp_addr = alloca i32
    %r_addr = alloca i32
    %l_addr = alloca i32
    %ans_addr = alloca i32
    %ii_addr = alloca i32
    %rp_addr = alloca i32
    %c_addr = alloca i32
    %n_addr = alloca i32
    %T_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %T = load i32, i32* %T_addr
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* %T_addr
    call void @init()
    %fn = load i32*, i32** @fn
    %getelementptr_reg = getelementptr inbounds i32, i32* %fn, i32 1
    %load_result = load i32, i32* %getelementptr_reg
    store i32 2, i32* %getelementptr_reg
    %fc = load i32*, i32** @fc
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %fc, i32 1
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 3, i32* %getelementptr_reg_0
    %fm = load i32**, i32*** @fm
    %getelementptr_reg_1 = getelementptr inbounds i32*, i32** %fm, i32 1
    %load_result_1 = load i32*, i32** %getelementptr_reg_1
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %load_result_1, i32 1
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    store i32 3, i32* %getelementptr_reg_2
    %fm_0 = load i32**, i32*** @fm
    %getelementptr_reg_3 = getelementptr inbounds i32*, i32** %fm_0, i32 1
    %load_result_3 = load i32*, i32** %getelementptr_reg_3
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %load_result_3, i32 2
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    store i32 4, i32* %getelementptr_reg_4
    %fn_0 = load i32*, i32** @fn
    %getelementptr_reg_5 = getelementptr inbounds i32, i32* %fn_0, i32 2
    %load_result_5 = load i32, i32* %getelementptr_reg_5
    store i32 3, i32* %getelementptr_reg_5
    %fc_0 = load i32*, i32** @fc
    %getelementptr_reg_6 = getelementptr inbounds i32, i32* %fc_0, i32 2
    %load_result_6 = load i32, i32* %getelementptr_reg_6
    store i32 3, i32* %getelementptr_reg_6
    %fm_1 = load i32**, i32*** @fm
    %getelementptr_reg_7 = getelementptr inbounds i32*, i32** %fm_1, i32 2
    %load_result_7 = load i32*, i32** %getelementptr_reg_7
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %load_result_7, i32 1
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    store i32 3, i32* %getelementptr_reg_8
    %fm_2 = load i32**, i32*** @fm
    %getelementptr_reg_9 = getelementptr inbounds i32*, i32** %fm_2, i32 2
    %load_result_9 = load i32*, i32** %getelementptr_reg_9
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %load_result_9, i32 2
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    store i32 4, i32* %getelementptr_reg_10
    %fm_3 = load i32**, i32*** @fm
    %getelementptr_reg_11 = getelementptr inbounds i32*, i32** %fm_3, i32 2
    %load_result_11 = load i32*, i32** %getelementptr_reg_11
    %getelementptr_reg_12 = getelementptr inbounds i32, i32* %load_result_11, i32 3
    %load_result_12 = load i32, i32* %getelementptr_reg_12
    store i32 4, i32* %getelementptr_reg_12
    %fn_1 = load i32*, i32** @fn
    %getelementptr_reg_13 = getelementptr inbounds i32, i32* %fn_1, i32 3
    %load_result_13 = load i32, i32* %getelementptr_reg_13
    store i32 4, i32* %getelementptr_reg_13
    %fc_1 = load i32*, i32** @fc
    %getelementptr_reg_14 = getelementptr inbounds i32, i32* %fc_1, i32 3
    %load_result_14 = load i32, i32* %getelementptr_reg_14
    store i32 4, i32* %getelementptr_reg_14
    %fm_4 = load i32**, i32*** @fm
    %getelementptr_reg_15 = getelementptr inbounds i32*, i32** %fm_4, i32 3
    %load_result_15 = load i32*, i32** %getelementptr_reg_15
    %getelementptr_reg_16 = getelementptr inbounds i32, i32* %load_result_15, i32 1
    %load_result_16 = load i32, i32* %getelementptr_reg_16
    store i32 5, i32* %getelementptr_reg_16
    %fm_5 = load i32**, i32*** @fm
    %getelementptr_reg_17 = getelementptr inbounds i32*, i32** %fm_5, i32 3
    %load_result_17 = load i32*, i32** %getelementptr_reg_17
    %getelementptr_reg_18 = getelementptr inbounds i32, i32* %load_result_17, i32 2
    %load_result_18 = load i32, i32* %getelementptr_reg_18
    store i32 7, i32* %getelementptr_reg_18
    %fm_6 = load i32**, i32*** @fm
    %getelementptr_reg_19 = getelementptr inbounds i32*, i32** %fm_6, i32 3
    %load_result_19 = load i32*, i32** %getelementptr_reg_19
    %getelementptr_reg_20 = getelementptr inbounds i32, i32* %load_result_19, i32 3
    %load_result_20 = load i32, i32* %getelementptr_reg_20
    store i32 8, i32* %getelementptr_reg_20
    %fm_7 = load i32**, i32*** @fm
    %getelementptr_reg_21 = getelementptr inbounds i32*, i32** %fm_7, i32 3
    %load_result_21 = load i32*, i32** %getelementptr_reg_21
    %getelementptr_reg_22 = getelementptr inbounds i32, i32* %load_result_21, i32 4
    %load_result_22 = load i32, i32* %getelementptr_reg_22
    store i32 9, i32* %getelementptr_reg_22
    %C = load i32, i32* @C
    store i32 4, i32* @C
    %M = load i32, i32* @M
    store i32 9, i32* @M
    %N = load i32, i32* @N
    store i32 4, i32* @N
    %Mod = load i32, i32* @Mod
    store i32 10007, i32* @Mod
    call void @Calculate_G()
    call void @Calculate_Comb()
    %rp = load i32, i32* %rp_addr
    store i32 1, i32* %rp_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %rp_0 = load i32, i32* %rp_addr
    %T_0 = load i32, i32* %T_addr
    %sle = icmp sle i32 %rp_0, %T_0
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body if_end_basicblock 
    %rp_4 = load i32, i32* %rp_addr
    %add_12 = add i32 %rp_4, 1
    store i32 %add_12, i32* %rp_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %n = load i32, i32* %n_addr
    %fn_2 = load i32*, i32** @fn
    %rp_1 = load i32, i32* %rp_addr
    %getelementptr_reg_23 = getelementptr inbounds i32, i32* %fn_2, i32 %rp_1
    %load_result_23 = load i32, i32* %getelementptr_reg_23
    store i32 %load_result_23, i32* %n_addr
    %c = load i32, i32* %c_addr
    %fc_2 = load i32*, i32** @fc
    %rp_2 = load i32, i32* %rp_addr
    %getelementptr_reg_24 = getelementptr inbounds i32, i32* %fc_2, i32 %rp_2
    %load_result_24 = load i32, i32* %getelementptr_reg_24
    store i32 %load_result_24, i32* %c_addr
    %ii = load i32, i32* %ii_addr
    store i32 1, i32* %ii_addr
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %ii_0 = load i32, i32* %ii_addr
    %n_0 = load i32, i32* %n_addr
    %sle_0 = icmp sle i32 %ii_0, %n_0
    br i1 %sle_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %ii_3 = load i32, i32* %ii_addr
    %add = add i32 %ii_3, 1
    store i32 %add, i32* %ii_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %m = load i32*, i32** @m
    %ii_1 = load i32, i32* %ii_addr
    %getelementptr_reg_25 = getelementptr inbounds i32, i32* %m, i32 %ii_1
    %load_result_25 = load i32, i32* %getelementptr_reg_25
    %fm_8 = load i32**, i32*** @fm
    %rp_3 = load i32, i32* %rp_addr
    %getelementptr_reg_26 = getelementptr inbounds i32*, i32** %fm_8, i32 %rp_3
    %load_result_26 = load i32*, i32** %getelementptr_reg_26
    %ii_2 = load i32, i32* %ii_addr
    %getelementptr_reg_27 = getelementptr inbounds i32, i32* %load_result_26, i32 %ii_2
    %load_result_27 = load i32, i32* %getelementptr_reg_27
    store i32 %load_result_27, i32* %getelementptr_reg_25
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    %n_1 = load i32, i32* %n_addr
    %eq = icmp eq i32 %n_1, 1
    br i1 %eq, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = for_end_merge0 
    %Comb = load i32**, i32*** @Comb
    %m_0 = load i32*, i32** @m
    %getelementptr_reg_28 = getelementptr inbounds i32, i32* %m_0, i32 1
    %load_result_28 = load i32, i32* %getelementptr_reg_28
    %getelementptr_reg_29 = getelementptr inbounds i32*, i32** %Comb, i32 %load_result_28
    %load_result_29 = load i32*, i32** %getelementptr_reg_29
    %c_0 = load i32, i32* %c_addr
    %getelementptr_reg_30 = getelementptr inbounds i32, i32* %load_result_29, i32 %c_0
    %load_result_30 = load i32, i32* %getelementptr_reg_30
    %call_toString = call i8* @toString(i32 %load_result_30)
    call void @println(i8* %call_toString)
    br label %if_end_basicblock

else_basicblock:                                             ; preds = for_end_merge0 
    %ans = load i32, i32* %ans_addr
    store i32 0, i32* %ans_addr
    %temp = load i32, i32* %temp_addr
    store i32 0, i32* %temp_addr
    %l = load i32, i32* %l_addr
    store i32 0, i32* %l_addr
    %r = load i32, i32* %r_addr
    store i32 1, i32* %r_addr
    br label %for_condition1

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock if_withoutelse_end_basicblock1 
    br label %for_step

for_condition1:                                              ; preds = else_basicblock for_step1 
    %r_0 = load i32, i32* %r_addr
    %m_1 = load i32*, i32** @m
    %getelementptr_reg_31 = getelementptr inbounds i32, i32* %m_1, i32 1
    %load_result_31 = load i32, i32* %getelementptr_reg_31
    %sle_1 = icmp sle i32 %r_0, %load_result_31
    br i1 %sle_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 for_end_merge7 
    %r_7 = load i32, i32* %r_addr
    %add_10 = add i32 %r_7, 1
    store i32 %add_10, i32* %r_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %tmp = load i32, i32* %tmp_addr
    %m_2 = load i32*, i32** @m
    %getelementptr_reg_32 = getelementptr inbounds i32, i32* %m_2, i32 1
    %load_result_32 = load i32, i32* %getelementptr_reg_32
    %m_3 = load i32*, i32** @m
    %getelementptr_reg_33 = getelementptr inbounds i32, i32* %m_3, i32 1
    %load_result_33 = load i32, i32* %getelementptr_reg_33
    %r_1 = load i32, i32* %r_addr
    %sdiv = sdiv i32 %load_result_33, %r_1
    %sdiv_0 = sdiv i32 %load_result_32, %sdiv
    store i32 %sdiv_0, i32* %tmp_addr
    %i = load i32, i32* %i_addr
    store i32 2, i32* %i_addr
    br label %for_condition2

for_end_merge1:                                              ; preds = for_condition1 
    %ans_2 = load i32, i32* %ans_addr
    %slt_3 = icmp slt i32 %ans_2, 0
    br i1 %slt_3, label %single_then_basicblock1, label %if_withoutelse_end_basicblock1

for_condition2:                                              ; preds = for_body1 for_step2 
    %i_0 = load i32, i32* %i_addr
    %n_2 = load i32, i32* %n_addr
    %sle_2 = icmp sle i32 %i_0, %n_2
    br i1 %sle_2, label %for_body2, label %for_end_merge2

for_step2:                                                   ; preds = for_body2 if_withoutelse_end_basicblock 
    %i_3 = load i32, i32* %i_addr
    %add_0 = add i32 %i_3, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition2

for_body2:                                                   ; preds = for_condition2 
    %get = load i32, i32* %get_addr
    %m_4 = load i32*, i32** @m
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg_34 = getelementptr inbounds i32, i32* %m_4, i32 %i_1
    %load_result_34 = load i32, i32* %getelementptr_reg_34
    %m_5 = load i32*, i32** @m
    %i_2 = load i32, i32* %i_addr
    %getelementptr_reg_35 = getelementptr inbounds i32, i32* %m_5, i32 %i_2
    %load_result_35 = load i32, i32* %getelementptr_reg_35
    %r_2 = load i32, i32* %r_addr
    %sdiv_1 = sdiv i32 %load_result_35, %r_2
    %sdiv_2 = sdiv i32 %load_result_34, %sdiv_1
    store i32 %sdiv_2, i32* %get_addr
    %get_0 = load i32, i32* %get_addr
    %tmp_0 = load i32, i32* %tmp_addr
    %slt = icmp slt i32 %get_0, %tmp_0
    br i1 %slt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge2:                                              ; preds = for_condition2 
    %m_6 = load i32*, i32** @m
    %getelementptr_reg_36 = getelementptr inbounds i32, i32* %m_6, i32 1
    %load_result_36 = load i32, i32* %getelementptr_reg_36
    %tmp_2 = load i32, i32* %tmp_addr
    %slt_0 = icmp slt i32 %load_result_36, %tmp_2
    br i1 %slt_0, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

single_then_basicblock:                                      ; preds = for_body2 
    %tmp_1 = load i32, i32* %tmp_addr
    %get_1 = load i32, i32* %get_addr
    store i32 %get_1, i32* %tmp_addr
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body2 
    br label %for_step2

single_then_basicblock0:                                     ; preds = for_end_merge2 
    %tmp_3 = load i32, i32* %tmp_addr
    %m_7 = load i32*, i32** @m
    %getelementptr_reg_37 = getelementptr inbounds i32, i32* %m_7, i32 1
    %load_result_37 = load i32, i32* %getelementptr_reg_37
    store i32 %load_result_37, i32* %tmp_addr
    br label %if_withoutelse_end_basicblock0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 for_end_merge2 
    %r_3 = load i32, i32* %r_addr
    %tmp_4 = load i32, i32* %tmp_addr
    store i32 %tmp_4, i32* %r_addr
    %b = load i32*, i32** @b
    %getelementptr_reg_38 = getelementptr inbounds i32, i32* %b, i32 0
    %load_result_38 = load i32, i32* %getelementptr_reg_38
    store i32 1, i32* %getelementptr_reg_38
    %i_4 = load i32, i32* %i_addr
    store i32 1, i32* %i_addr
    br label %for_condition3

for_condition3:                                              ; preds = if_withoutelse_end_basicblock0 for_step3 
    %i_5 = load i32, i32* %i_addr
    %n_3 = load i32, i32* %n_addr
    %sle_3 = icmp sle i32 %i_5, %n_3
    br i1 %sle_3, label %for_body3, label %for_end_merge3

for_step3:                                                   ; preds = for_body3 for_end_merge6 
    %i_11 = load i32, i32* %i_addr
    %add_7 = add i32 %i_11, 1
    store i32 %add_7, i32* %i_addr
    br label %for_condition3

for_body3:                                                   ; preds = for_condition3 
    %tmp1 = load i32, i32* %tmp1_addr
    %m_8 = load i32*, i32** @m
    %i_6 = load i32, i32* %i_addr
    %getelementptr_reg_39 = getelementptr inbounds i32, i32* %m_8, i32 %i_6
    %load_result_39 = load i32, i32* %getelementptr_reg_39
    %r_4 = load i32, i32* %r_addr
    %sdiv_3 = sdiv i32 %load_result_39, %r_4
    %Mod_0 = load i32, i32* @Mod
    %srem = srem i32 %sdiv_3, %Mod_0
    store i32 %srem, i32* %tmp1_addr
    %tmp2 = load i32, i32* %tmp2_addr
    %tmp1_0 = load i32, i32* %tmp1_addr
    %tmp1_1 = load i32, i32* %tmp1_addr
    %add_1 = add i32 %tmp1_1, 1
    %mul = mul i32 %tmp1_0, %add_1
    %sdiv_4 = sdiv i32 %mul, 2
    %Mod_1 = load i32, i32* @Mod
    %srem_0 = srem i32 %sdiv_4, %Mod_1
    store i32 %srem_0, i32* %tmp2_addr
    %tmp3 = load i32, i32* %tmp3_addr
    %m_9 = load i32*, i32** @m
    %i_7 = load i32, i32* %i_addr
    %getelementptr_reg_40 = getelementptr inbounds i32, i32* %m_9, i32 %i_7
    %load_result_40 = load i32, i32* %getelementptr_reg_40
    %tmp1_2 = load i32, i32* %tmp1_addr
    %mul_0 = mul i32 %load_result_40, %tmp1_2
    %Mod_2 = load i32, i32* @Mod
    %srem_1 = srem i32 %mul_0, %Mod_2
    store i32 %srem_1, i32* %tmp3_addr
    %j = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition4

for_end_merge3:                                              ; preds = for_condition3 
    %i_12 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition7

for_condition4:                                              ; preds = for_body3 for_step4 
    %j_0 = load i32, i32* %j_addr
    %i_8 = load i32, i32* %i_addr
    %slt_1 = icmp slt i32 %j_0, %i_8
    br i1 %slt_1, label %for_body4, label %for_end_merge4

for_step4:                                                   ; preds = for_body4 
    %j_3 = load i32, i32* %j_addr
    %add_3 = add i32 %j_3, 1
    store i32 %add_3, i32* %j_addr
    br label %for_condition4

for_body4:                                                   ; preds = for_condition4 
    %res = load i32*, i32** @res
    %j_1 = load i32, i32* %j_addr
    %add_2 = add i32 %j_1, 1
    %getelementptr_reg_41 = getelementptr inbounds i32, i32* %res, i32 %add_2
    %load_result_41 = load i32, i32* %getelementptr_reg_41
    %b_0 = load i32*, i32** @b
    %j_2 = load i32, i32* %j_addr
    %getelementptr_reg_42 = getelementptr inbounds i32, i32* %b_0, i32 %j_2
    %load_result_42 = load i32, i32* %getelementptr_reg_42
    %Mod_3 = load i32, i32* @Mod
    %tmp2_0 = load i32, i32* %tmp2_addr
    %sub = sub i32 %Mod_3, %tmp2_0
    %mul_1 = mul i32 %load_result_42, %sub
    %Mod_4 = load i32, i32* @Mod
    %srem_2 = srem i32 %mul_1, %Mod_4
    store i32 %srem_2, i32* %getelementptr_reg_41
    br label %for_step4

for_end_merge4:                                              ; preds = for_condition4 
    %res_0 = load i32*, i32** @res
    %getelementptr_reg_43 = getelementptr inbounds i32, i32* %res_0, i32 0
    %load_result_43 = load i32, i32* %getelementptr_reg_43
    store i32 0, i32* %getelementptr_reg_43
    %j_4 = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition5

for_condition5:                                              ; preds = for_end_merge4 for_step5 
    %j_5 = load i32, i32* %j_addr
    %i_9 = load i32, i32* %i_addr
    %slt_2 = icmp slt i32 %j_5, %i_9
    br i1 %slt_2, label %for_body5, label %for_end_merge5

for_step5:                                                   ; preds = for_body5 
    %j_9 = load i32, i32* %j_addr
    %add_5 = add i32 %j_9, 1
    store i32 %add_5, i32* %j_addr
    br label %for_condition5

for_body5:                                                   ; preds = for_condition5 
    %res_1 = load i32*, i32** @res
    %j_6 = load i32, i32* %j_addr
    %getelementptr_reg_44 = getelementptr inbounds i32, i32* %res_1, i32 %j_6
    %load_result_44 = load i32, i32* %getelementptr_reg_44
    %res_2 = load i32*, i32** @res
    %j_7 = load i32, i32* %j_addr
    %getelementptr_reg_45 = getelementptr inbounds i32, i32* %res_2, i32 %j_7
    %load_result_45 = load i32, i32* %getelementptr_reg_45
    %tmp3_0 = load i32, i32* %tmp3_addr
    %b_1 = load i32*, i32** @b
    %j_8 = load i32, i32* %j_addr
    %getelementptr_reg_46 = getelementptr inbounds i32, i32* %b_1, i32 %j_8
    %load_result_46 = load i32, i32* %getelementptr_reg_46
    %mul_2 = mul i32 %tmp3_0, %load_result_46
    %add_4 = add i32 %load_result_45, %mul_2
    %Mod_5 = load i32, i32* @Mod
    %srem_3 = srem i32 %add_4, %Mod_5
    store i32 %srem_3, i32* %getelementptr_reg_44
    br label %for_step5

for_end_merge5:                                              ; preds = for_condition5 
    %j_10 = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition6

for_condition6:                                              ; preds = for_end_merge5 for_step6 
    %j_11 = load i32, i32* %j_addr
    %i_10 = load i32, i32* %i_addr
    %sle_4 = icmp sle i32 %j_11, %i_10
    br i1 %sle_4, label %for_body6, label %for_end_merge6

for_step6:                                                   ; preds = for_body6 
    %j_14 = load i32, i32* %j_addr
    %add_6 = add i32 %j_14, 1
    store i32 %add_6, i32* %j_addr
    br label %for_condition6

for_body6:                                                   ; preds = for_condition6 
    %b_2 = load i32*, i32** @b
    %j_12 = load i32, i32* %j_addr
    %getelementptr_reg_47 = getelementptr inbounds i32, i32* %b_2, i32 %j_12
    %load_result_47 = load i32, i32* %getelementptr_reg_47
    %res_3 = load i32*, i32** @res
    %j_13 = load i32, i32* %j_addr
    %getelementptr_reg_48 = getelementptr inbounds i32, i32* %res_3, i32 %j_13
    %load_result_48 = load i32, i32* %getelementptr_reg_48
    store i32 %load_result_48, i32* %getelementptr_reg_47
    br label %for_step6

for_end_merge6:                                              ; preds = for_condition6 
    br label %for_step3

for_condition7:                                              ; preds = for_end_merge3 for_step7 
    %i_13 = load i32, i32* %i_addr
    %n_4 = load i32, i32* %n_addr
    %sle_5 = icmp sle i32 %i_13, %n_4
    br i1 %sle_5, label %for_body7, label %for_end_merge7

for_step7:                                                   ; preds = for_body7 
    %i_17 = load i32, i32* %i_addr
    %add_9 = add i32 %i_17, 1
    store i32 %add_9, i32* %i_addr
    br label %for_condition7

for_body7:                                                   ; preds = for_condition7 
    %ans_0 = load i32, i32* %ans_addr
    %ans_1 = load i32, i32* %ans_addr
    %b_3 = load i32*, i32** @b
    %i_14 = load i32, i32* %i_addr
    %getelementptr_reg_49 = getelementptr inbounds i32, i32* %b_3, i32 %i_14
    %load_result_49 = load i32, i32* %getelementptr_reg_49
    %Sum = load i32***, i32**** @Sum
    %i_15 = load i32, i32* %i_addr
    %getelementptr_reg_50 = getelementptr inbounds i32**, i32*** %Sum, i32 %i_15
    %load_result_50 = load i32**, i32*** %getelementptr_reg_50
    %r_5 = load i32, i32* %r_addr
    %getelementptr_reg_51 = getelementptr inbounds i32*, i32** %load_result_50, i32 %r_5
    %load_result_51 = load i32*, i32** %getelementptr_reg_51
    %c_1 = load i32, i32* %c_addr
    %getelementptr_reg_52 = getelementptr inbounds i32, i32* %load_result_51, i32 %c_1
    %load_result_52 = load i32, i32* %getelementptr_reg_52
    %Sum_0 = load i32***, i32**** @Sum
    %i_16 = load i32, i32* %i_addr
    %getelementptr_reg_53 = getelementptr inbounds i32**, i32*** %Sum_0, i32 %i_16
    %load_result_53 = load i32**, i32*** %getelementptr_reg_53
    %l_0 = load i32, i32* %l_addr
    %getelementptr_reg_54 = getelementptr inbounds i32*, i32** %load_result_53, i32 %l_0
    %load_result_54 = load i32*, i32** %getelementptr_reg_54
    %c_2 = load i32, i32* %c_addr
    %getelementptr_reg_55 = getelementptr inbounds i32, i32* %load_result_54, i32 %c_2
    %load_result_55 = load i32, i32* %getelementptr_reg_55
    %sub_0 = sub i32 %load_result_52, %load_result_55
    %mul_3 = mul i32 %load_result_49, %sub_0
    %add_8 = add i32 %ans_1, %mul_3
    %Mod_6 = load i32, i32* @Mod
    %srem_4 = srem i32 %add_8, %Mod_6
    store i32 %srem_4, i32* %ans_addr
    br label %for_step7

for_end_merge7:                                              ; preds = for_condition7 
    %l_1 = load i32, i32* %l_addr
    %r_6 = load i32, i32* %r_addr
    store i32 %r_6, i32* %l_addr
    br label %for_step1

single_then_basicblock1:                                     ; preds = for_end_merge1 
    %ans_3 = load i32, i32* %ans_addr
    %ans_4 = load i32, i32* %ans_addr
    %Mod_7 = load i32, i32* @Mod
    %add_11 = add i32 %ans_4, %Mod_7
    store i32 %add_11, i32* %ans_addr
    br label %if_withoutelse_end_basicblock1

if_withoutelse_end_basicblock1:                              ; preds = single_then_basicblock1 for_end_merge1 
    %ans_5 = load i32, i32* %ans_addr
    %call_toString_0 = call i8* @toString(i32 %ans_5)
    call void @println(i8* %call_toString_0)
    br label %if_end_basicblock

return_block0:                                               ; preds = for_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @Calculate_q() {
entrance_block0:                                             
    %i_addr = alloca i32
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %C = load i32, i32* @C
    %sub = sub i32 %C, 2
    %sle = icmp sle i32 %i_0, %sub
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %i_1 = load i32, i32* %i_addr
    call void @Euler(i32 %i_1)
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local void @Calculate_G() {
entrance_block0:                                             
    %k_addr = alloca i32
    %j_addr = alloca i32
    %i_addr = alloca i32
    call void @Calculate_Ksm()
    call void @Calculate_p()
    call void @Calculate_q()
    %i = load i32, i32* %i_addr
    store i32 1, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %M = load i32, i32* @M
    %sle = icmp sle i32 %i_0, %M
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_7 = load i32, i32* %i_addr
    %add_3 = add i32 %i_7, 1
    store i32 %add_3, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %j = load i32, i32* %j_addr
    store i32 2, i32* %j_addr
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    %k_9 = load i32, i32* %k_addr
    store i32 0, i32* %k_addr
    br label %for_condition3

for_condition0:                                              ; preds = for_body for_step0 
    %j_0 = load i32, i32* %j_addr
    %C = load i32, i32* @C
    %sle_0 = icmp sle i32 %j_0, %C
    br i1 %sle_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 for_end_merge2 
    %j_7 = load i32, i32* %j_addr
    %add_2 = add i32 %j_7, 1
    store i32 %add_2, i32* %j_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %k = load i32, i32* %k_addr
    store i32 0, i32* %k_addr
    br label %for_condition1

for_end_merge0:                                              ; preds = for_condition0 
    br label %for_step

for_condition1:                                              ; preds = for_body0 for_step1 
    %k_0 = load i32, i32* %k_addr
    %j_1 = load i32, i32* %j_addr
    %sub = sub i32 %j_1, 2
    %sle_1 = icmp sle i32 %k_0, %sub
    br i1 %sle_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 
    %k_3 = load i32, i32* %k_addr
    %add_0 = add i32 %k_3, 1
    store i32 %add_0, i32* %k_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %g = load i32***, i32**** @g
    %getelementptr_reg = getelementptr inbounds i32**, i32*** %g, i32 0
    %load_result = load i32**, i32*** %getelementptr_reg
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32*, i32** %load_result, i32 %i_1
    %load_result_0 = load i32*, i32** %getelementptr_reg_0
    %j_2 = load i32, i32* %j_addr
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %load_result_0, i32 %j_2
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    %g_0 = load i32***, i32**** @g
    %getelementptr_reg_2 = getelementptr inbounds i32**, i32*** %g_0, i32 0
    %load_result_2 = load i32**, i32*** %getelementptr_reg_2
    %i_2 = load i32, i32* %i_addr
    %getelementptr_reg_3 = getelementptr inbounds i32*, i32** %load_result_2, i32 %i_2
    %load_result_3 = load i32*, i32** %getelementptr_reg_3
    %j_3 = load i32, i32* %j_addr
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %load_result_3, i32 %j_3
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %p = load i32**, i32*** @p
    %j_4 = load i32, i32* %j_addr
    %sub_0 = sub i32 %j_4, 2
    %getelementptr_reg_5 = getelementptr inbounds i32*, i32** %p, i32 %sub_0
    %load_result_5 = load i32*, i32** %getelementptr_reg_5
    %k_1 = load i32, i32* %k_addr
    %getelementptr_reg_6 = getelementptr inbounds i32, i32* %load_result_5, i32 %k_1
    %load_result_6 = load i32, i32* %getelementptr_reg_6
    %q = load i32**, i32*** @q
    %k_2 = load i32, i32* %k_addr
    %getelementptr_reg_7 = getelementptr inbounds i32*, i32** %q, i32 %k_2
    %load_result_7 = load i32*, i32** %getelementptr_reg_7
    %i_3 = load i32, i32* %i_addr
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %load_result_7, i32 %i_3
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    %mul = mul i32 %load_result_6, %load_result_8
    %add = add i32 %load_result_4, %mul
    %Mod = load i32, i32* @Mod
    %srem = srem i32 %add, %Mod
    store i32 %srem, i32* %getelementptr_reg_1
    br label %for_step1

for_end_merge1:                                              ; preds = for_condition1 
    %k_4 = load i32, i32* %k_addr
    store i32 1, i32* %k_addr
    br label %for_condition2

for_condition2:                                              ; preds = for_end_merge1 for_step2 
    %k_5 = load i32, i32* %k_addr
    %N = load i32, i32* @N
    %sle_2 = icmp sle i32 %k_5, %N
    br i1 %sle_2, label %for_body2, label %for_end_merge2

for_step2:                                                   ; preds = for_body2 
    %k_8 = load i32, i32* %k_addr
    %add_1 = add i32 %k_8, 1
    store i32 %add_1, i32* %k_addr
    br label %for_condition2

for_body2:                                                   ; preds = for_condition2 
    %g_1 = load i32***, i32**** @g
    %k_6 = load i32, i32* %k_addr
    %getelementptr_reg_9 = getelementptr inbounds i32**, i32*** %g_1, i32 %k_6
    %load_result_9 = load i32**, i32*** %getelementptr_reg_9
    %i_4 = load i32, i32* %i_addr
    %getelementptr_reg_10 = getelementptr inbounds i32*, i32** %load_result_9, i32 %i_4
    %load_result_10 = load i32*, i32** %getelementptr_reg_10
    %j_5 = load i32, i32* %j_addr
    %getelementptr_reg_11 = getelementptr inbounds i32, i32* %load_result_10, i32 %j_5
    %load_result_11 = load i32, i32* %getelementptr_reg_11
    %g_2 = load i32***, i32**** @g
    %k_7 = load i32, i32* %k_addr
    %sub_1 = sub i32 %k_7, 1
    %getelementptr_reg_12 = getelementptr inbounds i32**, i32*** %g_2, i32 %sub_1
    %load_result_12 = load i32**, i32*** %getelementptr_reg_12
    %i_5 = load i32, i32* %i_addr
    %getelementptr_reg_13 = getelementptr inbounds i32*, i32** %load_result_12, i32 %i_5
    %load_result_13 = load i32*, i32** %getelementptr_reg_13
    %j_6 = load i32, i32* %j_addr
    %getelementptr_reg_14 = getelementptr inbounds i32, i32* %load_result_13, i32 %j_6
    %load_result_14 = load i32, i32* %getelementptr_reg_14
    %i_6 = load i32, i32* %i_addr
    %mul_0 = mul i32 %load_result_14, %i_6
    %Mod_0 = load i32, i32* @Mod
    %srem_0 = srem i32 %mul_0, %Mod_0
    store i32 %srem_0, i32* %getelementptr_reg_11
    br label %for_step2

for_end_merge2:                                              ; preds = for_condition2 
    br label %for_step0

for_condition3:                                              ; preds = for_end_merge for_step3 
    %k_10 = load i32, i32* %k_addr
    %N_0 = load i32, i32* @N
    %sle_3 = icmp sle i32 %k_10, %N_0
    br i1 %sle_3, label %for_body3, label %for_end_merge3

for_step3:                                                   ; preds = for_body3 for_end_merge4 
    %k_17 = load i32, i32* %k_addr
    %add_7 = add i32 %k_17, 1
    store i32 %add_7, i32* %k_addr
    br label %for_condition3

for_body3:                                                   ; preds = for_condition3 
    %i_8 = load i32, i32* %i_addr
    store i32 2, i32* %i_addr
    br label %for_condition4

for_end_merge3:                                              ; preds = for_condition3 
    br label %return_block0

for_condition4:                                              ; preds = for_body3 for_step4 
    %i_9 = load i32, i32* %i_addr
    %C_0 = load i32, i32* @C
    %sle_4 = icmp sle i32 %i_9, %C_0
    br i1 %sle_4, label %for_body4, label %for_end_merge4

for_step4:                                                   ; preds = for_body4 for_end_merge5 
    %i_16 = load i32, i32* %i_addr
    %add_6 = add i32 %i_16, 1
    store i32 %add_6, i32* %i_addr
    br label %for_condition4

for_body4:                                                   ; preds = for_condition4 
    %j_8 = load i32, i32* %j_addr
    store i32 1, i32* %j_addr
    br label %for_condition5

for_end_merge4:                                              ; preds = for_condition4 
    br label %for_step3

for_condition5:                                              ; preds = for_body4 for_step5 
    %j_9 = load i32, i32* %j_addr
    %M_0 = load i32, i32* @M
    %sle_5 = icmp sle i32 %j_9, %M_0
    br i1 %sle_5, label %for_body5, label %for_end_merge5

for_step5:                                                   ; preds = for_body5 if_withoutelse_end_basicblock 
    %j_16 = load i32, i32* %j_addr
    %add_5 = add i32 %j_16, 1
    store i32 %add_5, i32* %j_addr
    br label %for_condition5

for_body5:                                                   ; preds = for_condition5 
    %Sum = load i32***, i32**** @Sum
    %k_11 = load i32, i32* %k_addr
    %getelementptr_reg_15 = getelementptr inbounds i32**, i32*** %Sum, i32 %k_11
    %load_result_15 = load i32**, i32*** %getelementptr_reg_15
    %j_10 = load i32, i32* %j_addr
    %getelementptr_reg_16 = getelementptr inbounds i32*, i32** %load_result_15, i32 %j_10
    %load_result_16 = load i32*, i32** %getelementptr_reg_16
    %i_10 = load i32, i32* %i_addr
    %getelementptr_reg_17 = getelementptr inbounds i32, i32* %load_result_16, i32 %i_10
    %load_result_17 = load i32, i32* %getelementptr_reg_17
    %Sum_0 = load i32***, i32**** @Sum
    %k_12 = load i32, i32* %k_addr
    %getelementptr_reg_18 = getelementptr inbounds i32**, i32*** %Sum_0, i32 %k_12
    %load_result_18 = load i32**, i32*** %getelementptr_reg_18
    %j_11 = load i32, i32* %j_addr
    %sub_2 = sub i32 %j_11, 1
    %getelementptr_reg_19 = getelementptr inbounds i32*, i32** %load_result_18, i32 %sub_2
    %load_result_19 = load i32*, i32** %getelementptr_reg_19
    %i_11 = load i32, i32* %i_addr
    %getelementptr_reg_20 = getelementptr inbounds i32, i32* %load_result_19, i32 %i_11
    %load_result_20 = load i32, i32* %getelementptr_reg_20
    %g_3 = load i32***, i32**** @g
    %k_13 = load i32, i32* %k_addr
    %getelementptr_reg_21 = getelementptr inbounds i32**, i32*** %g_3, i32 %k_13
    %load_result_21 = load i32**, i32*** %getelementptr_reg_21
    %j_12 = load i32, i32* %j_addr
    %getelementptr_reg_22 = getelementptr inbounds i32*, i32** %load_result_21, i32 %j_12
    %load_result_22 = load i32*, i32** %getelementptr_reg_22
    %i_12 = load i32, i32* %i_addr
    %getelementptr_reg_23 = getelementptr inbounds i32, i32* %load_result_22, i32 %i_12
    %load_result_23 = load i32, i32* %getelementptr_reg_23
    %add_4 = add i32 %load_result_20, %load_result_23
    store i32 %add_4, i32* %getelementptr_reg_17
    %Sum_1 = load i32***, i32**** @Sum
    %k_14 = load i32, i32* %k_addr
    %getelementptr_reg_24 = getelementptr inbounds i32**, i32*** %Sum_1, i32 %k_14
    %load_result_24 = load i32**, i32*** %getelementptr_reg_24
    %j_13 = load i32, i32* %j_addr
    %getelementptr_reg_25 = getelementptr inbounds i32*, i32** %load_result_24, i32 %j_13
    %load_result_25 = load i32*, i32** %getelementptr_reg_25
    %i_13 = load i32, i32* %i_addr
    %getelementptr_reg_26 = getelementptr inbounds i32, i32* %load_result_25, i32 %i_13
    %load_result_26 = load i32, i32* %getelementptr_reg_26
    %Mod_1 = load i32, i32* @Mod
    %sge = icmp sge i32 %load_result_26, %Mod_1
    br i1 %sge, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge5:                                              ; preds = for_condition5 
    br label %for_step4

single_then_basicblock:                                      ; preds = for_body5 
    %Sum_2 = load i32***, i32**** @Sum
    %k_15 = load i32, i32* %k_addr
    %getelementptr_reg_27 = getelementptr inbounds i32**, i32*** %Sum_2, i32 %k_15
    %load_result_27 = load i32**, i32*** %getelementptr_reg_27
    %j_14 = load i32, i32* %j_addr
    %getelementptr_reg_28 = getelementptr inbounds i32*, i32** %load_result_27, i32 %j_14
    %load_result_28 = load i32*, i32** %getelementptr_reg_28
    %i_14 = load i32, i32* %i_addr
    %getelementptr_reg_29 = getelementptr inbounds i32, i32* %load_result_28, i32 %i_14
    %load_result_29 = load i32, i32* %getelementptr_reg_29
    %Sum_3 = load i32***, i32**** @Sum
    %k_16 = load i32, i32* %k_addr
    %getelementptr_reg_30 = getelementptr inbounds i32**, i32*** %Sum_3, i32 %k_16
    %load_result_30 = load i32**, i32*** %getelementptr_reg_30
    %j_15 = load i32, i32* %j_addr
    %getelementptr_reg_31 = getelementptr inbounds i32*, i32** %load_result_30, i32 %j_15
    %load_result_31 = load i32*, i32** %getelementptr_reg_31
    %i_15 = load i32, i32* %i_addr
    %getelementptr_reg_32 = getelementptr inbounds i32, i32* %load_result_31, i32 %i_15
    %load_result_32 = load i32, i32* %getelementptr_reg_32
    %Mod_2 = load i32, i32* @Mod
    %sub_3 = sub i32 %load_result_32, %Mod_2
    store i32 %sub_3, i32* %getelementptr_reg_29
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body5 
    br label %for_step5

return_block0:                                               ; preds = for_end_merge3 
    ret void
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
