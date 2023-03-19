; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.point = type { i32, i32, i32 }


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
    %d_addr = alloca %class.point*
    %c_addr = alloca %class.point*
    %b_addr = alloca %class.point*
    %a_addr = alloca %class.point*
    %return_register_infunction_addr = alloca i32
    %class_malloc = call i8* @_f_malloc(i32 12)
    %class_ptr = bitcast i8* %class_malloc to %class.point*
    call void @point.point(%class.point* %class_ptr)
    store %class.point* %class_ptr, %class.point** %a_addr
    %class_malloc_0 = call i8* @_f_malloc(i32 12)
    %class_ptr_0 = bitcast i8* %class_malloc_0 to %class.point*
    call void @point.point(%class.point* %class_ptr_0)
    store %class.point* %class_ptr_0, %class.point** %b_addr
    %class_malloc_1 = call i8* @_f_malloc(i32 12)
    %class_ptr_1 = bitcast i8* %class_malloc_1 to %class.point*
    call void @point.point(%class.point* %class_ptr_1)
    store %class.point* %class_ptr_1, %class.point** %c_addr
    %class_malloc_2 = call i8* @_f_malloc(i32 12)
    %class_ptr_2 = bitcast i8* %class_malloc_2 to %class.point*
    call void @point.point(%class.point* %class_ptr_2)
    store %class.point* %class_ptr_2, %class.point** %d_addr
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @point.point(%class.point* %this) {
entrance_block0:                                             
    %this_addr_0 = alloca %class.point*
    store %class.point* %this, %class.point** %this_addr_0
    %this_reg = load %class.point*, %class.point** %this_addr_0
    %point.x_gep_in_id = getelementptr inbounds %class.point, %class.point* %this_reg, i32 0, i32 0
    %point.x_load_reg = load i32, i32* %point.x_gep_in_id
    store i32 0, i32* %point.x_gep_in_id
    %this_reg_0 = load %class.point*, %class.point** %this_addr_0
    %point.y_gep_in_id = getelementptr inbounds %class.point, %class.point* %this_reg_0, i32 0, i32 1
    %point.y_load_reg = load i32, i32* %point.y_gep_in_id
    store i32 0, i32* %point.y_gep_in_id
    %this_reg_1 = load %class.point*, %class.point** %this_addr_0
    %point.z_gep_in_id = getelementptr inbounds %class.point, %class.point* %this_reg_1, i32 0, i32 2
    %point.z_load_reg = load i32, i32* %point.z_gep_in_id
    store i32 0, i32* %point.z_gep_in_id
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
