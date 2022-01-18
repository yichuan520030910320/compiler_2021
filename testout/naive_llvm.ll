; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"



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

define dso_local i32 @kk(i32 %a_para,i32 %a1_para,i32 %a2_para,i32 %a3_para,i32 %a4_para,i32 %a5_para,i32 %a6_para,i32 %a7_para,i32 %a8_para,i32 %a9_para,i32 %a10_para) {
entrance_block0:                                             
    %a10_addr = alloca i32
    %a9_addr = alloca i32
    %a8_addr = alloca i32
    %a7_addr = alloca i32
    %a6_addr = alloca i32
    %a5_addr = alloca i32
    %a4_addr = alloca i32
    %a3_addr = alloca i32
    %a2_addr = alloca i32
    %a1_addr = alloca i32
    %a_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %a_para, i32* %a_addr
    store i32 %a1_para, i32* %a1_addr
    store i32 %a2_para, i32* %a2_addr
    store i32 %a3_para, i32* %a3_addr
    store i32 %a4_para, i32* %a4_addr
    store i32 %a5_para, i32* %a5_addr
    store i32 %a6_para, i32* %a6_addr
    store i32 %a7_para, i32* %a7_addr
    store i32 %a8_para, i32* %a8_addr
    store i32 %a9_para, i32* %a9_addr
    store i32 %a10_para, i32* %a10_addr
    %a = load i32, i32* %a_addr
    %a1 = load i32, i32* %a1_addr
    %add = add i32 %a, %a1
    %a2 = load i32, i32* %a2_addr
    %add_0 = add i32 %add, %a2
    %a3 = load i32, i32* %a3_addr
    %add_1 = add i32 %add_0, %a3
    %a4 = load i32, i32* %a4_addr
    %add_2 = add i32 %add_1, %a4
    %a5 = load i32, i32* %a5_addr
    %add_3 = add i32 %add_2, %a5
    %a6 = load i32, i32* %a6_addr
    %add_4 = add i32 %add_3, %a6
    %a7 = load i32, i32* %a7_addr
    %add_5 = add i32 %add_4, %a7
    %a8 = load i32, i32* %a8_addr
    %add_6 = add i32 %add_5, %a8
    %a9 = load i32, i32* %a9_addr
    %add_7 = add i32 %add_6, %a9
    %a10 = load i32, i32* %a10_addr
    %add_8 = add i32 %add_7, %a10
    store i32 %add_8, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %return_register_infunction_addr = alloca i32
    %call_kk = call i32 @kk(i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1)
    call void @printlnInt(i32 %call_kk)
    store i32 0, i32* %return_register_infunction_addr
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
