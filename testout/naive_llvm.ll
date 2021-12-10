; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@const_string0 = private unnamed_addr constant [17 x i8] c"hello yichuan :)\00", align 1

declare i32 @getInt()
declare void @print(i8* %str_0)
declare void @println(i8* %str_0)
declare void @printInt(i32 %n_0)
declare void @printlnInt(i32 %n_0)
declare i8* @toString(i32 %i_0)
declare i8* @getString()

define dso_local i32 @main() {
entrance_block0:
    %return_register_infunction = alloca i32
    %const_string_pointer = getelementptr inbounds [17 x i8], [17 x i8]* @const_string0, i32 0, i32 0
    call void @println(i8* %const_string_pointer)
    store i32 0, i32* %return_register_infunction
    br label %return_block0

return_block0:
    %returnval = load i32, i32* %return_register_infunction
    ret i32 %returnval
}
