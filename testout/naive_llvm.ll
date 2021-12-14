; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\mytest2.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\mytest2.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"



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
    %call_tak = call i32 @tak(i32 18, i32 12, i32 6)
    call void @printInt(i32 %call_tak)
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
define dso_local i32 @tak(i32 %x_para,i32 %y_para,i32 %z_para) {
entrance_block0:                                             
    %z_addr = alloca i32
    %y_addr = alloca i32
    %x_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %x_para, i32* %x_addr
    store i32 %y_para, i32* %y_addr
    store i32 %z_para, i32* %z_addr
    %y = load i32, i32* %y_addr
    %x = load i32, i32* %x_addr
    %slt = icmp slt i32 %y, %x
    br i1 %slt, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = entrance_block0 
    %x_0 = load i32, i32* %x_addr
    %sub = sub i32 %x_0, 1
    %y_0 = load i32, i32* %y_addr
    %z = load i32, i32* %z_addr
    %call_tak = call i32 @tak(i32 %sub, i32 %y_0, i32 %z)
    %y_1 = load i32, i32* %y_addr
    %sub_0 = sub i32 %y_1, 1
    %z_0 = load i32, i32* %z_addr
    %x_1 = load i32, i32* %x_addr
    %call_tak_0 = call i32 @tak(i32 %sub_0, i32 %z_0, i32 %x_1)
    %z_1 = load i32, i32* %z_addr
    %sub_1 = sub i32 %z_1, 1
    %x_2 = load i32, i32* %x_addr
    %y_2 = load i32, i32* %y_addr
    %call_tak_1 = call i32 @tak(i32 %sub_1, i32 %x_2, i32 %y_2)
    %call_tak_2 = call i32 @tak(i32 %call_tak, i32 %call_tak_0, i32 %call_tak_1)
    %add = add i32 1, %call_tak_2
    store i32 %add, i32* %return_register_infunction_addr
    br label %return_block0

else_basicblock:                                             ; preds = entrance_block0 
    %z_2 = load i32, i32* %z_addr
    store i32 %z_2, i32* %return_register_infunction_addr
    br label %return_block0

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %return_block0

return_block0:                                               ; preds = then_basicblock else_basicblock if_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
