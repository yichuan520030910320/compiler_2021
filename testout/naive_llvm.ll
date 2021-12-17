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

define dso_local i1 @f(i32 %a_para) {
entrance_block0:                                             
    %a_addr = alloca i32
    %return_register_infunction_addr = alloca i1
    store i32 %a_para, i32* %a_addr
    call void @printlnInt(i32 4)
    store i1 true, i1* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i1, i1* %return_register_infunction_addr
    ret i1 %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %AND_addr_1 = alloca i1
    %AND_addr_0 = alloca i1
    %AND_addr = alloca i1
    %return_register_infunction_addr = alloca i32
    store i1 true, i1* %AND_addr
    br i1 true, label %short_circuit_and_branch_AND, label %short_circuit_and_end_AND

short_circuit_and_end_AND:                                   ; preds = entrance_block0 short_circuit_and_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    store i1 %AND_short_circuit, i1* %AND_addr_0
    br i1 %AND_short_circuit, label %short_circuit_and_branch_AND0, label %short_circuit_and_end_AND0

short_circuit_and_branch_AND:                                ; preds = entrance_block0 
    store i1 true, i1* %AND_addr
    br label %short_circuit_and_end_AND

short_circuit_and_end_AND0:                                  ; preds = short_circuit_and_end_AND short_circuit_and_branch_AND0 
    %AND_short_circuit_0 = load i1, i1* %AND_addr_0
    store i1 %AND_short_circuit_0, i1* %AND_addr_1
    br i1 %AND_short_circuit_0, label %short_circuit_and_branch_AND1, label %short_circuit_and_end_AND1

short_circuit_and_branch_AND0:                               ; preds = short_circuit_and_end_AND 
    store i1 false, i1* %AND_addr_0
    br label %short_circuit_and_end_AND0

short_circuit_and_end_AND1:                                  ; preds = short_circuit_and_end_AND0 short_circuit_and_branch_AND1 
    %AND_short_circuit_1 = load i1, i1* %AND_addr_1
    br i1 %AND_short_circuit_1, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_and_branch_AND1:                               ; preds = short_circuit_and_end_AND0 
    %call_f = call i1 @f(i32 1)
    store i1 %call_f, i1* %AND_addr_1
    br label %short_circuit_and_end_AND1

single_then_basicblock:                                      ; preds = short_circuit_and_end_AND1 
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock short_circuit_and_end_AND1 
    call void @printInt(i32 7)
    br label %return_block0

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
