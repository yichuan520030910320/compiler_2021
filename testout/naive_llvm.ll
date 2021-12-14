; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32 0
@m = dso_local global i32 0
@n = dso_local global i32 0


declare i1 @_str_ne(i8* %lhs,i8* %rhs)
declare i1 @_str_le(i8* %lhs,i8* %rhs)
declare i8* @_str_concatenate(i8* %lhs,i8* %rhs)
declare i8* @getString()
declare i1 @_str_ge(i8* %lhs,i8* %rhs)
declare i1 @_str_lt(i8* %lhs,i8* %rhs)
declare i32 @getInt()
declare void @print(i8* %str_0)
declare void @println(i8* %str_0)
declare i32 @_str_ord(i8* %str,i32 %pos)
declare void @printInt(i32 %n_0)
declare void @printlnInt(i32 %n_0)
declare i8* @toString(i32 %i_0)
declare i1 @_str_eq(i8* %lhs,i8* %rhs)
declare i1 @_str_gt(i8* %lhs,i8* %rhs)

define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %return_register_infunction_addr = alloca i32
    %n = load i32, i32* @n
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @n
    %m = load i32, i32* @m
    %call_getInt_0 = call i32 @getInt()
    store i32 %call_getInt_0, i32* @m
    %a = load i32, i32* @a
    %call_getInt_1 = call i32 @getInt()
    store i32 %call_getInt_1, i32* @a
    %m_0 = load i32, i32* @m
    %a_0 = load i32, i32* @a
    %add = add i32 %m_0, %a_0
    %sub = sub i32 %add, 1
    %a_1 = load i32, i32* @a
    %sdiv = sdiv i32 %sub, %a_1
    %n_0 = load i32, i32* @n
    %a_2 = load i32, i32* @a
    %add_0 = add i32 %n_0, %a_2
    %sub_0 = sub i32 %add_0, 1
    %a_3 = load i32, i32* @a
    %sdiv_0 = sdiv i32 %sub_0, %a_3
    %mul = mul i32 %sdiv, %sdiv_0
    %call_toString = call i8* @toString(i32 %mul)
    call void @print(i8* %call_toString)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
