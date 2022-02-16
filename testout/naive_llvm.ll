; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.Array_Node = type { %class.Node**, i32 }
%class.Heap_Node = type { %class.Array_Node* }
%class.Node = type { i32, i32 }
%class.Edge = type { i32, i32, i32 }
%class.EdgeList = type { %class.Edge**, i32*, i32*, i32 }
@INF = dso_local global i32 0
@g = dso_local global %class.EdgeList* null
@m = dso_local global i32 0
@n = dso_local global i32 0

@const_string1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@const_string2 = private unnamed_addr constant [1 x i8] c"\00", align 1
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

define dso_local %class.Node* @Heap_Node.pop(%class.Heap_Node* %this) {
entrance_block0:                                             
    %res_addr = alloca %class.Node*
    %this_addr_0 = alloca %class.Heap_Node*
    %return_register_infunction_addr = alloca %class.Node*
    store %class.Heap_Node* %this, %class.Heap_Node** %this_addr_0
    %this_reg = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %Heap_Node.storage_gep_in_id = getelementptr inbounds %class.Heap_Node, %class.Heap_Node* %this_reg, i32 0, i32 0
    %Heap_Node.storage_load_reg = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %call_Array_Node_front = call %class.Node* @Array_Node.front(%class.Array_Node* %Heap_Node.storage_load_reg)
    store %class.Node* %call_Array_Node_front, %class.Node** %res_addr
    %storage = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %Implicit_call_inclass = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %call_size = call i32 @Heap_Node.size(%class.Heap_Node* %Implicit_call_inclass)
    %sub = sub i32 %call_size, 1
    call void @Array_Node.swap(%class.Array_Node* %storage, i32 0, i32 %sub)
    %storage_0 = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %call_Array_Node_pop_back = call %class.Node* @Array_Node.pop_back(%class.Array_Node* %storage_0)
    %Implicit_call_inclass_0 = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    call void @Heap_Node.maxHeapify(%class.Heap_Node* %Implicit_call_inclass_0, i32 0)
    %res = load %class.Node*, %class.Node** %res_addr
    store %class.Node* %res, %class.Node** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load %class.Node*, %class.Node** %return_register_infunction_addr
    ret %class.Node* %returnval
}
define dso_local i32 @Heap_Node.rchild(%class.Heap_Node* %this,i32 %x_para) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Heap_Node*
    %x_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %x_para, i32* %x_addr
    store %class.Heap_Node* %this, %class.Heap_Node** %this_addr_0
    %x = load i32, i32* %x_addr
    %mul = mul i32 %x, 2
    %add = add i32 %mul, 2
    store i32 %add, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @Heap_Node.push(%class.Heap_Node* %this,%class.Node* %v_para) {
entrance_block0:                                             
    %p_addr = alloca i32
    %x_addr = alloca i32
    %this_addr_0 = alloca %class.Heap_Node*
    %v_addr = alloca %class.Node*
    store %class.Node* %v_para, %class.Node** %v_addr
    store %class.Heap_Node* %this, %class.Heap_Node** %this_addr_0
    %this_reg = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %Heap_Node.storage_gep_in_id = getelementptr inbounds %class.Heap_Node, %class.Heap_Node* %this_reg, i32 0, i32 0
    %Heap_Node.storage_load_reg = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %v = load %class.Node*, %class.Node** %v_addr
    call void @Array_Node.push_back(%class.Array_Node* %Heap_Node.storage_load_reg, %class.Node* %v)
    %Implicit_call_inclass = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %call_size = call i32 @Heap_Node.size(%class.Heap_Node* %Implicit_call_inclass)
    %sub = sub i32 %call_size, 1
    store i32 %sub, i32* %x_addr
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body if_withoutelse_end_basicblock 
    %x = load i32, i32* %x_addr
    %sgt = icmp sgt i32 %x, 0
    br i1 %sgt, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %Implicit_call_inclass_0 = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %x_0 = load i32, i32* %x_addr
    %call_pnt = call i32 @Heap_Node.pnt(%class.Heap_Node* %Implicit_call_inclass_0, i32 %x_0)
    store i32 %call_pnt, i32* %p_addr
    %storage = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %p = load i32, i32* %p_addr
    %call_Array_Node_get = call %class.Node* @Array_Node.get(%class.Array_Node* %storage, i32 %p)
    %call_Node_key_ = call i32 @Node.key_(%class.Node* %call_Array_Node_get)
    %storage_0 = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %x_1 = load i32, i32* %x_addr
    %call_Array_Node_get_0 = call %class.Node* @Array_Node.get(%class.Array_Node* %storage_0, i32 %x_1)
    %call_Node_key__0 = call i32 @Node.key_(%class.Node* %call_Array_Node_get_0)
    %sge = icmp sge i32 %call_Node_key_, %call_Node_key__0
    br i1 %sge, label %single_then_basicblock, label %if_withoutelse_end_basicblock

while_end_merge:                                             ; preds = entrance_block0 while_condition single_then_basicblock 
    br label %return_block0

single_then_basicblock:                                      ; preds = while_body 
    br label %while_end_merge

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock while_body 
    %storage_1 = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %p_0 = load i32, i32* %p_addr
    %x_2 = load i32, i32* %x_addr
    call void @Array_Node.swap(%class.Array_Node* %storage_1, i32 %p_0, i32 %x_2)
    %p_1 = load i32, i32* %p_addr
    store i32 %p_1, i32* %x_addr
    br label %while_condition

return_block0:                                               ; preds = while_end_merge 
    ret void
}
define dso_local %class.Node* @Heap_Node.top(%class.Heap_Node* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Heap_Node*
    %return_register_infunction_addr = alloca %class.Node*
    store %class.Heap_Node* %this, %class.Heap_Node** %this_addr_0
    %this_reg = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %Heap_Node.storage_gep_in_id = getelementptr inbounds %class.Heap_Node, %class.Heap_Node* %this_reg, i32 0, i32 0
    %Heap_Node.storage_load_reg = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %call_Array_Node_front = call %class.Node* @Array_Node.front(%class.Array_Node* %Heap_Node.storage_load_reg)
    store %class.Node* %call_Array_Node_front, %class.Node** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load %class.Node*, %class.Node** %return_register_infunction_addr
    ret %class.Node* %returnval
}
define dso_local %class.Node* @Array_Node.front(%class.Array_Node* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Array_Node*
    %return_register_infunction_addr = alloca %class.Node*
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.storage_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 0
    %Array_Node.storage_load_reg = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %Array_Node.storage_load_reg, i32 0
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    store %class.Node* %load_result, %class.Node** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load %class.Node*, %class.Node** %return_register_infunction_addr
    ret %class.Node* %returnval
}
define dso_local %class.Node* @Array_Node.pop_back(%class.Array_Node* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Array_Node*
    %return_register_infunction_addr = alloca %class.Node*
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.sz_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 1
    %Array_Node.sz_load_reg = load i32, i32* %Array_Node.sz_gep_in_id
    %sub = sub i32 %Array_Node.sz_load_reg, 1
    store i32 %sub, i32* %Array_Node.sz_gep_in_id
    %this_reg_0 = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.storage_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg_0, i32 0, i32 0
    %Array_Node.storage_load_reg = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %sz = load i32, i32* %Array_Node.sz_gep_in_id
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %Array_Node.storage_load_reg, i32 %sz
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    store %class.Node* %load_result, %class.Node** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load %class.Node*, %class.Node** %return_register_infunction_addr
    ret %class.Node* %returnval
}
define dso_local void @Array_Node.doubleStorage(%class.Array_Node* %this) {
entrance_block0:                                             
    %szCopy_addr = alloca i32
    %copy_addr = alloca %class.Node**
    %this_addr_0 = alloca %class.Array_Node*
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.storage_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 0
    %Array_Node.storage_load_reg = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    store %class.Node** %Array_Node.storage_load_reg, %class.Node*** %copy_addr
    %this_reg_0 = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.sz_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg_0, i32 0, i32 1
    %Array_Node.sz_load_reg = load i32, i32* %Array_Node.sz_gep_in_id
    store i32 %Array_Node.sz_load_reg, i32* %szCopy_addr
    %copy = load %class.Node**, %class.Node*** %copy_addr
    %bitcast_i32 = bitcast %class.Node** %copy to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %mul = mul i32 %size_load, 2
    %mul_bytes = mul i32 %mul, 8
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %mul, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to %class.Node**
    store %class.Node** %array_addr, %class.Node*** %Array_Node.storage_gep_in_id
    store i32 0, i32* %Array_Node.sz_gep_in_id
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %sz = load i32, i32* %Array_Node.sz_gep_in_id
    %szCopy = load i32, i32* %szCopy_addr
    %ne = icmp ne i32 %sz, %szCopy
    br i1 %ne, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %sz_2 = load i32, i32* %Array_Node.sz_gep_in_id
    %add = add i32 %sz_2, 1
    store i32 %add, i32* %Array_Node.sz_gep_in_id
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %storage = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %sz_0 = load i32, i32* %Array_Node.sz_gep_in_id
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %storage, i32 %sz_0
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    %copy_0 = load %class.Node**, %class.Node*** %copy_addr
    %sz_1 = load i32, i32* %Array_Node.sz_gep_in_id
    %getelementptr_reg_0 = getelementptr inbounds %class.Node*, %class.Node** %copy_0, i32 %sz_1
    %load_result_0 = load %class.Node*, %class.Node** %getelementptr_reg_0
    store %class.Node* %load_result_0, %class.Node** %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local i32* @dijkstra(i32 %s_para) {
entrance_block0:                                             
    %alt_addr = alloca i32
    %w_addr = alloca i32
    %v_addr = alloca i32
    %k_addr = alloca i32
    %u_addr = alloca i32
    %node_addr = alloca %class.Node*
    %src_addr = alloca %class.Node*
    %q_addr = alloca %class.Heap_Node*
    %i_addr = alloca i32
    %d_addr = alloca i32*
    %visited_addr = alloca i32*
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
    store i32* %array_addr, i32** %visited_addr
    %n_0 = load i32, i32* @n
    %mul_bytes_0 = mul i32 %n_0, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 %n_0, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** %d_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i = load i32, i32* %i_addr
    %n_1 = load i32, i32* @n
    %slt = icmp slt i32 %i, %n_1
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %d = load i32*, i32** %d_addr
    %i_0 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %d, i32 %i_0
    %load_result = load i32, i32* %getelementptr_reg
    %INF = load i32, i32* @INF
    store i32 %INF, i32* %getelementptr_reg
    %visited = load i32*, i32** %visited_addr
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %visited, i32 %i_1
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    store i32 0, i32* %getelementptr_reg_0
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %d_0 = load i32*, i32** %d_addr
    %s = load i32, i32* %s_addr
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %d_0, i32 %s
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    store i32 0, i32* %getelementptr_reg_1
    %class_malloc = call i8* @_f_malloc(i32 8)
    %class_ptr = bitcast i8* %class_malloc to %class.Heap_Node*
    call void @Heap_Node.Heap_Node(%class.Heap_Node* %class_ptr)
    store %class.Heap_Node* %class_ptr, %class.Heap_Node** %q_addr
    %class_malloc_0 = call i8* @_f_malloc(i32 8)
    %class_ptr_0 = bitcast i8* %class_malloc_0 to %class.Node*
    store %class.Node* %class_ptr_0, %class.Node** %src_addr
    %src = load %class.Node*, %class.Node** %src_addr
    %class_mem_gep_reg = getelementptr inbounds %class.Node, %class.Node* %src, i32 0, i32 1
    %load_member = load i32, i32* %class_mem_gep_reg
    store i32 0, i32* %class_mem_gep_reg
    %src_0 = load %class.Node*, %class.Node** %src_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.Node, %class.Node* %src_0, i32 0, i32 0
    %load_member_0 = load i32, i32* %class_mem_gep_reg_0
    %s_0 = load i32, i32* %s_addr
    store i32 %s_0, i32* %class_mem_gep_reg_0
    %q = load %class.Heap_Node*, %class.Heap_Node** %q_addr
    %src_1 = load %class.Node*, %class.Node** %src_addr
    call void @Heap_Node.push(%class.Heap_Node* %q, %class.Node* %src_1)
    br label %while_condition

while_condition:                                             ; preds = for_end_merge while_body single_then_basicblock for_end_merge0 
    %q_0 = load %class.Heap_Node*, %class.Heap_Node** %q_addr
    %call_Heap_Node_size = call i32 @Heap_Node.size(%class.Heap_Node* %q_0)
    %ne = icmp ne i32 %call_Heap_Node_size, 0
    br i1 %ne, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %q_1 = load %class.Heap_Node*, %class.Heap_Node** %q_addr
    %call_Heap_Node_pop = call %class.Node* @Heap_Node.pop(%class.Heap_Node* %q_1)
    store %class.Node* %call_Heap_Node_pop, %class.Node** %node_addr
    %node = load %class.Node*, %class.Node** %node_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.Node, %class.Node* %node, i32 0, i32 0
    %load_member_1 = load i32, i32* %class_mem_gep_reg_1
    store i32 %load_member_1, i32* %u_addr
    %visited_0 = load i32*, i32** %visited_addr
    %u = load i32, i32* %u_addr
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %visited_0, i32 %u
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %eq = icmp eq i32 %load_result_2, 1
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

while_end_merge:                                             ; preds = for_end_merge while_condition 
    %d_5 = load i32*, i32** %d_addr
    store i32* %d_5, i32** %return_register_infunction_addr
    br label %return_block0

single_then_basicblock:                                      ; preds = while_body 
    br label %while_condition

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock while_body 
    %visited_1 = load i32*, i32** %visited_addr
    %u_0 = load i32, i32* %u_addr
    %getelementptr_reg_3 = getelementptr inbounds i32, i32* %visited_1, i32 %u_0
    %load_result_3 = load i32, i32* %getelementptr_reg_3
    store i32 1, i32* %getelementptr_reg_3
    %g = load %class.EdgeList*, %class.EdgeList** @g
    %class_mem_gep_reg_2 = getelementptr inbounds %class.EdgeList, %class.EdgeList* %g, i32 0, i32 2
    %load_member_2 = load i32*, i32** %class_mem_gep_reg_2
    %u_1 = load i32, i32* %u_addr
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %load_member_2, i32 %u_1
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    store i32 %load_result_4, i32* %k_addr
    br label %for_condition0

for_condition0:                                              ; preds = if_withoutelse_end_basicblock for_step0 
    %k = load i32, i32* %k_addr
    %SUB_single_front = mul i32 1, -1
    %ne_0 = icmp ne i32 %k, %SUB_single_front
    br i1 %ne_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 single_then_basicblock0 if_withoutelse_end_basicblock0 
    %g_2 = load %class.EdgeList*, %class.EdgeList** @g
    %class_mem_gep_reg_9 = getelementptr inbounds %class.EdgeList, %class.EdgeList* %g_2, i32 0, i32 1
    %load_member_9 = load i32*, i32** %class_mem_gep_reg_9
    %k_2 = load i32, i32* %k_addr
    %getelementptr_reg_11 = getelementptr inbounds i32, i32* %load_member_9, i32 %k_2
    %load_result_11 = load i32, i32* %getelementptr_reg_11
    store i32 %load_result_11, i32* %k_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %g_0 = load %class.EdgeList*, %class.EdgeList** @g
    %class_mem_gep_reg_3 = getelementptr inbounds %class.EdgeList, %class.EdgeList* %g_0, i32 0, i32 0
    %load_member_3 = load %class.Edge**, %class.Edge*** %class_mem_gep_reg_3
    %k_0 = load i32, i32* %k_addr
    %getelementptr_reg_5 = getelementptr inbounds %class.Edge*, %class.Edge** %load_member_3, i32 %k_0
    %load_result_5 = load %class.Edge*, %class.Edge** %getelementptr_reg_5
    %class_mem_gep_reg_4 = getelementptr inbounds %class.Edge, %class.Edge* %load_result_5, i32 0, i32 1
    %load_member_4 = load i32, i32* %class_mem_gep_reg_4
    store i32 %load_member_4, i32* %v_addr
    %g_1 = load %class.EdgeList*, %class.EdgeList** @g
    %class_mem_gep_reg_5 = getelementptr inbounds %class.EdgeList, %class.EdgeList* %g_1, i32 0, i32 0
    %load_member_5 = load %class.Edge**, %class.Edge*** %class_mem_gep_reg_5
    %k_1 = load i32, i32* %k_addr
    %getelementptr_reg_6 = getelementptr inbounds %class.Edge*, %class.Edge** %load_member_5, i32 %k_1
    %load_result_6 = load %class.Edge*, %class.Edge** %getelementptr_reg_6
    %class_mem_gep_reg_6 = getelementptr inbounds %class.Edge, %class.Edge* %load_result_6, i32 0, i32 2
    %load_member_6 = load i32, i32* %class_mem_gep_reg_6
    store i32 %load_member_6, i32* %w_addr
    %d_1 = load i32*, i32** %d_addr
    %u_2 = load i32, i32* %u_addr
    %getelementptr_reg_7 = getelementptr inbounds i32, i32* %d_1, i32 %u_2
    %load_result_7 = load i32, i32* %getelementptr_reg_7
    %w = load i32, i32* %w_addr
    %add_0 = add i32 %load_result_7, %w
    store i32 %add_0, i32* %alt_addr
    %alt = load i32, i32* %alt_addr
    %d_2 = load i32*, i32** %d_addr
    %v = load i32, i32* %v_addr
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %d_2, i32 %v
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    %sge = icmp sge i32 %alt, %load_result_8
    br i1 %sge, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

for_end_merge0:                                              ; preds = for_condition0 
    br label %while_condition

single_then_basicblock0:                                     ; preds = for_body0 
    br label %for_step0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 for_body0 
    %d_3 = load i32*, i32** %d_addr
    %v_0 = load i32, i32* %v_addr
    %getelementptr_reg_9 = getelementptr inbounds i32, i32* %d_3, i32 %v_0
    %load_result_9 = load i32, i32* %getelementptr_reg_9
    %alt_0 = load i32, i32* %alt_addr
    store i32 %alt_0, i32* %getelementptr_reg_9
    %class_malloc_1 = call i8* @_f_malloc(i32 8)
    %class_ptr_1 = bitcast i8* %class_malloc_1 to %class.Node*
    store %class.Node* %class_ptr_1, %class.Node** %node_addr
    %node_0 = load %class.Node*, %class.Node** %node_addr
    %class_mem_gep_reg_7 = getelementptr inbounds %class.Node, %class.Node* %node_0, i32 0, i32 0
    %load_member_7 = load i32, i32* %class_mem_gep_reg_7
    %v_1 = load i32, i32* %v_addr
    store i32 %v_1, i32* %class_mem_gep_reg_7
    %node_1 = load %class.Node*, %class.Node** %node_addr
    %class_mem_gep_reg_8 = getelementptr inbounds %class.Node, %class.Node* %node_1, i32 0, i32 1
    %load_member_8 = load i32, i32* %class_mem_gep_reg_8
    %d_4 = load i32*, i32** %d_addr
    %v_2 = load i32, i32* %v_addr
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %d_4, i32 %v_2
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    store i32 %load_result_10, i32* %class_mem_gep_reg_8
    %q_2 = load %class.Heap_Node*, %class.Heap_Node** %q_addr
    %node_2 = load %class.Node*, %class.Node** %node_addr
    call void @Heap_Node.push(%class.Heap_Node* %q_2, %class.Node* %node_2)
    br label %for_step0

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32*, i32** %return_register_infunction_addr
    ret i32* %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %d_addr = alloca i32*
    %j_addr = alloca i32
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    call void @init()
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i = load i32, i32* %i_addr
    %n = load i32, i32* @n
    %slt = icmp slt i32 %i, %n
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_1 = load i32, i32* %i_addr
    %add_0 = add i32 %i_1, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %i_0 = load i32, i32* %i_addr
    %call_dijkstra = call i32* @dijkstra(i32 %i_0)
    store i32* %call_dijkstra, i32** %d_addr
    store i32 0, i32* %j_addr
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %j = load i32, i32* %j_addr
    %n_0 = load i32, i32* @n
    %slt_0 = icmp slt i32 %j, %n_0
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 if_end_basicblock 
    %j_2 = load i32, i32* %j_addr
    %add = add i32 %j_2, 1
    store i32 %add, i32* %j_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %d = load i32*, i32** %d_addr
    %j_0 = load i32, i32* %j_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %d, i32 %j_0
    %load_result = load i32, i32* %getelementptr_reg
    %INF = load i32, i32* @INF
    %eq = icmp eq i32 %load_result, %INF
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
    %d_0 = load i32*, i32** %d_addr
    %j_1 = load i32, i32* %j_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %d_0, i32 %j_1
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    call void @printInt(i32 %load_result_0)
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    %const_string_pointer_0 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string1, i32 0, i32 0
    call void @print(i8* %const_string_pointer_0)
    br label %for_step0

return_block0:                                               ; preds = for_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @Array_Node.resize(%class.Array_Node* %this,i32 %newSize_para) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Array_Node*
    %newSize_addr = alloca i32
    store i32 %newSize_para, i32* %newSize_addr
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body 
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.storage_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 0
    %Array_Node.storage_load_reg = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %bitcast_i32 = bitcast %class.Node** %Array_Node.storage_load_reg to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %newSize = load i32, i32* %newSize_addr
    %slt = icmp slt i32 %size_load, %newSize
    br i1 %slt, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %Implicit_call_inclass = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    call void @Array_Node.doubleStorage(%class.Array_Node* %Implicit_call_inclass)
    br label %while_condition

while_end_merge:                                             ; preds = entrance_block0 while_condition 
    %this_reg_0 = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.sz_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg_0, i32 0, i32 1
    %Array_Node.sz_load_reg = load i32, i32* %Array_Node.sz_gep_in_id
    %newSize_0 = load i32, i32* %newSize_addr
    store i32 %newSize_0, i32* %Array_Node.sz_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = while_end_merge 
    ret void
}
define dso_local i32 @Heap_Node.lchild(%class.Heap_Node* %this,i32 %x_para) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Heap_Node*
    %x_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %x_para, i32* %x_addr
    store %class.Heap_Node* %this, %class.Heap_Node** %this_addr_0
    %x = load i32, i32* %x_addr
    %mul = mul i32 %x, 2
    %add = add i32 %mul, 1
    store i32 %add, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local %class.Node* @Array_Node.get(%class.Array_Node* %this,i32 %i_para) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Array_Node*
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca %class.Node*
    store i32 %i_para, i32* %i_addr
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.storage_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 0
    %Array_Node.storage_load_reg = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %i = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %Array_Node.storage_load_reg, i32 %i
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    store %class.Node* %load_result, %class.Node** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load %class.Node*, %class.Node** %return_register_infunction_addr
    ret %class.Node* %returnval
}
define dso_local i32 @Node.key_(%class.Node* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Node*
    %return_register_infunction_addr = alloca i32
    store %class.Node* %this, %class.Node** %this_addr_0
    %this_reg = load %class.Node*, %class.Node** %this_addr_0
    %Node.dist_gep_in_id = getelementptr inbounds %class.Node, %class.Node* %this_reg, i32 0, i32 1
    %Node.dist_load_reg = load i32, i32* %Node.dist_gep_in_id
    %SUB_single_front = mul i32 %Node.dist_load_reg, -1
    store i32 %SUB_single_front, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @EdgeList.nVertices(%class.EdgeList* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.EdgeList*
    %return_register_infunction_addr = alloca i32
    store %class.EdgeList* %this, %class.EdgeList** %this_addr_0
    %this_reg = load %class.EdgeList*, %class.EdgeList** %this_addr_0
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
    %this_addr_0 = alloca %class.EdgeList*
    %return_register_infunction_addr = alloca i32
    store %class.EdgeList* %this, %class.EdgeList** %this_addr_0
    %this_reg = load %class.EdgeList*, %class.EdgeList** %this_addr_0
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
define dso_local void @Heap_Node.maxHeapify(%class.Heap_Node* %this,i32 %x_para) {
entrance_block0:                                             
    %AND_addr_0 = alloca i1
    %AND_addr = alloca i1
    %largest_addr = alloca i32
    %r_addr = alloca i32
    %l_addr = alloca i32
    %this_addr_0 = alloca %class.Heap_Node*
    %x_addr = alloca i32
    store i32 %x_para, i32* %x_addr
    store %class.Heap_Node* %this, %class.Heap_Node** %this_addr_0
    %Implicit_call_inclass = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %x = load i32, i32* %x_addr
    %call_lchild = call i32 @Heap_Node.lchild(%class.Heap_Node* %Implicit_call_inclass, i32 %x)
    store i32 %call_lchild, i32* %l_addr
    %Implicit_call_inclass_0 = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %x_0 = load i32, i32* %x_addr
    %call_rchild = call i32 @Heap_Node.rchild(%class.Heap_Node* %Implicit_call_inclass_0, i32 %x_0)
    store i32 %call_rchild, i32* %r_addr
    %x_1 = load i32, i32* %x_addr
    store i32 %x_1, i32* %largest_addr
    %l = load i32, i32* %l_addr
    %Implicit_call_inclass_1 = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %call_size = call i32 @Heap_Node.size(%class.Heap_Node* %Implicit_call_inclass_1)
    %slt = icmp slt i32 %l, %call_size
    store i1 %slt, i1* %AND_addr
    br i1 %slt, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

short_circuit_AND_end_AND:                                   ; preds = entrance_block0 short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_AND_branch_AND:                                ; preds = entrance_block0 
    %this_reg = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %Heap_Node.storage_gep_in_id = getelementptr inbounds %class.Heap_Node, %class.Heap_Node* %this_reg, i32 0, i32 0
    %Heap_Node.storage_load_reg = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %l_0 = load i32, i32* %l_addr
    %call_Array_Node_get = call %class.Node* @Array_Node.get(%class.Array_Node* %Heap_Node.storage_load_reg, i32 %l_0)
    %call_Node_key_ = call i32 @Node.key_(%class.Node* %call_Array_Node_get)
    %storage = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %largest = load i32, i32* %largest_addr
    %call_Array_Node_get_0 = call %class.Node* @Array_Node.get(%class.Array_Node* %storage, i32 %largest)
    %call_Node_key__0 = call i32 @Node.key_(%class.Node* %call_Array_Node_get_0)
    %sgt = icmp sgt i32 %call_Node_key_, %call_Node_key__0
    store i1 %sgt, i1* %AND_addr
    br label %short_circuit_AND_end_AND

single_then_basicblock:                                      ; preds = short_circuit_AND_end_AND 
    %l_1 = load i32, i32* %l_addr
    store i32 %l_1, i32* %largest_addr
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock short_circuit_AND_end_AND 
    %r = load i32, i32* %r_addr
    %Implicit_call_inclass_2 = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %call_size_0 = call i32 @Heap_Node.size(%class.Heap_Node* %Implicit_call_inclass_2)
    %slt_0 = icmp slt i32 %r, %call_size_0
    store i1 %slt_0, i1* %AND_addr_0
    br i1 %slt_0, label %short_circuit_AND_branch_AND0, label %short_circuit_AND_end_AND0

short_circuit_AND_end_AND0:                                  ; preds = if_withoutelse_end_basicblock short_circuit_AND_branch_AND0 
    %AND_short_circuit_0 = load i1, i1* %AND_addr_0
    br i1 %AND_short_circuit_0, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

short_circuit_AND_branch_AND0:                               ; preds = if_withoutelse_end_basicblock 
    %storage_0 = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %r_0 = load i32, i32* %r_addr
    %call_Array_Node_get_1 = call %class.Node* @Array_Node.get(%class.Array_Node* %storage_0, i32 %r_0)
    %call_Node_key__1 = call i32 @Node.key_(%class.Node* %call_Array_Node_get_1)
    %storage_1 = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %largest_0 = load i32, i32* %largest_addr
    %call_Array_Node_get_2 = call %class.Node* @Array_Node.get(%class.Array_Node* %storage_1, i32 %largest_0)
    %call_Node_key__2 = call i32 @Node.key_(%class.Node* %call_Array_Node_get_2)
    %sgt_0 = icmp sgt i32 %call_Node_key__1, %call_Node_key__2
    store i1 %sgt_0, i1* %AND_addr_0
    br label %short_circuit_AND_end_AND0

single_then_basicblock0:                                     ; preds = short_circuit_AND_end_AND0 
    %r_1 = load i32, i32* %r_addr
    store i32 %r_1, i32* %largest_addr
    br label %if_withoutelse_end_basicblock0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 short_circuit_AND_end_AND0 
    %largest_1 = load i32, i32* %largest_addr
    %x_2 = load i32, i32* %x_addr
    %eq = icmp eq i32 %largest_1, %x_2
    br i1 %eq, label %single_then_basicblock1, label %if_withoutelse_end_basicblock1

single_then_basicblock1:                                     ; preds = if_withoutelse_end_basicblock0 
    br label %return_block0

if_withoutelse_end_basicblock1:                              ; preds = single_then_basicblock1 if_withoutelse_end_basicblock0 
    %storage_2 = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %x_3 = load i32, i32* %x_addr
    %largest_2 = load i32, i32* %largest_addr
    call void @Array_Node.swap(%class.Array_Node* %storage_2, i32 %x_3, i32 %largest_2)
    %Implicit_call_inclass_3 = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %largest_3 = load i32, i32* %largest_addr
    call void @Heap_Node.maxHeapify(%class.Heap_Node* %Implicit_call_inclass_3, i32 %largest_3)
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock1 if_withoutelse_end_basicblock1 
    ret void
}
define dso_local %class.Node* @Array_Node.back(%class.Array_Node* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Array_Node*
    %return_register_infunction_addr = alloca %class.Node*
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.storage_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 0
    %Array_Node.storage_load_reg = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %this_reg_0 = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.sz_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg_0, i32 0, i32 1
    %Array_Node.sz_load_reg = load i32, i32* %Array_Node.sz_gep_in_id
    %sub = sub i32 %Array_Node.sz_load_reg, 1
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %Array_Node.storage_load_reg, i32 %sub
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    store %class.Node* %load_result, %class.Node** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load %class.Node*, %class.Node** %return_register_infunction_addr
    ret %class.Node* %returnval
}
define dso_local void @EdgeList.addEdge(%class.EdgeList* %this,i32 %u_para,i32 %v_para,i32 %w_para) {
entrance_block0:                                             
    %e_addr = alloca %class.Edge*
    %this_addr_0 = alloca %class.EdgeList*
    %w_addr = alloca i32
    %v_addr = alloca i32
    %u_addr = alloca i32
    store i32 %u_para, i32* %u_addr
    store i32 %v_para, i32* %v_addr
    store i32 %w_para, i32* %w_addr
    store %class.EdgeList* %this, %class.EdgeList** %this_addr_0
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
    %this_reg = load %class.EdgeList*, %class.EdgeList** %this_addr_0
    %EdgeList.edges_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg, i32 0, i32 0
    %EdgeList.edges_load_reg = load %class.Edge**, %class.Edge*** %EdgeList.edges_gep_in_id
    %this_reg_0 = load %class.EdgeList*, %class.EdgeList** %this_addr_0
    %EdgeList.size_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg_0, i32 0, i32 3
    %EdgeList.size_load_reg = load i32, i32* %EdgeList.size_gep_in_id
    %getelementptr_reg = getelementptr inbounds %class.Edge*, %class.Edge** %EdgeList.edges_load_reg, i32 %EdgeList.size_load_reg
    %load_result = load %class.Edge*, %class.Edge** %getelementptr_reg
    %e_2 = load %class.Edge*, %class.Edge** %e_addr
    store %class.Edge* %e_2, %class.Edge** %getelementptr_reg
    %this_reg_1 = load %class.EdgeList*, %class.EdgeList** %this_addr_0
    %EdgeList.next_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg_1, i32 0, i32 1
    %EdgeList.next_load_reg = load i32*, i32** %EdgeList.next_gep_in_id
    %size = load i32, i32* %EdgeList.size_gep_in_id
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %EdgeList.next_load_reg, i32 %size
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %this_reg_2 = load %class.EdgeList*, %class.EdgeList** %this_addr_0
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
define dso_local void @Array_Node.set(%class.Array_Node* %this,i32 %i_para,%class.Node* %v_para) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Array_Node*
    %v_addr = alloca %class.Node*
    %i_addr = alloca i32
    store i32 %i_para, i32* %i_addr
    store %class.Node* %v_para, %class.Node** %v_addr
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.storage_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 0
    %Array_Node.storage_load_reg = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %i = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %Array_Node.storage_load_reg, i32 %i
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    %v = load %class.Node*, %class.Node** %v_addr
    store %class.Node* %v, %class.Node** %getelementptr_reg
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    store i32 10000000, i32* @INF
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local void @init() {
entrance_block0:                                             
    %w_addr = alloca i32
    %v_addr = alloca i32
    %u_addr = alloca i32
    %i_addr = alloca i32
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @n
    %call_getInt_0 = call i32 @getInt()
    store i32 %call_getInt_0, i32* @m
    %class_malloc = call i8* @_f_malloc(i32 28)
    %class_ptr = bitcast i8* %class_malloc to %class.EdgeList*
    store %class.EdgeList* %class_ptr, %class.EdgeList** @g
    %g = load %class.EdgeList*, %class.EdgeList** @g
    %n = load i32, i32* @n
    %m = load i32, i32* @m
    call void @EdgeList.init(%class.EdgeList* %g, i32 %n, i32 %m)
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i = load i32, i32* %i_addr
    %m_0 = load i32, i32* @m
    %slt = icmp slt i32 %i, %m_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_0 = load i32, i32* %i_addr
    %add = add i32 %i_0, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %call_getInt_1 = call i32 @getInt()
    store i32 %call_getInt_1, i32* %u_addr
    %call_getInt_2 = call i32 @getInt()
    store i32 %call_getInt_2, i32* %v_addr
    %call_getInt_3 = call i32 @getInt()
    store i32 %call_getInt_3, i32* %w_addr
    %g_0 = load %class.EdgeList*, %class.EdgeList** @g
    %u = load i32, i32* %u_addr
    %v = load i32, i32* %v_addr
    %w = load i32, i32* %w_addr
    call void @EdgeList.addEdge(%class.EdgeList* %g_0, i32 %u, i32 %v, i32 %w)
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local void @Array_Node.push_back(%class.Array_Node* %this,%class.Node* %v_para) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Array_Node*
    %v_addr = alloca %class.Node*
    store %class.Node* %v_para, %class.Node** %v_addr
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    %Implicit_call_inclass = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %call_size = call i32 @Array_Node.size(%class.Array_Node* %Implicit_call_inclass)
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.storage_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 0
    %Array_Node.storage_load_reg = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %bitcast_i32 = bitcast %class.Node** %Array_Node.storage_load_reg to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %eq = icmp eq i32 %call_size, %size_load
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %Implicit_call_inclass_0 = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    call void @Array_Node.doubleStorage(%class.Array_Node* %Implicit_call_inclass_0)
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %storage = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %this_reg_0 = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.sz_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg_0, i32 0, i32 1
    %Array_Node.sz_load_reg = load i32, i32* %Array_Node.sz_gep_in_id
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %storage, i32 %Array_Node.sz_load_reg
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    %v = load %class.Node*, %class.Node** %v_addr
    store %class.Node* %v, %class.Node** %getelementptr_reg
    %sz = load i32, i32* %Array_Node.sz_gep_in_id
    %add = add i32 %sz, 1
    store i32 %add, i32* %Array_Node.sz_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    ret void
}
define dso_local i32 @Heap_Node.pnt(%class.Heap_Node* %this,i32 %x_para) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Heap_Node*
    %x_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %x_para, i32* %x_addr
    store %class.Heap_Node* %this, %class.Heap_Node** %this_addr_0
    %x = load i32, i32* %x_addr
    %sub = sub i32 %x, 1
    %sdiv = sdiv i32 %sub, 2
    store i32 %sdiv, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @Heap_Node.Heap_Node(%class.Heap_Node* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Heap_Node*
    store %class.Heap_Node* %this, %class.Heap_Node** %this_addr_0
    %this_reg = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %Heap_Node.storage_gep_in_id = getelementptr inbounds %class.Heap_Node, %class.Heap_Node* %this_reg, i32 0, i32 0
    %Heap_Node.storage_load_reg = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %class_malloc = call i8* @_f_malloc(i32 12)
    %class_ptr = bitcast i8* %class_malloc to %class.Array_Node*
    call void @Array_Node.Array_Node(%class.Array_Node* %class_ptr)
    store %class.Array_Node* %class_ptr, %class.Array_Node** %Heap_Node.storage_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local void @Array_Node.swap(%class.Array_Node* %this,i32 %i_para,i32 %j_para) {
entrance_block0:                                             
    %t_addr = alloca %class.Node*
    %this_addr_0 = alloca %class.Array_Node*
    %j_addr = alloca i32
    %i_addr = alloca i32
    store i32 %i_para, i32* %i_addr
    store i32 %j_para, i32* %j_addr
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.storage_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 0
    %Array_Node.storage_load_reg = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %i = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %Array_Node.storage_load_reg, i32 %i
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    store %class.Node* %load_result, %class.Node** %t_addr
    %storage = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %i_0 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds %class.Node*, %class.Node** %storage, i32 %i_0
    %load_result_0 = load %class.Node*, %class.Node** %getelementptr_reg_0
    %storage_0 = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %j = load i32, i32* %j_addr
    %getelementptr_reg_1 = getelementptr inbounds %class.Node*, %class.Node** %storage_0, i32 %j
    %load_result_1 = load %class.Node*, %class.Node** %getelementptr_reg_1
    store %class.Node* %load_result_1, %class.Node** %getelementptr_reg_0
    %storage_1 = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %j_0 = load i32, i32* %j_addr
    %getelementptr_reg_2 = getelementptr inbounds %class.Node*, %class.Node** %storage_1, i32 %j_0
    %load_result_2 = load %class.Node*, %class.Node** %getelementptr_reg_2
    %t = load %class.Node*, %class.Node** %t_addr
    store %class.Node* %t, %class.Node** %getelementptr_reg_2
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local i32 @Heap_Node.size(%class.Heap_Node* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Heap_Node*
    %return_register_infunction_addr = alloca i32
    store %class.Heap_Node* %this, %class.Heap_Node** %this_addr_0
    %this_reg = load %class.Heap_Node*, %class.Heap_Node** %this_addr_0
    %Heap_Node.storage_gep_in_id = getelementptr inbounds %class.Heap_Node, %class.Heap_Node* %this_reg, i32 0, i32 0
    %Heap_Node.storage_load_reg = load %class.Array_Node*, %class.Array_Node** %Heap_Node.storage_gep_in_id
    %call_Array_Node_size = call i32 @Array_Node.size(%class.Array_Node* %Heap_Node.storage_load_reg)
    store i32 %call_Array_Node_size, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @EdgeList.init(%class.EdgeList* %this,i32 %n_para,i32 %m_para) {
entrance_block0:                                             
    %i_addr = alloca i32
    %this_addr_0 = alloca %class.EdgeList*
    %m_addr = alloca i32
    %n_addr = alloca i32
    store i32 %n_para, i32* %n_addr
    store i32 %m_para, i32* %m_addr
    store %class.EdgeList* %this, %class.EdgeList** %this_addr_0
    %this_reg = load %class.EdgeList*, %class.EdgeList** %this_addr_0
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
    %this_reg_0 = load %class.EdgeList*, %class.EdgeList** %this_addr_0
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
    %this_reg_1 = load %class.EdgeList*, %class.EdgeList** %this_addr_0
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
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i = load i32, i32* %i_addr
    %m_1 = load i32, i32* %m_addr
    %slt = icmp slt i32 %i, %m_1
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_1 = load i32, i32* %i_addr
    %add = add i32 %i_1, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %next = load i32*, i32** %EdgeList.next_gep_in_id
    %i_0 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds i32, i32* %next, i32 %i_0
    %load_result = load i32, i32* %getelementptr_reg
    %SUB_single_front = mul i32 1, -1
    store i32 %SUB_single_front, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    store i32 0, i32* %i_addr
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %i_2 = load i32, i32* %i_addr
    %n_0 = load i32, i32* %n_addr
    %slt_0 = icmp slt i32 %i_2, %n_0
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %i_4 = load i32, i32* %i_addr
    %add_0 = add i32 %i_4, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %first = load i32*, i32** %EdgeList.first_gep_in_id
    %i_3 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %first, i32 %i_3
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %SUB_single_front_0 = mul i32 1, -1
    store i32 %SUB_single_front_0, i32* %getelementptr_reg_0
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    %this_reg_2 = load %class.EdgeList*, %class.EdgeList** %this_addr_0
    %EdgeList.size_gep_in_id = getelementptr inbounds %class.EdgeList, %class.EdgeList* %this_reg_2, i32 0, i32 3
    %EdgeList.size_load_reg = load i32, i32* %EdgeList.size_gep_in_id
    store i32 0, i32* %EdgeList.size_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = for_end_merge0 
    ret void
}
define dso_local void @Array_Node.Array_Node(%class.Array_Node* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Array_Node*
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.sz_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 1
    %Array_Node.sz_load_reg = load i32, i32* %Array_Node.sz_gep_in_id
    store i32 0, i32* %Array_Node.sz_gep_in_id
    %this_reg_0 = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.storage_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg_0, i32 0, i32 0
    %Array_Node.storage_load_reg = load %class.Node**, %class.Node*** %Array_Node.storage_gep_in_id
    %mul_bytes = mul i32 16, 8
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 16, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to %class.Node**
    store %class.Node** %array_addr, %class.Node*** %Array_Node.storage_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local i32 @Array_Node.size(%class.Array_Node* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.Array_Node*
    %return_register_infunction_addr = alloca i32
    store %class.Array_Node* %this, %class.Array_Node** %this_addr_0
    %this_reg = load %class.Array_Node*, %class.Array_Node** %this_addr_0
    %Array_Node.sz_gep_in_id = getelementptr inbounds %class.Array_Node, %class.Array_Node* %this_reg, i32 0, i32 1
    %Array_Node.sz_load_reg = load i32, i32* %Array_Node.sz_gep_in_id
    store i32 %Array_Node.sz_load_reg, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
