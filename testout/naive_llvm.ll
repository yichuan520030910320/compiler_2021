; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.vector = type { i32* }

@const_string6 = private unnamed_addr constant [8 x i8] c"x + y: \00", align 1
@const_string5 = private unnamed_addr constant [11 x i8] c"vector y: \00", align 1
@const_string7 = private unnamed_addr constant [8 x i8] c"x * y: \00", align 1
@const_string3 = private unnamed_addr constant [11 x i8] c"vector x: \00", align 1
@const_string2 = private unnamed_addr constant [3 x i8] c" )\00", align 1
@const_string0 = private unnamed_addr constant [3 x i8] c"( \00", align 1
@const_string1 = private unnamed_addr constant [3 x i8] c", \00", align 1
@const_string4 = private unnamed_addr constant [9 x i8] c"excited!\00", align 1
@const_string8 = private unnamed_addr constant [15 x i8] c"(1 << 3) * y: \00", align 1

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

define dso_local i32 @vector.getDim(%class.vector* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.vector*
    %return_register_infunction_addr = alloca i32
    store %class.vector* %this, %class.vector** %this_addr_0
    %this_reg = load %class.vector*, %class.vector** %this_addr_0
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %this_reg, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    %eq = icmp eq i32* %vector.data_load_reg, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %data = load i32*, i32** %vector.data_gep_in_id
    %bitcast_i32 = bitcast i32* %data to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    store i32 %size_load, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock if_withoutelse_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local %class.vector* @vector.add(%class.vector* %this,%class.vector* %rhs_para) {
entrance_block0:                                             
    %i_addr = alloca i32
    %temp_addr = alloca %class.vector*
    %OR_addr = alloca i1
    %this_addr_0 = alloca %class.vector*
    %rhs_addr = alloca %class.vector*
    %return_register_infunction_addr = alloca %class.vector*
    store %class.vector* %rhs_para, %class.vector** %rhs_addr
    store %class.vector* %this, %class.vector** %this_addr_0
    %Implicit_call_inclass = load %class.vector*, %class.vector** %this_addr_0
    %call_getDim = call i32 @vector.getDim(%class.vector* %Implicit_call_inclass)
    %rhs = load %class.vector*, %class.vector** %rhs_addr
    %call_vector_getDim = call i32 @vector.getDim(%class.vector* %rhs)
    %ne = icmp ne i32 %call_getDim, %call_vector_getDim
    store i1 %ne, i1* %OR_addr
    br i1 %ne, label %short_circuit_OR_end_OR, label %short_circuit_OR_branch_OR

short_circuit_OR_end_OR:                                     ; preds = entrance_block0 short_circuit_OR_branch_OR 
    %OR_short_circuit = load i1, i1* %OR_addr
    br i1 %OR_short_circuit, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_OR_branch_OR:                                  ; preds = entrance_block0 
    %Implicit_call_inclass_0 = load %class.vector*, %class.vector** %this_addr_0
    %call_getDim_0 = call i32 @vector.getDim(%class.vector* %Implicit_call_inclass_0)
    %eq = icmp eq i32 %call_getDim_0, 0
    store i1 %eq, i1* %OR_addr
    br label %short_circuit_OR_end_OR

single_then_basicblock:                                      ; preds = short_circuit_OR_end_OR 
    store %class.vector* null, %class.vector** %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock short_circuit_OR_end_OR 
    %class_malloc = call i8* @_f_malloc(i32 4)
    %class_ptr = bitcast i8* %class_malloc to %class.vector*
    store %class.vector* %class_ptr, %class.vector** %temp_addr
    %temp = load %class.vector*, %class.vector** %temp_addr
    %class_mem_gep_reg = getelementptr inbounds %class.vector, %class.vector* %temp, i32 0, i32 0
    %load_member = load i32*, i32** %class_mem_gep_reg
    %Implicit_call_inclass_1 = load %class.vector*, %class.vector** %this_addr_0
    %call_getDim_1 = call i32 @vector.getDim(%class.vector* %Implicit_call_inclass_1)
    %mul_bytes = mul i32 %call_getDim_1, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %call_getDim_1, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %class_mem_gep_reg
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = if_withoutelse_end_basicblock for_step 
    %i_0 = load i32, i32* %i_addr
    %Implicit_call_inclass_2 = load %class.vector*, %class.vector** %this_addr_0
    %call_getDim_2 = call i32 @vector.getDim(%class.vector* %Implicit_call_inclass_2)
    %slt = icmp slt i32 %i_0, %call_getDim_2
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_4 = load i32, i32* %i_addr
    %add_0 = add i32 %i_4, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %temp_0 = load %class.vector*, %class.vector** %temp_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.vector, %class.vector* %temp_0, i32 0, i32 0
    %load_member_0 = load i32*, i32** %class_mem_gep_reg_0
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %load_member_0, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %this_reg = load %class.vector*, %class.vector** %this_addr_0
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %this_reg, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    %i_2 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %vector.data_load_reg, i32 %i_2
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %rhs_0 = load %class.vector*, %class.vector** %rhs_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.vector, %class.vector* %rhs_0, i32 0, i32 0
    %load_member_1 = load i32*, i32** %class_mem_gep_reg_1
    %i_3 = load i32, i32* %i_addr
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %load_member_1, i32 %i_3
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    %add = add i32 %load_result_0, %load_result_1
    store i32 %add, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %temp_1 = load %class.vector*, %class.vector** %temp_addr
    store %class.vector* %temp_1, %class.vector** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock for_end_merge 
    %returnval = load %class.vector*, %class.vector** %return_register_infunction_addr
    ret %class.vector* %returnval
}
define dso_local void @vector.init(%class.vector* %this,i32* %vec_para) {
entrance_block0:                                             
    %i_addr = alloca i32
    %this_addr_0 = alloca %class.vector*
    %vec_addr = alloca i32*
    store i32* %vec_para, i32** %vec_addr
    store %class.vector* %this, %class.vector** %this_addr_0
    %vec = load i32*, i32** %vec_addr
    %eq = icmp eq i32* %vec, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %this_reg = load %class.vector*, %class.vector** %this_addr_0
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %this_reg, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    %vec_0 = load i32*, i32** %vec_addr
    %bitcast_i32 = bitcast i32* %vec_0 to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %mul_bytes = mul i32 %size_load, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %size_load, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %vector.data_gep_in_id
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = if_withoutelse_end_basicblock for_step 
    %i_0 = load i32, i32* %i_addr
    %vec_1 = load i32*, i32** %vec_addr
    %bitcast_i32_0 = bitcast i32* %vec_1 to i32*
    %gep_size_0 = getelementptr inbounds i32, i32* %bitcast_i32_0, i32 -1
    %size_load_0 = load i32, i32* %gep_size_0
    %slt = icmp slt i32 %i_0, %size_load_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_3 = load i32, i32* %i_addr
    %add = add i32 %i_3, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %data = load i32*, i32** %vector.data_gep_in_id
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %data, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %vec_2 = load i32*, i32** %vec_addr
    %i_2 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %vec_2, i32 %i_2
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 %load_result_0, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock for_end_merge 
    ret void
}
define dso_local %class.vector* @vector.scalarInPlaceMultiply(%class.vector* %this,i32 %c_para) {
entrance_block0:                                             
    %i_addr = alloca i32
    %this_addr_0 = alloca %class.vector*
    %c_addr = alloca i32
    %return_register_infunction_addr = alloca %class.vector*
    store i32 %c_para, i32* %c_addr
    store %class.vector* %this, %class.vector** %this_addr_0
    %this_reg = load %class.vector*, %class.vector** %this_addr_0
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %this_reg, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    %eq = icmp eq i32* %vector.data_load_reg, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store %class.vector* null, %class.vector** %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = if_withoutelse_end_basicblock for_step 
    %i_0 = load i32, i32* %i_addr
    %Implicit_call_inclass = load %class.vector*, %class.vector** %this_addr_0
    %call_getDim = call i32 @vector.getDim(%class.vector* %Implicit_call_inclass)
    %slt = icmp slt i32 %i_0, %call_getDim
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_3 = load i32, i32* %i_addr
    %add = add i32 %i_3, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %thisexpr_reg = load %class.vector*, %class.vector** %this_addr_0
    %class_mem_gep_reg = getelementptr inbounds %class.vector, %class.vector* %thisexpr_reg, i32 0, i32 0
    %load_member = load i32*, i32** %class_mem_gep_reg
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %load_member, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %c = load i32, i32* %c_addr
    %thisexpr_reg_0 = load %class.vector*, %class.vector** %this_addr_0
    %class_mem_gep_reg_0 = getelementptr inbounds %class.vector, %class.vector* %thisexpr_reg_0, i32 0, i32 0
    %load_member_0 = load i32*, i32** %class_mem_gep_reg_0
    %i_2 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_member_0, i32 %i_2
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %mul = mul i32 %c, %load_result_0
    store i32 %mul, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %thisexpr_reg_1 = load %class.vector*, %class.vector** %this_addr_0
    store %class.vector* %thisexpr_reg_1, %class.vector** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock for_end_merge 
    %returnval = load %class.vector*, %class.vector** %return_register_infunction_addr
    ret %class.vector* %returnval
}
define dso_local i1 @vector.copy(%class.vector* %this,%class.vector* %rhs_para) {
entrance_block0:                                             
    %i_addr = alloca i32
    %this_addr_0 = alloca %class.vector*
    %rhs_addr = alloca %class.vector*
    %return_register_infunction_addr = alloca i1
    store %class.vector* %rhs_para, %class.vector** %rhs_addr
    store %class.vector* %this, %class.vector** %this_addr_0
    %rhs = load %class.vector*, %class.vector** %rhs_addr
    %eq = icmp eq %class.vector* %rhs, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i1 false, i1* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %rhs_0 = load %class.vector*, %class.vector** %rhs_addr
    %call_vector_getDim = call i32 @vector.getDim(%class.vector* %rhs_0)
    %eq_0 = icmp eq i32 %call_vector_getDim, 0
    br i1 %eq_0, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = if_withoutelse_end_basicblock 
    %this_reg = load %class.vector*, %class.vector** %this_addr_0
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %this_reg, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    store i32* null, i32** %vector.data_gep_in_id
    br label %if_end_basicblock

else_basicblock:                                             ; preds = if_withoutelse_end_basicblock 
    %this_reg_0 = load %class.vector*, %class.vector** %this_addr_0
    %vector.data_gep_in_id_0 = getelementptr inbounds %class.vector, %class.vector* %this_reg_0, i32 0, i32 0
    %vector.data_load_reg_0 = load i32*, i32** %vector.data_gep_in_id_0
    %rhs_1 = load %class.vector*, %class.vector** %rhs_addr
    %call_vector_getDim_0 = call i32 @vector.getDim(%class.vector* %rhs_1)
    %mul_bytes = mul i32 %call_vector_getDim_0, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %call_vector_getDim_0, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %vector.data_gep_in_id_0
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock for_end_merge 
    store i1 true, i1* %return_register_infunction_addr
    br label %return_block0

for_condition:                                               ; preds = else_basicblock for_step 
    %i_0 = load i32, i32* %i_addr
    %Implicit_call_inclass = load %class.vector*, %class.vector** %this_addr_0
    %call_getDim = call i32 @vector.getDim(%class.vector* %Implicit_call_inclass)
    %slt = icmp slt i32 %i_0, %call_getDim
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_3 = load i32, i32* %i_addr
    %add = add i32 %i_3, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %data = load i32*, i32** %vector.data_gep_in_id_0
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %data, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %rhs_2 = load %class.vector*, %class.vector** %rhs_addr
    %class_mem_gep_reg = getelementptr inbounds %class.vector, %class.vector* %rhs_2, i32 0, i32 0
    %load_member = load i32*, i32** %class_mem_gep_reg
    %i_2 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_member, i32 %i_2
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 %load_result_0, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    br label %if_end_basicblock

return_block0:                                               ; preds = single_then_basicblock if_end_basicblock 
    %returnval = load i1, i1* %return_register_infunction_addr
    ret i1 %returnval
}
define dso_local i32 @vector.dot(%class.vector* %this,%class.vector* %rhs_para) {
entrance_block0:                                             
    %result_addr = alloca i32
    %i_addr = alloca i32
    %this_addr_0 = alloca %class.vector*
    %rhs_addr = alloca %class.vector*
    %return_register_infunction_addr = alloca i32
    store %class.vector* %rhs_para, %class.vector** %rhs_addr
    store %class.vector* %this, %class.vector** %this_addr_0
    store i32 0, i32* %i_addr
    store i32 0, i32* %result_addr
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body 
    %i = load i32, i32* %i_addr
    %Implicit_call_inclass = load %class.vector*, %class.vector** %this_addr_0
    %call_getDim = call i32 @vector.getDim(%class.vector* %Implicit_call_inclass)
    %slt = icmp slt i32 %i, %call_getDim
    br i1 %slt, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %result = load i32, i32* %result_addr
    %this_reg = load %class.vector*, %class.vector** %this_addr_0
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %this_reg, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    %i_0 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %vector.data_load_reg, i32 %i_0
    %load_result = load i32, i32* %getelementptr_reg
    %rhs = load %class.vector*, %class.vector** %rhs_addr
    %class_mem_gep_reg = getelementptr inbounds %class.vector, %class.vector* %rhs, i32 0, i32 0
    %load_member = load i32*, i32** %class_mem_gep_reg
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_member, i32 %i_1
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %mul = mul i32 %load_result, %load_result_0
    store i32 %mul, i32* %result_addr
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %while_condition

while_end_merge:                                             ; preds = entrance_block0 while_condition 
    %result_0 = load i32, i32* %result_addr
    store i32 %result_0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %y_addr = alloca %class.vector*
    %i_addr = alloca i32
    %a_addr = alloca i32*
    %x_addr = alloca %class.vector*
    %return_register_infunction_addr = alloca i32
    %class_malloc = call i8* @_f_malloc(i32 4)
    %class_ptr = bitcast i8* %class_malloc to %class.vector*
    store %class.vector* %class_ptr, %class.vector** %x_addr
    %mul_bytes = mul i32 10, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 10, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %a_addr
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %slt = icmp slt i32 %i_0, 10
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_3 = load i32, i32* %i_addr
    %add = add i32 %i_3, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %a = load i32*, i32** %a_addr
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %a, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %i_2 = load i32, i32* %i_addr
    %sub = sub i32 9, %i_2
    store i32 %sub, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %x = load %class.vector*, %class.vector** %x_addr
    %a_0 = load i32*, i32** %a_addr
    call void @vector.init(%class.vector* %x, i32* %a_0)
    %const_string_pointer = getelementptr inbounds [11 x i8], [11 x i8]* @const_string3, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    %x_0 = load %class.vector*, %class.vector** %x_addr
    %call_vector_tostring = call i8* @vector.tostring(%class.vector* %x_0)
    call void @println(i8* %call_vector_tostring)
    %class_malloc_0 = call i8* @_f_malloc(i32 4)
    %class_ptr_0 = bitcast i8* %class_malloc_0 to %class.vector*
    store %class.vector* %class_ptr_0, %class.vector** %y_addr
    %y = load %class.vector*, %class.vector** %y_addr
    %x_1 = load %class.vector*, %class.vector** %x_addr
    %call_vector_copy = call i1 @vector.copy(%class.vector* %y, %class.vector* %x_1)
    %y_0 = load %class.vector*, %class.vector** %y_addr
    %call_vector_set = call i1 @vector.set(%class.vector* %y_0, i32 3, i32 817)
    br i1 %call_vector_set, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = for_end_merge 
    %const_string_pointer_0 = getelementptr inbounds [9 x i8], [9 x i8]* @const_string4, i32 0, i32 0
    call void @println(i8* %const_string_pointer_0)
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_end_merge 
    %const_string_pointer_1 = getelementptr inbounds [11 x i8], [11 x i8]* @const_string5, i32 0, i32 0
    call void @print(i8* %const_string_pointer_1)
    %y_1 = load %class.vector*, %class.vector** %y_addr
    %call_vector_tostring_0 = call i8* @vector.tostring(%class.vector* %y_1)
    call void @println(i8* %call_vector_tostring_0)
    %const_string_pointer_2 = getelementptr inbounds [8 x i8], [8 x i8]* @const_string6, i32 0, i32 0
    call void @print(i8* %const_string_pointer_2)
    %x_2 = load %class.vector*, %class.vector** %x_addr
    %y_2 = load %class.vector*, %class.vector** %y_addr
    %call_vector_add = call %class.vector* @vector.add(%class.vector* %x_2, %class.vector* %y_2)
    %call_vector_tostring_1 = call i8* @vector.tostring(%class.vector* %call_vector_add)
    call void @println(i8* %call_vector_tostring_1)
    %const_string_pointer_3 = getelementptr inbounds [8 x i8], [8 x i8]* @const_string7, i32 0, i32 0
    call void @print(i8* %const_string_pointer_3)
    %x_3 = load %class.vector*, %class.vector** %x_addr
    %y_3 = load %class.vector*, %class.vector** %y_addr
    %call_vector_dot = call i32 @vector.dot(%class.vector* %x_3, %class.vector* %y_3)
    %call_toString = call i8* @toString(i32 %call_vector_dot)
    call void @println(i8* %call_toString)
    %const_string_pointer_4 = getelementptr inbounds [15 x i8], [15 x i8]* @const_string8, i32 0, i32 0
    call void @print(i8* %const_string_pointer_4)
    %y_4 = load %class.vector*, %class.vector** %y_addr
    %shl = shl i32 1, 3
    %call_vector_scalarInPlaceMultiply = call %class.vector* @vector.scalarInPlaceMultiply(%class.vector* %y_4, i32 %shl)
    %call_vector_tostring_2 = call i8* @vector.tostring(%class.vector* %call_vector_scalarInPlaceMultiply)
    call void @println(i8* %call_vector_tostring_2)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i8* @vector.tostring(%class.vector* %this) {
entrance_block0:                                             
    %i_addr = alloca i32
    %temp_addr = alloca i8*
    %this_addr_0 = alloca %class.vector*
    %return_register_infunction_addr = alloca i8*
    store %class.vector* %this, %class.vector** %this_addr_0
    %const_string_pointer = getelementptr inbounds [3 x i8], [3 x i8]* @const_string0, i32 0, i32 0
    store i8* %const_string_pointer, i8** %temp_addr
    %Implicit_call_inclass = load %class.vector*, %class.vector** %this_addr_0
    %call_getDim = call i32 @vector.getDim(%class.vector* %Implicit_call_inclass)
    %sgt = icmp sgt i32 %call_getDim, 0
    br i1 %sgt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %temp = load i8*, i8** %temp_addr
    %temp_0 = load i8*, i8** %temp_addr
    %this_reg = load %class.vector*, %class.vector** %this_addr_0
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %this_reg, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    %getelementptr_reg = getelementptr inbounds i32, i32* %vector.data_load_reg, i32 0
    %load_result = load i32, i32* %getelementptr_reg
    %call_toString = call i8* @toString(i32 %load_result)
    %string_add = call i8* @_str_concatenate(i8* %temp_0, i8* %call_toString)
    store i8* %string_add, i8** %temp_addr
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %i = load i32, i32* %i_addr
    store i32 1, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = if_withoutelse_end_basicblock for_step 
    %i_0 = load i32, i32* %i_addr
    %Implicit_call_inclass_0 = load %class.vector*, %class.vector** %this_addr_0
    %call_getDim_0 = call i32 @vector.getDim(%class.vector* %Implicit_call_inclass_0)
    %slt = icmp slt i32 %i_0, %call_getDim_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %temp_1 = load i8*, i8** %temp_addr
    %temp_2 = load i8*, i8** %temp_addr
    %const_string_pointer_0 = getelementptr inbounds [3 x i8], [3 x i8]* @const_string1, i32 0, i32 0
    %string_add_0 = call i8* @_str_concatenate(i8* %temp_2, i8* %const_string_pointer_0)
    %this_reg_0 = load %class.vector*, %class.vector** %this_addr_0
    %vector.data_gep_in_id_0 = getelementptr inbounds %class.vector, %class.vector* %this_reg_0, i32 0, i32 0
    %vector.data_load_reg_0 = load i32*, i32** %vector.data_gep_in_id_0
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %vector.data_load_reg_0, i32 %i_1
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %call_toString_0 = call i8* @toString(i32 %load_result_0)
    %string_add_1 = call i8* @_str_concatenate(i8* %string_add_0, i8* %call_toString_0)
    store i8* %string_add_1, i8** %temp_addr
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %temp_3 = load i8*, i8** %temp_addr
    %temp_4 = load i8*, i8** %temp_addr
    %const_string_pointer_1 = getelementptr inbounds [3 x i8], [3 x i8]* @const_string2, i32 0, i32 0
    %string_add_2 = call i8* @_str_concatenate(i8* %temp_4, i8* %const_string_pointer_1)
    store i8* %string_add_2, i8** %temp_addr
    %temp_5 = load i8*, i8** %temp_addr
    store i8* %temp_5, i8** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = for_end_merge 
    %returnval = load i8*, i8** %return_register_infunction_addr
    ret i8* %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local i1 @vector.set(%class.vector* %this,i32 %idx_para,i32 %value_para) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.vector*
    %value_addr = alloca i32
    %idx_addr = alloca i32
    %return_register_infunction_addr = alloca i1
    store i32 %idx_para, i32* %idx_addr
    store i32 %value_para, i32* %value_addr
    store %class.vector* %this, %class.vector** %this_addr_0
    %Implicit_call_inclass = load %class.vector*, %class.vector** %this_addr_0
    %call_getDim = call i32 @vector.getDim(%class.vector* %Implicit_call_inclass)
    %idx = load i32, i32* %idx_addr
    %slt = icmp slt i32 %call_getDim, %idx
    br i1 %slt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i1 false, i1* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %this_reg = load %class.vector*, %class.vector** %this_addr_0
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %this_reg, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    %idx_0 = load i32, i32* %idx_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %vector.data_load_reg, i32 %idx_0
    %load_result = load i32, i32* %getelementptr_reg
    %value = load i32, i32* %value_addr
    store i32 %value, i32* %getelementptr_reg
    store i1 true, i1* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock if_withoutelse_end_basicblock 
    %returnval = load i1, i1* %return_register_infunction_addr
    ret i1 %returnval
}
