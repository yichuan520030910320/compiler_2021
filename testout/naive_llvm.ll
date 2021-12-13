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
    %b_addr = alloca i32
    %c_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 9, i32* %c_addr
    %c = load i32, i32* %c_addr
    %c_0 = load i32, i32* %c_addr
    %add = add i32 %c_0, 8
    store i32 %add, i32* %c_addr
    store i32 7, i32* %b_addr
    %b = load i32, i32* %b_addr
    call void @printlnInt(i32 %b)
    %c_1 = load i32, i32* %c_addr
    call void @printlnInt(i32 %c_1)
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
