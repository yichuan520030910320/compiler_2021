; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.Queue_int = type { i32*, i32, i32 }
%class.Edge = type { i32, i32, i32 }
%class.EdgeList = type { %class.Edge**, i32*, i32*, i32 }
@INF = dso_local global i32 0
@g = dso_local global %class.EdgeList* null
@m = dso_local global i32 0
@n = dso_local global i32 0

@const_string2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@const_string3 = private unnamed_addr constant [1 x i8] c"\00", align 1
@const_string0 = private unnamed_addr constant [37 x i8] c"Warning: Queue_int::pop: empty queue\00", align 1
@const_string1 = private unnamed_addr constant [3 x i8] c"-1\00", align 1

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
    %w_addr = alloca i32
    %v_addr = alloca i32
    %u_addr = alloca i32
    %i_addr = alloca i32
    %n = load i32, i32* @n
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @n
    %m = load i32, i32* @m
    %call_getInt_0 = call i32 @getInt()
    store i32 %call_getInt_0, i32* @m
    %g = load %class.EdgeList*, %class.EdgeList** @g
    %class_malloc = call i8* @_f_malloc(i32 28)
    %class_ptr = bitcast i8* %class_malloc to %class.EdgeList*
    store %class.EdgeList* %class_ptr, %class.EdgeList** @g
    %g_0 = load %class.EdgeList*, %class.EdgeList** @g
    %n_0 = load i32, i32* @n
    %m_0 = load i32, i32* @m
    call void @EdgeList.init(%class.EdgeList* %g_0, i32 %n_0, i32 %m_0)
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %m_1 = load i32, i32* @m
    %slt = icmp slt i32 %i_0, %m_1
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_1 = load i32, i32* %i_addr
    %add = add i32 %i_1, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %call_getInt_1 = call i32 @getInt()
    store i32 %call_getInt_1, i32* %u_addr
    %call_getInt_2 = call i32 @getInt()
    store i32 %call_getInt_2, i32* %v_addr
    %call_getInt_3 = call i32 @getInt()
    store i32 %call_getInt_3, i32* %w_addr
    %g_1 = load %class.EdgeList*, %class.EdgeList** @g
    %u = load i32, i32* %u_addr
    %v = load i32, i32* %v_addr
    %w = load i32, i32* %w_addr
    call void @EdgeList.addEdge(%class.EdgeList* %g_1, i32 %u, i32 %v, i32 %w)
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local void @Queue_int.Queue_int(%class.Queue_int* %this) {
entrance_block0:                                             
    %this_addr = alloca %class.Queue_int*
    store %class.Queue_int* %this, %class.Queue_int** %this_addr
    %this_reg = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.beg_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg, i32 0, i32 1
    %Queue_int.beg_load_reg = load i32, i32* %Queue_int.beg_gep_in_id
    store i32 0, i32* %Queue_int.beg_gep_in_id
    %this_reg_0 = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.end_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg_0, i32 0, i32 2
    %Queue_int.end_load_reg = load i32, i32* %Queue_int.end_gep_in_id
    store i32 0, i32* %Queue_int.end_gep_in_id
    %this_reg_1 = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.storage_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg_1, i32 0, i32 0
    %Queue_int.storage_load_reg = load i32*, i32** %Queue_int.storage_gep_in_id
    %mul_bytes = mul i32 16, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 16, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %Queue_int.storage_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local void @Queue_int.push(%class.Queue_int* %this,i32 %v_para) {
entrance_block0:                                             
    %this_addr = alloca %class.Queue_int*
    %v_addr = alloca i32
    store i32 %v_para, i32* %v_addr
    store %class.Queue_int* %this, %class.Queue_int** %this_addr
    %Implicit_call_inclass = load %class.Queue_int*, %class.Queue_int** %this_addr
    %call_size = call i32 @Queue_int.size(%class.Queue_int* %Implicit_call_inclass)
    %this_reg = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.storage_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg, i32 0, i32 0
    %Queue_int.storage_load_reg = load i32*, i32** %Queue_int.storage_gep_in_id
    %bitcast_i32 = bitcast i32* %Queue_int.storage_load_reg to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %sub = sub i32 %size_load, 1
    %eq = icmp eq i32 %call_size, %sub
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %Implicit_call_inclass_0 = load %class.Queue_int*, %class.Queue_int** %this_addr
    call void @Queue_int.doubleStorage(%class.Queue_int* %Implicit_call_inclass_0)
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %storage = load i32*, i32** %Queue_int.storage_gep_in_id
    %this_reg_0 = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.end_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg_0, i32 0, i32 2
    %Queue_int.end_load_reg = load i32, i32* %Queue_int.end_gep_in_id
    %getelementptr_reg = getelementptr inbounds i32, i32* %storage, i32 %Queue_int.end_load_reg
    %load_result = load i32, i32* %getelementptr_reg
    %v = load i32, i32* %v_addr
    store i32 %v, i32* %getelementptr_reg
    %end = load i32, i32* %Queue_int.end_gep_in_id
    %end_0 = load i32, i32* %Queue_int.end_gep_in_id
    %add = add i32 %end_0, 1
    %storage_0 = load i32*, i32** %Queue_int.storage_gep_in_id
    %bitcast_i32_0 = bitcast i32* %storage_0 to i32*
    %gep_size_0 = getelementptr inbounds i32, i32* %bitcast_i32_0, i32 -1
    %size_load_0 = load i32, i32* %gep_size_0
    %srem = srem i32 %add, %size_load_0
    store i32 %srem, i32* %Queue_int.end_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %d_addr = alloca i32*
    %j_addr = alloca i32
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    call void @init()
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %n = load i32, i32* @n
    %slt = icmp slt i32 %i_0, %n
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_2 = load i32, i32* %i_addr
    %add_0 = add i32 %i_2, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %i_1 = load i32, i32* %i_addr
    %call_spfa = call i32* @spfa(i32 %i_1)
    store i32* %call_spfa, i32** %d_addr
    %j = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %j_0 = load i32, i32* %j_addr
    %n_0 = load i32, i32* @n
    %slt_0 = icmp slt i32 %j_0, %n_0
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 if_end_basicblock 
    %j_3 = load i32, i32* %j_addr
    %add = add i32 %j_3, 1
    store i32 %add, i32* %j_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %d = load i32*, i32** %d_addr
    %j_1 = load i32, i32* %j_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %d, i32 %j_1
    %load_result = load i32, i32* %getelementptr_reg
    %INF = load i32, i32* @INF
    %eq = icmp eq i32 %load_result, %INF
    br i1 %eq, label %then_basicblock, label %else_basicblock

for_end_merge0:                                              ; preds = for_condition0 
    %const_string_pointer_1 = getelementptr inbounds [1 x i8], [1 x i8]* @const_string3, i32 0, i32 0
    call void @println(i8* %const_string_pointer_1)
    br label %for_step

then_basicblock:                                             ; preds = for_body0 
    %const_string_pointer = getelementptr inbounds [3 x i8], [3 x i8]* @const_string1, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    br label %if_end_basicblock

else_basicblock:                                             ; preds = for_body0 
    %d_0 = load i32*, i32** %d_addr
    %j_2 = load i32, i32* %j_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %d_0, i32 %j_2
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %call_toString = call i8* @toString(i32 %load_result_0)
    call void @print(i8* %call_toString)
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    %const_string_pointer_0 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string2, i32 0, i32 0
    call void @print(i8* %const_string_pointer_0)
    br label %for_step0

return_block0:                                               ; preds = for_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @Queue_int.size(%class.Queue_int* %this) {
entrance_block0:                                             
    %this_addr = alloca %class.Queue_int*
    %return_register_infunction_addr = alloca i32
    store %class.Queue_int* %this, %class.Queue_int** %this_addr
    %this_reg = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.end_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg, i32 0, i32 2
    %Queue_int.end_load_reg = load i32, i32* %Queue_int.end_gep_in_id
    %this_reg_0 = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.storage_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg_0, i32 0, i32 0
    %Queue_int.storage_load_reg = load i32*, i32** %Queue_int.storage_gep_in_id
    %bitcast_i32 = bitcast i32* %Queue_int.storage_load_reg to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %add = add i32 %Queue_int.end_load_reg, %size_load
    %this_reg_1 = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.beg_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg_1, i32 0, i32 1
    %Queue_int.beg_load_reg = load i32, i32* %Queue_int.beg_gep_in_id
    %sub = sub i32 %add, %Queue_int.beg_load_reg
    %storage = load i32*, i32** %Queue_int.storage_gep_in_id
    %bitcast_i32_0 = bitcast i32* %storage to i32*
    %gep_size_0 = getelementptr inbounds i32, i32* %bitcast_i32_0, i32 -1
    %size_load_0 = load i32, i32* %gep_size_0
    %srem = srem i32 %sub, %size_load_0
    store i32 %srem, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @Queue_int.doubleStorage(%class.Queue_int* %this) {
entrance_block0:                                             
    %i_addr = alloca i32
    %endCopy_addr = alloca i32
    %begCopy_addr = alloca i32
    %copy_addr = alloca i32*
    %this_addr = alloca %class.Queue_int*
    store %class.Queue_int* %this, %class.Queue_int** %this_addr
    %this_reg = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.storage_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg, i32 0, i32 0
    %Queue_int.storage_load_reg = load i32*, i32** %Queue_int.storage_gep_in_id
    store i32* %Queue_int.storage_load_reg, i32** %copy_addr
    %this_reg_0 = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.beg_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg_0, i32 0, i32 1
    %Queue_int.beg_load_reg = load i32, i32* %Queue_int.beg_gep_in_id
    store i32 %Queue_int.beg_load_reg, i32* %begCopy_addr
    %this_reg_1 = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.end_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg_1, i32 0, i32 2
    %Queue_int.end_load_reg = load i32, i32* %Queue_int.end_gep_in_id
    store i32 %Queue_int.end_load_reg, i32* %endCopy_addr
    %storage = load i32*, i32** %Queue_int.storage_gep_in_id
    %copy = load i32*, i32** %copy_addr
    %bitcast_i32 = bitcast i32* %copy to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %mul = mul i32 %size_load, 2
    %mul_bytes = mul i32 %mul, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %mul, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %Queue_int.storage_gep_in_id
    %beg = load i32, i32* %Queue_int.beg_gep_in_id
    store i32 0, i32* %Queue_int.beg_gep_in_id
    %end = load i32, i32* %Queue_int.end_gep_in_id
    store i32 0, i32* %Queue_int.end_gep_in_id
    %begCopy = load i32, i32* %begCopy_addr
    store i32 %begCopy, i32* %i_addr
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body 
    %i = load i32, i32* %i_addr
    %endCopy = load i32, i32* %endCopy_addr
    %ne = icmp ne i32 %i, %endCopy
    br i1 %ne, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %storage_0 = load i32*, i32** %Queue_int.storage_gep_in_id
    %end_0 = load i32, i32* %Queue_int.end_gep_in_id
    %getelementptr_reg = getelementptr inbounds i32, i32* %storage_0, i32 %end_0
    %load_result = load i32, i32* %getelementptr_reg
    %copy_0 = load i32*, i32** %copy_addr
    %i_0 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %copy_0, i32 %i_0
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 %load_result_0, i32* %getelementptr_reg
    %end_1 = load i32, i32* %Queue_int.end_gep_in_id
    %add = add i32 %end_1, 1
    store i32 %add, i32* %Queue_int.end_gep_in_id
    %i_1 = load i32, i32* %i_addr
    %i_2 = load i32, i32* %i_addr
    %add_0 = add i32 %i_2, 1
    %copy_1 = load i32*, i32** %copy_addr
    %bitcast_i32_0 = bitcast i32* %copy_1 to i32*
    %gep_size_0 = getelementptr inbounds i32, i32* %bitcast_i32_0, i32 -1
    %size_load_0 = load i32, i32* %gep_size_0
    %srem = srem i32 %add_0, %size_load_0
    store i32 %srem, i32* %i_addr
    br label %while_condition

while_end_merge:                                             ; preds = entrance_block0 while_condition 
    br label %return_block0

return_block0:                                               ; preds = while_end_merge 
    ret void
}
define dso_local i32* @spfa(i32 %s_para) {
entrance_block0:                                             
    %v_addr = alloca i32
    %e_addr = alloca %class.Edge*
    %k_addr = alloca i32
    %u_addr = alloca i32
    %q_addr = alloca %class.Queue_int*
    %i_addr = alloca i32
    %d_addr = alloca i32*
    %s_addr = alloca i32
    %return_register_infunction_addr = alloca i32*
    store i32 %s_para, i32* %s_addr
    %n = load i32, i32* @n
    %mul_bytes = mul i32 %n, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %n, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** %d_addr
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %n_0 = load i32, i32* @n
    %slt = icmp slt i32 %i_0, %n_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %d = load i32*, i32** %d_addr
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %d, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %INF = load i32, i32* @INF
    store i32 %INF, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %d_0 = load i32*, i32** %d_addr
    %s = load i32, i32* %s_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %d_0, i32 %s
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 0, i32* %getelementptr_reg_0
    %class_malloc = call i8* @_f_malloc(i32 16)
    %class_ptr = bitcast i8* %class_malloc to %class.Queue_int*
    call void @Queue_int.Queue_int(%class.Queue_int* %class_ptr)
    store %class.Queue_int* %class_ptr, %class.Queue_int** %q_addr
    %q = load %class.Queue_int*, %class.Queue_int** %q_addr
    %s_0 = load i32, i32* %s_addr
    call void @Queue_int.push(%class.Queue_int* %q, i32 %s_0)
    br label %while_condition

while_condition:                                             ; preds = for_end_merge while_body for_end_merge0 
    %q_0 = load %class.Queue_int*, %class.Queue_int** %q_addr
    %call_Queue_int_size = call i32 @Queue_int.size(%class.Queue_int* %q_0)
    %ne = icmp ne i32 %call_Queue_int_size, 0
    br i1 %ne, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %q_1 = load %class.Queue_int*, %class.Queue_int** %q_addr
    %call_Queue_int_pop = call i32 @Queue_int.pop(%class.Queue_int* %q_1)
    store i32 %call_Queue_int_pop, i32* %u_addr
    %k = load i32, i32* %k_addr
    %g = load %class.EdgeList*, %class.EdgeList** @g
    %class_mem_gep_reg = getelementptr inbounds %class.EdgeList, %class.EdgeList* %g, i32 0, i32 2
    %load_member = load i32*, i32** %class_mem_gep_reg
    %u = load i32, i32* %u_addr
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %load_member, i32 %u
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    store i32 %load_result_1, i32* %k_addr
    br label %for_condition0

while_end_merge:                                             ; preds = for_end_merge while_condition 
    %d_5 = load i32*, i32** %d_addr
    store i32* %d_5, i32** %return_register_infunction_addr
    br label %return_block0

for_condition0:                                              ; preds = while_body for_step0 
    %k_0 = load i32, i32* %k_addr
    %SUB_single_front = mul i32 1, -1
    %ne_0 = icmp ne i32 %k_0, %SUB_single_front
    br i1 %ne_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 if_withoutelse_end_basicblock 
    %k_2 = load i32, i32* %k_addr
    %g_1 = load %class.EdgeList*, %class.EdgeList** @g
    %class_mem_gep_reg_4 = getelementptr inbounds %class.EdgeList, %class.EdgeList* %g_1, i32 0, i32 1
    %load_member_4 = load i32*, i32** %class_mem_gep_reg_4
    %k_3 = load i32, i32* %k_addr
    %getelementptr_reg_7 = getelementptr inbounds i32, i32* %load_member_4, i32 %k_3
    %load_result_7 = load i32, i32* %getelementptr_reg_7
    store i32 %load_result_7, i32* %k_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %g_0 = load %class.EdgeList*, %class.EdgeList** @g
    %class_mem_gep_reg_0 = getelementptr inbounds %class.EdgeList, %class.EdgeList* %g_0, i32 0, i32 0
    %load_member_0 = load %class.Edge**, %class.Edge*** %class_mem_gep_reg_0
    %k_1 = load i32, i32* %k_addr
    %getelementptr_reg_2 = getelementptr inbounds %class.Edge*, %class.Edge** %load_member_0, i32 %k_1
    %load_result_2 = load %class.Edge*, %class.Edge** %getelementptr_reg_2
    store %class.Edge* %load_result_2, %class.Edge** %e_addr
    %e = load %class.Edge*, %class.Edge** %e_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.Edge, %class.Edge* %e, i32 0, i32 1
    %load_member_1 = load i32, i32* %class_mem_gep_reg_1
    store i32 %load_member_1, i32* %v_addr
    %d_1 = load i32*, i32** %d_addr
    %v = load i32, i32* %v_addr
    %getelementptr_reg_3 = getelementptr inbounds i32, i32* %d_1, i32 %v
    %load_result_3 = load i32, i32* %getelementptr_reg_3
    %d_2 = load i32*, i32** %d_addr
    %u_0 = load i32, i32* %u_addr
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %d_2, i32 %u_0
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %e_0 = load %class.Edge*, %class.Edge** %e_addr
    %class_mem_gep_reg_2 = getelementptr inbounds %class.Edge, %class.Edge* %e_0, i32 0, i32 2
    %load_member_2 = load i32, i32* %class_mem_gep_reg_2
    %add_0 = add i32 %load_result_4, %load_member_2
    %sgt = icmp sgt i32 %load_result_3, %add_0
    br i1 %sgt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge0:                                              ; preds = for_condition0 
    br label %while_condition

single_then_basicblock:                                      ; preds = for_body0 
    %d_3 = load i32*, i32** %d_addr
    %v_0 = load i32, i32* %v_addr
    %getelementptr_reg_5 = getelementptr inbounds i32, i32* %d_3, i32 %v_0
    %load_result_5 = load i32, i32* %getelementptr_reg_5
    %d_4 = load i32*, i32** %d_addr
    %u_1 = load i32, i32* %u_addr
    %getelementptr_reg_6 = getelementptr inbounds i32, i32* %d_4, i32 %u_1
    %load_result_6 = load i32, i32* %getelementptr_reg_6
    %e_1 = load %class.Edge*, %class.Edge** %e_addr
    %class_mem_gep_reg_3 = getelementptr inbounds %class.Edge, %class.Edge* %e_1, i32 0, i32 2
    %load_member_3 = load i32, i32* %class_mem_gep_reg_3
    %add_1 = add i32 %load_result_6, %load_member_3
    store i32 %add_1, i32* %getelementptr_reg_5
    %q_2 = load %class.Queue_int*, %class.Queue_int** %q_addr
    %v_1 = load i32, i32* %v_addr
    call void @Queue_int.push(%class.Queue_int* %q_2, i32 %v_1)
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body0 
    br label %for_step0

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32*, i32** %return_register_infunction_addr
    ret i32* %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    store i32 10000000, i32* @INF
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local void @EdgeList.init(%class.EdgeList* %this,i32 %n_para,i32 %m_para) {
entrance_block0:                                             
    %i_addr = alloca i32
    %this_addr = alloca %class.EdgeList*
    %m_addr = alloca i32
    %n_addr = alloca i32
    store i32 %n_para, i32* %n_addr
    store i32 %m_para, i32* %m_addr
    store %class.EdgeList* %this, %class.EdgeList** %this_addr
    %this_reg = load %class.EdgeList*, %class.EdgeList** %this_addr
    %EdgeList.edges_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg, i32 0, i32 0
    %EdgeList.edges_load_reg = load %class.Edge**, %class.Edge*** %EdgeList.edges_gep_in_id
    %m = load i32, i32* %m_addr
    %mul_bytes = mul i32 %m, 8
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %m, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to %class.Edge**
    store %class.Edge** %array_addr, %class.Edge*** %EdgeList.edges_gep_in_id
    %this_reg_0 = load %class.EdgeList*, %class.EdgeList** %this_addr
    %EdgeList.next_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg_0, i32 0, i32 1
    %EdgeList.next_load_reg = load i32*, i32** %EdgeList.next_gep_in_id
    %m_0 = load i32, i32* %m_addr
    %mul_bytes_0 = mul i32 %m_0, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 %m_0, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** %EdgeList.next_gep_in_id
    %this_reg_1 = load %class.EdgeList*, %class.EdgeList** %this_addr
    %EdgeList.first_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg_1, i32 0, i32 2
    %EdgeList.first_load_reg = load i32*, i32** %EdgeList.first_gep_in_id
    %n = load i32, i32* %n_addr
    %mul_bytes_1 = mul i32 %n, 4
    %sum_bytes_1 = add i32 %mul_bytes_1, 4
    %malloca_1 = call i8* @_f_malloc(i32 %sum_bytes_1)
    %array_cast_i8_to_i32_1 = bitcast i8* %malloca_1 to i32*
    store i32 %n, i32* %array_cast_i8_to_i32_1
    %array_tmp_begin_i32_1 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_1, i32 1
    %array_addr_1 = bitcast i32* %array_tmp_begin_i32_1 to i32*
    store i32* %array_addr_1, i32** %EdgeList.first_gep_in_id
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %m_1 = load i32, i32* %m_addr
    %slt = icmp slt i32 %i_0, %m_1
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %next = load i32*, i32** %EdgeList.next_gep_in_id
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %next, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %SUB_single_front = mul i32 1, -1
    store i32 %SUB_single_front, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %i_3 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %i_4 = load i32, i32* %i_addr
    %n_0 = load i32, i32* %n_addr
    %slt_0 = icmp slt i32 %i_4, %n_0
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %i_6 = load i32, i32* %i_addr
    %add_0 = add i32 %i_6, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %first = load i32*, i32** %EdgeList.first_gep_in_id
    %i_5 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %first, i32 %i_5
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %SUB_single_front_0 = mul i32 1, -1
    store i32 %SUB_single_front_0, i32* %getelementptr_reg_0
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    %this_reg_2 = load %class.EdgeList*, %class.EdgeList** %this_addr
    %EdgeList.size_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg_2, i32 0, i32 3
    %EdgeList.size_load_reg = load i32, i32* %EdgeList.size_gep_in_id
    store i32 0, i32* %EdgeList.size_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = for_end_merge0 
    ret void
}
define dso_local i32 @Queue_int.top(%class.Queue_int* %this) {
entrance_block0:                                             
    %this_addr = alloca %class.Queue_int*
    %return_register_infunction_addr = alloca i32
    store %class.Queue_int* %this, %class.Queue_int** %this_addr
    %this_reg = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.storage_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg, i32 0, i32 0
    %Queue_int.storage_load_reg = load i32*, i32** %Queue_int.storage_gep_in_id
    %this_reg_0 = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.beg_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg_0, i32 0, i32 1
    %Queue_int.beg_load_reg = load i32, i32* %Queue_int.beg_gep_in_id
    %getelementptr_reg = getelementptr inbounds i32, i32* %Queue_int.storage_load_reg, i32 %Queue_int.beg_load_reg
    %load_result = load i32, i32* %getelementptr_reg
    store i32 %load_result, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @EdgeList.nVertices(%class.EdgeList* %this) {
entrance_block0:                                             
    %this_addr = alloca %class.EdgeList*
    %return_register_infunction_addr = alloca i32
    store %class.EdgeList* %this, %class.EdgeList** %this_addr
    %this_reg = load %class.EdgeList*, %class.EdgeList** %this_addr
    %EdgeList.first_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg, i32 0, i32 2
    %EdgeList.first_load_reg = load i32*, i32** %EdgeList.first_gep_in_id
    %bitcast_i32 = bitcast i32* %EdgeList.first_load_reg to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    store i32 %size_load, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @EdgeList.nEdges(%class.EdgeList* %this) {
entrance_block0:                                             
    %this_addr = alloca %class.EdgeList*
    %return_register_infunction_addr = alloca i32
    store %class.EdgeList* %this, %class.EdgeList** %this_addr
    %this_reg = load %class.EdgeList*, %class.EdgeList** %this_addr
    %EdgeList.edges_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg, i32 0, i32 0
    %EdgeList.edges_load_reg = load %class.Edge**, %class.Edge*** %EdgeList.edges_gep_in_id
    %bitcast_i32 = bitcast %class.Edge** %EdgeList.edges_load_reg to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    store i32 %size_load, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @Queue_int.pop(%class.Queue_int* %this) {
entrance_block0:                                             
    %res_addr = alloca i32
    %this_addr = alloca %class.Queue_int*
    %return_register_infunction_addr = alloca i32
    store %class.Queue_int* %this, %class.Queue_int** %this_addr
    %Implicit_call_inclass = load %class.Queue_int*, %class.Queue_int** %this_addr
    %call_size = call i32 @Queue_int.size(%class.Queue_int* %Implicit_call_inclass)
    %eq = icmp eq i32 %call_size, 0
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %const_string_pointer = getelementptr inbounds [37 x i8], [37 x i8]* @const_string0, i32 0, i32 0
    call void @println(i8* %const_string_pointer)
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %Implicit_call_inclass_0 = load %class.Queue_int*, %class.Queue_int** %this_addr
    %call_top = call i32 @Queue_int.top(%class.Queue_int* %Implicit_call_inclass_0)
    store i32 %call_top, i32* %res_addr
    %this_reg = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.beg_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg, i32 0, i32 1
    %Queue_int.beg_load_reg = load i32, i32* %Queue_int.beg_gep_in_id
    %beg = load i32, i32* %Queue_int.beg_gep_in_id
    %add = add i32 %beg, 1
    %this_reg_0 = load %class.Queue_int*, %class.Queue_int** %this_addr
    %Queue_int.storage_gep_in_id = getelementptr inbounds %class.Queue_int, %class.Queue_int* %this_reg_0, i32 0, i32 0
    %Queue_int.storage_load_reg = load i32*, i32** %Queue_int.storage_gep_in_id
    %bitcast_i32 = bitcast i32* %Queue_int.storage_load_reg to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %srem = srem i32 %add, %size_load
    store i32 %srem, i32* %Queue_int.beg_gep_in_id
    %res = load i32, i32* %res_addr
    store i32 %res, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @EdgeList.addEdge(%class.EdgeList* %this,i32 %u_para,i32 %v_para,i32 %w_para) {
entrance_block0:                                             
    %e_addr = alloca %class.Edge*
    %this_addr = alloca %class.EdgeList*
    %w_addr = alloca i32
    %v_addr = alloca i32
    %u_addr = alloca i32
    store i32 %u_para, i32* %u_addr
    store i32 %v_para, i32* %v_addr
    store i32 %w_para, i32* %w_addr
    store %class.EdgeList* %this, %class.EdgeList** %this_addr
    %class_malloc = call i8* @_f_malloc(i32 12)
    %class_ptr = bitcast i8* %class_malloc to %class.Edge*
    store %class.Edge* %class_ptr, %class.Edge** %e_addr
    %e = load %class.Edge*, %class.Edge** %e_addr
    %class_mem_gep_reg = getelementptr inbounds %class.Edge, %class.Edge* %e, i32 0, i32 0
    %load_member = load i32, i32* %class_mem_gep_reg
    %u = load i32, i32* %u_addr
    store i32 %u, i32* %class_mem_gep_reg
    %e_0 = load %class.Edge*, %class.Edge** %e_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.Edge, %class.Edge* %e_0, i32 0, i32 1
    %load_member_0 = load i32, i32* %class_mem_gep_reg_0
    %v = load i32, i32* %v_addr
    store i32 %v, i32* %class_mem_gep_reg_0
    %e_1 = load %class.Edge*, %class.Edge** %e_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.Edge, %class.Edge* %e_1, i32 0, i32 2
    %load_member_1 = load i32, i32* %class_mem_gep_reg_1
    %w = load i32, i32* %w_addr
    store i32 %w, i32* %class_mem_gep_reg_1
    %this_reg = load %class.EdgeList*, %class.EdgeList** %this_addr
    %EdgeList.edges_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg, i32 0, i32 0
    %EdgeList.edges_load_reg = load %class.Edge**, %class.Edge*** %EdgeList.edges_gep_in_id
    %this_reg_0 = load %class.EdgeList*, %class.EdgeList** %this_addr
    %EdgeList.size_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg_0, i32 0, i32 3
    %EdgeList.size_load_reg = load i32, i32* %EdgeList.size_gep_in_id
    %getelementptr_reg = getelementptr inbounds %class.Edge*, %class.Edge** %EdgeList.edges_load_reg, i32 %EdgeList.size_load_reg
    %load_result = load %class.Edge*, %class.Edge** %getelementptr_reg
    %e_2 = load %class.Edge*, %class.Edge** %e_addr
    store %class.Edge* %e_2, %class.Edge** %getelementptr_reg
    %this_reg_1 = load %class.EdgeList*, %class.EdgeList** %this_addr
    %EdgeList.next_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg_1, i32 0, i32 1
    %EdgeList.next_load_reg = load i32*, i32** %EdgeList.next_gep_in_id
    %size = load i32, i32* %EdgeList.size_gep_in_id
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %EdgeList.next_load_reg, i32 %size
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %this_reg_2 = load %class.EdgeList*, %class.EdgeList** %this_addr
    %EdgeList.first_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg_2, i32 0, i32 2
    %EdgeList.first_load_reg = load i32*, i32** %EdgeList.first_gep_in_id
    %u_0 = load i32, i32* %u_addr
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %EdgeList.first_load_reg, i32 %u_0
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    store i32 %load_result_1, i32* %getelementptr_reg_0
    %first = load i32*, i32** %EdgeList.first_gep_in_id
    %u_1 = load i32, i32* %u_addr
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %first, i32 %u_1
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %size_0 = load i32, i32* %EdgeList.size_gep_in_id
    store i32 %size_0, i32* %getelementptr_reg_2
    %size_1 = load i32, i32* %EdgeList.size_gep_in_id
    %add = add i32 %size_1, 1
    store i32 %add, i32* %EdgeList.size_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
