; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"


@const_string2 = private unnamed_addr constant [21 x i8] c"\0Aabbdbdd\5C\5C\22d\22c\5Cadc\22c\00", align 1
@const_string0 = private unnamed_addr constant [21 x i8] c"\22\0Abda\5C\22\0Adbd\5Cc\22\5C\22c\5Cc\22\00", align 1
@const_string1 = private unnamed_addr constant [21 x i8] c"\5Cab\0Aac\22\22add\0A\22\0Aac\0Adb\22\00", align 1

declare i1 @_str_ne(i8* %lhs,i8* %rhs)
declare i1 @_str_le(i8* %lhs,i8* %rhs)
declare i8* @_str_concatenate(i8* %lhs,i8* %rhs)
declare i8* @getString()
declare i1 @_str_ge(i8* %lhs,i8* %rhs)
declare i1 @_str_lt(i8* %lhs,i8* %rhs)
declare i32 @getInt()
declare void @print(i8* %str_0)
declare void @println(i8* %str_0)
declare i32 @_str_ord(i8* %str,i32 %pos)
declare void @printInt(i32 %n_0)
declare void @printlnInt(i32 %n_0)
declare i8* @toString(i32 %i_0)
declare i1 @_str_eq(i8* %lhs,i8* %rhs)
declare i1 @_str_gt(i8* %lhs,i8* %rhs)

define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main.mx()
    %c_addr = alloca i8*
    %b_addr = alloca i8*
    %a_addr = alloca i8*
    %return_register_infunction_addr = alloca i32
    %const_string_pointer = getelementptr inbounds [21 x i8], [21 x i8]* @const_string0, i32 0, i32 0
    store i8* %const_string_pointer, i8** %a_addr
    %const_string_pointer_0 = getelementptr inbounds [21 x i8], [21 x i8]* @const_string1, i32 0, i32 0
    store i8* %const_string_pointer_0, i8** %b_addr
    %const_string_pointer_1 = getelementptr inbounds [21 x i8], [21 x i8]* @const_string2, i32 0, i32 0
    store i8* %const_string_pointer_1, i8** %c_addr
    %c = load i8*, i8** %c_addr
    %b = load i8*, i8** %b_addr
    %string_add = call i8* @_str_concatenate(i8* %c, i8* %b)
    %b_0 = load i8*, i8** %b_addr
    %string_add_0 = call i8* @_str_concatenate(i8* %string_add, i8* %b_0)
    %c_0 = load i8*, i8** %c_addr
    %string_add_1 = call i8* @_str_concatenate(i8* %string_add_0, i8* %c_0)
    %c_1 = load i8*, i8** %c_addr
    %string_add_2 = call i8* @_str_concatenate(i8* %string_add_1, i8* %c_1)
    %a = load i8*, i8** %a_addr
    %string_add_3 = call i8* @_str_concatenate(i8* %string_add_2, i8* %a)
    %c_2 = load i8*, i8** %c_addr
    %string_add_4 = call i8* @_str_concatenate(i8* %string_add_3, i8* %c_2)
    %b_1 = load i8*, i8** %b_addr
    %string_add_5 = call i8* @_str_concatenate(i8* %string_add_4, i8* %b_1)
    %c_3 = load i8*, i8** %c_addr
    %string_add_6 = call i8* @_str_concatenate(i8* %string_add_5, i8* %c_3)
    %b_2 = load i8*, i8** %b_addr
    %string_add_7 = call i8* @_str_concatenate(i8* %string_add_6, i8* %b_2)
    call void @print(i8* %string_add_7)
    %c_4 = load i8*, i8** %c_addr
    %c_5 = load i8*, i8** %c_addr
    %string_add_8 = call i8* @_str_concatenate(i8* %c_4, i8* %c_5)
    %a_0 = load i8*, i8** %a_addr
    %string_add_9 = call i8* @_str_concatenate(i8* %string_add_8, i8* %a_0)
    %a_1 = load i8*, i8** %a_addr
    %string_add_10 = call i8* @_str_concatenate(i8* %string_add_9, i8* %a_1)
    %a_2 = load i8*, i8** %a_addr
    %string_add_11 = call i8* @_str_concatenate(i8* %string_add_10, i8* %a_2)
    %c_6 = load i8*, i8** %c_addr
    %string_add_12 = call i8* @_str_concatenate(i8* %string_add_11, i8* %c_6)
    %c_7 = load i8*, i8** %c_addr
    %string_add_13 = call i8* @_str_concatenate(i8* %string_add_12, i8* %c_7)
    %b_3 = load i8*, i8** %b_addr
    %string_add_14 = call i8* @_str_concatenate(i8* %string_add_13, i8* %b_3)
    %b_4 = load i8*, i8** %b_addr
    %string_add_15 = call i8* @_str_concatenate(i8* %string_add_14, i8* %b_4)
    %b_5 = load i8*, i8** %b_addr
    %string_add_16 = call i8* @_str_concatenate(i8* %string_add_15, i8* %b_5)
    call void @print(i8* %string_add_16)
    %b_6 = load i8*, i8** %b_addr
    %a_3 = load i8*, i8** %a_addr
    %string_add_17 = call i8* @_str_concatenate(i8* %b_6, i8* %a_3)
    %c_8 = load i8*, i8** %c_addr
    %string_add_18 = call i8* @_str_concatenate(i8* %string_add_17, i8* %c_8)
    %b_7 = load i8*, i8** %b_addr
    %string_add_19 = call i8* @_str_concatenate(i8* %string_add_18, i8* %b_7)
    %c_9 = load i8*, i8** %c_addr
    %string_add_20 = call i8* @_str_concatenate(i8* %string_add_19, i8* %c_9)
    %c_10 = load i8*, i8** %c_addr
    %string_add_21 = call i8* @_str_concatenate(i8* %string_add_20, i8* %c_10)
    %b_8 = load i8*, i8** %b_addr
    %string_add_22 = call i8* @_str_concatenate(i8* %string_add_21, i8* %b_8)
    %b_9 = load i8*, i8** %b_addr
    %string_add_23 = call i8* @_str_concatenate(i8* %string_add_22, i8* %b_9)
    %a_4 = load i8*, i8** %a_addr
    %string_add_24 = call i8* @_str_concatenate(i8* %string_add_23, i8* %a_4)
    %c_11 = load i8*, i8** %c_addr
    %string_add_25 = call i8* @_str_concatenate(i8* %string_add_24, i8* %c_11)
    call void @print(i8* %string_add_25)
    %b_10 = load i8*, i8** %b_addr
    %a_5 = load i8*, i8** %a_addr
    %string_add_26 = call i8* @_str_concatenate(i8* %b_10, i8* %a_5)
    %c_12 = load i8*, i8** %c_addr
    %string_add_27 = call i8* @_str_concatenate(i8* %string_add_26, i8* %c_12)
    %a_6 = load i8*, i8** %a_addr
    %string_add_28 = call i8* @_str_concatenate(i8* %string_add_27, i8* %a_6)
    %a_7 = load i8*, i8** %a_addr
    %string_add_29 = call i8* @_str_concatenate(i8* %string_add_28, i8* %a_7)
    %a_8 = load i8*, i8** %a_addr
    %string_add_30 = call i8* @_str_concatenate(i8* %string_add_29, i8* %a_8)
    %b_11 = load i8*, i8** %b_addr
    %string_add_31 = call i8* @_str_concatenate(i8* %string_add_30, i8* %b_11)
    %b_12 = load i8*, i8** %b_addr
    %string_add_32 = call i8* @_str_concatenate(i8* %string_add_31, i8* %b_12)
    %b_13 = load i8*, i8** %b_addr
    %string_add_33 = call i8* @_str_concatenate(i8* %string_add_32, i8* %b_13)
    %c_13 = load i8*, i8** %c_addr
    %string_add_34 = call i8* @_str_concatenate(i8* %string_add_33, i8* %c_13)
    call void @print(i8* %string_add_34)
    %b_14 = load i8*, i8** %b_addr
    %a_9 = load i8*, i8** %a_addr
    %string_add_35 = call i8* @_str_concatenate(i8* %b_14, i8* %a_9)
    %b_15 = load i8*, i8** %b_addr
    %string_add_36 = call i8* @_str_concatenate(i8* %string_add_35, i8* %b_15)
    %a_10 = load i8*, i8** %a_addr
    %string_add_37 = call i8* @_str_concatenate(i8* %string_add_36, i8* %a_10)
    %c_14 = load i8*, i8** %c_addr
    %string_add_38 = call i8* @_str_concatenate(i8* %string_add_37, i8* %c_14)
    %c_15 = load i8*, i8** %c_addr
    %string_add_39 = call i8* @_str_concatenate(i8* %string_add_38, i8* %c_15)
    %c_16 = load i8*, i8** %c_addr
    %string_add_40 = call i8* @_str_concatenate(i8* %string_add_39, i8* %c_16)
    %b_16 = load i8*, i8** %b_addr
    %string_add_41 = call i8* @_str_concatenate(i8* %string_add_40, i8* %b_16)
    %c_17 = load i8*, i8** %c_addr
    %string_add_42 = call i8* @_str_concatenate(i8* %string_add_41, i8* %c_17)
    %a_11 = load i8*, i8** %a_addr
    %string_add_43 = call i8* @_str_concatenate(i8* %string_add_42, i8* %a_11)
    call void @print(i8* %string_add_43)
    %a_12 = load i8*, i8** %a_addr
    %a_13 = load i8*, i8** %a_addr
    %string_add_44 = call i8* @_str_concatenate(i8* %a_12, i8* %a_13)
    %c_18 = load i8*, i8** %c_addr
    %string_add_45 = call i8* @_str_concatenate(i8* %string_add_44, i8* %c_18)
    %c_19 = load i8*, i8** %c_addr
    %string_add_46 = call i8* @_str_concatenate(i8* %string_add_45, i8* %c_19)
    %a_14 = load i8*, i8** %a_addr
    %string_add_47 = call i8* @_str_concatenate(i8* %string_add_46, i8* %a_14)
    %c_20 = load i8*, i8** %c_addr
    %string_add_48 = call i8* @_str_concatenate(i8* %string_add_47, i8* %c_20)
    %b_17 = load i8*, i8** %b_addr
    %string_add_49 = call i8* @_str_concatenate(i8* %string_add_48, i8* %b_17)
    %c_21 = load i8*, i8** %c_addr
    %string_add_50 = call i8* @_str_concatenate(i8* %string_add_49, i8* %c_21)
    %c_22 = load i8*, i8** %c_addr
    %string_add_51 = call i8* @_str_concatenate(i8* %string_add_50, i8* %c_22)
    %a_15 = load i8*, i8** %a_addr
    %string_add_52 = call i8* @_str_concatenate(i8* %string_add_51, i8* %a_15)
    call void @print(i8* %string_add_52)
    %b_18 = load i8*, i8** %b_addr
    %b_19 = load i8*, i8** %b_addr
    %string_add_53 = call i8* @_str_concatenate(i8* %b_18, i8* %b_19)
    %b_20 = load i8*, i8** %b_addr
    %string_add_54 = call i8* @_str_concatenate(i8* %string_add_53, i8* %b_20)
    %b_21 = load i8*, i8** %b_addr
    %string_add_55 = call i8* @_str_concatenate(i8* %string_add_54, i8* %b_21)
    %c_23 = load i8*, i8** %c_addr
    %string_add_56 = call i8* @_str_concatenate(i8* %string_add_55, i8* %c_23)
    %a_16 = load i8*, i8** %a_addr
    %string_add_57 = call i8* @_str_concatenate(i8* %string_add_56, i8* %a_16)
    %c_24 = load i8*, i8** %c_addr
    %string_add_58 = call i8* @_str_concatenate(i8* %string_add_57, i8* %c_24)
    %b_22 = load i8*, i8** %b_addr
    %string_add_59 = call i8* @_str_concatenate(i8* %string_add_58, i8* %b_22)
    %a_17 = load i8*, i8** %a_addr
    %string_add_60 = call i8* @_str_concatenate(i8* %string_add_59, i8* %a_17)
    %a_18 = load i8*, i8** %a_addr
    %string_add_61 = call i8* @_str_concatenate(i8* %string_add_60, i8* %a_18)
    call void @print(i8* %string_add_61)
    %a_19 = load i8*, i8** %a_addr
    %a_20 = load i8*, i8** %a_addr
    %string_add_62 = call i8* @_str_concatenate(i8* %a_19, i8* %a_20)
    %c_25 = load i8*, i8** %c_addr
    %string_add_63 = call i8* @_str_concatenate(i8* %string_add_62, i8* %c_25)
    %b_23 = load i8*, i8** %b_addr
    %string_add_64 = call i8* @_str_concatenate(i8* %string_add_63, i8* %b_23)
    %a_21 = load i8*, i8** %a_addr
    %string_add_65 = call i8* @_str_concatenate(i8* %string_add_64, i8* %a_21)
    %b_24 = load i8*, i8** %b_addr
    %string_add_66 = call i8* @_str_concatenate(i8* %string_add_65, i8* %b_24)
    %c_26 = load i8*, i8** %c_addr
    %string_add_67 = call i8* @_str_concatenate(i8* %string_add_66, i8* %c_26)
    %c_27 = load i8*, i8** %c_addr
    %string_add_68 = call i8* @_str_concatenate(i8* %string_add_67, i8* %c_27)
    %b_25 = load i8*, i8** %b_addr
    %string_add_69 = call i8* @_str_concatenate(i8* %string_add_68, i8* %b_25)
    %b_26 = load i8*, i8** %b_addr
    %string_add_70 = call i8* @_str_concatenate(i8* %string_add_69, i8* %b_26)
    call void @print(i8* %string_add_70)
    %c_28 = load i8*, i8** %c_addr
    %b_27 = load i8*, i8** %b_addr
    %string_add_71 = call i8* @_str_concatenate(i8* %c_28, i8* %b_27)
    %a_22 = load i8*, i8** %a_addr
    %string_add_72 = call i8* @_str_concatenate(i8* %string_add_71, i8* %a_22)
    %a_23 = load i8*, i8** %a_addr
    %string_add_73 = call i8* @_str_concatenate(i8* %string_add_72, i8* %a_23)
    %c_29 = load i8*, i8** %c_addr
    %string_add_74 = call i8* @_str_concatenate(i8* %string_add_73, i8* %c_29)
    %b_28 = load i8*, i8** %b_addr
    %string_add_75 = call i8* @_str_concatenate(i8* %string_add_74, i8* %b_28)
    %a_24 = load i8*, i8** %a_addr
    %string_add_76 = call i8* @_str_concatenate(i8* %string_add_75, i8* %a_24)
    %a_25 = load i8*, i8** %a_addr
    %string_add_77 = call i8* @_str_concatenate(i8* %string_add_76, i8* %a_25)
    %c_30 = load i8*, i8** %c_addr
    %string_add_78 = call i8* @_str_concatenate(i8* %string_add_77, i8* %c_30)
    %b_29 = load i8*, i8** %b_addr
    %string_add_79 = call i8* @_str_concatenate(i8* %string_add_78, i8* %b_29)
    call void @print(i8* %string_add_79)
    %a_26 = load i8*, i8** %a_addr
    %c_31 = load i8*, i8** %c_addr
    %string_add_80 = call i8* @_str_concatenate(i8* %a_26, i8* %c_31)
    %b_30 = load i8*, i8** %b_addr
    %string_add_81 = call i8* @_str_concatenate(i8* %string_add_80, i8* %b_30)
    %b_31 = load i8*, i8** %b_addr
    %string_add_82 = call i8* @_str_concatenate(i8* %string_add_81, i8* %b_31)
    %b_32 = load i8*, i8** %b_addr
    %string_add_83 = call i8* @_str_concatenate(i8* %string_add_82, i8* %b_32)
    %c_32 = load i8*, i8** %c_addr
    %string_add_84 = call i8* @_str_concatenate(i8* %string_add_83, i8* %c_32)
    %c_33 = load i8*, i8** %c_addr
    %string_add_85 = call i8* @_str_concatenate(i8* %string_add_84, i8* %c_33)
    %c_34 = load i8*, i8** %c_addr
    %string_add_86 = call i8* @_str_concatenate(i8* %string_add_85, i8* %c_34)
    %b_33 = load i8*, i8** %b_addr
    %string_add_87 = call i8* @_str_concatenate(i8* %string_add_86, i8* %b_33)
    %c_35 = load i8*, i8** %c_addr
    %string_add_88 = call i8* @_str_concatenate(i8* %string_add_87, i8* %c_35)
    call void @print(i8* %string_add_88)
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
