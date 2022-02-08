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
    store %class.older null, %class.older* %mem2reg0
    store i32 0, i32 %mem2reg1
    %class_malloc = call i8* @_f_malloc(i32 4)
    %class_ptr = bitcast i8* %class_malloc to %class.older*
    store %class.older* %class_ptr, %class.older* %mem2reg0
    store %class.older* %mem2reg0, %class.older* %mem2reg2
    call void @older.solveAge(%class.older* mem2reg2)
    store %class.older* %mem2reg0, %class.older* %mem2reg3
    %class_mem_gep_reg = getelementptr inbounds %class.older, %class.older* %mem2reg3, i32 0, i32 0
    %load_member = load i32, i32* %class_mem_gep_reg
    %sgt = icmp sgt i32 %load_member, 10000
    br i1 %sgt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %const_string_pointer = getelementptr inbounds [9 x i8], [9 x i8]* @const_string0, i32 0, i32 0
    call void @println(i8* %const_string_pointer)
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    store i32 0, i32 %mem2reg1
    br label %return_block0

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    store i32 %mem2reg1, i32 %mem2reg4
    ret i32 %mem2reg4
}
define dso_local void @older.solveAge(%class.older* %this) {
entrance_block0:                                             
    store i32 0, i32 %mem2reg5
    store i32 0, i32 %mem2reg6
    store i32 0, i32 %mem2reg7
    store %class.older null, %class.older* %mem2reg8
    store %class.older* %this, %class.older* %mem2reg8
    store i32 %mem2reg7, i32 %mem2reg9
    store i32 1, i32 %mem2reg7
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    store i32 %mem2reg7, i32 %mem2reg10
    %slt = icmp slt i32 mem2reg10, 100
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    store i32 %mem2reg7, i32 %mem2reg11
    %add_17 = add i32 mem2reg11, 1
    store i32 %add_17, i32 %mem2reg7
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store i32 %mem2reg6, i32 %mem2reg12
    store i32 %mem2reg7, i32 %mem2reg13
    %add = add i32 mem2reg13, 1
    store i32 %add, i32 %mem2reg6
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    store i32 %mem2reg6, i32 %mem2reg14
    %slt_0 = icmp slt i32 mem2reg14, 100
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 for_end_merge1 
    store i32 %mem2reg6, i32 %mem2reg15
    %add_16 = add i32 mem2reg15, 1
    store i32 %add_16, i32 %mem2reg6
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    store i32 %mem2reg5, i32 %mem2reg16
    store i32 %mem2reg6, i32 %mem2reg17
    %add_0 = add i32 mem2reg17, 1
    store i32 %add_0, i32 %mem2reg5
    br label %for_condition1

for_end_merge0:                                              ; preds = for_condition0 
    br label %for_step

for_condition1:                                              ; preds = for_body0 for_step1 
    store i32 %mem2reg5, i32 %mem2reg18
    %slt_1 = icmp slt i32 mem2reg18, 100
    br i1 %slt_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 if_withoutelse_end_basicblock 
    store i32 %mem2reg5, i32 %mem2reg19
    %add_15 = add i32 mem2reg19, 1
    store i32 %add_15, i32 %mem2reg5
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    store i32 %mem2reg7, i32 %mem2reg20
    store i32 %mem2reg7, i32 %mem2reg21
    %sub = sub i32 mem2reg20, mem2reg21
    store i32 %mem2reg7, i32 %mem2reg22
    %add_1 = add i32 %sub, mem2reg22
    store i32 %mem2reg6, i32 %mem2reg23
    %add_2 = add i32 %add_1, mem2reg23
    store i32 %mem2reg6, i32 %mem2reg24
    %sub_0 = sub i32 %add_2, mem2reg24
    store i32 %mem2reg6, i32 %mem2reg25
    %add_3 = add i32 %sub_0, mem2reg25
    store i32 %mem2reg5, i32 %mem2reg26
    %add_4 = add i32 %add_3, mem2reg26
    store i32 %mem2reg5, i32 %mem2reg27
    %sub_1 = sub i32 %add_4, mem2reg27
    store i32 %mem2reg5, i32 %mem2reg28
    %add_5 = add i32 %sub_1, mem2reg28
    store i32 %mem2reg7, i32 %mem2reg29
    %mul = mul i32 100, mem2reg29
    store i32 %mem2reg6, i32 %mem2reg30
    %mul_0 = mul i32 10, mem2reg30
    %add_6 = add i32 %mul, %mul_0
    store i32 %mem2reg5, i32 %mem2reg31
    %add_7 = add i32 %add_6, mem2reg31
    %mul_1 = mul i32 %add_5, %add_7
    %srem = srem i32 %mul_1, 1926
    %eq = icmp eq i32 %srem, 0
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge1:                                              ; preds = for_condition1 
    br label %for_step0

single_then_basicblock:                                      ; preds = for_body1 
    store %class.older* %mem2reg8, %class.older* %mem2reg32
    %older.age_gep_in_id = getelementptr inbounds %class.older, %class.older* %mem2reg32, i32 0, i32 0
    %older.age_load_reg = load i32, i32* %older.age_gep_in_id
    store i32 %mem2reg7, i32 %mem2reg33
    store i32 %mem2reg7, i32 %mem2reg34
    %sub_2 = sub i32 mem2reg33, mem2reg34
    store i32 %mem2reg7, i32 %mem2reg35
    %add_8 = add i32 %sub_2, mem2reg35
    store i32 %mem2reg6, i32 %mem2reg36
    %add_9 = add i32 %add_8, mem2reg36
    store i32 %mem2reg6, i32 %mem2reg37
    %sub_3 = sub i32 %add_9, mem2reg37
    store i32 %mem2reg6, i32 %mem2reg38
    %add_10 = add i32 %sub_3, mem2reg38
    store i32 %mem2reg5, i32 %mem2reg39
    %add_11 = add i32 %add_10, mem2reg39
    store i32 %mem2reg5, i32 %mem2reg40
    %sub_4 = sub i32 %add_11, mem2reg40
    store i32 %mem2reg5, i32 %mem2reg41
    %add_12 = add i32 %sub_4, mem2reg41
    store i32 %mem2reg7, i32 %mem2reg42
    %mul_2 = mul i32 100, mem2reg42
    store i32 %mem2reg6, i32 %mem2reg43
    %mul_3 = mul i32 10, mem2reg43
    %add_13 = add i32 %mul_2, %mul_3
    store i32 %mem2reg5, i32 %mem2reg44
    %add_14 = add i32 %add_13, mem2reg44
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
