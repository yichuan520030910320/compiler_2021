; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32* null
@n = dso_local global i32 0

@const_string0 = private unnamed_addr constant [2 x i8] c" \00", align 1
@const_string1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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

define dso_local void @exchange(i32 %x_para,i32 %y_para) {
entrance_block0:                                             
    %t_addr = alloca i32
    %y_addr = alloca i32
    %x_addr = alloca i32
    store i32 %x_para, i32* %x_addr
    store i32 %y_para, i32* %y_addr
    %a = load i32*, i32** @a
    %x = load i32, i32* %x_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %a, i32 %x
    %load_result = load i32, i32* %getelementptr_reg
    store i32 %load_result, i32* %t_addr
    %a_0 = load i32*, i32** @a
    %x_0 = load i32, i32* %x_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %a_0, i32 %x_0
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %a_1 = load i32*, i32** @a
    %y = load i32, i32* %y_addr
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %a_1, i32 %y
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    store i32 %load_result_1, i32* %getelementptr_reg_0
    %a_2 = load i32*, i32** @a
    %y_0 = load i32, i32* %y_addr
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %a_2, i32 %y_0
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %t = load i32, i32* %t_addr
    store i32 %t, i32* %getelementptr_reg_2
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %n = load i32, i32* @n
    %call_getString = call i8* @getString()
    %call_string_parseInt = call i32 @_str_parseInt(i8* %call_getString)
    store i32 %call_string_parseInt, i32* @n
    %a = load i32*, i32** @a
    %n_0 = load i32, i32* @n
    %mul_bytes = mul i32 %n_0, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %n_0, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** @a
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %a_0 = load i32*, i32** @a
    %bitcast_i32 = bitcast i32* %a_0 to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %slt = icmp slt i32 %i_0, %size_load
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_3 = load i32, i32* %i_addr
    %i_4 = load i32, i32* %i_addr
    %add = add i32 %i_4, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %a_1 = load i32*, i32** @a
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %a_1, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %i_2 = load i32, i32* %i_addr
    store i32 %i_2, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %call_makeHeap = call i32 @makeHeap()
    %call_heapSort = call i32 @heapSort()
    %i_5 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %i_6 = load i32, i32* %i_addr
    %a_2 = load i32*, i32** @a
    %bitcast_i32_0 = bitcast i32* %a_2 to i32*
    %gep_size_0 = getelementptr inbounds i32, i32* %bitcast_i32_0, i32 -1
    %size_load_0 = load i32, i32* %gep_size_0
    %slt_0 = icmp slt i32 %i_6, %size_load_0
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %i_8 = load i32, i32* %i_addr
    %i_9 = load i32, i32* %i_addr
    %add_0 = add i32 %i_9, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %a_3 = load i32*, i32** @a
    %i_7 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %a_3, i32 %i_7
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %call_toString = call i8* @toString(i32 %load_result_0)
    %const_string_pointer = getelementptr inbounds [2 x i8], [2 x i8]* @const_string0, i32 0, i32 0
    %string_add = call i8* @_str_concatenate(i8* %call_toString, i8* %const_string_pointer)
    call void @print(i8* %string_add)
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    %const_string_pointer_0 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string1, i32 0, i32 0
    call void @print(i8* %const_string_pointer_0)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = for_end_merge0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @adjustHeap(i32 %n_para) {
entrance_block0:                                             
    %t_addr_0 = alloca i32
    %AND_addr = alloca i1
    %t_addr = alloca i32
    %j_addr = alloca i32
    %i_addr = alloca i32
    %n_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %n_para, i32* %n_addr
    store i32 0, i32* %i_addr
    store i32 0, i32* %j_addr
    store i32 0, i32* %t_addr
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body if_end_basicblock 
    %i = load i32, i32* %i_addr
    %mul = mul i32 %i, 2
    %n = load i32, i32* %n_addr
    %slt = icmp slt i32 %mul, %n
    br i1 %slt, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %j = load i32, i32* %j_addr
    %i_0 = load i32, i32* %i_addr
    %mul_0 = mul i32 %i_0, 2
    store i32 %mul_0, i32* %j_addr
    %i_1 = load i32, i32* %i_addr
    %mul_1 = mul i32 %i_1, 2
    %add = add i32 %mul_1, 1
    %n_0 = load i32, i32* %n_addr
    %slt_0 = icmp slt i32 %add, %n_0
    store i1 %slt_0, i1* %AND_addr
    br i1 %slt_0, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

while_end_merge:                                             ; preds = entrance_block0 while_condition else_basicblock 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

short_circuit_AND_end_AND:                                   ; preds = while_body short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_AND_branch_AND:                                ; preds = while_body 
    %a = load i32*, i32** @a
    %i_2 = load i32, i32* %i_addr
    %mul_2 = mul i32 %i_2, 2
    %add_0 = add i32 %mul_2, 1
    %getelementptr_reg = getelementptr inbounds i32, i32* %a, i32 %add_0
    %load_result = load i32, i32* %getelementptr_reg
    %a_0 = load i32*, i32** @a
    %i_3 = load i32, i32* %i_addr
    %mul_3 = mul i32 %i_3, 2
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %a_0, i32 %mul_3
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %slt_1 = icmp slt i32 %load_result, %load_result_0
    store i1 %slt_1, i1* %AND_addr
    br label %short_circuit_AND_end_AND

single_then_basicblock:                                      ; preds = short_circuit_AND_end_AND 
    %j_0 = load i32, i32* %j_addr
    %i_4 = load i32, i32* %i_addr
    %mul_4 = mul i32 %i_4, 2
    %add_1 = add i32 %mul_4, 1
    store i32 %add_1, i32* %j_addr
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock short_circuit_AND_end_AND 
    %a_1 = load i32*, i32** @a
    %i_5 = load i32, i32* %i_addr
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %a_1, i32 %i_5
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    %a_2 = load i32*, i32** @a
    %j_1 = load i32, i32* %j_addr
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %a_2, i32 %j_1
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %sgt = icmp sgt i32 %load_result_1, %load_result_2
    br i1 %sgt, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = if_withoutelse_end_basicblock 
    %a_3 = load i32*, i32** @a
    %i_6 = load i32, i32* %i_addr
    %getelementptr_reg_3 = getelementptr inbounds i32, i32* %a_3, i32 %i_6
    %load_result_3 = load i32, i32* %getelementptr_reg_3
    store i32 %load_result_3, i32* %t_addr_0
    %a_4 = load i32*, i32** @a
    %i_7 = load i32, i32* %i_addr
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %a_4, i32 %i_7
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %a_5 = load i32*, i32** @a
    %j_2 = load i32, i32* %j_addr
    %getelementptr_reg_5 = getelementptr inbounds i32, i32* %a_5, i32 %j_2
    %load_result_5 = load i32, i32* %getelementptr_reg_5
    store i32 %load_result_5, i32* %getelementptr_reg_4
    %a_6 = load i32*, i32** @a
    %j_3 = load i32, i32* %j_addr
    %getelementptr_reg_6 = getelementptr inbounds i32, i32* %a_6, i32 %j_3
    %load_result_6 = load i32, i32* %getelementptr_reg_6
    %t = load i32, i32* %t_addr_0
    store i32 %t, i32* %getelementptr_reg_6
    %i_8 = load i32, i32* %i_addr
    %j_4 = load i32, i32* %j_addr
    store i32 %j_4, i32* %i_addr
    br label %if_end_basicblock

else_basicblock:                                             ; preds = if_withoutelse_end_basicblock 
    br label %while_end_merge

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %while_condition

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @heapSort() {
entrance_block0:                                             
    %k_addr = alloca i32
    %t_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %t = load i32, i32* %t_addr
    store i32 0, i32* %t_addr
    %k = load i32, i32* %k_addr
    store i32 0, i32* %k_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %k_0 = load i32, i32* %k_addr
    %n = load i32, i32* @n
    %slt = icmp slt i32 %k_0, %n
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %k_4 = load i32, i32* %k_addr
    %k_5 = load i32, i32* %k_addr
    %add = add i32 %k_5, 1
    store i32 %add, i32* %k_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %t_0 = load i32, i32* %t_addr
    %a = load i32*, i32** @a
    %getelementptr_reg = getelementptr inbounds i32, i32* %a, i32 0
    %load_result = load i32, i32* %getelementptr_reg
    store i32 %load_result, i32* %t_addr
    %a_0 = load i32*, i32** @a
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %a_0, i32 0
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %a_1 = load i32*, i32** @a
    %n_0 = load i32, i32* @n
    %k_1 = load i32, i32* %k_addr
    %sub = sub i32 %n_0, %k_1
    %sub_0 = sub i32 %sub, 1
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %a_1, i32 %sub_0
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    store i32 %load_result_1, i32* %getelementptr_reg_0
    %a_2 = load i32*, i32** @a
    %n_1 = load i32, i32* @n
    %k_2 = load i32, i32* %k_addr
    %sub_1 = sub i32 %n_1, %k_2
    %sub_2 = sub i32 %sub_1, 1
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %a_2, i32 %sub_2
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %t_1 = load i32, i32* %t_addr
    store i32 %t_1, i32* %getelementptr_reg_2
    %n_2 = load i32, i32* @n
    %k_3 = load i32, i32* %k_addr
    %sub_3 = sub i32 %n_2, %k_3
    %sub_4 = sub i32 %sub_3, 1
    %call_adjustHeap = call i32 @adjustHeap(i32 %sub_4)
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = for_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @makeHeap() {
entrance_block0:                                             
    %AND_addr = alloca i1
    %j_addr = alloca i32
    %t_addr = alloca i32
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %i = load i32, i32* %i_addr
    %n = load i32, i32* @n
    %sub = sub i32 %n, 1
    %sdiv = sdiv i32 %sub, 2
    store i32 %sdiv, i32* %i_addr
    %t = load i32, i32* %t_addr
    store i32 0, i32* %t_addr
    %j = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body if_withoutelse_end_basicblock0 
    %i_0 = load i32, i32* %i_addr
    %sge = icmp sge i32 %i_0, 0
    br i1 %sge, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %j_0 = load i32, i32* %j_addr
    %i_1 = load i32, i32* %i_addr
    %mul = mul i32 %i_1, 2
    store i32 %mul, i32* %j_addr
    %i_2 = load i32, i32* %i_addr
    %mul_0 = mul i32 %i_2, 2
    %add = add i32 %mul_0, 1
    %n_0 = load i32, i32* @n
    %slt = icmp slt i32 %add, %n_0
    store i1 %slt, i1* %AND_addr
    br i1 %slt, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

while_end_merge:                                             ; preds = entrance_block0 while_condition 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

short_circuit_AND_end_AND:                                   ; preds = while_body short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_AND_branch_AND:                                ; preds = while_body 
    %a = load i32*, i32** @a
    %i_3 = load i32, i32* %i_addr
    %mul_1 = mul i32 %i_3, 2
    %add_0 = add i32 %mul_1, 1
    %getelementptr_reg = getelementptr inbounds i32, i32* %a, i32 %add_0
    %load_result = load i32, i32* %getelementptr_reg
    %a_0 = load i32*, i32** @a
    %i_4 = load i32, i32* %i_addr
    %mul_2 = mul i32 %i_4, 2
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %a_0, i32 %mul_2
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %slt_0 = icmp slt i32 %load_result, %load_result_0
    store i1 %slt_0, i1* %AND_addr
    br label %short_circuit_AND_end_AND

single_then_basicblock:                                      ; preds = short_circuit_AND_end_AND 
    %j_1 = load i32, i32* %j_addr
    %i_5 = load i32, i32* %i_addr
    %mul_3 = mul i32 %i_5, 2
    %add_1 = add i32 %mul_3, 1
    store i32 %add_1, i32* %j_addr
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock short_circuit_AND_end_AND 
    %a_1 = load i32*, i32** @a
    %i_6 = load i32, i32* %i_addr
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %a_1, i32 %i_6
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    %a_2 = load i32*, i32** @a
    %j_2 = load i32, i32* %j_addr
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %a_2, i32 %j_2
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %sgt = icmp sgt i32 %load_result_1, %load_result_2
    br i1 %sgt, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

single_then_basicblock0:                                     ; preds = if_withoutelse_end_basicblock 
    %i_7 = load i32, i32* %i_addr
    %j_3 = load i32, i32* %j_addr
    call void @exchange(i32 %i_7, i32 %j_3)
    br label %if_withoutelse_end_basicblock0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 if_withoutelse_end_basicblock 
    %i_8 = load i32, i32* %i_addr
    %i_9 = load i32, i32* %i_addr
    %sub_0 = sub i32 %i_9, 1
    store i32 %sub_0, i32* %i_addr
    br label %while_condition

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
