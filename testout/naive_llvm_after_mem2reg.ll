; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32** null
@n = dso_local global i32 0

@const_string0 = private unnamed_addr constant [3 x i8] c"-1\00", align 1

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

define dso_local void @init() {
entrance_block0:                                             
    %n = load i32, i32* @n
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @n
    %a = load i32**, i32*** @a
    %n_0 = load i32, i32* @n
    %n_1 = load i32, i32* @n
    %mul_bytes = mul i32 %n_0, 8
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %n_0, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32**
    store i32 0, i32 %mem2reg0
    br label %new_condition

new_condition:                                               ; preds = new_loop_body entrance_block0 
    %addr_cmp_result = icmp slt i32 mem2reg0, %n_0
    br i1 %addr_cmp_result, label %new_loop_body, label %new_end

new_loop_body:                                               ; preds = new_condition 
    %geparrayaddr = getelementptr inbounds i32*, i32** %array_addr, i32 %mem2reg0
    %mul_bytes_0 = mul i32 %n_1, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 %n_1, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** %geparrayaddr
    %add_one_ptr = add i32 mem2reg0, 1
    store i32 %add_one_ptr, i32 %mem2reg0
    br label %new_condition

new_end:                                                     ; preds = new_condition 
    store i32** %array_addr, i32*** @a
    br label %return_block0

return_block0:                                               ; preds = new_end 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    store i32 0, i32 %mem2reg2
    store i32 0, i32 %mem2reg3
    store i32 0, i32 %mem2reg4
    call void @init()
    store i32 0, i32 %mem2reg3
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %n = load i32, i32* @n
    %slt = icmp slt i32 mem2reg3, %n
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %add_0 = add i32 mem2reg3, 1
    store i32 %add_0, i32 %mem2reg3
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store i32 0, i32 %mem2reg2
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    store i32 98, i32 %mem2reg3
    br label %for_condition1

for_condition0:                                              ; preds = for_body for_step0 
    %n_0 = load i32, i32* @n
    %slt_0 = icmp slt i32 mem2reg2, %n_0
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %add = add i32 mem2reg2, 1
    store i32 %add, i32 %mem2reg2
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %a = load i32**, i32*** @a
    %getelementptr_reg = getelementptr inbounds i32*, i32** %a, i32 %mem2reg3
    %load_result = load i32*, i32** %getelementptr_reg
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_result, i32 %mem2reg2
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 0, i32* %getelementptr_reg_0
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    br label %for_step

for_condition1:                                              ; preds = for_end_merge for_step1 
    %n_1 = load i32, i32* @n
    %slt_1 = icmp slt i32 mem2reg3, %n_1
    br i1 %slt_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 
    %add_1 = add i32 mem2reg3, 1
    store i32 %add_1, i32 %mem2reg3
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %const_string_pointer = getelementptr inbounds [3 x i8], [3 x i8]* @const_string0, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    br label %for_step1

for_end_merge1:                                              ; preds = for_condition1 
    store i32 0, i32 %mem2reg4
    br label %return_block0

return_block0:                                               ; preds = for_end_merge1 
    ret i32 %mem2reg4
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
