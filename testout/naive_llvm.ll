; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.TA = type { i8*, i32 }
@init_anger = dso_local global i32 0
@work_anger = dso_local global i32 0

@const_string6 = private unnamed_addr constant [5 x i8] c"Mars\00", align 1
@const_string2 = private unnamed_addr constant [23 x i8] c" wants to give up!!!!!\00", align 1
@const_string1 = private unnamed_addr constant [22 x i8] c" enjoys this work. XD\00", align 1
@const_string3 = private unnamed_addr constant [15 x i8] c"the leading TA\00", align 1
@const_string5 = private unnamed_addr constant [3 x i8] c"MR\00", align 1
@const_string0 = private unnamed_addr constant [3 x i8] c", \00", align 1
@const_string4 = private unnamed_addr constant [16 x i8] c"the striking TA\00", align 1

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

define dso_local void @work(i8* %st_para,%class.TA* %ta_para) {
entrance_block0:                                             
    %ta_addr = alloca %class.TA*
    %st_addr = alloca i8*
    store i8* %st_para, i8** %st_addr
    store %class.TA* %ta_para, %class.TA** %ta_addr
    %ta = load %class.TA*, %class.TA** %ta_addr
    %class_mem_gep_reg = getelementptr inbounds %class.TA, %class.TA* %ta, i32 0, i32 1
    %load_member = load i32, i32* %class_mem_gep_reg
    %sle = icmp sle i32 %load_member, 100
    br i1 %sle, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = entrance_block0 
    %st = load i8*, i8** %st_addr
    %const_string_pointer = getelementptr inbounds [3 x i8], [3 x i8]* @const_string0, i32 0, i32 0
    %string_add = call i8* @_str_concatenate(i8* %st, i8* %const_string_pointer)
    %ta_0 = load %class.TA*, %class.TA** %ta_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.TA, %class.TA* %ta_0, i32 0, i32 0
    %load_member_0 = load i8*, i8** %class_mem_gep_reg_0
    %string_add_0 = call i8* @_str_concatenate(i8* %string_add, i8* %load_member_0)
    %const_string_pointer_0 = getelementptr inbounds [22 x i8], [22 x i8]* @const_string1, i32 0, i32 0
    %string_add_1 = call i8* @_str_concatenate(i8* %string_add_0, i8* %const_string_pointer_0)
    call void @println(i8* %string_add_1)
    br label %if_end_basicblock

else_basicblock:                                             ; preds = entrance_block0 
    %st_0 = load i8*, i8** %st_addr
    %const_string_pointer_1 = getelementptr inbounds [3 x i8], [3 x i8]* @const_string0, i32 0, i32 0
    %string_add_2 = call i8* @_str_concatenate(i8* %st_0, i8* %const_string_pointer_1)
    %ta_1 = load %class.TA*, %class.TA** %ta_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.TA, %class.TA* %ta_1, i32 0, i32 0
    %load_member_1 = load i8*, i8** %class_mem_gep_reg_1
    %string_add_3 = call i8* @_str_concatenate(i8* %string_add_2, i8* %load_member_1)
    %const_string_pointer_2 = getelementptr inbounds [23 x i8], [23 x i8]* @const_string2, i32 0, i32 0
    %string_add_4 = call i8* @_str_concatenate(i8* %string_add_3, i8* %const_string_pointer_2)
    call void @println(i8* %string_add_4)
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    %ta_2 = load %class.TA*, %class.TA** %ta_addr
    %class_mem_gep_reg_2 = getelementptr inbounds %class.TA, %class.TA* %ta_2, i32 0, i32 1
    %load_member_2 = load i32, i32* %class_mem_gep_reg_2
    %ta_3 = load %class.TA*, %class.TA** %ta_addr
    %class_mem_gep_reg_3 = getelementptr inbounds %class.TA, %class.TA* %ta_3, i32 0, i32 1
    %load_member_3 = load i32, i32* %class_mem_gep_reg_3
    %work_anger = load i32, i32* @work_anger
    %add = add i32 %load_member_3, %work_anger
    store i32 %add, i32* %class_mem_gep_reg_2
    br label %return_block0

return_block0:                                               ; preds = if_end_basicblock 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %mars_addr = alloca %class.TA*
    %mr_addr = alloca %class.TA*
    %return_register_infunction_addr = alloca i32
    %mr = load %class.TA*, %class.TA** %mr_addr
    %class_malloc = call i8* @_f_malloc(i32 12)
    %class_ptr = bitcast i8* %class_malloc to %class.TA*
    store %class.TA* %class_ptr, %class.TA** %mr_addr
    %mr_0 = load %class.TA*, %class.TA** %mr_addr
    %class_mem_gep_reg = getelementptr inbounds %class.TA, %class.TA* %mr_0, i32 0, i32 0
    %load_member = load i8*, i8** %class_mem_gep_reg
    %const_string_pointer = getelementptr inbounds [15 x i8], [15 x i8]* @const_string3, i32 0, i32 0
    store i8* %const_string_pointer, i8** %class_mem_gep_reg
    %mr_1 = load %class.TA*, %class.TA** %mr_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.TA, %class.TA* %mr_1, i32 0, i32 1
    %load_member_0 = load i32, i32* %class_mem_gep_reg_0
    store i32 0, i32* %class_mem_gep_reg_0
    %mars = load %class.TA*, %class.TA** %mars_addr
    %class_malloc_0 = call i8* @_f_malloc(i32 12)
    %class_ptr_0 = bitcast i8* %class_malloc_0 to %class.TA*
    store %class.TA* %class_ptr_0, %class.TA** %mars_addr
    %mars_0 = load %class.TA*, %class.TA** %mars_addr
    %class_mem_gep_reg_1 = getelementptr inbounds %class.TA, %class.TA* %mars_0, i32 0, i32 0
    %load_member_1 = load i8*, i8** %class_mem_gep_reg_1
    %const_string_pointer_0 = getelementptr inbounds [16 x i8], [16 x i8]* @const_string4, i32 0, i32 0
    store i8* %const_string_pointer_0, i8** %class_mem_gep_reg_1
    %mars_1 = load %class.TA*, %class.TA** %mars_addr
    %class_mem_gep_reg_2 = getelementptr inbounds %class.TA, %class.TA* %mars_1, i32 0, i32 1
    %load_member_2 = load i32, i32* %class_mem_gep_reg_2
    %init_anger = load i32, i32* @init_anger
    store i32 %init_anger, i32* %class_mem_gep_reg_2
    %const_string_pointer_1 = getelementptr inbounds [3 x i8], [3 x i8]* @const_string5, i32 0, i32 0
    %mr_2 = load %class.TA*, %class.TA** %mr_addr
    call void @work(i8* %const_string_pointer_1, %class.TA* %mr_2)
    %const_string_pointer_2 = getelementptr inbounds [5 x i8], [5 x i8]* @const_string6, i32 0, i32 0
    %mars_2 = load %class.TA*, %class.TA** %mars_addr
    call void @work(i8* %const_string_pointer_2, %class.TA* %mars_2)
    %const_string_pointer_3 = getelementptr inbounds [5 x i8], [5 x i8]* @const_string6, i32 0, i32 0
    %mars_3 = load %class.TA*, %class.TA** %mars_addr
    call void @work(i8* %const_string_pointer_3, %class.TA* %mars_3)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    store i32 100, i32* @init_anger
    store i32 10, i32* @work_anger
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
