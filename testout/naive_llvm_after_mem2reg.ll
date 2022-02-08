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
    store %class.vector null, %class.vector* %mem2reg0
    store i32 0, i32 %mem2reg1
    store %class.vector* %this, %class.vector* %mem2reg0
    store %class.vector* %mem2reg0, %class.vector* %mem2reg2
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %mem2reg2, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    %eq = icmp eq i32* %vector.data_load_reg, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i32 0, i32 %mem2reg1
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %data = load i32*, i32** %vector.data_gep_in_id
    %bitcast_i32 = bitcast i32* %data to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    store i32 %size_load, i32 %mem2reg1
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock if_withoutelse_end_basicblock 
    store i32 %mem2reg1, i32 %mem2reg3
    ret i32 %mem2reg3
}
define dso_local %class.vector* @vector.add(%class.vector* %this,%class.vector* %rhs_para) {
entrance_block0:                                             
    store i32 0, i32 %mem2reg4
    store %class.vector null, %class.vector* %mem2reg5
    store i1 false, i1 %mem2reg6
    store %class.vector null, %class.vector* %mem2reg7
    store %class.vector null, %class.vector* %mem2reg8
    store %class.vector null, %class.vector* %mem2reg9
    store %class.vector* %rhs_para, %class.vector* %mem2reg8
    store %class.vector* %this, %class.vector* %mem2reg7
    store %class.vector* %mem2reg7, %class.vector* %mem2reg10
    %call_getDim = call i32 @vector.getDim(%class.vector* mem2reg10)
    store %class.vector* %mem2reg8, %class.vector* %mem2reg11
    %call_vector_getDim = call i32 @vector.getDim(%class.vector* mem2reg11)
    %ne = icmp ne i32 %call_getDim, %call_vector_getDim
    store i1 %ne, i1 %mem2reg6
    br i1 %ne, label %short_circuit_OR_end_OR, label %short_circuit_OR_branch_OR

short_circuit_OR_end_OR:                                     ; preds = entrance_block0 short_circuit_OR_branch_OR 
    store i1 %mem2reg6, i1 %mem2reg12
    br i1 %mem2reg12, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_OR_branch_OR:                                  ; preds = entrance_block0 
    store %class.vector* %mem2reg7, %class.vector* %mem2reg13
    %call_getDim_0 = call i32 @vector.getDim(%class.vector* mem2reg13)
    %eq = icmp eq i32 %call_getDim_0, 0
    store i1 %eq, i1 %mem2reg6
    br label %short_circuit_OR_end_OR

single_then_basicblock:                                      ; preds = short_circuit_OR_end_OR 
    store %class.vector null, %class.vector* %mem2reg9
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock short_circuit_OR_end_OR 
    %class_malloc = call i8* @_f_malloc(i32 8)
    %class_ptr = bitcast i8* %class_malloc to %class.vector*
    store %class.vector* %class_ptr, %class.vector* %mem2reg5
    store %class.vector* %mem2reg5, %class.vector* %mem2reg14
    %class_mem_gep_reg = getelementptr inbounds %class.vector, %class.vector* %mem2reg14, i32 0, i32 0
    %load_member = load i32*, i32** %class_mem_gep_reg
    store %class.vector* %mem2reg7, %class.vector* %mem2reg15
    %call_getDim_1 = call i32 @vector.getDim(%class.vector* mem2reg15)
    %mul_bytes = mul i32 %call_getDim_1, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %call_getDim_1, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %class_mem_gep_reg
    store i32 %mem2reg4, i32 %mem2reg16
    store i32 0, i32 %mem2reg4
    br label %for_condition

for_condition:                                               ; preds = if_withoutelse_end_basicblock for_step 
    store i32 %mem2reg4, i32 %mem2reg17
    store %class.vector* %mem2reg7, %class.vector* %mem2reg18
    %call_getDim_2 = call i32 @vector.getDim(%class.vector* mem2reg18)
    %slt = icmp slt i32 mem2reg17, %call_getDim_2
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    store i32 %mem2reg4, i32 %mem2reg19
    %add_0 = add i32 mem2reg19, 1
    store i32 %add_0, i32 %mem2reg4
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store %class.vector* %mem2reg5, %class.vector* %mem2reg20
    %class_mem_gep_reg_0 = getelementptr inbounds %class.vector, %class.vector* %mem2reg20, i32 0, i32 0
    %load_member_0 = load i32*, i32** %class_mem_gep_reg_0
    store i32 %mem2reg4, i32 %mem2reg21
    %getelementptr_reg = getelementptr inbounds i32, i32* %load_member_0, i32 %mem2reg21
    %load_result = load i32, i32* %getelementptr_reg
    store %class.vector* %mem2reg7, %class.vector* %mem2reg22
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %mem2reg22, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    store i32 %mem2reg4, i32 %mem2reg23
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %vector.data_load_reg, i32 %mem2reg23
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store %class.vector* %mem2reg8, %class.vector* %mem2reg24
    %class_mem_gep_reg_1 = getelementptr inbounds %class.vector, %class.vector* %mem2reg24, i32 0, i32 0
    %load_member_1 = load i32*, i32** %class_mem_gep_reg_1
    store i32 %mem2reg4, i32 %mem2reg25
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %load_member_1, i32 %mem2reg25
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    %add = add i32 %load_result_0, %load_result_1
    store i32 %add, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    store %class.vector* %mem2reg5, %class.vector* %mem2reg26
    store %class.vector* %mem2reg26, %class.vector* %mem2reg9
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock for_end_merge 
    store %class.vector* %mem2reg9, %class.vector* %mem2reg27
    ret %class.vector* %mem2reg27
}
define dso_local void @vector.init(%class.vector* %this,i32* %vec_para) {
entrance_block0:                                             
    store i32 0, i32 %mem2reg28
    store %class.vector null, %class.vector* %mem2reg29
    store i32 null, i32* %mem2reg30
    store i32* %vec_para, i32* %mem2reg30
    store %class.vector* %this, %class.vector* %mem2reg29
    store i32* %mem2reg30, i32* %mem2reg31
    %eq = icmp eq i32* mem2reg31, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    store %class.vector* %mem2reg29, %class.vector* %mem2reg32
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %mem2reg32, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    store i32* %mem2reg30, i32* %mem2reg33
    %bitcast_i32 = bitcast i32* %mem2reg33 to i32*
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
    store i32 %mem2reg28, i32 %mem2reg34
    store i32 0, i32 %mem2reg28
    br label %for_condition

for_condition:                                               ; preds = if_withoutelse_end_basicblock for_step 
    store i32 %mem2reg28, i32 %mem2reg35
    store i32* %mem2reg30, i32* %mem2reg36
    %bitcast_i32_0 = bitcast i32* %mem2reg36 to i32*
    %gep_size_0 = getelementptr inbounds i32, i32* %bitcast_i32_0, i32 -1
    %size_load_0 = load i32, i32* %gep_size_0
    %slt = icmp slt i32 mem2reg35, %size_load_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    store i32 %mem2reg28, i32 %mem2reg37
    %add = add i32 mem2reg37, 1
    store i32 %add, i32 %mem2reg28
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %data = load i32*, i32** %vector.data_gep_in_id
    store i32 %mem2reg28, i32 %mem2reg38
    %getelementptr_reg = getelementptr inbounds i32, i32* %data, i32 %mem2reg38
    %load_result = load i32, i32* %getelementptr_reg
    store i32* %mem2reg30, i32* %mem2reg39
    store i32 %mem2reg28, i32 %mem2reg40
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %mem2reg39, i32 %mem2reg40
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
    store i32 0, i32 %mem2reg41
    store %class.vector null, %class.vector* %mem2reg42
    store i32 0, i32 %mem2reg43
    store %class.vector null, %class.vector* %mem2reg44
    store i32 %c_para, i32 %mem2reg43
    store %class.vector* %this, %class.vector* %mem2reg42
    store %class.vector* %mem2reg42, %class.vector* %mem2reg45
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %mem2reg45, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    %eq = icmp eq i32* %vector.data_load_reg, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store %class.vector null, %class.vector* %mem2reg44
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    store i32 %mem2reg41, i32 %mem2reg46
    store i32 0, i32 %mem2reg41
    br label %for_condition

for_condition:                                               ; preds = if_withoutelse_end_basicblock for_step 
    store i32 %mem2reg41, i32 %mem2reg47
    store %class.vector* %mem2reg42, %class.vector* %mem2reg48
    %call_getDim = call i32 @vector.getDim(%class.vector* mem2reg48)
    %slt = icmp slt i32 mem2reg47, %call_getDim
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    store i32 %mem2reg41, i32 %mem2reg49
    %add = add i32 mem2reg49, 1
    store i32 %add, i32 %mem2reg41
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store %class.vector* %mem2reg42, %class.vector* %mem2reg50
    %class_mem_gep_reg = getelementptr inbounds %class.vector, %class.vector* %mem2reg50, i32 0, i32 0
    %load_member = load i32*, i32** %class_mem_gep_reg
    store i32 %mem2reg41, i32 %mem2reg51
    %getelementptr_reg = getelementptr inbounds i32, i32* %load_member, i32 %mem2reg51
    %load_result = load i32, i32* %getelementptr_reg
    store i32 %mem2reg43, i32 %mem2reg52
    store %class.vector* %mem2reg42, %class.vector* %mem2reg53
    %class_mem_gep_reg_0 = getelementptr inbounds %class.vector, %class.vector* %mem2reg53, i32 0, i32 0
    %load_member_0 = load i32*, i32** %class_mem_gep_reg_0
    store i32 %mem2reg41, i32 %mem2reg54
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_member_0, i32 %mem2reg54
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %mul = mul i32 mem2reg52, %load_result_0
    store i32 %mul, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    store %class.vector* %mem2reg42, %class.vector* %mem2reg55
    store %class.vector* %mem2reg55, %class.vector* %mem2reg44
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock for_end_merge 
    store %class.vector* %mem2reg44, %class.vector* %mem2reg56
    ret %class.vector* %mem2reg56
}
define dso_local i1 @vector.copy(%class.vector* %this,%class.vector* %rhs_para) {
entrance_block0:                                             
    store i32 0, i32 %mem2reg57
    store %class.vector null, %class.vector* %mem2reg58
    store %class.vector null, %class.vector* %mem2reg59
    store i1 false, i1 %mem2reg60
    store %class.vector* %rhs_para, %class.vector* %mem2reg59
    store %class.vector* %this, %class.vector* %mem2reg58
    store %class.vector* %mem2reg59, %class.vector* %mem2reg61
    %eq = icmp eq %class.vector* mem2reg61, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i1 false, i1 %mem2reg60
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    store %class.vector* %mem2reg59, %class.vector* %mem2reg62
    %call_vector_getDim = call i32 @vector.getDim(%class.vector* mem2reg62)
    %eq_0 = icmp eq i32 %call_vector_getDim, 0
    br i1 %eq_0, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = if_withoutelse_end_basicblock 
    store %class.vector* %mem2reg58, %class.vector* %mem2reg63
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %mem2reg63, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    store i32* null, i32** %vector.data_gep_in_id
    br label %if_end_basicblock

else_basicblock:                                             ; preds = if_withoutelse_end_basicblock 
    store %class.vector* %mem2reg58, %class.vector* %mem2reg64
    %vector.data_gep_in_id_0 = getelementptr inbounds %class.vector, %class.vector* %mem2reg64, i32 0, i32 0
    %vector.data_load_reg_0 = load i32*, i32** %vector.data_gep_in_id_0
    store %class.vector* %mem2reg59, %class.vector* %mem2reg65
    %call_vector_getDim_0 = call i32 @vector.getDim(%class.vector* mem2reg65)
    %mul_bytes = mul i32 %call_vector_getDim_0, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %call_vector_getDim_0, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %vector.data_gep_in_id_0
    store i32 %mem2reg57, i32 %mem2reg66
    store i32 0, i32 %mem2reg57
    br label %for_condition

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock for_end_merge 
    store i1 true, i1 %mem2reg60
    br label %return_block0

for_condition:                                               ; preds = else_basicblock for_step 
    store i32 %mem2reg57, i32 %mem2reg67
    store %class.vector* %mem2reg58, %class.vector* %mem2reg68
    %call_getDim = call i32 @vector.getDim(%class.vector* mem2reg68)
    %slt = icmp slt i32 mem2reg67, %call_getDim
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    store i32 %mem2reg57, i32 %mem2reg69
    %add = add i32 mem2reg69, 1
    store i32 %add, i32 %mem2reg57
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %data = load i32*, i32** %vector.data_gep_in_id_0
    store i32 %mem2reg57, i32 %mem2reg70
    %getelementptr_reg = getelementptr inbounds i32, i32* %data, i32 %mem2reg70
    %load_result = load i32, i32* %getelementptr_reg
    store %class.vector* %mem2reg59, %class.vector* %mem2reg71
    %class_mem_gep_reg = getelementptr inbounds %class.vector, %class.vector* %mem2reg71, i32 0, i32 0
    %load_member = load i32*, i32** %class_mem_gep_reg
    store i32 %mem2reg57, i32 %mem2reg72
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_member, i32 %mem2reg72
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 %load_result_0, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    br label %if_end_basicblock

return_block0:                                               ; preds = single_then_basicblock if_end_basicblock 
    store i1 %mem2reg60, i1 %mem2reg73
    ret i1 %mem2reg73
}
define dso_local i32 @vector.dot(%class.vector* %this,%class.vector* %rhs_para) {
entrance_block0:                                             
    store i32 0, i32 %mem2reg74
    store i32 0, i32 %mem2reg75
    store %class.vector null, %class.vector* %mem2reg76
    store %class.vector null, %class.vector* %mem2reg77
    store i32 0, i32 %mem2reg78
    store %class.vector* %rhs_para, %class.vector* %mem2reg77
    store %class.vector* %this, %class.vector* %mem2reg76
    store i32 0, i32 %mem2reg75
    store i32 0, i32 %mem2reg74
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body 
    store i32 %mem2reg75, i32 %mem2reg79
    store %class.vector* %mem2reg76, %class.vector* %mem2reg80
    %call_getDim = call i32 @vector.getDim(%class.vector* mem2reg80)
    %slt = icmp slt i32 mem2reg79, %call_getDim
    br i1 %slt, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    store i32 %mem2reg74, i32 %mem2reg81
    store %class.vector* %mem2reg76, %class.vector* %mem2reg82
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %mem2reg82, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    store i32 %mem2reg75, i32 %mem2reg83
    %getelementptr_reg = getelementptr inbounds i32, i32* %vector.data_load_reg, i32 %mem2reg83
    %load_result = load i32, i32* %getelementptr_reg
    store %class.vector* %mem2reg77, %class.vector* %mem2reg84
    %class_mem_gep_reg = getelementptr inbounds %class.vector, %class.vector* %mem2reg84, i32 0, i32 0
    %load_member = load i32*, i32** %class_mem_gep_reg
    store i32 %mem2reg75, i32 %mem2reg85
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_member, i32 %mem2reg85
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %mul = mul i32 %load_result, %load_result_0
    store i32 %mul, i32 %mem2reg74
    store i32 %mem2reg75, i32 %mem2reg86
    %add = add i32 mem2reg86, 1
    store i32 %add, i32 %mem2reg75
    br label %while_condition

while_end_merge:                                             ; preds = entrance_block0 while_condition 
    store i32 %mem2reg74, i32 %mem2reg87
    store i32 %mem2reg87, i32 %mem2reg78
    br label %return_block0

return_block0:                                               ; preds = while_end_merge 
    store i32 %mem2reg78, i32 %mem2reg88
    ret i32 %mem2reg88
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    store %class.vector null, %class.vector* %mem2reg89
    store i32 0, i32 %mem2reg90
    store i32 null, i32* %mem2reg91
    store %class.vector null, %class.vector* %mem2reg92
    store i32 0, i32 %mem2reg93
    %class_malloc = call i8* @_f_malloc(i32 8)
    %class_ptr = bitcast i8* %class_malloc to %class.vector*
    store %class.vector* %class_ptr, %class.vector* %mem2reg92
    %mul_bytes = mul i32 10, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 10, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32* %mem2reg91
    store i32 %mem2reg90, i32 %mem2reg94
    store i32 0, i32 %mem2reg90
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    store i32 %mem2reg90, i32 %mem2reg95
    %slt = icmp slt i32 mem2reg95, 10
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    store i32 %mem2reg90, i32 %mem2reg96
    %add = add i32 mem2reg96, 1
    store i32 %add, i32 %mem2reg90
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store i32* %mem2reg91, i32* %mem2reg97
    store i32 %mem2reg90, i32 %mem2reg98
    %getelementptr_reg = getelementptr inbounds i32, i32* %mem2reg97, i32 %mem2reg98
    %load_result = load i32, i32* %getelementptr_reg
    store i32 %mem2reg90, i32 %mem2reg99
    %sub = sub i32 9, mem2reg99
    store i32 %sub, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    store %class.vector* %mem2reg92, %class.vector* %mem2reg100
    store i32* %mem2reg91, i32* %mem2reg101
    call void @vector.init(%class.vector* mem2reg100, i32* mem2reg101)
    %const_string_pointer = getelementptr inbounds [11 x i8], [11 x i8]* @const_string3, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    store %class.vector* %mem2reg92, %class.vector* %mem2reg102
    %call_vector_tostring = call i8* @vector.tostring(%class.vector* mem2reg102)
    call void @println(i8* %call_vector_tostring)
    %class_malloc_0 = call i8* @_f_malloc(i32 8)
    %class_ptr_0 = bitcast i8* %class_malloc_0 to %class.vector*
    store %class.vector* %class_ptr_0, %class.vector* %mem2reg89
    store %class.vector* %mem2reg89, %class.vector* %mem2reg103
    store %class.vector* %mem2reg92, %class.vector* %mem2reg104
    %call_vector_copy = call i1 @vector.copy(%class.vector* mem2reg103, %class.vector* mem2reg104)
    store %class.vector* %mem2reg89, %class.vector* %mem2reg105
    %call_vector_set = call i1 @vector.set(%class.vector* mem2reg105, i32 3, i32 817)
    br i1 %call_vector_set, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = for_end_merge 
    %const_string_pointer_0 = getelementptr inbounds [9 x i8], [9 x i8]* @const_string4, i32 0, i32 0
    call void @println(i8* %const_string_pointer_0)
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_end_merge 
    %const_string_pointer_1 = getelementptr inbounds [11 x i8], [11 x i8]* @const_string5, i32 0, i32 0
    call void @print(i8* %const_string_pointer_1)
    store %class.vector* %mem2reg89, %class.vector* %mem2reg106
    %call_vector_tostring_0 = call i8* @vector.tostring(%class.vector* mem2reg106)
    call void @println(i8* %call_vector_tostring_0)
    %const_string_pointer_2 = getelementptr inbounds [8 x i8], [8 x i8]* @const_string6, i32 0, i32 0
    call void @print(i8* %const_string_pointer_2)
    store %class.vector* %mem2reg92, %class.vector* %mem2reg107
    store %class.vector* %mem2reg89, %class.vector* %mem2reg108
    %call_vector_add = call %class.vector* @vector.add(%class.vector* mem2reg107, %class.vector* mem2reg108)
    %call_vector_tostring_1 = call i8* @vector.tostring(%class.vector* %call_vector_add)
    call void @println(i8* %call_vector_tostring_1)
    %const_string_pointer_3 = getelementptr inbounds [8 x i8], [8 x i8]* @const_string7, i32 0, i32 0
    call void @print(i8* %const_string_pointer_3)
    store %class.vector* %mem2reg92, %class.vector* %mem2reg109
    store %class.vector* %mem2reg89, %class.vector* %mem2reg110
    %call_vector_dot = call i32 @vector.dot(%class.vector* mem2reg109, %class.vector* mem2reg110)
    %call_toString = call i8* @toString(i32 %call_vector_dot)
    call void @println(i8* %call_toString)
    %const_string_pointer_4 = getelementptr inbounds [15 x i8], [15 x i8]* @const_string8, i32 0, i32 0
    call void @print(i8* %const_string_pointer_4)
    store %class.vector* %mem2reg89, %class.vector* %mem2reg111
    %shl = shl i32 1, 3
    %call_vector_scalarInPlaceMultiply = call %class.vector* @vector.scalarInPlaceMultiply(%class.vector* mem2reg111, i32 %shl)
    %call_vector_tostring_2 = call i8* @vector.tostring(%class.vector* %call_vector_scalarInPlaceMultiply)
    call void @println(i8* %call_vector_tostring_2)
    store i32 0, i32 %mem2reg93
    br label %return_block0

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    store i32 %mem2reg93, i32 %mem2reg112
    ret i32 %mem2reg112
}
define dso_local i8* @vector.tostring(%class.vector* %this) {
entrance_block0:                                             
    store i32 0, i32 %mem2reg113
    store i8 null, i8* %mem2reg114
    store %class.vector null, %class.vector* %mem2reg115
    store i8 null, i8* %mem2reg116
    store %class.vector* %this, %class.vector* %mem2reg115
    %const_string_pointer = getelementptr inbounds [3 x i8], [3 x i8]* @const_string0, i32 0, i32 0
    store i8* %const_string_pointer, i8* %mem2reg114
    store %class.vector* %mem2reg115, %class.vector* %mem2reg117
    %call_getDim = call i32 @vector.getDim(%class.vector* mem2reg117)
    %sgt = icmp sgt i32 %call_getDim, 0
    br i1 %sgt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i8* %mem2reg114, i8* %mem2reg118
    store i8* %mem2reg114, i8* %mem2reg119
    store %class.vector* %mem2reg115, %class.vector* %mem2reg120
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %mem2reg120, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    %getelementptr_reg = getelementptr inbounds i32, i32* %vector.data_load_reg, i32 0
    %load_result = load i32, i32* %getelementptr_reg
    %call_toString = call i8* @toString(i32 %load_result)
    %string_add = call i8* @_str_concatenate(i8* mem2reg119, i8* %call_toString)
    store i8* %string_add, i8* %mem2reg114
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    store i32 %mem2reg113, i32 %mem2reg121
    store i32 1, i32 %mem2reg113
    br label %for_condition

for_condition:                                               ; preds = if_withoutelse_end_basicblock for_step 
    store i32 %mem2reg113, i32 %mem2reg122
    store %class.vector* %mem2reg115, %class.vector* %mem2reg123
    %call_getDim_0 = call i32 @vector.getDim(%class.vector* mem2reg123)
    %slt = icmp slt i32 mem2reg122, %call_getDim_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    store i32 %mem2reg113, i32 %mem2reg124
    %add = add i32 mem2reg124, 1
    store i32 %add, i32 %mem2reg113
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store i8* %mem2reg114, i8* %mem2reg125
    store i8* %mem2reg114, i8* %mem2reg126
    %const_string_pointer_0 = getelementptr inbounds [3 x i8], [3 x i8]* @const_string1, i32 0, i32 0
    %string_add_0 = call i8* @_str_concatenate(i8* mem2reg126, i8* %const_string_pointer_0)
    store %class.vector* %mem2reg115, %class.vector* %mem2reg127
    %vector.data_gep_in_id_0 = getelementptr inbounds %class.vector, %class.vector* %mem2reg127, i32 0, i32 0
    %vector.data_load_reg_0 = load i32*, i32** %vector.data_gep_in_id_0
    store i32 %mem2reg113, i32 %mem2reg128
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %vector.data_load_reg_0, i32 %mem2reg128
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %call_toString_0 = call i8* @toString(i32 %load_result_0)
    %string_add_1 = call i8* @_str_concatenate(i8* %string_add_0, i8* %call_toString_0)
    store i8* %string_add_1, i8* %mem2reg114
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    store i8* %mem2reg114, i8* %mem2reg129
    store i8* %mem2reg114, i8* %mem2reg130
    %const_string_pointer_1 = getelementptr inbounds [3 x i8], [3 x i8]* @const_string2, i32 0, i32 0
    %string_add_2 = call i8* @_str_concatenate(i8* mem2reg130, i8* %const_string_pointer_1)
    store i8* %string_add_2, i8* %mem2reg114
    store i8* %mem2reg114, i8* %mem2reg131
    store i8* %mem2reg131, i8* %mem2reg116
    br label %return_block0

return_block0:                                               ; preds = for_end_merge 
    store i8* %mem2reg116, i8* %mem2reg132
    ret i8* %mem2reg132
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local i1 @vector.set(%class.vector* %this,i32 %idx_para,i32 %value_para) {
entrance_block0:                                             
    store %class.vector null, %class.vector* %mem2reg133
    store i32 0, i32 %mem2reg134
    store i32 0, i32 %mem2reg135
    store i1 false, i1 %mem2reg136
    store i32 %idx_para, i32 %mem2reg135
    store i32 %value_para, i32 %mem2reg134
    store %class.vector* %this, %class.vector* %mem2reg133
    store %class.vector* %mem2reg133, %class.vector* %mem2reg137
    %call_getDim = call i32 @vector.getDim(%class.vector* mem2reg137)
    store i32 %mem2reg135, i32 %mem2reg138
    %slt = icmp slt i32 %call_getDim, mem2reg138
    br i1 %slt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i1 false, i1 %mem2reg136
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    store %class.vector* %mem2reg133, %class.vector* %mem2reg139
    %vector.data_gep_in_id = getelementptr inbounds %class.vector, %class.vector* %mem2reg139, i32 0, i32 0
    %vector.data_load_reg = load i32*, i32** %vector.data_gep_in_id
    store i32 %mem2reg135, i32 %mem2reg140
    %getelementptr_reg = getelementptr inbounds i32, i32* %vector.data_load_reg, i32 %mem2reg140
    %load_result = load i32, i32* %getelementptr_reg
    store i32 %mem2reg134, i32 %mem2reg141
    store i32 %mem2reg141, i32* %getelementptr_reg
    store i1 true, i1 %mem2reg136
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock if_withoutelse_end_basicblock 
    store i1 %mem2reg136, i1 %mem2reg142
    ret i1 %mem2reg142
}
