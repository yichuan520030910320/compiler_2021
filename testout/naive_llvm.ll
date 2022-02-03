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

define dso_local i32 @gcd(i32 %x_para,i32 %y_para,i32 %j0_para,i32 %j1_para,i32 %j2_para,i32 %j3_para,i32 %j4_para,i32 %j5_para,i32 %j6_para,i32 %j7_para,i32 %j8_para,i32 %j9_para,i32 %j10_para,i32 %j11_para,i32 %j12_para,i32 %j13_para,i32 %j14_para,i32 %j15_para,i32 %j16_para,i32 %j17_para,i32 %j18_para,i32 %j19_para,i32 %j20_para,i32 %j21_para,i32 %j22_para,i32 %j23_para,i32 %j24_para,i32 %j25_para,i32 %j26_para,i32 %j27_para,i32 %j28_para,i32 %j29_para) {
entrance_block0:                                             
    %j_addr = alloca i32
    %i_addr = alloca i32
    %j29_addr = alloca i32
    %j28_addr = alloca i32
    %j27_addr = alloca i32
    %j26_addr = alloca i32
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
    store i32 %j26_para, i32* %j26_addr
    store i32 %j27_para, i32* %j27_addr
    store i32 %j28_para, i32* %j28_addr
    store i32 %j29_para, i32* %j29_addr
    %i = load i32, i32* %i_addr
    store i32 0, i32* %i_addr
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* %i_addr
    %sle = icmp sle i32 %i_0, 10
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body 
    %i_1 = load i32, i32* %i_addr
    %add_28 = add i32 %i_1, 1
    store i32 %add_28, i32* %i_addr
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %j = load i32, i32* %j_addr
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
    %j26 = load i32, i32* %j26_addr
    %add_24 = add i32 %add_23, %j26
    %j27 = load i32, i32* %j27_addr
    %add_25 = add i32 %add_24, %j27
    %j28 = load i32, i32* %j28_addr
    %add_26 = add i32 %add_25, %j28
    %j29 = load i32, i32* %j29_addr
    %add_27 = add i32 %add_26, %j29
    %srem = srem i32 %add_27, 100
    store i32 %srem, i32* %j_addr
    br label %for_step

for_end_merge:                                               ; preds = for_condition 
    %x = load i32, i32* %x_addr
    %y = load i32, i32* %y_addr
    %srem_0 = srem i32 %x, %y
    %eq = icmp eq i32 %srem_0, 0
    br i1 %eq, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = for_end_merge 
    %y_0 = load i32, i32* %y_addr
    store i32 %y_0, i32* %return_register_infunction_addr
    br label %return_block0

else_basicblock:                                             ; preds = for_end_merge 
    %y_1 = load i32, i32* %y_addr
    %x_0 = load i32, i32* %x_addr
    %y_2 = load i32, i32* %y_addr
    %srem_1 = srem i32 %x_0, %y_2
    %j_0 = load i32, i32* %j_addr
    %call_gcd = call i32 @gcd(i32 10, i32 68, i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30, i32 32, i32 34, i32 36, i32 38, i32 40, i32 42, i32 44, i32 46, i32 48, i32 50, i32 52, i32 54, i32 56, i32 58)
    %j2_0 = load i32, i32* %j2_addr
    %j3_0 = load i32, i32* %j3_addr
    %j4_0 = load i32, i32* %j4_addr
    %j5_0 = load i32, i32* %j5_addr
    %j6_0 = load i32, i32* %j6_addr
    %j7_0 = load i32, i32* %j7_addr
    %j8_0 = load i32, i32* %j8_addr
    %j9_0 = load i32, i32* %j9_addr
    %j10_0 = load i32, i32* %j10_addr
    %j11_0 = load i32, i32* %j11_addr
    %j12_0 = load i32, i32* %j12_addr
    %j13_0 = load i32, i32* %j13_addr
    %j14_0 = load i32, i32* %j14_addr
    %j15_0 = load i32, i32* %j15_addr
    %j16_0 = load i32, i32* %j16_addr
    %j17_0 = load i32, i32* %j17_addr
    %j18_0 = load i32, i32* %j18_addr
    %j19_0 = load i32, i32* %j19_addr
    %j20_0 = load i32, i32* %j20_addr
    %j21_0 = load i32, i32* %j21_addr
    %j22_0 = load i32, i32* %j22_addr
    %j23_0 = load i32, i32* %j23_addr
    %j24_0 = load i32, i32* %j24_addr
    %j25_0 = load i32, i32* %j25_addr
    %j26_0 = load i32, i32* %j26_addr
    %j27_0 = load i32, i32* %j27_addr
    %j28_0 = load i32, i32* %j28_addr
    %j29_0 = load i32, i32* %j29_addr
    %call_gcd1 = call i32 @gcd1(i32 %y_1, i32 %srem_1, i32 %j_0, i32 %call_gcd, i32 %j2_0, i32 %j3_0, i32 %j4_0, i32 %j5_0, i32 %j6_0, i32 %j7_0, i32 %j8_0, i32 %j9_0, i32 %j10_0, i32 %j11_0, i32 %j12_0, i32 %j13_0, i32 %j14_0, i32 %j15_0, i32 %j16_0, i32 %j17_0, i32 %j18_0, i32 %j19_0, i32 %j20_0, i32 %j21_0, i32 %j22_0, i32 %j23_0, i32 %j24_0, i32 %j25_0, i32 %j26_0, i32 %j27_0, i32 %j28_0, i32 %j29_0)
    store i32 %call_gcd1, i32* %return_register_infunction_addr
    br label %return_block0

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %return_block0

return_block0:                                               ; preds = then_basicblock else_basicblock if_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @gcd1(i32 %x_para,i32 %y_para,i32 %j0_para,i32 %j1_para,i32 %j2_para,i32 %j3_para,i32 %j4_para,i32 %j5_para,i32 %j6_para,i32 %j7_para,i32 %j8_para,i32 %j9_para,i32 %j10_para,i32 %j11_para,i32 %j12_para,i32 %j13_para,i32 %j14_para,i32 %j15_para,i32 %j16_para,i32 %j17_para,i32 %j18_para,i32 %j19_para,i32 %j20_para,i32 %j21_para,i32 %j22_para,i32 %j23_para,i32 %j24_para,i32 %j25_para,i32 %j26_para,i32 %j27_para,i32 %j28_para,i32 %j29_para) {
entrance_block0:                                             
    %j_addr = alloca i32
    %j29_addr = alloca i32
    %j28_addr = alloca i32
    %j27_addr = alloca i32
    %j26_addr = alloca i32
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
    store i32 %j26_para, i32* %j26_addr
    store i32 %j27_para, i32* %j27_addr
    store i32 %j28_para, i32* %j28_addr
    store i32 %j29_para, i32* %j29_addr
    %j = load i32, i32* %j_addr
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
    %j26 = load i32, i32* %j26_addr
    %add_24 = add i32 %add_23, %j26
    %j27 = load i32, i32* %j27_addr
    %add_25 = add i32 %add_24, %j27
    %j28 = load i32, i32* %j28_addr
    %add_26 = add i32 %add_25, %j28
    %j29 = load i32, i32* %j29_addr
    %add_27 = add i32 %add_26, %j29
    %srem = srem i32 %add_27, 100
    store i32 %srem, i32* %j_addr
    %x = load i32, i32* %x_addr
    %y = load i32, i32* %y_addr
    %srem_0 = srem i32 %x, %y
    %eq = icmp eq i32 %srem_0, 0
    br i1 %eq, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = entrance_block0 
    %y_0 = load i32, i32* %y_addr
    store i32 %y_0, i32* %return_register_infunction_addr
    br label %return_block0

else_basicblock:                                             ; preds = entrance_block0 
    %y_1 = load i32, i32* %y_addr
    %x_0 = load i32, i32* %x_addr
    %y_2 = load i32, i32* %y_addr
    %srem_1 = srem i32 %x_0, %y_2
    %j_0 = load i32, i32* %j_addr
    %j1_0 = load i32, i32* %j1_addr
    %j2_0 = load i32, i32* %j2_addr
    %j3_0 = load i32, i32* %j3_addr
    %j4_0 = load i32, i32* %j4_addr
    %j5_0 = load i32, i32* %j5_addr
    %j6_0 = load i32, i32* %j6_addr
    %j7_0 = load i32, i32* %j7_addr
    %j8_0 = load i32, i32* %j8_addr
    %j9_0 = load i32, i32* %j9_addr
    %j10_0 = load i32, i32* %j10_addr
    %j11_0 = load i32, i32* %j11_addr
    %j12_0 = load i32, i32* %j12_addr
    %j13_0 = load i32, i32* %j13_addr
    %j14_0 = load i32, i32* %j14_addr
    %j15_0 = load i32, i32* %j15_addr
    %j16_0 = load i32, i32* %j16_addr
    %j17_0 = load i32, i32* %j17_addr
    %j18_0 = load i32, i32* %j18_addr
    %j19_0 = load i32, i32* %j19_addr
    %j20_0 = load i32, i32* %j20_addr
    %j21_0 = load i32, i32* %j21_addr
    %j22_0 = load i32, i32* %j22_addr
    %j23_0 = load i32, i32* %j23_addr
    %j24_0 = load i32, i32* %j24_addr
    %j25_0 = load i32, i32* %j25_addr
    %j26_0 = load i32, i32* %j26_addr
    %j27_0 = load i32, i32* %j27_addr
    %j28_0 = load i32, i32* %j28_addr
    %j29_0 = load i32, i32* %j29_addr
    %call_gcd2 = call i32 @gcd2(i32 %y_1, i32 %srem_1, i32 %j_0, i32 %j1_0, i32 %j2_0, i32 %j3_0, i32 %j4_0, i32 %j5_0, i32 %j6_0, i32 %j7_0, i32 %j8_0, i32 %j9_0, i32 %j10_0, i32 %j11_0, i32 %j12_0, i32 %j13_0, i32 %j14_0, i32 %j15_0, i32 %j16_0, i32 %j17_0, i32 %j18_0, i32 %j19_0, i32 %j20_0, i32 %j21_0, i32 %j22_0, i32 %j23_0, i32 %j24_0, i32 %j25_0, i32 %j26_0, i32 %j27_0, i32 %j28_0, i32 %j29_0)
    store i32 %call_gcd2, i32* %return_register_infunction_addr
    br label %return_block0

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %return_block0

return_block0:                                               ; preds = then_basicblock else_basicblock if_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @gcd2(i32 %x_para,i32 %y_para,i32 %j0_para,i32 %j1_para,i32 %j2_para,i32 %j3_para,i32 %j4_para,i32 %j5_para,i32 %j6_para,i32 %j7_para,i32 %j8_para,i32 %j9_para,i32 %j10_para,i32 %j11_para,i32 %j12_para,i32 %j13_para,i32 %j14_para,i32 %j15_para,i32 %j16_para,i32 %j17_para,i32 %j18_para,i32 %j19_para,i32 %j20_para,i32 %j21_para,i32 %j22_para,i32 %j23_para,i32 %j24_para,i32 %j25_para,i32 %j26_para,i32 %j27_para,i32 %j28_para,i32 %j29_para) {
entrance_block0:                                             
    %j_addr = alloca i32
    %j29_addr = alloca i32
    %j28_addr = alloca i32
    %j27_addr = alloca i32
    %j26_addr = alloca i32
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
    store i32 %j26_para, i32* %j26_addr
    store i32 %j27_para, i32* %j27_addr
    store i32 %j28_para, i32* %j28_addr
    store i32 %j29_para, i32* %j29_addr
    %j = load i32, i32* %j_addr
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
    %j26 = load i32, i32* %j26_addr
    %add_24 = add i32 %add_23, %j26
    %j27 = load i32, i32* %j27_addr
    %add_25 = add i32 %add_24, %j27
    %j28 = load i32, i32* %j28_addr
    %add_26 = add i32 %add_25, %j28
    %j29 = load i32, i32* %j29_addr
    %add_27 = add i32 %add_26, %j29
    %srem = srem i32 %add_27, 100
    store i32 %srem, i32* %j_addr
    %x = load i32, i32* %x_addr
    %y = load i32, i32* %y_addr
    %srem_0 = srem i32 %x, %y
    %eq = icmp eq i32 %srem_0, 0
    br i1 %eq, label %then_basicblock, label %else_basicblock

then_basicblock:                                             ; preds = entrance_block0 
    %y_0 = load i32, i32* %y_addr
    store i32 %y_0, i32* %return_register_infunction_addr
    br label %return_block0

else_basicblock:                                             ; preds = entrance_block0 
    %y_1 = load i32, i32* %y_addr
    %x_0 = load i32, i32* %x_addr
    %y_2 = load i32, i32* %y_addr
    %srem_1 = srem i32 %x_0, %y_2
    %j0_0 = load i32, i32* %j0_addr
    %j1_0 = load i32, i32* %j1_addr
    %j2_0 = load i32, i32* %j2_addr
    %j3_0 = load i32, i32* %j3_addr
    %j4_0 = load i32, i32* %j4_addr
    %j5_0 = load i32, i32* %j5_addr
    %j6_0 = load i32, i32* %j6_addr
    %j7_0 = load i32, i32* %j7_addr
    %j8_0 = load i32, i32* %j8_addr
    %j9_0 = load i32, i32* %j9_addr
    %j10_0 = load i32, i32* %j10_addr
    %j11_0 = load i32, i32* %j11_addr
    %j12_0 = load i32, i32* %j12_addr
    %j13_0 = load i32, i32* %j13_addr
    %j14_0 = load i32, i32* %j14_addr
    %j15_0 = load i32, i32* %j15_addr
    %j16_0 = load i32, i32* %j16_addr
    %j17_0 = load i32, i32* %j17_addr
    %j18_0 = load i32, i32* %j18_addr
    %j19_0 = load i32, i32* %j19_addr
    %j20_0 = load i32, i32* %j20_addr
    %j21_0 = load i32, i32* %j21_addr
    %j22_0 = load i32, i32* %j22_addr
    %j23_0 = load i32, i32* %j23_addr
    %j24_0 = load i32, i32* %j24_addr
    %j25_0 = load i32, i32* %j25_addr
    %j26_0 = load i32, i32* %j26_addr
    %j27_0 = load i32, i32* %j27_addr
    %j28_0 = load i32, i32* %j28_addr
    %j29_0 = load i32, i32* %j29_addr
    %call_gcd = call i32 @gcd(i32 %y_1, i32 %srem_1, i32 %j0_0, i32 %j1_0, i32 %j2_0, i32 %j3_0, i32 %j4_0, i32 %j5_0, i32 %j6_0, i32 %j7_0, i32 %j8_0, i32 %j9_0, i32 %j10_0, i32 %j11_0, i32 %j12_0, i32 %j13_0, i32 %j14_0, i32 %j15_0, i32 %j16_0, i32 %j17_0, i32 %j18_0, i32 %j19_0, i32 %j20_0, i32 %j21_0, i32 %j22_0, i32 %j23_0, i32 %j24_0, i32 %j25_0, i32 %j26_0, i32 %j27_0, i32 %j28_0, i32 %j29_0)
    store i32 %call_gcd, i32* %return_register_infunction_addr
    br label %return_block0

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock 
    br label %return_block0

return_block0:                                               ; preds = then_basicblock else_basicblock if_end_basicblock 
    %returnval = load i32, i32* %return_register_infunction_addr
    ret i32 %returnval
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    %return_register_infunction_addr = alloca i32
    %call_gcd = call i32 @gcd(i32 10, i32 1, i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30, i32 32, i32 34, i32 36, i32 38, i32 40, i32 42, i32 44, i32 46, i32 48, i32 50, i32 52, i32 54, i32 56, i32 58)
    %add = add i32 %call_gcd, 1024
    %call_toString = call i8* @toString(i32 %add)
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
