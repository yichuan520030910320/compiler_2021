; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@MAXK = dso_local global i32 0
@MAXN = dso_local global i32 0


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
    call void @GLOBAL__sub_I_main.mx()
    %ans_addr = alloca i32*
    %pindex_addr = alloca i32*
    %primes_addr = alloca i32*
    %i_addr = alloca i32
    %N_addr = alloca i32
    %K_addr = alloca i32
    %MIN_addr = alloca i32
    %k_addr = alloca i32
    %point_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 0, i32* %point_addr
    %MAXK = load i32, i32* @MAXK
    %mul_bytes = mul i32 %MAXK, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %MAXK, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %primes_addr
    %MAXK_0 = load i32, i32* @MAXK
    %mul_bytes_0 = mul i32 %MAXK_0, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 %MAXK_0, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** %pindex_addr
    %MAXN = load i32, i32* @MAXN
    %mul_bytes_1 = mul i32 %MAXN, 4
    %sum_bytes_1 = add i32 %mul_bytes_1, 4
    %malloca_1 = call i8* @_f_malloc(i32 %sum_bytes_1)
    %array_cast_i8_to_i32_1 = bitcast i8* %malloca_1 to i32*
    store i32 %MAXN, i32* %array_cast_i8_to_i32_1
    %array_tmp_begin_i32_1 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_1, i32 1
    %array_addr_1 = bitcast i32* %array_tmp_begin_i32_1 to i32*
    store i32* %array_addr_1, i32** %ans_addr
    %K = load i32, i32* %K_addr
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* %K_addr
    %N = load i32, i32* %N_addr
    %call_getInt_0 = call i32 @getInt()
    store i32 %call_getInt_0, i32* %N_addr
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %K_0 = load i32, i32* %K_addr
    %slt = icmp slt i32 %i_0, %K_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %primes = load i32*, i32** %primes_addr
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %primes, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %call_getInt_1 = call i32 @getInt()
    store i32 %call_getInt_1, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %ans = load i32*, i32** %ans_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %ans, i32 0
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 1, i32* %getelementptr_reg_0
    br label %while_condition

while_condition:                                             ; preds = for_end_merge while_body for_end_merge0 
    %point = load i32, i32* %point_addr
    %N_0 = load i32, i32* %N_addr
    %sle = icmp sle i32 %point, %N_0
    br i1 %sle, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %MIN = load i32, i32* %MIN_addr
    store i32 2139062143, i32* %MIN_addr
    %i_3 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition0

while_end_merge:                                             ; preds = for_end_merge while_condition 
    %ans_5 = load i32*, i32** %ans_addr
    %N_1 = load i32, i32* %N_addr
    %getelementptr_reg_13 = getelementptr inbounds i32, i32* %ans_5, i32 %N_1
    %load_result_13 = load i32, i32* %getelementptr_reg_13
    %call_toString = call i8* @toString(i32 %load_result_13)
    call void @print(i8* %call_toString)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

for_condition0:                                              ; preds = while_body for_step0 
    %i_4 = load i32, i32* %i_addr
    %K_1 = load i32, i32* %K_addr
    %slt_0 = icmp slt i32 %i_4, %K_1
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 if_withoutelse_end_basicblock 
    %i_13 = load i32, i32* %i_addr
    %add_1 = add i32 %i_13, 1
    store i32 %add_1, i32* %i_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    br label %while_condition0

for_end_merge0:                                              ; preds = for_condition0 
    %ans_4 = load i32*, i32** %ans_addr
    %point_1 = load i32, i32* %point_addr
    %add_2 = add i32 %point_1, 1
    store i32 %add_2, i32* %point_addr
    %getelementptr_reg_12 = getelementptr inbounds i32, i32* %ans_4, i32 %add_2
    %load_result_12 = load i32, i32* %getelementptr_reg_12
    %MIN_2 = load i32, i32* %MIN_addr
    store i32 %MIN_2, i32* %getelementptr_reg_12
    br label %while_condition

while_condition0:                                            ; preds = for_body0 while_body0 
    %ans_0 = load i32*, i32** %ans_addr
    %point_0 = load i32, i32* %point_addr
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %ans_0, i32 %point_0
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    %primes_0 = load i32*, i32** %primes_addr
    %i_5 = load i32, i32* %i_addr
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %primes_0, i32 %i_5
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %ans_1 = load i32*, i32** %ans_addr
    %pindex = load i32*, i32** %pindex_addr
    %i_6 = load i32, i32* %i_addr
    %getelementptr_reg_3 = getelementptr inbounds i32, i32* %pindex, i32 %i_6
    %load_result_3 = load i32, i32* %getelementptr_reg_3
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %ans_1, i32 %load_result_3
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %mul = mul i32 %load_result_2, %load_result_4
    %sge = icmp sge i32 %load_result_1, %mul
    br i1 %sge, label %while_body0, label %while_end_merge0

while_body0:                                                 ; preds = while_condition0 
    %pindex_0 = load i32*, i32** %pindex_addr
    %i_7 = load i32, i32* %i_addr
    %getelementptr_reg_5 = getelementptr inbounds i32, i32* %pindex_0, i32 %i_7
    %load_result_5 = load i32, i32* %getelementptr_reg_5
    %add_0 = add i32 %load_result_5, 1
    store i32 %add_0, i32* %getelementptr_reg_5
    br label %while_condition0

while_end_merge0:                                            ; preds = for_body0 while_condition0 
    %primes_1 = load i32*, i32** %primes_addr
    %i_8 = load i32, i32* %i_addr
    %getelementptr_reg_6 = getelementptr inbounds i32, i32* %primes_1, i32 %i_8
    %load_result_6 = load i32, i32* %getelementptr_reg_6
    %ans_2 = load i32*, i32** %ans_addr
    %pindex_1 = load i32*, i32** %pindex_addr
    %i_9 = load i32, i32* %i_addr
    %getelementptr_reg_7 = getelementptr inbounds i32, i32* %pindex_1, i32 %i_9
    %load_result_7 = load i32, i32* %getelementptr_reg_7
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %ans_2, i32 %load_result_7
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    %mul_0 = mul i32 %load_result_6, %load_result_8
    %MIN_0 = load i32, i32* %MIN_addr
    %slt_1 = icmp slt i32 %mul_0, %MIN_0
    br i1 %slt_1, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = while_end_merge0 
    %MIN_1 = load i32, i32* %MIN_addr
    %primes_2 = load i32*, i32** %primes_addr
    %i_10 = load i32, i32* %i_addr
    %getelementptr_reg_9 = getelementptr inbounds i32, i32* %primes_2, i32 %i_10
    %load_result_9 = load i32, i32* %getelementptr_reg_9
    %ans_3 = load i32*, i32** %ans_addr
    %pindex_2 = load i32*, i32** %pindex_addr
    %i_11 = load i32, i32* %i_addr
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %pindex_2, i32 %i_11
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    %getelementptr_reg_11 = getelementptr inbounds i32, i32* %ans_3, i32 %load_result_10
    %load_result_11 = load i32, i32* %getelementptr_reg_11
    %mul_1 = mul i32 %load_result_9, %load_result_11
    store i32 %mul_1, i32* %MIN_addr
    %k = load i32, i32* %k_addr
    %i_12 = load i32, i32* %i_addr
    store i32 %i_12, i32* %k_addr
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock while_end_merge0 
    br label %for_step0

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    store i32 105, i32* @MAXK
    store i32 100005, i32* @MAXN
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
