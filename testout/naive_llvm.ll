; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.node = type { i32, i32, i32 }
@hashsize = dso_local global i32 0
@table = dso_local global %class.node** null

@const_string0 = private unnamed_addr constant [2 x i8] c" \00", align 1

declare i1 @_str_ne(i8* %lhs,i8* %rhs)
declare i1 @_str_le(i8* %lhs,i8* %rhs)
declare i8* @_str_substring(i8* %str,i32 %left,i32 %right)
declare i8* @_str_concatenate(i8* %lhs,i8* %rhs)
declare i8* @getString()
declare i1 @_str_ge(i8* %lhs,i8* %rhs)
declare i1 @_str_lt(i8* %lhs,i8* %rhs)
declare i32 @getInt()
declare i32 @_str_length(i32* %str)
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

define dso_local i32 @getHash(i32 %n_para) {
entrance_block0:                                             
    %n_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %n_para, i32* %n_addr
    %n = load i32, i32* %n_addr
    %mul = mul i32 %n, 237
    %hashsize = load i32, i32* @hashsize
    %srem = srem i32 %mul, %hashsize
    store i32 %srem, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @get(i32 %key_para) {
entrance_block0:                                             
    %ptr_addr = alloca %class.node*
    %key_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %key_para, i32* %key_addr
    store null, %class.node** %ptr_addr
    %ptr = load %class.node*, %class.node** %ptr_addr
    %table = load %class.node**, %class.node*** @table
    %key = load i32, i32* %key_addr
    %call_getHash = call i32 @getHash(i32 %key)
    %getelementptr_reg = getelementptr inbounds %class.node*, %class.node** %table, i32 %call_getHash
    %load_result = load %class.node*, %class.node** %getelementptr_reg
    store %class.node* %load_result, %class.node** %ptr_addr
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body 
    %ptr_0 = load %class.node*, %class.node** %ptr_addr
    %class_mem_gep_reg = getelementptr inbounds %class.node, %class.node* %ptr_0, i32 0, i32 0
    %load_member = load i32, i32* %class_mem_gep_reg
    %key_0 = load i32, i32* %key_addr
    %ne = icmp ne i32 %load_member, %key_0
    br i1 %ne, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %ptr_1 = load %class.node*, %class.node** %ptr_addr
    %ptr_2 = load %class.node*, %class.node** %ptr_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.node, %class.node* %ptr_2, i32 0, i32 2
    %load_member_0 = load %class.node*, %class.node** %class_mem_gep_reg_0
    store %class.node* %load_member_0, %class.node** %ptr_addr
    br label %while_condition

while_end_merge:                                             ; preds = entrance_block0 while_condition 
    %ptr_3 = load %class.node*, %class.node** %ptr_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.node, %class.node* %ptr_3, i32 0, i32 1
    %load_member_1 = load i32, i32* %class_mem_gep_reg_1
    store i32 %load_member_1, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %table = load %class.node**, %class.node*** @table
    %mul_bytes = mul i32 100, 12
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 12, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to %class.node**
    store %class.node** %array_addr, %class.node*** @table
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %hashsize = load i32, i32* @hashsize
    %slt = icmp slt i32 %i_0, %hashsize
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %table_0 = load %class.node**, %class.node*** @table
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg = getelementptr inbounds %class.node*, %class.node** %table_0, i32 %i_1
    %load_result = load %class.node*, %class.node** %getelementptr_reg
    store null, %class.node** %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %i_3 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %i_4 = load i32, i32* %i_addr
    %slt_0 = icmp slt i32 %i_4, 1000
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %i_7 = load i32, i32* %i_addr
    %add_0 = add i32 %i_7, 1
    store i32 %add_0, i32* %i_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %i_5 = load i32, i32* %i_addr
    %i_6 = load i32, i32* %i_addr
    call void @put(i32 %i_5, i32 %i_6)
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    %i_8 = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition1

for_condition1:                                              ; preds = for_end_merge0 for_step1 
    %i_9 = load i32, i32* %i_addr
    %slt_1 = icmp slt i32 %i_9, 1000
    br i1 %slt_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 
    %i_12 = load i32, i32* %i_addr
    %add_1 = add i32 %i_12, 1
    store i32 %add_1, i32* %i_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %i_10 = load i32, i32* %i_addr
    %call_toString = call i8* @toString(i32 %i_10)
    %const_string_pointer = getelementptr inbounds [2 x i8], [2 x i8]* @const_string0, i32 0, i32 0
    %string_add = call i8* @_str_concatenate(i8* %call_toString, i8* %const_string_pointer)
    %i_11 = load i32, i32* %i_addr
    %call_get = call i32 @get(i32 %i_11)
    %call_toString_0 = call i8* @toString(i32 %call_get)
    %string_add_0 = call i8* @_str_concatenate(i8* %string_add, i8* %call_toString_0)
    call void @println(i8* %string_add_0)
    br label %for_step1

for_end_merge1:                                              ; preds = for_condition1 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = for_end_merge1 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @put(i32 %key_para,i32 %data_para) {
entrance_block0:                                             
    %ptr_addr = alloca %class.node*
    %p_addr = alloca i32
    %data_addr = alloca i32
    %key_addr = alloca i32
    store i32 %key_para, i32* %key_addr
    store i32 %data_para, i32* %data_addr
    store null, %class.node** %ptr_addr
    %p = load i32, i32* %p_addr
    %key = load i32, i32* %key_addr
    %call_getHash = call i32 @getHash(i32 %key)
    store i32 %call_getHash, i32* %p_addr
    %table = load %class.node**, %class.node*** @table
    %p_0 = load i32, i32* %p_addr
    %getelementptr_reg = getelementptr inbounds %class.node*, %class.node** %table, i32 %p_0
    %load_result = load %class.node*, %class.node** %getelementptr_reg
    %eq = icmp eq %class.node* %load_result, null
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %table_0 = load %class.node**, %class.node*** @table
    %p_1 = load i32, i32* %p_addr
    %getelementptr_reg_0 = getelementptr inbounds %class.node*, %class.node** %table_0, i32 %p_1
    %load_result_0 = load %class.node*, %class.node** %getelementptr_reg_0
    %class_malloc = call i8* @_f_malloc(i32 12)
    %class_ptr = bitcast i8* %class_malloc to %class.node*
    store %class.node* %class_ptr, %class.node** %getelementptr_reg_0
    %table_1 = load %class.node**, %class.node*** @table
    %p_2 = load i32, i32* %p_addr
    %getelementptr_reg_1 = getelementptr inbounds %class.node*, %class.node** %table_1, i32 %p_2
    %load_result_1 = load %class.node*, %class.node** %getelementptr_reg_1
    %class_mem_gep_reg = getelementptr inbounds %class.node, %class.node* %load_result_1, i32 0, i32 0
    %load_member = load i32, i32* %class_mem_gep_reg
    %key_0 = load i32, i32* %key_addr
    store i32 %key_0, i32* %class_mem_gep_reg
    %table_2 = load %class.node**, %class.node*** @table
    %p_3 = load i32, i32* %p_addr
    %getelementptr_reg_2 = getelementptr inbounds %class.node*, %class.node** %table_2, i32 %p_3
    %load_result_2 = load %class.node*, %class.node** %getelementptr_reg_2
    %class_mem_gep_reg_0 = getelementptr inbounds %class.node, %class.node* %load_result_2, i32 0, i32 1
    %load_member_0 = load i32, i32* %class_mem_gep_reg_0
    %data = load i32, i32* %data_addr
    store i32 %data, i32* %class_mem_gep_reg_0
    %table_3 = load %class.node**, %class.node*** @table
    %p_4 = load i32, i32* %p_addr
    %getelementptr_reg_3 = getelementptr inbounds %class.node*, %class.node** %table_3, i32 %p_4
    %load_result_3 = load %class.node*, %class.node** %getelementptr_reg_3
    %class_mem_gep_reg_1 = getelementptr inbounds %class.node, %class.node* %load_result_3, i32 0, i32 2
    %load_member_1 = load %class.node*, %class.node** %class_mem_gep_reg_1
    store null, %class.node** %class_mem_gep_reg_1
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %ptr = load %class.node*, %class.node** %ptr_addr
    %table_4 = load %class.node**, %class.node*** @table
    %p_5 = load i32, i32* %p_addr
    %getelementptr_reg_4 = getelementptr inbounds %class.node*, %class.node** %table_4, i32 %p_5
    %load_result_4 = load %class.node*, %class.node** %getelementptr_reg_4
    store %class.node* %load_result_4, %class.node** %ptr_addr
    br label %while_condition

while_condition:                                             ; preds = if_withoutelse_end_basicblock while_body if_withoutelse_end_basicblock0 
    %ptr_0 = load %class.node*, %class.node** %ptr_addr
    %class_mem_gep_reg_2 = getelementptr inbounds %class.node, %class.node* %ptr_0, i32 0, i32 0
    %load_member_2 = load i32, i32* %class_mem_gep_reg_2
    %key_1 = load i32, i32* %key_addr
    %ne = icmp ne i32 %load_member_2, %key_1
    br i1 %ne, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %ptr_1 = load %class.node*, %class.node** %ptr_addr
    %class_mem_gep_reg_3 = getelementptr inbounds %class.node, %class.node* %ptr_1, i32 0, i32 2
    %load_member_3 = load %class.node*, %class.node** %class_mem_gep_reg_3
    %eq_0 = icmp eq %class.node* %load_member_3, null
    br i1 %eq_0, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

while_end_merge:                                             ; preds = if_withoutelse_end_basicblock while_condition 
    %ptr_7 = load %class.node*, %class.node** %ptr_addr
    %class_mem_gep_reg_10 = getelementptr inbounds %class.node, %class.node* %ptr_7, i32 0, i32 1
    %load_member_10 = load i32, i32* %class_mem_gep_reg_10
    %data_0 = load i32, i32* %data_addr
    store i32 %data_0, i32* %class_mem_gep_reg_10
    br label %return_block0

single_then_basicblock0:                                     ; preds = while_body 
    %ptr_2 = load %class.node*, %class.node** %ptr_addr
    %class_mem_gep_reg_4 = getelementptr inbounds %class.node, %class.node* %ptr_2, i32 0, i32 2
    %load_member_4 = load %class.node*, %class.node** %class_mem_gep_reg_4
    %class_malloc_0 = call i8* @_f_malloc(i32 12)
    %class_ptr_0 = bitcast i8* %class_malloc_0 to %class.node*
    store %class.node* %class_ptr_0, %class.node** %class_mem_gep_reg_4
    %ptr_3 = load %class.node*, %class.node** %ptr_addr
    %class_mem_gep_reg_5 = getelementptr inbounds %class.node, %class.node* %ptr_3, i32 0, i32 2
    %load_member_5 = load %class.node*, %class.node** %class_mem_gep_reg_5
    %class_mem_gep_reg_6 = getelementptr inbounds %class.node, %class.node* %load_member_5, i32 0, i32 0
    %load_member_6 = load i32, i32* %class_mem_gep_reg_6
    %key_2 = load i32, i32* %key_addr
    store i32 %key_2, i32* %class_mem_gep_reg_6
    %ptr_4 = load %class.node*, %class.node** %ptr_addr
    %class_mem_gep_reg_7 = getelementptr inbounds %class.node, %class.node* %ptr_4, i32 0, i32 2
    %load_member_7 = load %class.node*, %class.node** %class_mem_gep_reg_7
    %class_mem_gep_reg_8 = getelementptr inbounds %class.node, %class.node* %load_member_7, i32 0, i32 2
    %load_member_8 = load %class.node*, %class.node** %class_mem_gep_reg_8
    store null, %class.node** %class_mem_gep_reg_8
    br label %if_withoutelse_end_basicblock0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 while_body 
    %ptr_5 = load %class.node*, %class.node** %ptr_addr
    %ptr_6 = load %class.node*, %class.node** %ptr_addr
    %class_mem_gep_reg_9 = getelementptr inbounds %class.node, %class.node* %ptr_6, i32 0, i32 2
    %load_member_9 = load %class.node*, %class.node** %class_mem_gep_reg_9
    store %class.node* %load_member_9, %class.node** %ptr_addr
    br label %while_condition

return_block0:                                               ; preds = single_then_basicblock while_end_merge 
    ret void
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    store i32 100, i32* @hashsize
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
