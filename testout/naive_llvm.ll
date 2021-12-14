; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"



declare i32 @getInt()
declare void @print(i8* %str_0)
declare void @println(i8* %str_0)
declare void @printInt(i32 %n_0)
declare void @printlnInt(i32 %n_0)
declare i8* @toString(i32 %i_0)
declare i8* @getString()

define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %i_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 100, i32* %i_addr
    br label %while_condition

while_condition:                                             ; preds = entrance_block0 while_body 
    %i = load i32, i32* %i_addr
    %sgt = icmp sgt i32 %i, 0
    br i1 %sgt, label %while_body, label %while_end_merge

while_body:                                                  ; preds = while_condition 
    %i_0 = load i32, i32* %i_addr
    call void @printlnInt(i32 %i_0)
    %i_1 = load i32, i32* %i_addr
    %sub = sub i32 %i_1, 1
    store i32 %sub, i32* %i_addr
    br label %while_condition

while_end_merge:                                             ; preds = entrance_block0 while_condition 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = while_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
