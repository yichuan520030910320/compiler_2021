; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a2b = dso_local global i8* null
@a2q = dso_local global i8* null
@co = dso_local global i8* null

@const_string2 = private unnamed_addr constant [2 x i8] c"\5C\00", align 1
@const_string0 = private unnamed_addr constant [2 x i8] c";\00", align 1
@const_string3 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@const_string1 = private unnamed_addr constant [2 x i8] c"\22\00", align 1

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
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 0, i32* %i_addr
    %const_string_pointer = getelementptr inbounds [2 x i8], [2 x i8]* @const_string3, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    %a2q = load i8*, i8** @a2q
    call void @print(i8* %a2q)
    %const_string_pointer_0 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string3, i32 0, i32 0
    call void @print(i8* %const_string_pointer_0)
    %a2q_0 = load i8*, i8** @a2q
    call void @println(i8* %a2q_0)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    %const_string_pointer = getelementptr inbounds [2 x i8], [2 x i8]* @const_string0, i32 0, i32 0
    store i8* %const_string_pointer, i8** @co
    %const_string_pointer_0 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string1, i32 0, i32 0
    store i8* %const_string_pointer_0, i8** @a2q
    %const_string_pointer_1 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string2, i32 0, i32 0
    store i8* %const_string_pointer_1, i8** @a2b
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
