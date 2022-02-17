; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@r = dso_local global i32 0
@c = dso_local global i32 0
@i = dso_local global i32 0
@j = dso_local global i32 0
@n = dso_local global i32 0


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

define dso_local i32 @abs(i32 %c_para) {
entrance_block0:                                             
    %c_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %c_para, i32* %c_addr
    %c = load i32, i32* %c_addr
    %sgt = icmp sgt i32 %c, 0
    br i1 %sgt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

single_then_basicblock:                                      ; preds = entrance_block0 
    %c_0 = load i32, i32* %c_addr
    store i32 %c_0, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock entrance_block0 
    %c_1 = load i32, i32* %c_addr
    %SUB_single_front = mul i32 %c_1, -1
    store i32 %SUB_single_front, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = single_then_basicblock if_withoutelse_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %return_register_infunction_addr = alloca i32
    store i32 0, i32* @i
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i = load i32, i32* @i
    %slt = icmp slt i32 %i, 5
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_1 = load i32, i32* @i
    %add_0 = add i32 %i_1, 1
    store i32 %add_0, i32* @i
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store i32 0, i32* @j
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    %r = load i32, i32* @r
    %sub = sub i32 2, %r
    %call_abs = call i32 @abs(i32 %sub)
    %c = load i32, i32* @c
    %sub_0 = sub i32 2, %c
    %call_abs_0 = call i32 @abs(i32 %sub_0)
    %add_1 = add i32 %call_abs, %call_abs_0
    call void @printInt(i32 %add_1)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %j = load i32, i32* @j
    %slt_0 = icmp slt i32 %j, 5
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 if_withoutelse_end_basicblock 
    %j_1 = load i32, i32* @j
    %add = add i32 %j_1, 1
    store i32 %add, i32* @j
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @n
    %n = load i32, i32* @n
    %eq = icmp eq i32 %n, 1
    br i1 %eq, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge0:                                              ; preds = for_condition0 
    br label %for_step

single_then_basicblock:                                      ; preds = for_body0 
    %i_0 = load i32, i32* @i
    store i32 %i_0, i32* @r
    %j_0 = load i32, i32* @j
    store i32 %j_0, i32* @c
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body0 
    br label %for_step0

return_block0:                                               ; preds = for_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
