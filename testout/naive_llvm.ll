; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@s = dso_local global i8* null
@t = dso_local global i32 0
@i = dso_local global i32 0
@l = dso_local global i32 0


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
    %return_register_infunction_addr = alloca i32
    %t = load i32, i32* @t
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @t
    %i = load i32, i32* @i
    store i32 0, i32* @i
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* @i
    %t_0 = load i32, i32* @t
    %slt = icmp slt i32 %i_0, %t_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body if_end_basicblock 
    %i_1 = load i32, i32* @i
    %add = add i32 %i_1, 1
    store i32 %add, i32* @i
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %s = load i8*, i8** @s
    %call_getString = call i8* @getString()
    store i8* %call_getString, i8** @s
    %l = load i32, i32* @l
    %s_0 = load i8*, i8** @s
    %call_string_length = call i32 @_str_length(i8* %s_0)
    store i32 %call_string_length, i32* @l
    %l_0 = load i32, i32* @l
    %sgt = icmp sgt i32 %l_0, 10
    br i1 %sgt, label %then_basicblock, label %else_basicblock

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

then_basicblock:                                             ; preds = for_body 
    %s_1 = load i8*, i8** @s
    %call_string_substring = call i8* @_str_substring(i8* %s_1, i32 0, i32 1)
    call void @print(i8* %call_string_substring)
    %l_1 = load i32, i32* @l
    %sub = sub i32 %l_1, 2
    call void @printInt(i32 %sub)
    %s_2 = load i8*, i8** @s
    %l_2 = load i32, i32* @l
    %sub_0 = sub i32 %l_2, 1
    %l_3 = load i32, i32* @l
    %call_string_substring_0 = call i8* @_str_substring(i8* %s_2, i32 %sub_0, i32 %l_3)
    call void @println(i8* %call_string_substring_0)
    br label %if_end_basicblock

else_basicblock:                                             ; preds = for_body 
    %s_3 = load i8*, i8** @s
    call void @println(i8* %s_3)
    br label %if_end_basicblock

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %for_step

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
