; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"

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
    call void @printInt(i32 1)
    store i32 0, i32* %return_register_infunction
    br label %return_block0

return_block0:
    %returnval = load i32, i32* %return_register_infunction
    ret i32 %returnval
}
