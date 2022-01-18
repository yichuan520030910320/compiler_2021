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

define dso_local i32 @qpow(i32 %a_para,i32 %p_para,i32 %mod_para) {
entrance_block0:                                             
    %y_addr = alloca i32
    %t_addr = alloca i32
    %mod_addr = alloca i32
    %p_addr = alloca i32
    %a_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %a_para, i32* %a_addr
    store i32 %p_para, i32* %p_addr
    store i32 %mod_para, i32* %mod_addr
    store i32 1, i32* %t_addr
    %a = load i32, i32* %a_addr
    store i32 %a, i32* %y_addr
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body if_withoutelse_end_basicblock 
    %p = load i32, i32* %p_addr
    %sgt = icmp sgt i32 %p, 0
    br i1 %sgt, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %p_0 = load i32, i32* %p_addr
    %and = and i32 %p_0, 1
    %eq = icmp eq i32 %and, 1
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

while_end_merge:                                             ; preds = entrance_block0 while_condition 
    %t_1 = load i32, i32* %t_addr
    store i32 %t_1, i32* %return_register_infunction_addr
    br label %return_block0

single_then_basicblock:                                      ; preds = while_body 
    %t = load i32, i32* %t_addr
    %t_0 = load i32, i32* %t_addr
    %y = load i32, i32* %y_addr
    %mul = mul i32 %t_0, %y
    %mod = load i32, i32* %mod_addr
    %srem = srem i32 %mul, %mod
    store i32 %srem, i32* %t_addr
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock while_body 
    %y_0 = load i32, i32* %y_addr
    %y_1 = load i32, i32* %y_addr
    %y_2 = load i32, i32* %y_addr
    %mul_0 = mul i32 %y_1, %y_2
    %mod_0 = load i32, i32* %mod_addr
    %srem_0 = srem i32 %mul_0, %mod_0
    store i32 %srem_0, i32* %y_addr
    %p_1 = load i32, i32* %p_addr
    %p_2 = load i32, i32* %p_addr
    %sdiv = sdiv i32 %p_2, 2
    store i32 %sdiv, i32* %p_addr
    br label %while_condition

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %return_register_infunction_addr = alloca i32
    %call_qpow = call i32 @qpow(i32 2, i32 10, i32 10000)
    %call_toString = call i8* @toString(i32 %call_qpow)
    call void @println(i8* %call_toString)
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
