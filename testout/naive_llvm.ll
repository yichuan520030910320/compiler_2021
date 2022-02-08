; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.older = type { i32 }

@const_string0 = private unnamed_addr constant [9 x i8] c"eternal!\00", align 1

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
    call void @GLOBAL__sub_I_main_mx()
    %mrJiang_addr = alloca %class.older*
    store %class.older* null, %class.older** %mrJiang_addr
    %return_register_infunction_addr = alloca i32
    store i32 0, i32* %return_register_infunction_addr
    %class_malloc = call i8* @_f_malloc(i32 4)
    %class_ptr = bitcast i8* %class_malloc to %class.older*
    store %class.older* %class_ptr, %class.older** %mrJiang_addr
    %mrJiang = load %class.older*, %class.older** %mrJiang_addr
    call void @older.solveAge(%class.older* %mrJiang)
    %mrJiang_0 = load %class.older*, %class.older** %mrJiang_addr
    %class_mem_gep_reg = getelementptr inbounds %class.older, %class.older* %mrJiang_0, i32 0, i32 0
    %load_member = load i32, i32* %class_mem_gep_reg
    %sgt = icmp sgt i32 %load_member, 10000
    br i1 %sgt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %const_string_pointer = getelementptr inbounds [9 x i8], [9 x i8]* @const_string0, i32 0, i32 0
    call void @println(i8* %const_string_pointer)
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @older.solveAge(%class.older* %this) {
entrance_block0:                                             
    %k_addr = alloca i32
    store i32 0, i32* %k_addr
    %j_addr = alloca i32
    store i32 0, i32* %j_addr
    %i_addr = alloca i32
    store i32 0, i32* %i_addr
    %this_addr_0 = alloca %class.older*
    store %class.older* null, %class.older** %this_addr_0
    store %class.older* %this, %class.older** %this_addr_0
    %i = load i32, i32* %i_addr
    store i32 1, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %slt = icmp slt i32 %i_0, 100
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_10 = load i32, i32* %i_addr
    %add_17 = add i32 %i_10, 1
    store i32 %add_17, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %j = load i32, i32* %j_addr
    %i_1 = load i32, i32* %i_addr
    %add = add i32 %i_1, 1
    store i32 %add, i32* %j_addr
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %j_0 = load i32, i32* %j_addr
    %slt_0 = icmp slt i32 %j_0, 100
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 for_end_merge1 
    %j_10 = load i32, i32* %j_addr
    %add_16 = add i32 %j_10, 1
    store i32 %add_16, i32* %j_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %k = load i32, i32* %k_addr
    %j_1 = load i32, i32* %j_addr
    %add_0 = add i32 %j_1, 1
    store i32 %add_0, i32* %k_addr
    br label %for_condition1

for_end_merge0:                                              ; preds = for_condition0 
    br label %for_step

for_condition1:                                              ; preds = for_body0 for_step1 
    %k_0 = load i32, i32* %k_addr
    %slt_1 = icmp slt i32 %k_0, 100
    br i1 %slt_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 if_withoutelse_end_basicblock 
    %k_9 = load i32, i32* %k_addr
    %add_15 = add i32 %k_9, 1
    store i32 %add_15, i32* %k_addr
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %i_2 = load i32, i32* %i_addr
    %i_3 = load i32, i32* %i_addr
    %sub = sub i32 %i_2, %i_3
    %i_4 = load i32, i32* %i_addr
    %add_1 = add i32 %sub, %i_4
    %j_2 = load i32, i32* %j_addr
    %add_2 = add i32 %add_1, %j_2
    %j_3 = load i32, i32* %j_addr
    %sub_0 = sub i32 %add_2, %j_3
    %j_4 = load i32, i32* %j_addr
    %add_3 = add i32 %sub_0, %j_4
    %k_1 = load i32, i32* %k_addr
    %add_4 = add i32 %add_3, %k_1
    %k_2 = load i32, i32* %k_addr
    %sub_1 = sub i32 %add_4, %k_2
    %k_3 = load i32, i32* %k_addr
    %add_5 = add i32 %sub_1, %k_3
    %i_5 = load i32, i32* %i_addr
    %mul = mul i32 100, %i_5
    %j_5 = load i32, i32* %j_addr
    %mul_0 = mul i32 10, %j_5
    %add_6 = add i32 %mul, %mul_0
    %k_4 = load i32, i32* %k_addr
    %add_7 = add i32 %add_6, %k_4
    %mul_1 = mul i32 %add_5, %add_7
    %srem = srem i32 %mul_1, 1926
    %eq = icmp eq i32 %srem, 0
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge1:                                              ; preds = for_condition1 
    br label %for_step0

single_then_basicblock:                                      ; preds = for_body1 
    %this_reg = load %class.older*, %class.older** %this_addr_0
    %older.age_gep_in_id = getelementptr inbounds %class.older, %class.older* %this_reg, i32 0, i32 0
    %older.age_load_reg = load i32, i32* %older.age_gep_in_id
    %i_6 = load i32, i32* %i_addr
    %i_7 = load i32, i32* %i_addr
    %sub_2 = sub i32 %i_6, %i_7
    %i_8 = load i32, i32* %i_addr
    %add_8 = add i32 %sub_2, %i_8
    %j_6 = load i32, i32* %j_addr
    %add_9 = add i32 %add_8, %j_6
    %j_7 = load i32, i32* %j_addr
    %sub_3 = sub i32 %add_9, %j_7
    %j_8 = load i32, i32* %j_addr
    %add_10 = add i32 %sub_3, %j_8
    %k_5 = load i32, i32* %k_addr
    %add_11 = add i32 %add_10, %k_5
    %k_6 = load i32, i32* %k_addr
    %sub_4 = sub i32 %add_11, %k_6
    %k_7 = load i32, i32* %k_addr
    %add_12 = add i32 %sub_4, %k_7
    %i_9 = load i32, i32* %i_addr
    %mul_2 = mul i32 100, %i_9
    %j_9 = load i32, i32* %j_addr
    %mul_3 = mul i32 10, %j_9
    %add_13 = add i32 %mul_2, %mul_3
    %k_8 = load i32, i32* %k_addr
    %add_14 = add i32 %add_13, %k_8
    %mul_4 = mul i32 %add_12, %add_14
    store i32 %mul_4, i32* %older.age_gep_in_id
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body1 
    br label %for_step1

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
