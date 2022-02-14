; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.Node = type { %class.Node*, %class.Node**, i32, i32 }
@seed = dso_local global i32 0
@MAX = dso_local global i32 0
@MaxRandInt = dso_local global i32 0
@root = dso_local global %class.Node* null

@const_string0 = private unnamed_addr constant [3 x i8] c": \00", align 1

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

define dso_local %class.Node* @findLargest(%class.Node* %cur_para) {
entrance_block0:                                             
    %cur_addr = alloca %class.Node*
    %return_register_infunction_addr = alloca %class.Node*
    store %class.Node* %cur_para, %class.Node** %cur_addr
    %cur = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg = getelementptr inbounds %class.Node, %class.Node* %cur, i32 0, i32 1
    %load_member = load %class.Node**, %class.Node*** %class_mem_gep_reg
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %load_member, i32 1
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    %eq = icmp eq %class.Node* %load_result, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %cur_0 = load %class.Node*, %class.Node** %cur_addr
    store %class.Node* %cur_0, %class.Node** %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %cur_1 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.Node, %class.Node* %cur_1, i32 0, i32 1
    %load_member_0 = load %class.Node**, %class.Node*** %class_mem_gep_reg_0
    %getelementptr_reg_0 = getelementptr inbounds %class.Node*, %class.Node** %load_member_0, i32 1
    %load_result_0 = load %class.Node*, %class.Node** %getelementptr_reg_0
    %call_findLargest = call %class.Node* @findLargest(%class.Node* %load_result_0)
    store %class.Node* %call_findLargest, %class.Node** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock if_withoutelse_end_basicblock 
    %returnval = load %class.Node*, %class.Node** %return_register_infunction_addr
    ret %class.Node* %returnval
}
define dso_local i32 @erase(i32 %key_para) {
entrance_block0:                                             
    %key_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %key_para, i32* %key_addr
    %root = load %class.Node*, %class.Node** @root
    %eq = icmp eq %class.Node* %root, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %root_0 = load %class.Node*, %class.Node** @root
    %SUB_single_front = mul i32 1, -1
    %key = load i32, i32* %key_addr
    %call_eraseImpl = call i32 @eraseImpl(%class.Node* %root_0, %class.Node* null, i32 %SUB_single_front, i32 %key)
    store i32 %call_eraseImpl, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock if_withoutelse_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local %class.Node* @constructNode(i32 %key_para,%class.Node* %pnt_para,%class.Node* %lchild_para,%class.Node* %rchild_para) {
entrance_block0:                                             
    %node_addr = alloca %class.Node*
    %rchild_addr = alloca %class.Node*
    %lchild_addr = alloca %class.Node*
    %pnt_addr = alloca %class.Node*
    %key_addr = alloca i32
    %return_register_infunction_addr = alloca %class.Node*
    store i32 %key_para, i32* %key_addr
    store %class.Node* %pnt_para, %class.Node** %pnt_addr
    store %class.Node* %lchild_para, %class.Node** %lchild_addr
    store %class.Node* %rchild_para, %class.Node** %rchild_addr
    %class_malloc = call i8* @_f_malloc(i32 24)
    %class_ptr = bitcast i8* %class_malloc to %class.Node*
    store %class.Node* %class_ptr, %class.Node** %node_addr
    %node = load %class.Node*, %class.Node** %node_addr
    %class_mem_gep_reg = getelementptr inbounds %class.Node, %class.Node* %node, i32 0, i32 1
    %load_member = load %class.Node**, %class.Node*** %class_mem_gep_reg
    %mul_bytes = mul i32 2, 8
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 2, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to %class.Node**
    store %class.Node** %array_addr, %class.Node*** %class_mem_gep_reg
    %node_0 = load %class.Node*, %class.Node** %node_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.Node, %class.Node* %node_0, i32 0, i32 2
    %load_member_0 = load i32, i32* %class_mem_gep_reg_0
    %key = load i32, i32* %key_addr
    store i32 %key, i32* %class_mem_gep_reg_0
    %node_1 = load %class.Node*, %class.Node** %node_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.Node, %class.Node* %node_1, i32 0, i32 3
    %load_member_1 = load i32, i32* %class_mem_gep_reg_1
    store i32 1, i32* %class_mem_gep_reg_1
    %node_2 = load %class.Node*, %class.Node** %node_addr
    %class_mem_gep_reg_2 = getelementptr inbounds %class.Node, %class.Node* %node_2, i32 0, i32 0
    %load_member_2 = load %class.Node*, %class.Node** %class_mem_gep_reg_2
    %pnt = load %class.Node*, %class.Node** %pnt_addr
    store %class.Node* %pnt, %class.Node** %class_mem_gep_reg_2
    %node_3 = load %class.Node*, %class.Node** %node_addr
    %class_mem_gep_reg_3 = getelementptr inbounds %class.Node, %class.Node* %node_3, i32 0, i32 1
    %load_member_3 = load %class.Node**, %class.Node*** %class_mem_gep_reg_3
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %load_member_3, i32 0
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    %lchild = load %class.Node*, %class.Node** %lchild_addr
    store %class.Node* %lchild, %class.Node** %getelementptr_reg
    %node_4 = load %class.Node*, %class.Node** %node_addr
    %class_mem_gep_reg_4 = getelementptr inbounds %class.Node, %class.Node* %node_4, i32 0, i32 1
    %load_member_4 = load %class.Node**, %class.Node*** %class_mem_gep_reg_4
    %getelementptr_reg_0 = getelementptr inbounds %class.Node*, %class.Node** %load_member_4, i32 1
    %load_result_0 = load %class.Node*, %class.Node** %getelementptr_reg_0
    %rchild = load %class.Node*, %class.Node** %rchild_addr
    store %class.Node* %rchild, %class.Node** %getelementptr_reg_0
    %node_5 = load %class.Node*, %class.Node** %node_addr
    store %class.Node* %node_5, %class.Node** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load %class.Node*, %class.Node** %return_register_infunction_addr
    ret %class.Node* %returnval
}
define dso_local i32 @randOp(i32 %n_para) {
entrance_block0:                                             
    %n_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %n_para, i32* %n_addr
    %call_randInt31 = call i32 @randInt31()
    %n = load i32, i32* %n_addr
    %slt = icmp slt i32 %call_randInt31, %n
    br i1 %slt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i32 1, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    store i32 2, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock if_withoutelse_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @eraseImpl(%class.Node* %cur_para,%class.Node* %pnt_para,i32 %childId_para,i32 %key_para) {
entrance_block0:                                             
    %replacement_addr = alloca %class.Node*
    %key_addr = alloca i32
    %childId_addr = alloca i32
    %pnt_addr = alloca %class.Node*
    %cur_addr = alloca %class.Node*
    %return_register_infunction_addr = alloca i32
    store %class.Node* %cur_para, %class.Node** %cur_addr
    store %class.Node* %pnt_para, %class.Node** %pnt_addr
    store i32 %childId_para, i32* %childId_addr
    store i32 %key_para, i32* %key_addr
    %cur = load %class.Node*, %class.Node** %cur_addr
    %eq = icmp eq %class.Node* %cur, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %cur_0 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg = getelementptr inbounds %class.Node, %class.Node* %cur_0, i32 0, i32 2
    %load_member = load i32, i32* %class_mem_gep_reg
    %key = load i32, i32* %key_addr
    %sgt = icmp sgt i32 %load_member, %key
    br i1 %sgt, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

single_then_basicblock0:                                     ; preds = if_withoutelse_end_basicblock 
    %cur_1 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.Node, %class.Node* %cur_1, i32 0, i32 1
    %load_member_0 = load %class.Node**, %class.Node*** %class_mem_gep_reg_0
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %load_member_0, i32 0
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    %cur_2 = load %class.Node*, %class.Node** %cur_addr
    %key_0 = load i32, i32* %key_addr
    %call_eraseImpl = call i32 @eraseImpl(%class.Node* %load_result, %class.Node* %cur_2, i32 0, i32 %key_0)
    store i32 %call_eraseImpl, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 if_withoutelse_end_basicblock 
    %cur_3 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.Node, %class.Node* %cur_3, i32 0, i32 2
    %load_member_1 = load i32, i32* %class_mem_gep_reg_1
    %key_1 = load i32, i32* %key_addr
    %slt = icmp slt i32 %load_member_1, %key_1
    br i1 %slt, label %single_then_basicblock1, label %if_withoutelse_end_basicblock1

single_then_basicblock1:                                     ; preds = if_withoutelse_end_basicblock0 
    %cur_4 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_2 = getelementptr inbounds %class.Node, %class.Node* %cur_4, i32 0, i32 1
    %load_member_2 = load %class.Node**, %class.Node*** %class_mem_gep_reg_2
    %getelementptr_reg_0 = getelementptr inbounds %class.Node*, %class.Node** %load_member_2, i32 1
    %load_result_0 = load %class.Node*, %class.Node** %getelementptr_reg_0
    %cur_5 = load %class.Node*, %class.Node** %cur_addr
    %key_2 = load i32, i32* %key_addr
    %call_eraseImpl_0 = call i32 @eraseImpl(%class.Node* %load_result_0, %class.Node* %cur_5, i32 1, i32 %key_2)
    store i32 %call_eraseImpl_0, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock1:                              ; preds = single_then_basicblock1 if_withoutelse_end_basicblock0 
    %cur_6 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_3 = getelementptr inbounds %class.Node, %class.Node* %cur_6, i32 0, i32 3
    %load_member_3 = load i32, i32* %class_mem_gep_reg_3
    %sub = sub i32 %load_member_3, 1
    store i32 %sub, i32* %class_mem_gep_reg_3
    %cur_7 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_4 = getelementptr inbounds %class.Node, %class.Node* %cur_7, i32 0, i32 3
    %load_member_4 = load i32, i32* %class_mem_gep_reg_4
    %sgt_0 = icmp sgt i32 %load_member_4, 0
    br i1 %sgt_0, label %single_then_basicblock2, label %if_withoutelse_end_basicblock2

single_then_basicblock2:                                     ; preds = if_withoutelse_end_basicblock1 
    store i32 1, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock2:                              ; preds = single_then_basicblock2 if_withoutelse_end_basicblock1 
    %cur_8 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_5 = getelementptr inbounds %class.Node, %class.Node* %cur_8, i32 0, i32 1
    %load_member_5 = load %class.Node**, %class.Node*** %class_mem_gep_reg_5
    %getelementptr_reg_1 = getelementptr inbounds %class.Node*, %class.Node** %load_member_5, i32 0
    %load_result_1 = load %class.Node*, %class.Node** %getelementptr_reg_1
    %eq_0 = icmp eq %class.Node* %load_result_1, null
    br i1 %eq_0, label %single_then_basicblock3, label %if_withoutelse_end_basicblock3

single_then_basicblock3:                                     ; preds = if_withoutelse_end_basicblock2 
    %pnt = load %class.Node*, %class.Node** %pnt_addr
    %ne = icmp ne %class.Node* %pnt, null
    br i1 %ne, label %single_then_basicblock4, label %if_withoutelse_end_basicblock4

if_withoutelse_end_basicblock3:                              ; preds = single_then_basicblock3 if_withoutelse_end_basicblock2 if_withoutelse_end_basicblock6 
    %cur_13 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_13 = getelementptr inbounds %class.Node, %class.Node* %cur_13, i32 0, i32 1
    %load_member_13 = load %class.Node**, %class.Node*** %class_mem_gep_reg_13
    %getelementptr_reg_7 = getelementptr inbounds %class.Node*, %class.Node** %load_member_13, i32 0
    %load_result_7 = load %class.Node*, %class.Node** %getelementptr_reg_7
    %call_findLargest = call %class.Node* @findLargest(%class.Node* %load_result_7)
    store %class.Node* %call_findLargest, %class.Node** %replacement_addr
    %key_4 = load i32, i32* %key_addr
    %root_0 = load %class.Node*, %class.Node** @root
    %class_mem_gep_reg_14 = getelementptr inbounds %class.Node, %class.Node* %root_0, i32 0, i32 2
    %load_member_14 = load i32, i32* %class_mem_gep_reg_14
    %eq_2 = icmp eq i32 %key_4, %load_member_14
    br i1 %eq_2, label %single_then_basicblock7, label %if_withoutelse_end_basicblock7

single_then_basicblock4:                                     ; preds = single_then_basicblock3 
    %pnt_0 = load %class.Node*, %class.Node** %pnt_addr
    %class_mem_gep_reg_6 = getelementptr inbounds %class.Node, %class.Node* %pnt_0, i32 0, i32 1
    %load_member_6 = load %class.Node**, %class.Node*** %class_mem_gep_reg_6
    %childId = load i32, i32* %childId_addr
    %getelementptr_reg_2 = getelementptr inbounds %class.Node*, %class.Node** %load_member_6, i32 %childId
    %load_result_2 = load %class.Node*, %class.Node** %getelementptr_reg_2
    %cur_9 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_7 = getelementptr inbounds %class.Node, %class.Node* %cur_9, i32 0, i32 1
    %load_member_7 = load %class.Node**, %class.Node*** %class_mem_gep_reg_7
    %getelementptr_reg_3 = getelementptr inbounds %class.Node*, %class.Node** %load_member_7, i32 1
    %load_result_3 = load %class.Node*, %class.Node** %getelementptr_reg_3
    store %class.Node* %load_result_3, %class.Node** %getelementptr_reg_2
    br label %if_withoutelse_end_basicblock4

if_withoutelse_end_basicblock4:                              ; preds = single_then_basicblock4 single_then_basicblock3 
    %cur_10 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_8 = getelementptr inbounds %class.Node, %class.Node* %cur_10, i32 0, i32 1
    %load_member_8 = load %class.Node**, %class.Node*** %class_mem_gep_reg_8
    %getelementptr_reg_4 = getelementptr inbounds %class.Node*, %class.Node** %load_member_8, i32 1
    %load_result_4 = load %class.Node*, %class.Node** %getelementptr_reg_4
    %ne_0 = icmp ne %class.Node* %load_result_4, null
    br i1 %ne_0, label %single_then_basicblock5, label %if_withoutelse_end_basicblock5

single_then_basicblock5:                                     ; preds = if_withoutelse_end_basicblock4 
    %cur_11 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_9 = getelementptr inbounds %class.Node, %class.Node* %cur_11, i32 0, i32 1
    %load_member_9 = load %class.Node**, %class.Node*** %class_mem_gep_reg_9
    %getelementptr_reg_5 = getelementptr inbounds %class.Node*, %class.Node** %load_member_9, i32 1
    %load_result_5 = load %class.Node*, %class.Node** %getelementptr_reg_5
    %class_mem_gep_reg_10 = getelementptr inbounds %class.Node, %class.Node* %load_result_5, i32 0, i32 0
    %load_member_10 = load %class.Node*, %class.Node** %class_mem_gep_reg_10
    %pnt_1 = load %class.Node*, %class.Node** %pnt_addr
    store %class.Node* %pnt_1, %class.Node** %class_mem_gep_reg_10
    br label %if_withoutelse_end_basicblock5

if_withoutelse_end_basicblock5:                              ; preds = single_then_basicblock5 if_withoutelse_end_basicblock4 
    %key_3 = load i32, i32* %key_addr
    %root = load %class.Node*, %class.Node** @root
    %class_mem_gep_reg_11 = getelementptr inbounds %class.Node, %class.Node* %root, i32 0, i32 2
    %load_member_11 = load i32, i32* %class_mem_gep_reg_11
    %eq_1 = icmp eq i32 %key_3, %load_member_11
    br i1 %eq_1, label %single_then_basicblock6, label %if_withoutelse_end_basicblock6

single_then_basicblock6:                                     ; preds = if_withoutelse_end_basicblock5 
    %cur_12 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_12 = getelementptr inbounds %class.Node, %class.Node* %cur_12, i32 0, i32 1
    %load_member_12 = load %class.Node**, %class.Node*** %class_mem_gep_reg_12
    %getelementptr_reg_6 = getelementptr inbounds %class.Node*, %class.Node** %load_member_12, i32 1
    %load_result_6 = load %class.Node*, %class.Node** %getelementptr_reg_6
    store %class.Node* %load_result_6, %class.Node** @root
    br label %if_withoutelse_end_basicblock6

if_withoutelse_end_basicblock6:                              ; preds = single_then_basicblock6 if_withoutelse_end_basicblock5 
    store i32 1, i32* %return_register_infunction_addr
    br label %return_block0

single_then_basicblock7:                                     ; preds = if_withoutelse_end_basicblock3 
    %replacement = load %class.Node*, %class.Node** %replacement_addr
    store %class.Node* %replacement, %class.Node** @root
    br label %if_withoutelse_end_basicblock7

if_withoutelse_end_basicblock7:                              ; preds = single_then_basicblock7 if_withoutelse_end_basicblock3 
    %replacement_0 = load %class.Node*, %class.Node** %replacement_addr
    %class_mem_gep_reg_15 = getelementptr inbounds %class.Node, %class.Node* %replacement_0, i32 0, i32 2
    %load_member_15 = load i32, i32* %class_mem_gep_reg_15
    %cur_14 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_16 = getelementptr inbounds %class.Node, %class.Node* %cur_14, i32 0, i32 1
    %load_member_16 = load %class.Node**, %class.Node*** %class_mem_gep_reg_16
    %getelementptr_reg_8 = getelementptr inbounds %class.Node*, %class.Node** %load_member_16, i32 0
    %load_result_8 = load %class.Node*, %class.Node** %getelementptr_reg_8
    %class_mem_gep_reg_17 = getelementptr inbounds %class.Node, %class.Node* %load_result_8, i32 0, i32 2
    %load_member_17 = load i32, i32* %class_mem_gep_reg_17
    %ne_1 = icmp ne i32 %load_member_15, %load_member_17
    br i1 %ne_1, label %single_then_basicblock8, label %if_withoutelse_end_basicblock8

single_then_basicblock8:                                     ; preds = if_withoutelse_end_basicblock7 
    %replacement_1 = load %class.Node*, %class.Node** %replacement_addr
    %class_mem_gep_reg_18 = getelementptr inbounds %class.Node, %class.Node* %replacement_1, i32 0, i32 0
    %load_member_18 = load %class.Node*, %class.Node** %class_mem_gep_reg_18
    %class_mem_gep_reg_19 = getelementptr inbounds %class.Node, %class.Node* %load_member_18, i32 0, i32 1
    %load_member_19 = load %class.Node**, %class.Node*** %class_mem_gep_reg_19
    %getelementptr_reg_9 = getelementptr inbounds %class.Node*, %class.Node** %load_member_19, i32 1
    %load_result_9 = load %class.Node*, %class.Node** %getelementptr_reg_9
    %replacement_2 = load %class.Node*, %class.Node** %replacement_addr
    %class_mem_gep_reg_20 = getelementptr inbounds %class.Node, %class.Node* %replacement_2, i32 0, i32 1
    %load_member_20 = load %class.Node**, %class.Node*** %class_mem_gep_reg_20
    %getelementptr_reg_10 = getelementptr inbounds %class.Node*, %class.Node** %load_member_20, i32 0
    %load_result_10 = load %class.Node*, %class.Node** %getelementptr_reg_10
    store %class.Node* %load_result_10, %class.Node** %getelementptr_reg_9
    %replacement_3 = load %class.Node*, %class.Node** %replacement_addr
    %class_mem_gep_reg_21 = getelementptr inbounds %class.Node, %class.Node* %replacement_3, i32 0, i32 1
    %load_member_21 = load %class.Node**, %class.Node*** %class_mem_gep_reg_21
    %getelementptr_reg_11 = getelementptr inbounds %class.Node*, %class.Node** %load_member_21, i32 0
    %load_result_11 = load %class.Node*, %class.Node** %getelementptr_reg_11
    %ne_2 = icmp ne %class.Node* %load_result_11, null
    br i1 %ne_2, label %single_then_basicblock9, label %if_withoutelse_end_basicblock9

if_withoutelse_end_basicblock8:                              ; preds = single_then_basicblock8 if_withoutelse_end_basicblock7 if_withoutelse_end_basicblock9 
    %pnt_2 = load %class.Node*, %class.Node** %pnt_addr
    %ne_3 = icmp ne %class.Node* %pnt_2, null
    br i1 %ne_3, label %single_then_basicblock10, label %if_withoutelse_end_basicblock10

single_then_basicblock9:                                     ; preds = single_then_basicblock8 
    %replacement_4 = load %class.Node*, %class.Node** %replacement_addr
    %class_mem_gep_reg_22 = getelementptr inbounds %class.Node, %class.Node* %replacement_4, i32 0, i32 1
    %load_member_22 = load %class.Node**, %class.Node*** %class_mem_gep_reg_22
    %getelementptr_reg_12 = getelementptr inbounds %class.Node*, %class.Node** %load_member_22, i32 0
    %load_result_12 = load %class.Node*, %class.Node** %getelementptr_reg_12
    %class_mem_gep_reg_23 = getelementptr inbounds %class.Node, %class.Node* %load_result_12, i32 0, i32 0
    %load_member_23 = load %class.Node*, %class.Node** %class_mem_gep_reg_23
    %replacement_5 = load %class.Node*, %class.Node** %replacement_addr
    %class_mem_gep_reg_24 = getelementptr inbounds %class.Node, %class.Node* %replacement_5, i32 0, i32 0
    %load_member_24 = load %class.Node*, %class.Node** %class_mem_gep_reg_24
    store %class.Node* %load_member_24, %class.Node** %class_mem_gep_reg_23
    br label %if_withoutelse_end_basicblock9

if_withoutelse_end_basicblock9:                              ; preds = single_then_basicblock9 single_then_basicblock8 
    br label %if_withoutelse_end_basicblock8

single_then_basicblock10:                                    ; preds = if_withoutelse_end_basicblock8 
    %pnt_3 = load %class.Node*, %class.Node** %pnt_addr
    %class_mem_gep_reg_25 = getelementptr inbounds %class.Node, %class.Node* %pnt_3, i32 0, i32 1
    %load_member_25 = load %class.Node**, %class.Node*** %class_mem_gep_reg_25
    %childId_0 = load i32, i32* %childId_addr
    %getelementptr_reg_13 = getelementptr inbounds %class.Node*, %class.Node** %load_member_25, i32 %childId_0
    %load_result_13 = load %class.Node*, %class.Node** %getelementptr_reg_13
    %replacement_6 = load %class.Node*, %class.Node** %replacement_addr
    store %class.Node* %replacement_6, %class.Node** %getelementptr_reg_13
    br label %if_withoutelse_end_basicblock10

if_withoutelse_end_basicblock10:                             ; preds = single_then_basicblock10 if_withoutelse_end_basicblock8 
    %replacement_7 = load %class.Node*, %class.Node** %replacement_addr
    %class_mem_gep_reg_26 = getelementptr inbounds %class.Node, %class.Node* %replacement_7, i32 0, i32 0
    %load_member_26 = load %class.Node*, %class.Node** %class_mem_gep_reg_26
    %pnt_4 = load %class.Node*, %class.Node** %pnt_addr
    store %class.Node* %pnt_4, %class.Node** %class_mem_gep_reg_26
    %replacement_8 = load %class.Node*, %class.Node** %replacement_addr
    %class_mem_gep_reg_27 = getelementptr inbounds %class.Node, %class.Node* %replacement_8, i32 0, i32 1
    %load_member_27 = load %class.Node**, %class.Node*** %class_mem_gep_reg_27
    %getelementptr_reg_14 = getelementptr inbounds %class.Node*, %class.Node** %load_member_27, i32 1
    %load_result_14 = load %class.Node*, %class.Node** %getelementptr_reg_14
    %cur_15 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_28 = getelementptr inbounds %class.Node, %class.Node* %cur_15, i32 0, i32 1
    %load_member_28 = load %class.Node**, %class.Node*** %class_mem_gep_reg_28
    %getelementptr_reg_15 = getelementptr inbounds %class.Node*, %class.Node** %load_member_28, i32 1
    %load_result_15 = load %class.Node*, %class.Node** %getelementptr_reg_15
    store %class.Node* %load_result_15, %class.Node** %getelementptr_reg_14
    %cur_16 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_29 = getelementptr inbounds %class.Node, %class.Node* %cur_16, i32 0, i32 1
    %load_member_29 = load %class.Node**, %class.Node*** %class_mem_gep_reg_29
    %getelementptr_reg_16 = getelementptr inbounds %class.Node*, %class.Node** %load_member_29, i32 1
    %load_result_16 = load %class.Node*, %class.Node** %getelementptr_reg_16
    %ne_4 = icmp ne %class.Node* %load_result_16, null
    br i1 %ne_4, label %single_then_basicblock11, label %if_withoutelse_end_basicblock11

single_then_basicblock11:                                    ; preds = if_withoutelse_end_basicblock10 
    %cur_17 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_30 = getelementptr inbounds %class.Node, %class.Node* %cur_17, i32 0, i32 1
    %load_member_30 = load %class.Node**, %class.Node*** %class_mem_gep_reg_30
    %getelementptr_reg_17 = getelementptr inbounds %class.Node*, %class.Node** %load_member_30, i32 1
    %load_result_17 = load %class.Node*, %class.Node** %getelementptr_reg_17
    %class_mem_gep_reg_31 = getelementptr inbounds %class.Node, %class.Node* %load_result_17, i32 0, i32 0
    %load_member_31 = load %class.Node*, %class.Node** %class_mem_gep_reg_31
    %replacement_9 = load %class.Node*, %class.Node** %replacement_addr
    store %class.Node* %replacement_9, %class.Node** %class_mem_gep_reg_31
    br label %if_withoutelse_end_basicblock11

if_withoutelse_end_basicblock11:                             ; preds = single_then_basicblock11 if_withoutelse_end_basicblock10 
    %replacement_10 = load %class.Node*, %class.Node** %replacement_addr
    %class_mem_gep_reg_32 = getelementptr inbounds %class.Node, %class.Node* %replacement_10, i32 0, i32 2
    %load_member_32 = load i32, i32* %class_mem_gep_reg_32
    %cur_18 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_33 = getelementptr inbounds %class.Node, %class.Node* %cur_18, i32 0, i32 1
    %load_member_33 = load %class.Node**, %class.Node*** %class_mem_gep_reg_33
    %getelementptr_reg_18 = getelementptr inbounds %class.Node*, %class.Node** %load_member_33, i32 0
    %load_result_18 = load %class.Node*, %class.Node** %getelementptr_reg_18
    %class_mem_gep_reg_34 = getelementptr inbounds %class.Node, %class.Node* %load_result_18, i32 0, i32 2
    %load_member_34 = load i32, i32* %class_mem_gep_reg_34
    %ne_5 = icmp ne i32 %load_member_32, %load_member_34
    br i1 %ne_5, label %single_then_basicblock12, label %if_withoutelse_end_basicblock12

single_then_basicblock12:                                    ; preds = if_withoutelse_end_basicblock11 
    %replacement_11 = load %class.Node*, %class.Node** %replacement_addr
    %class_mem_gep_reg_35 = getelementptr inbounds %class.Node, %class.Node* %replacement_11, i32 0, i32 1
    %load_member_35 = load %class.Node**, %class.Node*** %class_mem_gep_reg_35
    %getelementptr_reg_19 = getelementptr inbounds %class.Node*, %class.Node** %load_member_35, i32 0
    %load_result_19 = load %class.Node*, %class.Node** %getelementptr_reg_19
    %cur_19 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_36 = getelementptr inbounds %class.Node, %class.Node* %cur_19, i32 0, i32 1
    %load_member_36 = load %class.Node**, %class.Node*** %class_mem_gep_reg_36
    %getelementptr_reg_20 = getelementptr inbounds %class.Node*, %class.Node** %load_member_36, i32 0
    %load_result_20 = load %class.Node*, %class.Node** %getelementptr_reg_20
    store %class.Node* %load_result_20, %class.Node** %getelementptr_reg_19
    %cur_20 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_37 = getelementptr inbounds %class.Node, %class.Node* %cur_20, i32 0, i32 1
    %load_member_37 = load %class.Node**, %class.Node*** %class_mem_gep_reg_37
    %getelementptr_reg_21 = getelementptr inbounds %class.Node*, %class.Node** %load_member_37, i32 0
    %load_result_21 = load %class.Node*, %class.Node** %getelementptr_reg_21
    %class_mem_gep_reg_38 = getelementptr inbounds %class.Node, %class.Node* %load_result_21, i32 0, i32 0
    %load_member_38 = load %class.Node*, %class.Node** %class_mem_gep_reg_38
    %replacement_12 = load %class.Node*, %class.Node** %replacement_addr
    store %class.Node* %replacement_12, %class.Node** %class_mem_gep_reg_38
    br label %if_withoutelse_end_basicblock12

if_withoutelse_end_basicblock12:                             ; preds = single_then_basicblock12 if_withoutelse_end_basicblock11 
    store i32 1, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock single_then_basicblock0 single_then_basicblock1 single_then_basicblock2 if_withoutelse_end_basicblock6 if_withoutelse_end_basicblock12 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @insertImpl(%class.Node* %cur_para,%class.Node* %pnt_para,i32 %childId_para,i32 %key_para) {
entrance_block0:                                             
    %id_addr = alloca i32
    %key_addr = alloca i32
    %childId_addr = alloca i32
    %pnt_addr = alloca %class.Node*
    %cur_addr = alloca %class.Node*
    %return_register_infunction_addr = alloca i32
    store %class.Node* %cur_para, %class.Node** %cur_addr
    store %class.Node* %pnt_para, %class.Node** %pnt_addr
    store i32 %childId_para, i32* %childId_addr
    store i32 %key_para, i32* %key_addr
    %cur = load %class.Node*, %class.Node** %cur_addr
    %eq = icmp eq %class.Node* %cur, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %key = load i32, i32* %key_addr
    %pnt = load %class.Node*, %class.Node** %pnt_addr
    %call_constructNode = call %class.Node* @constructNode(i32 %key, %class.Node* %pnt, %class.Node* null, %class.Node* null)
    store %class.Node* %call_constructNode, %class.Node** %cur_addr
    %pnt_0 = load %class.Node*, %class.Node** %pnt_addr
    %class_mem_gep_reg = getelementptr inbounds %class.Node, %class.Node* %pnt_0, i32 0, i32 1
    %load_member = load %class.Node**, %class.Node*** %class_mem_gep_reg
    %childId = load i32, i32* %childId_addr
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %load_member, i32 %childId
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    %cur_0 = load %class.Node*, %class.Node** %cur_addr
    store %class.Node* %cur_0, %class.Node** %getelementptr_reg
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %cur_1 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.Node, %class.Node* %cur_1, i32 0, i32 2
    %load_member_0 = load i32, i32* %class_mem_gep_reg_0
    %key_0 = load i32, i32* %key_addr
    %eq_0 = icmp eq i32 %load_member_0, %key_0
    br i1 %eq_0, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

single_then_basicblock0:                                     ; preds = if_withoutelse_end_basicblock 
    %cur_2 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.Node, %class.Node* %cur_2, i32 0, i32 3
    %load_member_1 = load i32, i32* %class_mem_gep_reg_1
    %add = add i32 %load_member_1, 1
    store i32 %add, i32* %class_mem_gep_reg_1
    store i32 1, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 if_withoutelse_end_basicblock 
    store i32 0, i32* %id_addr
    %cur_3 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_2 = getelementptr inbounds %class.Node, %class.Node* %cur_3, i32 0, i32 2
    %load_member_2 = load i32, i32* %class_mem_gep_reg_2
    %key_1 = load i32, i32* %key_addr
    %slt = icmp slt i32 %load_member_2, %key_1
    br i1 %slt, label %single_then_basicblock1, label %if_withoutelse_end_basicblock1

single_then_basicblock1:                                     ; preds = if_withoutelse_end_basicblock0 
    store i32 1, i32* %id_addr
    br label %if_withoutelse_end_basicblock1

if_withoutelse_end_basicblock1:                              ; preds = single_then_basicblock1 if_withoutelse_end_basicblock0 
    %cur_4 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_3 = getelementptr inbounds %class.Node, %class.Node* %cur_4, i32 0, i32 1
    %load_member_3 = load %class.Node**, %class.Node*** %class_mem_gep_reg_3
    %id = load i32, i32* %id_addr
    %getelementptr_reg_0 = getelementptr inbounds %class.Node*, %class.Node** %load_member_3, i32 %id
    %load_result_0 = load %class.Node*, %class.Node** %getelementptr_reg_0
    %cur_5 = load %class.Node*, %class.Node** %cur_addr
    %id_0 = load i32, i32* %id_addr
    %key_2 = load i32, i32* %key_addr
    %call_insertImpl = call i32 @insertImpl(%class.Node* %load_result_0, %class.Node* %cur_5, i32 %id_0, i32 %key_2)
    store i32 %call_insertImpl, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock single_then_basicblock0 if_withoutelse_end_basicblock1 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @generateOperations(i32 %n_para,i32 %t_para) {
entrance_block0:                                             
    %value_addr = alloca i32
    %i_addr = alloca i32
    %t_addr = alloca i32
    %n_addr = alloca i32
    store i32 %n_para, i32* %n_addr
    store i32 %t_para, i32* %t_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i = load i32, i32* %i_addr
    %t = load i32, i32* %t_addr
    %slt = icmp slt i32 %i, %t
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body if_end_basicblock 
    %i_0 = load i32, i32* %i_addr
    %add = add i32 %i_0, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %call_randInt31 = call i32 @randInt31()
    %MAX = load i32, i32* @MAX
    %srem = srem i32 %call_randInt31, %MAX
    store i32 %srem, i32* %value_addr
    %n = load i32, i32* %n_addr
    %call_randOp = call i32 @randOp(i32 %n)
    %eq = icmp eq i32 %call_randOp, 1
    br i1 %eq, label %then_basicblock, label %else_basicblock

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

then_basicblock:                                             ; preds = for_body 
    %value = load i32, i32* %value_addr
    %call_insert = call i32 @insert(i32 %value)
    br label %if_end_basicblock

else_basicblock:                                             ; preds = for_body 
    %value_0 = load i32, i32* %value_addr
    %call_erase = call i32 @erase(i32 %value_0)
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %for_step

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local i32 @insert(i32 %key_para) {
entrance_block0:                                             
    %key_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %key_para, i32* %key_addr
    %root = load %class.Node*, %class.Node** @root
    %ne = icmp ne %class.Node* %root, null
    br i1 %ne, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %root_0 = load %class.Node*, %class.Node** @root
    %sub = sub i32 0, 1
    %key = load i32, i32* %key_addr
    %call_insertImpl = call i32 @insertImpl(%class.Node* %root_0, %class.Node* null, i32 %sub, i32 %key)
    store i32 %call_insertImpl, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %key_0 = load i32, i32* %key_addr
    %call_constructNode = call %class.Node* @constructNode(i32 %key_0, %class.Node* null, %class.Node* null, %class.Node* null)
    store %class.Node* %call_constructNode, %class.Node** @root
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock if_withoutelse_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %m_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @seed
    store i32 50000, i32* %m_addr
    %MaxRandInt = load i32, i32* @MaxRandInt
    %sdiv = sdiv i32 %MaxRandInt, 10
    %mul = mul i32 8, %sdiv
    %m = load i32, i32* %m_addr
    call void @generateOperations(i32 %mul, i32 %m)
    %MaxRandInt_0 = load i32, i32* @MaxRandInt
    %sdiv_0 = sdiv i32 %MaxRandInt_0, 10
    %mul_0 = mul i32 2, %sdiv_0
    %m_0 = load i32, i32* %m_addr
    %mul_1 = mul i32 2, %m_0
    call void @generateOperations(i32 %mul_0, i32 %mul_1)
    %MaxRandInt_1 = load i32, i32* @MaxRandInt
    %sdiv_1 = sdiv i32 %MaxRandInt_1, 10
    %mul_2 = mul i32 4, %sdiv_1
    %m_1 = load i32, i32* %m_addr
    call void @generateOperations(i32 %mul_2, i32 %m_1)
    %root = load %class.Node*, %class.Node** @root
    call void @printTree(%class.Node* %root)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @randInt31() {
entrance_block0:                                             
    %x_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %seed = load i32, i32* @seed
    store i32 %seed, i32* %x_addr
    %x = load i32, i32* %x_addr
    %x_0 = load i32, i32* %x_addr
    %shl = shl i32 %x_0, 13
    %xor = xor i32 %x, %shl
    store i32 %xor, i32* %x_addr
    %x_1 = load i32, i32* %x_addr
    %shl_0 = shl i32 1, 31
    %TILDE = xor i32 %shl_0, -1
    %and = and i32 %x_1, %TILDE
    store i32 %and, i32* %x_addr
    %x_2 = load i32, i32* %x_addr
    %x_3 = load i32, i32* %x_addr
    %ashr = ashr i32 %x_3, 17
    %xor_0 = xor i32 %x_2, %ashr
    store i32 %xor_0, i32* %x_addr
    %x_4 = load i32, i32* %x_addr
    %x_5 = load i32, i32* %x_addr
    %shl_1 = shl i32 %x_5, 5
    %xor_1 = xor i32 %x_4, %shl_1
    store i32 %xor_1, i32* %x_addr
    %x_6 = load i32, i32* %x_addr
    %shl_2 = shl i32 1, 31
    %TILDE_0 = xor i32 %shl_2, -1
    %and_0 = and i32 %x_6, %TILDE_0
    store i32 %and_0, i32* %x_addr
    %x_7 = load i32, i32* %x_addr
    store i32 %x_7, i32* @seed
    %x_8 = load i32, i32* %x_addr
    store i32 %x_8, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    store %class.Node* null, %class.Node** @root
    store i32 128, i32* @MAX
    %shl = shl i32 1, 31
    %TILDE = xor i32 %shl, -1
    store i32 %TILDE, i32* @MaxRandInt
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local void @printTree(%class.Node* %cur_para) {
entrance_block0:                                             
    %cur_addr = alloca %class.Node*
    store %class.Node* %cur_para, %class.Node** %cur_addr
    %cur = load %class.Node*, %class.Node** %cur_addr
    %eq = icmp eq %class.Node* %cur, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %cur_0 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg = getelementptr inbounds %class.Node, %class.Node* %cur_0, i32 0, i32 1
    %load_member = load %class.Node**, %class.Node*** %class_mem_gep_reg
    %getelementptr_reg = getelementptr inbounds %class.Node*, %class.Node** %load_member, i32 0
    %load_result = load %class.Node*, %class.Node** %getelementptr_reg
    call void @printTree(%class.Node* %load_result)
    %cur_1 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.Node, %class.Node* %cur_1, i32 0, i32 2
    %load_member_0 = load i32, i32* %class_mem_gep_reg_0
    call void @printInt(i32 %load_member_0)
    %const_string_pointer = getelementptr inbounds [3 x i8], [3 x i8]* @const_string0, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    %cur_2 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.Node, %class.Node* %cur_2, i32 0, i32 3
    %load_member_1 = load i32, i32* %class_mem_gep_reg_1
    call void @printlnInt(i32 %load_member_1)
    %cur_3 = load %class.Node*, %class.Node** %cur_addr
    %class_mem_gep_reg_2 = getelementptr inbounds %class.Node, %class.Node* %cur_3, i32 0, i32 1
    %load_member_2 = load %class.Node**, %class.Node*** %class_mem_gep_reg_2
    %getelementptr_reg_0 = getelementptr inbounds %class.Node*, %class.Node** %load_member_2, i32 1
    %load_result_0 = load %class.Node*, %class.Node** %getelementptr_reg_0
    call void @printTree(%class.Node* %load_result_0)
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock if_withoutelse_end_basicblock 
    ret void
}
