; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.mm = type { i32, i32, i32 }


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
    %jjj_addr = alloca %class.mm*
    %return_register_infunction_addr = alloca i32
    %class_malloc = call i8* @_f_malloc(i32 12)
    %class_ptr = bitcast i8* %class_malloc to %class.mm*
    store %class.mm* %class_ptr, %class.mm** %jjj_addr
    %jjj = load %class.mm*, %class.mm** %jjj_addr
    %class_mem_gep_reg = getelementptr inbounds %class.mm, %class.mm* %jjj, i32 0, i32 2
    %load_member = load i32, i32* %class_mem_gep_reg
    store i32 2, i32* %class_mem_gep_reg
    %jjj_0 = load %class.mm*, %class.mm** %jjj_addr
    %class_mem_gep_reg_0 = getelementptr inbounds %class.mm, %class.mm* %jjj_0, i32 0, i32 2
    %load_member_0 = load i32, i32* %class_mem_gep_reg_0
    call void @printlnInt(i32 %load_member_0)
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
