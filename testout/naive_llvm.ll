; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@w = dso_local global i32 0

@const_string0 = private unnamed_addr constant [4 x i8] c"YES\00", align 1
@const_string1 = private unnamed_addr constant [3 x i8] c"NO\00", align 1

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
    %AND_addr = alloca i1
    %return_register_infunction_addr = alloca i32
    %w = load i32, i32* @w
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @w
    %w_0 = load i32, i32* @w
    %srem = srem i32 %w_0, 2
    %eq = icmp eq i32 %srem, 0
    store i1 %eq, i1* %AND_addr
    br i1 %eq, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

short_circuit_AND_end_AND:                                   ; preds = entrance_block0 short_circuit_AND_branch_AND 
    %AND_short_circuit = load i1, i1* %AND_addr
    br i1 %AND_short_circuit, label %then_basicblock, label %else_basicblock

short_circuit_AND_branch_AND:                                ; preds = entrance_block0 
    %w_1 = load i32, i32* @w
    %sgt = icmp sgt i32 %w_1, 2
    store i1 %sgt, i1* %AND_addr
    br label %short_circuit_AND_end_AND

then_basicblock:                                             ; preds = short_circuit_AND_end_AND 
    %const_string_pointer = getelementptr inbounds [4 x i8], [4 x i8]* @const_string0, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    br label %if_end_basicblock

else_basicblock:                                             ; preds = short_circuit_AND_end_AND 
    %const_string_pointer_0 = getelementptr inbounds [3 x i8], [3 x i8]* @const_string1, i32 0, i32 0
    call void @print(i8* %const_string_pointer_0)
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = if_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
