; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32* null
@i = dso_local global i32 0
@n = dso_local global i32 0


declare i1 @_str_ne(i8* %lhs,i8* %rhs)
declare i1 @_str_le(i8* %lhs,i8* %rhs)
declare i8* @_str_substring(i8* %str,i32 %left,i32 %right)
declare i8* @_str_concatenate(i8* %lhs,i8* %rhs)
declare i8* @getString()
declare i1 @_str_ge(i8* %lhs,i8* %rhs)
declare i1 @_str_lt(i8* %lhs,i8* %rhs)
declare i32 @getInt()
declare i32 @_str_length(i32* %str)
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

define dso_local i32 @jud(i32 %x_para) {
entrance_block0:                                             
    %flag_addr = alloca i1
    %j_addr = alloca i32
    %i_addr = alloca i32
    %x_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %x_para, i32* %x_addr
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %n = load i32, i32* @n
    %x = load i32, i32* %x_addr
    %sdiv = sdiv i32 %n, %x
    %slt = icmp slt i32 %i_0, %sdiv
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body if_withoutelse_end_basicblock0 
    %i_3 = load i32, i32* %i_addr
    %add_3 = add i32 %i_3, 1
    store i32 %add_3, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store i1 false, i1* %flag_addr
    %j = load i32, i32* %j_addr
    store i32 0, i32* %j_addr
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %j_0 = load i32, i32* %j_addr
    %x_0 = load i32, i32* %x_addr
    %sub = sub i32 %x_0, 1
    %slt_0 = icmp slt i32 %j_0, %sub
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 if_withoutelse_end_basicblock 
    %j_3 = load i32, i32* %j_addr
    %add_2 = add i32 %j_3, 1
    store i32 %add_2, i32* %j_addr
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %a = load i32*, i32** @a
    %i_1 = load i32, i32* %i_addr
    %x_1 = load i32, i32* %x_addr
    %mul = mul i32 %i_1, %x_1
    %j_1 = load i32, i32* %j_addr
    %add = add i32 %mul, %j_1
    %getelementptr_reg = getelementptr inbounds i32, i32* %a, i32 %add
    %load_result = load i32, i32* %getelementptr_reg
    %a_0 = load i32*, i32** @a
    %i_2 = load i32, i32* %i_addr
    %x_2 = load i32, i32* %x_addr
    %mul_0 = mul i32 %i_2, %x_2
    %j_2 = load i32, i32* %j_addr
    %add_0 = add i32 %mul_0, %j_2
    %add_1 = add i32 %add_0, 1
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %a_0, i32 %add_1
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %sgt = icmp sgt i32 %load_result, %load_result_0
    br i1 %sgt, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge0:                                              ; preds = for_condition0 
    %flag_0 = load i1, i1* %flag_addr
    %NOT = xor i1 %flag_0, true
    br i1 %NOT, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

single_then_basicblock:                                      ; preds = for_body0 
    %flag = load i1, i1* %flag_addr
    store i1 true, i1* %flag_addr
    br label %if_withoutelse_end_basicblock

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body0 
    br label %for_step0

single_then_basicblock0:                                     ; preds = for_end_merge0 
    store i32 1, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 for_end_merge0 
    br label %for_step

return_block0:                                               ; preds = single_then_basicblock0 for_end_merge 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %return_register_infunction_addr = alloca i32
    %n = load i32, i32* @n
    %call_getInt = call i32 @getInt()
    store i32 %call_getInt, i32* @n
    %i = load i32, i32* @i
    store i32 0, i32* @i
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* @i
    %n_0 = load i32, i32* @n
    %slt = icmp slt i32 %i_0, %n_0
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_2 = load i32, i32* @i
    %add = add i32 %i_2, 1
    store i32 %add, i32* @i
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %a = load i32*, i32** @a
    %i_1 = load i32, i32* @i
    %getelementptr_reg = getelementptr inbounds i32, i32* %a, i32 %i_1
    %load_result = load i32, i32* %getelementptr_reg
    %call_getInt_0 = call i32 @getInt()
    store i32 %call_getInt_0, i32* %getelementptr_reg
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %i_3 = load i32, i32* @i
    %n_1 = load i32, i32* @n
    store i32 %n_1, i32* @i
    br label %for_condition0

for_condition0:                                              ; preds = for_end_merge for_step0 
    %i_4 = load i32, i32* @i
    %sgt = icmp sgt i32 %i_4, 0
    br i1 %sgt, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 if_withoutelse_end_basicblock 
    %i_7 = load i32, i32* @i
    %i_8 = load i32, i32* @i
    %sdiv = sdiv i32 %i_8, 2
    store i32 %sdiv, i32* @i
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %i_5 = load i32, i32* @i
    %call_jud = call i32 @jud(i32 %i_5)
    %sgt_0 = icmp sgt i32 %call_jud, 0
    br i1 %sgt_0, label %single_then_basicblock, label %if_withoutelse_end_basicblock

for_end_merge0:                                              ; preds = for_condition0 
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

single_then_basicblock:                                      ; preds = for_body0 
    %i_6 = load i32, i32* @i
    %call_toString = call i8* @toString(i32 %i_6)
    call void @print(i8* %call_toString)
    store i32 0, i32* %return_register_infunction_addr
    br label %return_block0

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock for_body0 
    br label %for_step0

return_block0:                                               ; preds = single_then_basicblock for_end_merge0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local void @GLOBAL__sub_I_main.mx() {
entrance_block0:                                             
    %mul_bytes = mul i32 20, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 4, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** @a
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
