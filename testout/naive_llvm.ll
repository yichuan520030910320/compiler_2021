; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@k = dso_local global i32 0
@m = dso_local global i32 0


declare i32 @getInt()
declare void @print(i8* %str_0)
declare void @println(i8* %str_0)
declare void @printInt(i32 %n_0)
declare void @printlnInt(i32 %n_0)
declare i8* @toString(i32 %i_0)
declare i8* @getString()

define dso_local void @calltest(i32 %i_para) {
entrance_block0:                                             
    %i_addr = alloca i32
    store i32 %i_para, i32* %i_addr
    %i = load i32, i32* %i_addr
    %add = add i32 %i, 1
    call void @calltest2(i32 %add)
    %i_0 = load i32, i32* %i_addr
    call void @printlnInt(i32 %i_0)
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local void @calltest2(i32 %l_para) {
entrance_block0:                                             
    %l_addr = alloca i32
    store i32 %l_para, i32* %l_addr
    %l = load i32, i32* %l_addr
    call void @printlnInt(i32 %l)
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %return_register_infunction_addr = alloca i32
    call void @printlnInt(i32 1)
    %k = load i32, i32* @k
    %m = load i32, i32* @m
    %add = add i32 %k, %m
    call void @calltest(i32 %add)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    store i32 9, i32* @k
    store i32 88, i32* @m
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
