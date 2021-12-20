; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32* null
@i = dso_local global i32 0
@k = dso_local global i32 0
@m = dso_local global i32 0


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
    %AND_addr_0 = alloca i1
    %AND_addr = alloca i1
    %return_register_infunction_addr = alloca i32
    %m = load i32, i32* @m
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @m
    %k = load i32, i32* @k
    %call_getInt_0 = call i32 @getInt()
    store i32 %call_getInt_0, i32* @k
    %i = load i32, i32* @i
    store i32 0, i32* @i
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* @i
    %m_0 = load i32, i32* @m
    %slt = icmp slt i32 %i_0, %m_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* @i
    %add = add i32 %i_2, 1
    store i32 %add, i32* @i
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %a = load i32*, i32** @a
    %i_1 = load i32, i32* @i
    %getelementptr_reg = getelementptr inbounds i32, i32* %a, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %call_getInt_1 = call i32 @getInt()
    store i32 %call_getInt_1, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %i_3 = load i32, i32* @i
    store i32 0, i32* @i
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %a_0 = load i32*, i32** @a
    %i_4 = load i32, i32* @i
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %a_0, i32 %i_4
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %a_1 = load i32*, i32** @a
    %k_0 = load i32, i32* @k
    %sub = sub i32 %k_0, 1
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %a_1, i32 %sub
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    %sge = icmp sge i32 %load_result_0, %load_result_1
    store i1 %sge, i1* %AND_addr
    br i1 %sge, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

for_step0:                                                   ; preds = for_body0 
    %i_7 = load i32, i32* @i
    %add_0 = add i32 %i_7, 1
    store i32 %add_0, i32* @i
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 short_circuit_AND_end_AND0 
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 short_circuit_AND_end_AND0 
    %i_8 = load i32, i32* @i
    call void @printInt(i32 %i_8)
    br label %return_block0

short_circuit_AND_end_AND:                                   ; preds = for_condition0 short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    store i1 %AND_short_circuit, i1* %AND_addr_0
    br i1 %AND_short_circuit, label %short_circuit_AND_branch_AND0, label %short_circuit_AND_end_AND0

short_circuit_AND_branch_AND:                                ; preds = for_condition0 
    %a_2 = load i32*, i32** @a
    %i_5 = load i32, i32* @i
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %a_2, i32 %i_5
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %sgt = icmp sgt i32 %load_result_2, 0
    store i1 %sgt, i1* %AND_addr
    br label %short_circuit_AND_end_AND

short_circuit_AND_end_AND0:                                  ; preds = short_circuit_AND_end_AND short_circuit_AND_branch_AND0 
    %AND_short_circuit_0 = load i1, i1* %AND_addr_0
    br i1 %AND_short_circuit_0, label %for_body0, label %for_end_merge0

short_circuit_AND_branch_AND0:                               ; preds = short_circuit_AND_end_AND 
    %i_6 = load i32, i32* @i
    %m_1 = load i32, i32* @m
    %slt_0 = icmp slt i32 %i_6, %m_1
    store i1 %slt_0, i1* %AND_addr_0
    br label %short_circuit_AND_end_AND0

return_block0:                                               ; preds = for_end_merge0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    %mul_bytes = mul i32 50, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 50, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** @a
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
