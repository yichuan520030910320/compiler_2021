; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.A = type { %class.A*, %class.B*, %class.C***, i32 }
%class.B = type { i32, %class.C* }
%class.C = type { i32, i8* }
@countA = dso_local global i32 0
@countB = dso_local global i32 0
@countC = dso_local global i32 0
@something = dso_local global %class.C* null

@const_string1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@const_string6 = private unnamed_addr constant [1 x i8] c"\00", align 1
@const_string3 = private unnamed_addr constant [2 x i8] c">\00", align 1
@const_string5 = private unnamed_addr constant [2 x i8] c",\00", align 1
@const_string2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@const_string0 = private unnamed_addr constant [6 x i8] c"Oops!\00", align 1
@const_string4 = private unnamed_addr constant [3 x i8] c"<=\00", align 1

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

define dso_local void @A.A(%class.A* %this) {
entrance_block0:                                             
    %arrayptrcnt_1 = alloca i32
    %arrayptrcnt_0 = alloca i32
    %arrayptrcnt = alloca i32
    %this_addr_0 = alloca %class.A*
    store %class.A* %this, %class.A** %this_addr_0
    %this_reg = load %class.A*, %class.A** %this_addr_0
    %A.idx_gep_in_id = getelementptr inbounds %class.A, %class.A* %this_reg, i32 0, i32 3
    %A.idx_load_reg = load i32, i32* %A.idx_gep_in_id
    %countA = load i32, i32* @countA
    %add = add i32 %countA, 1
    store i32 %add, i32* @countA
    store i32 %countA, i32* %A.idx_gep_in_id
    %idx = load i32, i32* %A.idx_gep_in_id
    %srem = srem i32 %idx, 2
    %eq = icmp eq i32 %srem, 0
    br i1 %eq, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = entrance_block0 
    %this_reg_0 = load %class.A*, %class.A** %this_addr_0
    %A.a_gep_in_id = getelementptr inbounds %class.A, %class.A* %this_reg_0, i32 0, i32 0
    %A.a_load_reg = load %class.A*, %class.A** %A.a_gep_in_id
    %class_malloc = call i8* @_f_malloc(i32 28)
    %class_ptr = bitcast i8* %class_malloc to %class.A*
    call void @A.A(%class.A* %class_ptr)
    store %class.A* %class_ptr, %class.A** %A.a_gep_in_id
    %countB = load i32, i32* @countB
    %srem_0 = srem i32 %countB, 2
    %eq_0 = icmp eq i32 %srem_0, 0
    br i1 %eq_0, label %then_basicblock0, label %else_basicblock0

else_basicblock:                                             ; preds = entrance_block0 
    %this_reg_2 = load %class.A*, %class.A** %this_addr_0
    %A.a_gep_in_id_0 = getelementptr inbounds %class.A, %class.A* %this_reg_2, i32 0, i32 0
    %A.a_load_reg_0 = load %class.A*, %class.A** %A.a_gep_in_id_0
    store %class.A* null, %class.A** %A.a_gep_in_id_0
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock if_end_basicblock0 
    %this_reg_3 = load %class.A*, %class.A** %this_addr_0
    %A.c_gep_in_id = getelementptr inbounds %class.A, %class.A* %this_reg_3, i32 0, i32 2
    %A.c_load_reg = load %class.C***, %class.C**** %A.c_gep_in_id
    %mul_bytes = mul i32 2, 8
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 2, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to %class.C***
    store %class.C*** %array_addr, %class.C**** %A.c_gep_in_id
    %c = load %class.C***, %class.C**** %A.c_gep_in_id
    %getelementptr_reg = getelementptr inbounds %class.C**, %class.C*** %c, i32 0
    %load_result = load %class.C**, %class.C*** %getelementptr_reg
    %mul_bytes_0 = mul i32 6, 8
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 6, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to %class.C*****
    store i32 0, i32* %arrayptrcnt
    br label %new_condition

then_basicblock0:                                            ; preds = then_basicblock 
    %this_reg_1 = load %class.A*, %class.A** %this_addr_0
    %A.b_gep_in_id = getelementptr inbounds %class.A, %class.A* %this_reg_1, i32 0, i32 1
    %A.b_load_reg = load %class.B*, %class.B** %A.b_gep_in_id
    %class_malloc_0 = call i8* @_f_malloc(i32 12)
    %class_ptr_0 = bitcast i8* %class_malloc_0 to %class.B*
    call void @B.B(%class.B* %class_ptr_0)
    store %class.B* %class_ptr_0, %class.B** %A.b_gep_in_id
    br label %if_end_basicblock0

else_basicblock0:                                            ; preds = then_basicblock 
    %b = load %class.B*, %class.B** %A.b_gep_in_id
    store %class.B* null, %class.B** %A.b_gep_in_id
    br label %if_end_basicblock0

if_end_basicblock0:                                          ; preds = then_basicblock0 else_basicblock0 
    br label %if_end_basicblock

new_condition:                                               ; preds = new_loop_body if_end_basicblock new_end0 
    %load_tmp_ptr_cnt = load i32, i32* %arrayptrcnt
    %addr_cmp_result = icmp slt i32 %load_tmp_ptr_cnt, 6
    br i1 %addr_cmp_result, label %new_loop_body, label %new_end

new_loop_body:                                               ; preds = new_condition 
    %geparrayaddr = getelementptr inbounds %class.C****, %class.C***** %array_addr_0, i32 %load_tmp_ptr_cnt
    %mul_bytes_1 = mul i32 6, 8
    %sum_bytes_1 = add i32 %mul_bytes_1, 4
    %malloca_1 = call i8* @_f_malloc(i32 %sum_bytes_1)
    %array_cast_i8_to_i32_1 = bitcast i8* %malloca_1 to i32*
    store i32 6, i32* %array_cast_i8_to_i32_1
    %array_tmp_begin_i32_1 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_1, i32 1
    %array_addr_1 = bitcast i32* %array_tmp_begin_i32_1 to %class.C****
    store i32 0, i32* %arrayptrcnt_0
    br label %new_condition0

new_end:                                                     ; preds = new_condition 
    %getelementptr_reg_0 = getelementptr inbounds %class.C****, %class.C***** %array_addr_0, i32 2
    %load_result_0 = load %class.C****, %class.C***** %getelementptr_reg_0
    %getelementptr_reg_1 = getelementptr inbounds %class.C***, %class.C**** %load_result_0, i32 3
    %load_result_1 = load %class.C***, %class.C**** %getelementptr_reg_1
    %getelementptr_reg_2 = getelementptr inbounds %class.C**, %class.C*** %load_result_1, i32 3
    %load_result_2 = load %class.C**, %class.C*** %getelementptr_reg_2
    store %class.C** %load_result_2, %class.C*** %getelementptr_reg
    %c_0 = load %class.C***, %class.C**** %A.c_gep_in_id
    %getelementptr_reg_3 = getelementptr inbounds %class.C**, %class.C*** %c_0, i32 1
    %load_result_3 = load %class.C**, %class.C*** %getelementptr_reg_3
    store %class.C** null, %class.C*** %getelementptr_reg_3
    %c_1 = load %class.C***, %class.C**** %A.c_gep_in_id
    %bitcast_i32 = bitcast %class.C*** %c_1 to i32*
    %gep_size = getelementptr inbounds i32, i32* %bitcast_i32, i32 -1
    %size_load = load i32, i32* %gep_size
    %ne = icmp ne i32 %size_load, 2
    br i1 %ne, label %single_then_basicblock, label %if_withoutelse_end_basicblock

new_condition0:                                              ; preds = new_loop_body0 new_loop_body new_end1 
    %load_tmp_ptr_cnt_0 = load i32, i32* %arrayptrcnt_0
    %addr_cmp_result_0 = icmp slt i32 %load_tmp_ptr_cnt_0, 6
    br i1 %addr_cmp_result_0, label %new_loop_body0, label %new_end0

new_loop_body0:                                              ; preds = new_condition0 
    %geparrayaddr_0 = getelementptr inbounds %class.C***, %class.C**** %array_addr_1, i32 %load_tmp_ptr_cnt_0
    %mul_bytes_2 = mul i32 6, 8
    %sum_bytes_2 = add i32 %mul_bytes_2, 4
    %malloca_2 = call i8* @_f_malloc(i32 %sum_bytes_2)
    %array_cast_i8_to_i32_2 = bitcast i8* %malloca_2 to i32*
    store i32 6, i32* %array_cast_i8_to_i32_2
    %array_tmp_begin_i32_2 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_2, i32 1
    %array_addr_2 = bitcast i32* %array_tmp_begin_i32_2 to %class.C***
    store i32 0, i32* %arrayptrcnt_1
    br label %new_condition1

new_end0:                                                    ; preds = new_condition0 
    store %class.C**** %array_addr_1, %class.C***** %geparrayaddr
    %add_one_ptr_1 = add i32 %load_tmp_ptr_cnt, 1
    store i32 %add_one_ptr_1, i32* %arrayptrcnt
    br label %new_condition

new_condition1:                                              ; preds = new_loop_body1 new_loop_body0 
    %load_tmp_ptr_cnt_1 = load i32, i32* %arrayptrcnt_1
    %addr_cmp_result_1 = icmp slt i32 %load_tmp_ptr_cnt_1, 6
    br i1 %addr_cmp_result_1, label %new_loop_body1, label %new_end1

new_loop_body1:                                              ; preds = new_condition1 
    %geparrayaddr_1 = getelementptr inbounds %class.C**, %class.C*** %array_addr_2, i32 %load_tmp_ptr_cnt_1
    %mul_bytes_3 = mul i32 6, 8
    %sum_bytes_3 = add i32 %mul_bytes_3, 4
    %malloca_3 = call i8* @_f_malloc(i32 %sum_bytes_3)
    %array_cast_i8_to_i32_3 = bitcast i8* %malloca_3 to i32*
    store i32 6, i32* %array_cast_i8_to_i32_3
    %array_tmp_begin_i32_3 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_3, i32 1
    %array_addr_3 = bitcast i32* %array_tmp_begin_i32_3 to %class.C**
    store %class.C** %array_addr_3, %class.C*** %geparrayaddr_1
    %add_one_ptr = add i32 %load_tmp_ptr_cnt_1, 1
    store i32 %add_one_ptr, i32* %arrayptrcnt_1
    br label %new_condition1

new_end1:                                                    ; preds = new_condition1 
    store %class.C*** %array_addr_2, %class.C**** %geparrayaddr_0
    %add_one_ptr_0 = add i32 %load_tmp_ptr_cnt_0, 1
    store i32 %add_one_ptr_0, i32* %arrayptrcnt_0
    br label %new_condition0

single_then_basicblock:                                      ; preds = new_end 
    %const_string_pointer = getelementptr inbounds [6 x i8], [6 x i8]* @const_string0, i32 0, i32 0
    call void @println(i8* %const_string_pointer)
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock new_end 
    br label %return_block0

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    ret void
}
define dso_local void @B.B(%class.B* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.B*
    store %class.B* %this, %class.B** %this_addr_0
    %this_reg = load %class.B*, %class.B** %this_addr_0
    %B.idx_gep_in_id = getelementptr inbounds %class.B, %class.B* %this_reg, i32 0, i32 0
    %B.idx_load_reg = load i32, i32* %B.idx_gep_in_id
    %countB = load i32, i32* @countB
    %add = add i32 %countB, 1
    store i32 %add, i32* @countB
    store i32 %countB, i32* %B.idx_gep_in_id
    %this_reg_0 = load %class.B*, %class.B** %this_addr_0
    %B.c_gep_in_id = getelementptr inbounds %class.B, %class.B* %this_reg_0, i32 0, i32 1
    %B.c_load_reg = load %class.C*, %class.C** %B.c_gep_in_id
    %class_malloc = call i8* @_f_malloc(i32 28)
    %class_ptr = bitcast i8* %class_malloc to %class.A*
    call void @A.A(%class.A* %class_ptr)
    %call_A_getc0 = call %class.C** @A.getc0(%class.A* %class_ptr)
    %getelementptr_reg = getelementptr inbounds %class.C*, %class.C** %call_A_getc0, i32 0
    %load_result = load %class.C*, %class.C** %getelementptr_reg
    %call_C_Me = call %class.C* @C.Me(%class.C* %load_result)
    %call_C_Me_0 = call %class.C* @C.Me(%class.C* %call_C_Me)
    store %class.C* %call_C_Me_0, %class.C** %B.c_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local void @count() {
entrance_block0:                                             
    %temp_addr = alloca i8*
    %b_addr = alloca %class.B*
    %countA = load i32, i32* @countA
    store i32 0, i32* @countA
    %countB = load i32, i32* @countB
    store i32 0, i32* @countB
    %countC = load i32, i32* @countC
    store i32 0, i32* @countC
    %class_malloc = call i8* @_f_malloc(i32 12)
    %class_ptr = bitcast i8* %class_malloc to %class.B*
    call void @B.B(%class.B* %class_ptr)
    store %class.B* %class_ptr, %class.B** %b_addr
    %countA_0 = load i32, i32* @countA
    %call_toString = call i8* @toString(i32 %countA_0)
    %const_string_pointer = getelementptr inbounds [2 x i8], [2 x i8]* @const_string1, i32 0, i32 0
    %string_add = call i8* @_str_concatenate(i8* %call_toString, i8* %const_string_pointer)
    %countB_0 = load i32, i32* @countB
    %call_toString_0 = call i8* @toString(i32 %countB_0)
    %string_add_0 = call i8* @_str_concatenate(i8* %string_add, i8* %call_toString_0)
    %const_string_pointer_0 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string1, i32 0, i32 0
    %string_add_1 = call i8* @_str_concatenate(i8* %string_add_0, i8* %const_string_pointer_0)
    %countC_0 = load i32, i32* @countC
    %call_toString_1 = call i8* @toString(i32 %countC_0)
    %string_add_2 = call i8* @_str_concatenate(i8* %string_add_1, i8* %call_toString_1)
    call void @println(i8* %string_add_2)
    %countA_1 = load i32, i32* @countA
    store i32 1, i32* @countA
    %countB_1 = load i32, i32* @countB
    store i32 1, i32* @countB
    %countC_1 = load i32, i32* @countC
    store i32 1, i32* @countC
    %b = load %class.B*, %class.B** %b_addr
    %class_malloc_0 = call i8* @_f_malloc(i32 12)
    %class_ptr_0 = bitcast i8* %class_malloc_0 to %class.B*
    call void @B.B(%class.B* %class_ptr_0)
    store %class.B* %class_ptr_0, %class.B** %b_addr
    %countA_2 = load i32, i32* @countA
    %sub = sub i32 %countA_2, 1
    %call_toString_2 = call i8* @toString(i32 %sub)
    %const_string_pointer_1 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string1, i32 0, i32 0
    %string_add_3 = call i8* @_str_concatenate(i8* %call_toString_2, i8* %const_string_pointer_1)
    %countB_2 = load i32, i32* @countB
    %sub_0 = sub i32 %countB_2, 1
    %call_toString_3 = call i8* @toString(i32 %sub_0)
    %string_add_4 = call i8* @_str_concatenate(i8* %string_add_3, i8* %call_toString_3)
    %const_string_pointer_2 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string1, i32 0, i32 0
    %string_add_5 = call i8* @_str_concatenate(i8* %string_add_4, i8* %const_string_pointer_2)
    %countC_2 = load i32, i32* @countC
    %sub_1 = sub i32 %countC_2, 1
    %call_toString_4 = call i8* @toString(i32 %sub_1)
    %string_add_6 = call i8* @_str_concatenate(i8* %string_add_5, i8* %call_toString_4)
    call void @print(i8* %string_add_6)
    %const_string_pointer_3 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string2, i32 0, i32 0
    call void @print(i8* %const_string_pointer_3)
    %something = load %class.C*, %class.C** @something
    %call_C_Me = call %class.C* @C.Me(%class.C* %something)
    %class_mem_gep_reg = getelementptr inbounds %class.C, %class.C* %call_C_Me, i32 0, i32 1
    %load_member = load i8*, i8** %class_mem_gep_reg
    %something_0 = load %class.C*, %class.C** @something
    %class_mem_gep_reg_0 = getelementptr inbounds %class.C, %class.C* %something_0, i32 0, i32 1
    %load_member_0 = load i8*, i8** %class_mem_gep_reg_0
    %call_string_length = call i32 @_str_length(i8* %load_member_0)
    %sub_2 = sub i32 %call_string_length, 1
    %call_string_substring = call i8* @_str_substring(i8* %load_member, i32 1, i32 %sub_2)
    %call_string_parseInt = call i32 @_str_parseInt(i8* %call_string_substring)
    %call_toString_5 = call i8* @toString(i32 %call_string_parseInt)
    call void @println(i8* %call_toString_5)
    %something_1 = load %class.C*, %class.C** @something
    %class_mem_gep_reg_1 = getelementptr inbounds %class.C, %class.C* %something_1, i32 0, i32 1
    %load_member_1 = load i8*, i8** %class_mem_gep_reg_1
    %and = and i32 42, 21
    %call_string_ord = call i32 @_str_ord(i8* %load_member_1, i32 %and)
    %call_toString_6 = call i8* @toString(i32 %call_string_ord)
    store i8* %call_toString_6, i8** %temp_addr
    %temp = load i8*, i8** %temp_addr
    %something_2 = load %class.C*, %class.C** @something
    %class_mem_gep_reg_2 = getelementptr inbounds %class.C, %class.C* %something_2, i32 0, i32 1
    %load_member_2 = load i8*, i8** %class_mem_gep_reg_2
    %cmp_result_str_lt = call i1 @_str_lt(i8* %temp, i8* %load_member_2)
    br i1 %cmp_result_str_lt, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = entrance_block0 
    %something_3 = load %class.C*, %class.C** @something
    %class_mem_gep_reg_3 = getelementptr inbounds %class.C, %class.C* %something_3, i32 0, i32 1
    %load_member_3 = load i8*, i8** %class_mem_gep_reg_3
    %const_string_pointer_4 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string3, i32 0, i32 0
    %string_add_7 = call i8* @_str_concatenate(i8* %load_member_3, i8* %const_string_pointer_4)
    %temp_0 = load i8*, i8** %temp_addr
    %string_add_8 = call i8* @_str_concatenate(i8* %string_add_7, i8* %temp_0)
    call void @println(i8* %string_add_8)
    br label %if_end_basicblock

else_basicblock:                                             ; preds = entrance_block0 
    %something_4 = load %class.C*, %class.C** @something
    %class_mem_gep_reg_4 = getelementptr inbounds %class.C, %class.C* %something_4, i32 0, i32 1
    %load_member_4 = load i8*, i8** %class_mem_gep_reg_4
    %const_string_pointer_5 = getelementptr inbounds [3 x i8], [3 x i8]* @const_string4, i32 0, i32 0
    %string_add_9 = call i8* @_str_concatenate(i8* %load_member_4, i8* %const_string_pointer_5)
    %temp_1 = load i8*, i8** %temp_addr
    %string_add_10 = call i8* @_str_concatenate(i8* %string_add_9, i8* %temp_1)
    call void @println(i8* %string_add_10)
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %return_block0

return_block0:                                               ; preds = if_end_basicblock 
    ret void
}
define dso_local %class.C** @A.getc0(%class.A* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.A*
    %return_register_infunction_addr = alloca %class.C**
    store %class.A* %this, %class.A** %this_addr_0
    %this_reg = load %class.A*, %class.A** %this_addr_0
    %A.c_gep_in_id = getelementptr inbounds %class.A, %class.A* %this_reg, i32 0, i32 2
    %A.c_load_reg = load %class.C***, %class.C**** %A.c_gep_in_id
    %getelementptr_reg = getelementptr inbounds %class.C**, %class.C*** %A.c_load_reg, i32 0
    %load_result = load %class.C**, %class.C*** %getelementptr_reg
    store %class.C** %load_result, %class.C*** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load %class.C**, %class.C*** %return_register_infunction_addr
    ret %class.C** %returnval
}
define dso_local void @C.C(%class.C* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.C*
    store %class.C* %this, %class.C** %this_addr_0
    %thisexpr_reg = load %class.C*, %class.C** %this_addr_0
    %class_mem_gep_reg = getelementptr inbounds %class.C, %class.C* %thisexpr_reg, i32 0, i32 0
    %load_member = load i32, i32* %class_mem_gep_reg
    %countC = load i32, i32* @countC
    %add = add i32 %countC, 1
    store i32 %add, i32* @countC
    store i32 %countC, i32* %class_mem_gep_reg
    %this_reg = load %class.C*, %class.C** %this_addr_0
    %C.str_gep_in_id = getelementptr inbounds %class.C, %class.C* %this_reg, i32 0, i32 1
    %C.str_load_reg = load i8*, i8** %C.str_gep_in_id
    %this_reg_0 = load %class.C*, %class.C** %this_addr_0
    %C.idx_gep_in_id = getelementptr inbounds %class.C, %class.C* %this_reg_0, i32 0, i32 0
    %C.idx_load_reg = load i32, i32* %C.idx_gep_in_id
    %call_toString = call i8* @toString(i32 %C.idx_load_reg)
    store i8* %call_toString, i8** %C.str_gep_in_id
    %something = load %class.C*, %class.C** @something
    %Implicit_call_inclass = load %class.C*, %class.C** %this_addr_0
    %call_Me = call %class.C* @C.Me(%class.C* %Implicit_call_inclass)
    store %class.C* %call_Me, %class.C** @something
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %i_addr_1 = alloca i32
    %i_addr_0 = alloca i32
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_body

for_step:                                                    ; preds = for_body if_withoutelse_end_basicblock 
    %i_4 = load i32, i32* %i_addr
    %add = add i32 %i_4, 1
    store i32 %add, i32* %i_addr
    br label %for_body

for_body:                                                    ; preds = for_step entrance_block0 
    %i_0 = load i32, i32* %i_addr
    %xor = xor i32 %i_0, 2
    %eq = icmp eq i32 %xor, 16
    %NOT = xor i1 false, true
    %eq_0 = icmp eq i1 %eq, %NOT
    br i1 %eq_0, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge:                                               ; preds = single_then_basicblock 
    br label %while_condition

single_then_basicblock:                                      ; preds = for_body 
    %i_1 = load i32, i32* %i_addr
    %call_toString = call i8* @toString(i32 %i_1)
    call void @println(i8* %call_toString)
    store i32 0, i32* %i_addr_0
    %i_2 = load i32, i32* %i_addr_0
    %call_toString_0 = call i8* @toString(i32 %i_2)
    call void @println(i8* %call_toString_0)
    store i32 1, i32* %i_addr_1
    %i_3 = load i32, i32* %i_addr_1
    %call_toString_1 = call i8* @toString(i32 %i_3)
    call void @println(i8* %call_toString_1)
    br label %for_end_merge

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body 
    br label %for_step

while_condition:                                             ; preds = for_end_merge while_body 
    %i_5 = load i32, i32* %i_addr
    %sub = sub i32 %i_5, 1
    store i32 %sub, i32* %i_addr
    %ne = icmp ne i32 %i_5, 0
    br i1 %ne, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %i_6 = load i32, i32* %i_addr
    %call_toString_2 = call i8* @toString(i32 %i_6)
    %const_string_pointer = getelementptr inbounds [2 x i8], [2 x i8]* @const_string5, i32 0, i32 0
    %string_add = call i8* @_str_concatenate(i8* %call_toString_2, i8* %const_string_pointer)
    call void @print(i8* %string_add)
    br label %while_condition

while_end_merge:                                             ; preds = for_end_merge while_condition 
    %const_string_pointer_0 = getelementptr inbounds [1 x i8], [1 x i8]* @const_string6, i32 0, i32 0
    call void @println(i8* %const_string_pointer_0)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local %class.C* @C.Me(%class.C* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.C*
    %return_register_infunction_addr = alloca %class.C*
    store %class.C* %this, %class.C** %this_addr_0
    %thisexpr_reg = load %class.C*, %class.C** %this_addr_0
    store %class.C* %thisexpr_reg, %class.C** %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load %class.C*, %class.C** %return_register_infunction_addr
    ret %class.C* %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
