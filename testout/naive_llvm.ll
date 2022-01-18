; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.interesting = type { i8*, i32 }
%class.naive = type { %class.interesting*** }

@const_string0 = private unnamed_addr constant [15 x i8] c"news.learnmore\00", align 1
@const_string1 = private unnamed_addr constant [4 x i8] c"+1s\00", align 1

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

define dso_local void @naive.naive(%class.naive* %this) {
entrance_block0:                                             
    %i_addr = alloca i32
    %this_addr = alloca %class.naive*
    store %class.naive* %this, %class.naive** %this_addr
    %this_reg = load %class.naive*, %class.naive** %this_addr
    %naive.HongKong_gep_in_id = getelementptr inbounds %class.naive, %class.naive* %this_reg, i32 0, i32 0
    %naive.HongKong_load_reg = load %class.interesting***, %class.interesting**** %naive.HongKong_gep_in_id
    %mul_bytes = mul i32 100, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 100, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to %class.interesting***
    store %class.interesting*** %array_addr, %class.interesting**** %naive.HongKong_gep_in_id
    %HongKong = load %class.interesting***, %class.interesting**** %naive.HongKong_gep_in_id
    %getelementptr_reg = getelementptr inbounds %class.interesting**, %class.interesting*** %HongKong, i32 1
    %load_result = load %class.interesting**, %class.interesting*** %getelementptr_reg
    store %class.interesting** null, %class.interesting*** %getelementptr_reg
    store i32 0, i32* %i_addr
    %i = load i32, i32* %i_addr
    store i32 1, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %slt = icmp slt i32 %i_0, 99
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* %i_addr
    %add = add i32 %i_2, 1
    store i32 %add, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %HongKong_0 = load %class.interesting***, %class.interesting**** %naive.HongKong_gep_in_id
    %i_1 = load i32, i32* %i_addr
    %getelementptr_reg_0 = getelementptr inbounds %class.interesting**, %class.interesting*** %HongKong_0, i32 %i_1
    %load_result_0 = load %class.interesting**, %class.interesting*** %getelementptr_reg_0
    %mul_bytes_0 = mul i32 233, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 233, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to %class.interesting**
    store %class.interesting** %array_addr_0, %class.interesting*** %getelementptr_reg_0
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %HongKong_1 = load %class.interesting***, %class.interesting**** %naive.HongKong_gep_in_id
    %getelementptr_reg_1 = getelementptr inbounds %class.interesting**, %class.interesting*** %HongKong_1, i32 99
    %load_result_1 = load %class.interesting**, %class.interesting*** %getelementptr_reg_1
    %mul_bytes_1 = mul i32 1, 4
    %sum_bytes_1 = add i32 %mul_bytes_1, 4
    %malloca_1 = call i8* @_f_malloc(i32 %sum_bytes_1)
    %array_cast_i8_to_i32_1 = bitcast i8* %malloca_1 to i32*
    store i32 1, i32* %array_cast_i8_to_i32_1
    %array_tmp_begin_i32_1 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_1, i32 1
    %array_addr_1 = bitcast i32* %array_tmp_begin_i32_1 to %class.interesting**
    store %class.interesting** %array_addr_1, %class.interesting*** %getelementptr_reg_1
    br label %return_block0

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local void @interesting.interesting(%class.interesting* %this) {
entrance_block0:                                             
    %this_addr = alloca %class.interesting*
    store %class.interesting* %this, %class.interesting** %this_addr
    %this_reg = load %class.interesting*, %class.interesting** %this_addr
    %interesting.second_gep_in_id = getelementptr inbounds %class.interesting, %class.interesting* %this_reg, i32 0, i32 1
    %interesting.second_load_reg = load i32, i32* %interesting.second_gep_in_id
    store i32 0, i32* %interesting.second_gep_in_id
    %this_reg_0 = load %class.interesting*, %class.interesting** %this_addr
    %interesting.learnmore_gep_in_id = getelementptr inbounds %class.interesting, %class.interesting* %this_reg_0, i32 0, i32 0
    %interesting.learnmore_load_reg = load i8*, i8** %interesting.learnmore_gep_in_id
    %const_string_pointer = getelementptr inbounds [4 x i8], [4 x i8]* @const_string1, i32 0, i32 0
    store i8* %const_string_pointer, i8** %interesting.learnmore_gep_in_id
    %second = load i32, i32* %interesting.second_gep_in_id
    %learnmore = load i8*, i8** %interesting.learnmore_gep_in_id
    %call_string_length = call i32 @_str_length(i8* %learnmore)
    %second_0 = load i32, i32* %interesting.second_gep_in_id
    %add = add i32 %call_string_length, %second_0
    store i32 %add, i32* %interesting.second_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %Beijing_addr = alloca %class.interesting***
    %current_array_ptr_addr = alloca %class.interesting***
    %Shanghai_addr = alloca %class.naive**
    %return_register_infunction_addr = alloca i32
    %mul_bytes = mul i32 233, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 233, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to %class.naive**
    store %class.naive** %array_addr, %class.naive*** %Shanghai_addr
    %mul_bytes_0 = mul i32 12, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 12, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to %class.interesting***
    %array_tail_addr = getelementptr inbounds %class.interesting**, %class.interesting*** %array_addr_0, i32 12
    store %class.interesting*** %array_addr_0, %class.interesting**** %current_array_ptr_addr
    br label %new_condition

new_condition:                                               ; preds = new_loop_body entrance_block0 
    %load_tmp_current_pointer = load %class.interesting***, %class.interesting**** %current_array_ptr_addr
    %addr_cmp_result = icmp slt %class.interesting*** %load_tmp_current_pointer, %array_tail_addr
    br i1 %addr_cmp_result, label %new_loop_body, label %new_end

new_loop_body:                                               ; preds = new_condition 
    %mul_bytes_1 = mul i32 34, 4
    %sum_bytes_1 = add i32 %mul_bytes_1, 4
    %malloca_1 = call i8* @_f_malloc(i32 %sum_bytes_1)
    %array_cast_i8_to_i32_1 = bitcast i8* %malloca_1 to i32*
    store i32 34, i32* %array_cast_i8_to_i32_1
    %array_tmp_begin_i32_1 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_1, i32 1
    %array_addr_1 = bitcast i32* %array_tmp_begin_i32_1 to %class.interesting**
    store %class.interesting** %array_addr_1, %class.interesting*** %load_tmp_current_pointer
    %nxt_pointer = getelementptr inbounds %class.interesting**, %class.interesting*** %load_tmp_current_pointer, i32 1
    store %class.interesting*** %nxt_pointer, %class.interesting**** %current_array_ptr_addr
    br label %new_condition

new_end:                                                     ; preds = new_condition 
    store %class.interesting*** %array_addr_0, %class.interesting**** %Beijing_addr
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = new_end 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @naive.Journalist(%class.naive* %this,%class.interesting* %news_para) {
entrance_block0:                                             
    %this_addr = alloca %class.naive*
    %news_addr = alloca %class.interesting*
    %return_register_infunction_addr = alloca i32
    store %class.interesting* %news_para, %class.interesting** %news_addr
    store %class.naive* %this, %class.naive** %this_addr
    %news = load %class.interesting*, %class.interesting** %news_addr
    %class_mem_gep_reg = getelementptr inbounds %class.interesting, %class.interesting* %news, i32 0, i32 0
    %load_member = load i8*, i8** %class_mem_gep_reg
    call void @println(i8* %load_member)
    %const_string_pointer = getelementptr inbounds [15 x i8], [15 x i8]* @const_string0, i32 0, i32 0
    call void @println(i8* %const_string_pointer)
    store i32 1, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
