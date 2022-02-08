; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@kkk = dso_local global i32 0


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
    store i32 0, i32 %mem2reg0
    store i32 0, i32 %mem2reg1
    store i32 0, i32 %mem2reg2
    store i32 0, i32 %mem2reg3
    store i32 10, i32 %mem2reg3
    store i32 0, i32 %mem2reg2
    store i32 %mem2reg1, i32 %mem2reg5
    store i32 1, i32 %mem2reg1
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    store i32 %mem2reg1, i32 %mem2reg6
    store i32 %mem2reg3, i32 %mem2reg7
    %sle = icmp sle i32 mem2reg6, mem2reg7
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    store i32 %mem2reg1, i32 %mem2reg8
    %add_0 = add i32 mem2reg8, 1
    store i32 %add_0, i32 %mem2reg1
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store i32 %mem2reg2, i32 %mem2reg9
    store i32 %mem2reg2, i32 %mem2reg10
    store i32 %mem2reg1, i32 %mem2reg11
    %add = add i32 mem2reg10, mem2reg11
    store i32 %add, i32 %mem2reg2
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    store i32 %mem2reg0, i32 %mem2reg12
    store i32 1, i32 %mem2reg0
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    store i32 %mem2reg0, i32 %mem2reg13
    store i32 %mem2reg3, i32 %mem2reg14
    %sle_0 = icmp sle i32 mem2reg13, mem2reg14
    br i1 %sle_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    store i32 %mem2reg0, i32 %mem2reg15
    %add_3 = add i32 mem2reg15, 1
    store i32 %add_3, i32 %mem2reg0
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    store i32 %mem2reg2, i32 %mem2reg16
    store i32 %mem2reg2, i32 %mem2reg17
    %add_1 = add i32 mem2reg17, 10
    store i32 %mem2reg0, i32 %mem2reg18
    %add_2 = add i32 %add_1, mem2reg18
    store i32 %add_2, i32 %mem2reg2
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    store i32 %mem2reg2, i32 %mem2reg19
    call void @printlnInt(i32 %sum_3)
    store i32 %mem2reg2, i32 %mem2reg20
    store i32 %mem2reg20, i32 %mem2reg4
    br label %return_block0

return_block0:                                               ; preds = for_end_merge0 
    store i32 %mem2reg4, i32 %mem2reg21
    ret i32 %mem2reg21
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
