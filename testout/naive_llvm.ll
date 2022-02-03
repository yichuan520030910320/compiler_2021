; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"



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

define dso_local i32 @gcd(i32 %x_para,i32 %y_para,i32 %j0_para,i32 %j1_para,i32 %j2_para,i32 %j3_para,i32 %j4_para,i32 %j5_para,i32 %j6_para,i32 %j7_para,i32 %j8_para,i32 %j9_para,i32 %j10_para,i32 %j11_para,i32 %j12_para,i32 %j13_para,i32 %j14_para,i32 %j15_para,i32 %j16_para,i32 %j17_para,i32 %j18_para,i32 %j19_para,i32 %j20_para,i32 %j21_para,i32 %j22_para,i32 %j23_para,i32 %j24_para,i32 %j25_para) {
entrance_block0:                                             
    %j25_addr = alloca i32
    %j24_addr = alloca i32
    %j23_addr = alloca i32
    %j22_addr = alloca i32
    %j21_addr = alloca i32
    %j20_addr = alloca i32
    %j19_addr = alloca i32
    %j18_addr = alloca i32
    %j17_addr = alloca i32
    %j16_addr = alloca i32
    %j15_addr = alloca i32
    %j14_addr = alloca i32
    %j13_addr = alloca i32
    %j12_addr = alloca i32
    %j11_addr = alloca i32
    %j10_addr = alloca i32
    %j9_addr = alloca i32
    %j8_addr = alloca i32
    %j7_addr = alloca i32
    %j6_addr = alloca i32
    %j5_addr = alloca i32
    %j4_addr = alloca i32
    %j3_addr = alloca i32
    %j2_addr = alloca i32
    %j1_addr = alloca i32
    %j0_addr = alloca i32
    %y_addr = alloca i32
    %x_addr = alloca i32
    %return_register_infunction_addr = alloca i32
    store i32 %x_para, i32* %x_addr
    store i32 %y_para, i32* %y_addr
    store i32 %j0_para, i32* %j0_addr
    store i32 %j1_para, i32* %j1_addr
    store i32 %j2_para, i32* %j2_addr
    store i32 %j3_para, i32* %j3_addr
    store i32 %j4_para, i32* %j4_addr
    store i32 %j5_para, i32* %j5_addr
    store i32 %j6_para, i32* %j6_addr
    store i32 %j7_para, i32* %j7_addr
    store i32 %j8_para, i32* %j8_addr
    store i32 %j9_para, i32* %j9_addr
    store i32 %j10_para, i32* %j10_addr
    store i32 %j11_para, i32* %j11_addr
    store i32 %j12_para, i32* %j12_addr
    store i32 %j13_para, i32* %j13_addr
    store i32 %j14_para, i32* %j14_addr
    store i32 %j15_para, i32* %j15_addr
    store i32 %j16_para, i32* %j16_addr
    store i32 %j17_para, i32* %j17_addr
    store i32 %j18_para, i32* %j18_addr
    store i32 %j19_para, i32* %j19_addr
    store i32 %j20_para, i32* %j20_addr
    store i32 %j21_para, i32* %j21_addr
    store i32 %j22_para, i32* %j22_addr
    store i32 %j23_para, i32* %j23_addr
    store i32 %j24_para, i32* %j24_addr
    store i32 %j25_para, i32* %j25_addr
    %j0 = load i32, i32* %j0_addr
    %j1 = load i32, i32* %j1_addr
    %add = add i32 %j0, %j1
    %j2 = load i32, i32* %j2_addr
    %add_0 = add i32 %add, %j2
    %j3 = load i32, i32* %j3_addr
    %add_1 = add i32 %add_0, %j3
    %j4 = load i32, i32* %j4_addr
    %add_2 = add i32 %add_1, %j4
    %j5 = load i32, i32* %j5_addr
    %add_3 = add i32 %add_2, %j5
    %j6 = load i32, i32* %j6_addr
    %add_4 = add i32 %add_3, %j6
    %j7 = load i32, i32* %j7_addr
    %add_5 = add i32 %add_4, %j7
    %j8 = load i32, i32* %j8_addr
    %add_6 = add i32 %add_5, %j8
    %j9 = load i32, i32* %j9_addr
    %add_7 = add i32 %add_6, %j9
    %j10 = load i32, i32* %j10_addr
    %add_8 = add i32 %add_7, %j10
    %j11 = load i32, i32* %j11_addr
    %add_9 = add i32 %add_8, %j11
    %j12 = load i32, i32* %j12_addr
    %add_10 = add i32 %add_9, %j12
    %j13 = load i32, i32* %j13_addr
    %add_11 = add i32 %add_10, %j13
    %j14 = load i32, i32* %j14_addr
    %add_12 = add i32 %add_11, %j14
    %j15 = load i32, i32* %j15_addr
    %add_13 = add i32 %add_12, %j15
    %j16 = load i32, i32* %j16_addr
    %add_14 = add i32 %add_13, %j16
    %j17 = load i32, i32* %j17_addr
    %add_15 = add i32 %add_14, %j17
    %j18 = load i32, i32* %j18_addr
    %add_16 = add i32 %add_15, %j18
    %j19 = load i32, i32* %j19_addr
    %add_17 = add i32 %add_16, %j19
    %j20 = load i32, i32* %j20_addr
    %add_18 = add i32 %add_17, %j20
    %j21 = load i32, i32* %j21_addr
    %add_19 = add i32 %add_18, %j21
    %j22 = load i32, i32* %j22_addr
    %add_20 = add i32 %add_19, %j22
    %j23 = load i32, i32* %j23_addr
    %add_21 = add i32 %add_20, %j23
    %j24 = load i32, i32* %j24_addr
    %add_22 = add i32 %add_21, %j24
    %j25 = load i32, i32* %j25_addr
    %add_23 = add i32 %add_22, %j25
    store i32 %add_23, i32* %return_register_infunction_addr
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %return_register_infunction_addr = alloca i32
    %call_gcd = call i32 @gcd(i32 10, i32 1, i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30, i32 32, i32 34, i32 36, i32 38, i32 40, i32 42, i32 44, i32 46, i32 48, i32 50)
    %call_toString = call i8* @toString(i32 %call_gcd)
    call void @println(i8* %call_toString)
    store i32 0, i32* %return_register_infunction_addr
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
