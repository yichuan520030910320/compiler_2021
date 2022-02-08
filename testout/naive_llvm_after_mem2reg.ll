; ModuleID = 'C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx'
source_filename = "C:\Users\18303\IdeaProjects\Mx\src\selftest\test.mx"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@color = dso_local global i32* null
@count = dso_local global i32* null
@i = dso_local global i32 0
@j = dso_local global i32 0
@make = dso_local global i32** null

@const_string0 = private unnamed_addr constant [2 x i8] c" \00", align 1
@const_string1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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

define dso_local void @search(i32 %x_para,i32 %y_para,i32 %z_para) {
entrance_block0:                                             
    store i1 false, i1 %mem2reg0
    store i1 false, i1 %mem2reg1
    store i1 false, i1 %mem2reg2
    store i1 false, i1 %mem2reg3
    store i1 false, i1 %mem2reg4
    store i1 false, i1 %mem2reg5
    store i1 false, i1 %mem2reg6
    store i1 false, i1 %mem2reg7
    store i1 false, i1 %mem2reg8
    store i1 false, i1 %mem2reg9
    store i1 false, i1 %mem2reg10
    store i1 false, i1 %mem2reg11
    store i32 0, i32 %mem2reg12
    store i32 0, i32 %mem2reg13
    store i32 0, i32 %mem2reg14
    store i32 0, i32 %mem2reg15
    store i32 0, i32 %mem2reg16
    store i32 0, i32 %mem2reg17
    store i32 %x_para, i32 %mem2reg17
    store i32 %y_para, i32 %mem2reg16
    store i32 %z_para, i32 %mem2reg15
    store i32 %mem2reg16, i32 %mem2reg18
    %sgt = icmp sgt i32 mem2reg18, 0
    store i1 %sgt, i1 %mem2reg11
    br i1 %sgt, label %short_circuit_OR_end_OR, label %short_circuit_OR_branch_OR

short_circuit_OR_end_OR:                                     ; preds = entrance_block0 short_circuit_OR_branch_OR 
    store i1 %mem2reg11, i1 %mem2reg19
    store i1 %mem2reg19, i1 %mem2reg10
    br i1 %mem2reg19, label %short_circuit_OR_end_OR0, label %short_circuit_OR_branch_OR0

short_circuit_OR_branch_OR:                                  ; preds = entrance_block0 
    store i32 %mem2reg16, i32 %mem2reg20
    %slt = icmp slt i32 mem2reg20, 0
    store i1 %slt, i1 %mem2reg11
    br label %short_circuit_OR_end_OR

short_circuit_OR_end_OR0:                                    ; preds = short_circuit_OR_end_OR short_circuit_OR_branch_OR0 
    store i1 %mem2reg10, i1 %mem2reg21
    store i1 %mem2reg21, i1 %mem2reg9
    br i1 %mem2reg21, label %short_circuit_OR_end_OR1, label %short_circuit_OR_branch_OR1

short_circuit_OR_branch_OR0:                                 ; preds = short_circuit_OR_end_OR 
    store i32 %mem2reg17, i32 %mem2reg22
    %eq = icmp eq i32 mem2reg22, 0
    store i1 %eq, i1 %mem2reg10
    br label %short_circuit_OR_end_OR0

short_circuit_OR_end_OR1:                                    ; preds = short_circuit_OR_end_OR0 short_circuit_OR_branch_OR1 
    store i1 %mem2reg9, i1 %mem2reg23
    br i1 %mem2reg23, label %single_then_basicblock, label %if_withoutelse_end_basicblock

short_circuit_OR_branch_OR1:                                 ; preds = short_circuit_OR_end_OR0 
    %make = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg24
    %sub = sub i32 mem2reg24, 1
    %getelementptr_reg = getelementptr inbounds i32*, i32** %make, i32 %sub
    %load_result = load i32*, i32** %getelementptr_reg
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %load_result, i32 0
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %make_0 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg25
    %sub_0 = sub i32 mem2reg25, 1
    %getelementptr_reg_1 = getelementptr inbounds i32*, i32** %make_0, i32 %sub_0
    %load_result_1 = load i32*, i32** %getelementptr_reg_1
    %getelementptr_reg_2 = getelementptr inbounds i32, i32* %load_result_1, i32 1
    %load_result_2 = load i32, i32* %getelementptr_reg_2
    %add = add i32 %load_result_0, %load_result_2
    %make_1 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg26
    %sub_1 = sub i32 mem2reg26, 1
    %getelementptr_reg_3 = getelementptr inbounds i32*, i32** %make_1, i32 %sub_1
    %load_result_3 = load i32*, i32** %getelementptr_reg_3
    %getelementptr_reg_4 = getelementptr inbounds i32, i32* %load_result_3, i32 2
    %load_result_4 = load i32, i32* %getelementptr_reg_4
    %add_0 = add i32 %add, %load_result_4
    %eq_0 = icmp eq i32 %add_0, 15
    store i1 %eq_0, i1 %mem2reg9
    br label %short_circuit_OR_end_OR1

single_then_basicblock:                                      ; preds = short_circuit_OR_end_OR1 
    store i32 %mem2reg17, i32 %mem2reg27
    %eq_1 = icmp eq i32 mem2reg27, 2
    store i1 %eq_1, i1 %mem2reg8
    br i1 %eq_1, label %short_circuit_AND_branch_AND, label %short_circuit_AND_end_AND

if_withoutelse_end_basicblock:                               ; preds = single_then_basicblock short_circuit_OR_end_OR1 if_end_basicblock 
    br label %return_block0

short_circuit_AND_end_AND:                                   ; preds = single_then_basicblock short_circuit_AND_branch_AND 
    store i1 %mem2reg8, i1 %mem2reg28
    br i1 %mem2reg28, label %then_basicblock, label %else_basicblock

short_circuit_AND_branch_AND:                                ; preds = single_then_basicblock 
    store i32 %mem2reg16, i32 %mem2reg29
    %eq_2 = icmp eq i32 mem2reg29, 2
    store i1 %eq_2, i1 %mem2reg8
    br label %short_circuit_AND_end_AND

then_basicblock:                                             ; preds = short_circuit_AND_end_AND 
    %make_2 = load i32**, i32*** @make
    %getelementptr_reg_5 = getelementptr inbounds i32*, i32** %make_2, i32 2
    %load_result_5 = load i32*, i32** %getelementptr_reg_5
    %getelementptr_reg_6 = getelementptr inbounds i32, i32* %load_result_5, i32 2
    %load_result_6 = load i32, i32* %getelementptr_reg_6
    store i32 %mem2reg15, i32 %mem2reg30
    %sub_2 = sub i32 45, mem2reg30
    store i32 %sub_2, i32* %getelementptr_reg_6
    store i32 %mem2reg14, i32 %mem2reg31
    %make_3 = load i32**, i32*** @make
    %getelementptr_reg_7 = getelementptr inbounds i32*, i32** %make_3, i32 0
    %load_result_7 = load i32*, i32** %getelementptr_reg_7
    %getelementptr_reg_8 = getelementptr inbounds i32, i32* %load_result_7, i32 0
    %load_result_8 = load i32, i32* %getelementptr_reg_8
    %make_4 = load i32**, i32*** @make
    %getelementptr_reg_9 = getelementptr inbounds i32*, i32** %make_4, i32 0
    %load_result_9 = load i32*, i32** %getelementptr_reg_9
    %getelementptr_reg_10 = getelementptr inbounds i32, i32* %load_result_9, i32 1
    %load_result_10 = load i32, i32* %getelementptr_reg_10
    %add_1 = add i32 %load_result_8, %load_result_10
    %make_5 = load i32**, i32*** @make
    %getelementptr_reg_11 = getelementptr inbounds i32*, i32** %make_5, i32 0
    %load_result_11 = load i32*, i32** %getelementptr_reg_11
    %getelementptr_reg_12 = getelementptr inbounds i32, i32* %load_result_11, i32 2
    %load_result_12 = load i32, i32* %getelementptr_reg_12
    %add_2 = add i32 %add_1, %load_result_12
    store i32 %add_2, i32 %mem2reg14
    %make_6 = load i32**, i32*** @make
    %getelementptr_reg_13 = getelementptr inbounds i32*, i32** %make_6, i32 1
    %load_result_13 = load i32*, i32** %getelementptr_reg_13
    %getelementptr_reg_14 = getelementptr inbounds i32, i32* %load_result_13, i32 0
    %load_result_14 = load i32, i32* %getelementptr_reg_14
    %make_7 = load i32**, i32*** @make
    %getelementptr_reg_15 = getelementptr inbounds i32*, i32** %make_7, i32 1
    %load_result_15 = load i32*, i32** %getelementptr_reg_15
    %getelementptr_reg_16 = getelementptr inbounds i32, i32* %load_result_15, i32 1
    %load_result_16 = load i32, i32* %getelementptr_reg_16
    %add_3 = add i32 %load_result_14, %load_result_16
    %make_8 = load i32**, i32*** @make
    %getelementptr_reg_17 = getelementptr inbounds i32*, i32** %make_8, i32 1
    %load_result_17 = load i32*, i32** %getelementptr_reg_17
    %getelementptr_reg_18 = getelementptr inbounds i32, i32* %load_result_17, i32 2
    %load_result_18 = load i32, i32* %getelementptr_reg_18
    %add_4 = add i32 %add_3, %load_result_18
    store i32 %mem2reg14, i32 %mem2reg32
    %eq_3 = icmp eq i32 %add_4, mem2reg32
    store i1 %eq_3, i1 %mem2reg7
    br i1 %eq_3, label %short_circuit_AND_branch_AND0, label %short_circuit_AND_end_AND0

else_basicblock:                                             ; preds = short_circuit_AND_end_AND 
    store i32 %mem2reg16, i32 %mem2reg33
    %eq_10 = icmp eq i32 mem2reg33, 2
    br i1 %eq_10, label %then_basicblock0, label %else_basicblock0

if_end_basicblock:                                           ; preds = then_basicblock else_basicblock if_withoutelse_end_basicblock0 if_end_basicblock0 
    br label %if_withoutelse_end_basicblock

short_circuit_AND_end_AND0:                                  ; preds = then_basicblock short_circuit_AND_branch_AND0 
    store i1 %mem2reg7, i1 %mem2reg34
    store i1 %mem2reg34, i1 %mem2reg6
    br i1 %mem2reg34, label %short_circuit_AND_branch_AND1, label %short_circuit_AND_end_AND1

short_circuit_AND_branch_AND0:                               ; preds = then_basicblock 
    %make_9 = load i32**, i32*** @make
    %getelementptr_reg_19 = getelementptr inbounds i32*, i32** %make_9, i32 2
    %load_result_19 = load i32*, i32** %getelementptr_reg_19
    %getelementptr_reg_20 = getelementptr inbounds i32, i32* %load_result_19, i32 0
    %load_result_20 = load i32, i32* %getelementptr_reg_20
    %make_10 = load i32**, i32*** @make
    %getelementptr_reg_21 = getelementptr inbounds i32*, i32** %make_10, i32 2
    %load_result_21 = load i32*, i32** %getelementptr_reg_21
    %getelementptr_reg_22 = getelementptr inbounds i32, i32* %load_result_21, i32 1
    %load_result_22 = load i32, i32* %getelementptr_reg_22
    %add_5 = add i32 %load_result_20, %load_result_22
    %make_11 = load i32**, i32*** @make
    %getelementptr_reg_23 = getelementptr inbounds i32*, i32** %make_11, i32 2
    %load_result_23 = load i32*, i32** %getelementptr_reg_23
    %getelementptr_reg_24 = getelementptr inbounds i32, i32* %load_result_23, i32 2
    %load_result_24 = load i32, i32* %getelementptr_reg_24
    %add_6 = add i32 %add_5, %load_result_24
    store i32 %mem2reg14, i32 %mem2reg35
    %eq_4 = icmp eq i32 %add_6, mem2reg35
    store i1 %eq_4, i1 %mem2reg7
    br label %short_circuit_AND_end_AND0

short_circuit_AND_end_AND1:                                  ; preds = short_circuit_AND_end_AND0 short_circuit_AND_branch_AND1 
    store i1 %mem2reg6, i1 %mem2reg36
    store i1 %mem2reg36, i1 %mem2reg5
    br i1 %mem2reg36, label %short_circuit_AND_branch_AND2, label %short_circuit_AND_end_AND2

short_circuit_AND_branch_AND1:                               ; preds = short_circuit_AND_end_AND0 
    %make_12 = load i32**, i32*** @make
    %getelementptr_reg_25 = getelementptr inbounds i32*, i32** %make_12, i32 0
    %load_result_25 = load i32*, i32** %getelementptr_reg_25
    %getelementptr_reg_26 = getelementptr inbounds i32, i32* %load_result_25, i32 0
    %load_result_26 = load i32, i32* %getelementptr_reg_26
    %make_13 = load i32**, i32*** @make
    %getelementptr_reg_27 = getelementptr inbounds i32*, i32** %make_13, i32 1
    %load_result_27 = load i32*, i32** %getelementptr_reg_27
    %getelementptr_reg_28 = getelementptr inbounds i32, i32* %load_result_27, i32 0
    %load_result_28 = load i32, i32* %getelementptr_reg_28
    %add_7 = add i32 %load_result_26, %load_result_28
    %make_14 = load i32**, i32*** @make
    %getelementptr_reg_29 = getelementptr inbounds i32*, i32** %make_14, i32 2
    %load_result_29 = load i32*, i32** %getelementptr_reg_29
    %getelementptr_reg_30 = getelementptr inbounds i32, i32* %load_result_29, i32 0
    %load_result_30 = load i32, i32* %getelementptr_reg_30
    %add_8 = add i32 %add_7, %load_result_30
    store i32 %mem2reg14, i32 %mem2reg37
    %eq_5 = icmp eq i32 %add_8, mem2reg37
    store i1 %eq_5, i1 %mem2reg6
    br label %short_circuit_AND_end_AND1

short_circuit_AND_end_AND2:                                  ; preds = short_circuit_AND_end_AND1 short_circuit_AND_branch_AND2 
    store i1 %mem2reg5, i1 %mem2reg38
    store i1 %mem2reg38, i1 %mem2reg4
    br i1 %mem2reg38, label %short_circuit_AND_branch_AND3, label %short_circuit_AND_end_AND3

short_circuit_AND_branch_AND2:                               ; preds = short_circuit_AND_end_AND1 
    %make_15 = load i32**, i32*** @make
    %getelementptr_reg_31 = getelementptr inbounds i32*, i32** %make_15, i32 0
    %load_result_31 = load i32*, i32** %getelementptr_reg_31
    %getelementptr_reg_32 = getelementptr inbounds i32, i32* %load_result_31, i32 1
    %load_result_32 = load i32, i32* %getelementptr_reg_32
    %make_16 = load i32**, i32*** @make
    %getelementptr_reg_33 = getelementptr inbounds i32*, i32** %make_16, i32 1
    %load_result_33 = load i32*, i32** %getelementptr_reg_33
    %getelementptr_reg_34 = getelementptr inbounds i32, i32* %load_result_33, i32 1
    %load_result_34 = load i32, i32* %getelementptr_reg_34
    %add_9 = add i32 %load_result_32, %load_result_34
    %make_17 = load i32**, i32*** @make
    %getelementptr_reg_35 = getelementptr inbounds i32*, i32** %make_17, i32 2
    %load_result_35 = load i32*, i32** %getelementptr_reg_35
    %getelementptr_reg_36 = getelementptr inbounds i32, i32* %load_result_35, i32 1
    %load_result_36 = load i32, i32* %getelementptr_reg_36
    %add_10 = add i32 %add_9, %load_result_36
    store i32 %mem2reg14, i32 %mem2reg39
    %eq_6 = icmp eq i32 %add_10, mem2reg39
    store i1 %eq_6, i1 %mem2reg5
    br label %short_circuit_AND_end_AND2

short_circuit_AND_end_AND3:                                  ; preds = short_circuit_AND_end_AND2 short_circuit_AND_branch_AND3 
    store i1 %mem2reg4, i1 %mem2reg40
    store i1 %mem2reg40, i1 %mem2reg3
    br i1 %mem2reg40, label %short_circuit_AND_branch_AND4, label %short_circuit_AND_end_AND4

short_circuit_AND_branch_AND3:                               ; preds = short_circuit_AND_end_AND2 
    %make_18 = load i32**, i32*** @make
    %getelementptr_reg_37 = getelementptr inbounds i32*, i32** %make_18, i32 0
    %load_result_37 = load i32*, i32** %getelementptr_reg_37
    %getelementptr_reg_38 = getelementptr inbounds i32, i32* %load_result_37, i32 2
    %load_result_38 = load i32, i32* %getelementptr_reg_38
    %make_19 = load i32**, i32*** @make
    %getelementptr_reg_39 = getelementptr inbounds i32*, i32** %make_19, i32 1
    %load_result_39 = load i32*, i32** %getelementptr_reg_39
    %getelementptr_reg_40 = getelementptr inbounds i32, i32* %load_result_39, i32 2
    %load_result_40 = load i32, i32* %getelementptr_reg_40
    %add_11 = add i32 %load_result_38, %load_result_40
    %make_20 = load i32**, i32*** @make
    %getelementptr_reg_41 = getelementptr inbounds i32*, i32** %make_20, i32 2
    %load_result_41 = load i32*, i32** %getelementptr_reg_41
    %getelementptr_reg_42 = getelementptr inbounds i32, i32* %load_result_41, i32 2
    %load_result_42 = load i32, i32* %getelementptr_reg_42
    %add_12 = add i32 %add_11, %load_result_42
    store i32 %mem2reg14, i32 %mem2reg41
    %eq_7 = icmp eq i32 %add_12, mem2reg41
    store i1 %eq_7, i1 %mem2reg4
    br label %short_circuit_AND_end_AND3

short_circuit_AND_end_AND4:                                  ; preds = short_circuit_AND_end_AND3 short_circuit_AND_branch_AND4 
    store i1 %mem2reg3, i1 %mem2reg42
    store i1 %mem2reg42, i1 %mem2reg2
    br i1 %mem2reg42, label %short_circuit_AND_branch_AND5, label %short_circuit_AND_end_AND5

short_circuit_AND_branch_AND4:                               ; preds = short_circuit_AND_end_AND3 
    %make_21 = load i32**, i32*** @make
    %getelementptr_reg_43 = getelementptr inbounds i32*, i32** %make_21, i32 0
    %load_result_43 = load i32*, i32** %getelementptr_reg_43
    %getelementptr_reg_44 = getelementptr inbounds i32, i32* %load_result_43, i32 0
    %load_result_44 = load i32, i32* %getelementptr_reg_44
    %make_22 = load i32**, i32*** @make
    %getelementptr_reg_45 = getelementptr inbounds i32*, i32** %make_22, i32 1
    %load_result_45 = load i32*, i32** %getelementptr_reg_45
    %getelementptr_reg_46 = getelementptr inbounds i32, i32* %load_result_45, i32 1
    %load_result_46 = load i32, i32* %getelementptr_reg_46
    %add_13 = add i32 %load_result_44, %load_result_46
    %make_23 = load i32**, i32*** @make
    %getelementptr_reg_47 = getelementptr inbounds i32*, i32** %make_23, i32 2
    %load_result_47 = load i32*, i32** %getelementptr_reg_47
    %getelementptr_reg_48 = getelementptr inbounds i32, i32* %load_result_47, i32 2
    %load_result_48 = load i32, i32* %getelementptr_reg_48
    %add_14 = add i32 %add_13, %load_result_48
    store i32 %mem2reg14, i32 %mem2reg43
    %eq_8 = icmp eq i32 %add_14, mem2reg43
    store i1 %eq_8, i1 %mem2reg3
    br label %short_circuit_AND_end_AND4

short_circuit_AND_end_AND5:                                  ; preds = short_circuit_AND_end_AND4 short_circuit_AND_branch_AND5 
    store i1 %mem2reg2, i1 %mem2reg44
    br i1 %mem2reg44, label %single_then_basicblock0, label %if_withoutelse_end_basicblock0

short_circuit_AND_branch_AND5:                               ; preds = short_circuit_AND_end_AND4 
    %make_24 = load i32**, i32*** @make
    %getelementptr_reg_49 = getelementptr inbounds i32*, i32** %make_24, i32 2
    %load_result_49 = load i32*, i32** %getelementptr_reg_49
    %getelementptr_reg_50 = getelementptr inbounds i32, i32* %load_result_49, i32 0
    %load_result_50 = load i32, i32* %getelementptr_reg_50
    %make_25 = load i32**, i32*** @make
    %getelementptr_reg_51 = getelementptr inbounds i32*, i32** %make_25, i32 1
    %load_result_51 = load i32*, i32** %getelementptr_reg_51
    %getelementptr_reg_52 = getelementptr inbounds i32, i32* %load_result_51, i32 1
    %load_result_52 = load i32, i32* %getelementptr_reg_52
    %add_15 = add i32 %load_result_50, %load_result_52
    %make_26 = load i32**, i32*** @make
    %getelementptr_reg_53 = getelementptr inbounds i32*, i32** %make_26, i32 0
    %load_result_53 = load i32*, i32** %getelementptr_reg_53
    %getelementptr_reg_54 = getelementptr inbounds i32, i32* %load_result_53, i32 2
    %load_result_54 = load i32, i32* %getelementptr_reg_54
    %add_16 = add i32 %add_15, %load_result_54
    store i32 %mem2reg14, i32 %mem2reg45
    %eq_9 = icmp eq i32 %add_16, mem2reg45
    store i1 %eq_9, i1 %mem2reg2
    br label %short_circuit_AND_end_AND5

single_then_basicblock0:                                     ; preds = short_circuit_AND_end_AND5 
    %count = load i32*, i32** @count
    %getelementptr_reg_55 = getelementptr inbounds i32, i32* %count, i32 0
    %load_result_55 = load i32, i32* %getelementptr_reg_55
    %count_0 = load i32*, i32** @count
    %getelementptr_reg_56 = getelementptr inbounds i32, i32* %count_0, i32 0
    %load_result_56 = load i32, i32* %getelementptr_reg_56
    %add_17 = add i32 %load_result_56, 1
    store i32 %add_17, i32* %getelementptr_reg_55
    store i32 %mem2reg13, i32 %mem2reg46
    store i32 0, i32 %mem2reg13
    br label %for_condition

if_withoutelse_end_basicblock0:                              ; preds = single_then_basicblock0 short_circuit_AND_end_AND5 for_end_merge 
    br label %if_end_basicblock

for_condition:                                               ; preds = single_then_basicblock0 for_step 
    store i32 %mem2reg13, i32 %mem2reg47
    %sle = icmp sle i32 mem2reg47, 2
    br i1 %sle, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    store i32 %mem2reg13, i32 %mem2reg48
    %add_19 = add i32 mem2reg48, 1
    store i32 %add_19, i32 %mem2reg13
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    store i32 %mem2reg12, i32 %mem2reg49
    store i32 0, i32 %mem2reg12
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    %const_string_pointer_1 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string1, i32 0, i32 0
    call void @print(i8* %const_string_pointer_1)
    br label %if_withoutelse_end_basicblock0

for_condition0:                                              ; preds = for_body for_step0 
    store i32 %mem2reg12, i32 %mem2reg50
    %sle_0 = icmp sle i32 mem2reg50, 2
    br i1 %sle_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    store i32 %mem2reg12, i32 %mem2reg51
    %add_18 = add i32 mem2reg51, 1
    store i32 %add_18, i32 %mem2reg12
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %make_27 = load i32**, i32*** @make
    store i32 %mem2reg13, i32 %mem2reg52
    %getelementptr_reg_57 = getelementptr inbounds i32*, i32** %make_27, i32 %mem2reg52
    %load_result_57 = load i32*, i32** %getelementptr_reg_57
    store i32 %mem2reg12, i32 %mem2reg53
    %getelementptr_reg_58 = getelementptr inbounds i32, i32* %load_result_57, i32 %mem2reg53
    %load_result_58 = load i32, i32* %getelementptr_reg_58
    %call_toString = call i8* @toString(i32 %load_result_58)
    call void @print(i8* %call_toString)
    %const_string_pointer = getelementptr inbounds [2 x i8], [2 x i8]* @const_string0, i32 0, i32 0
    call void @print(i8* %const_string_pointer)
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    %const_string_pointer_0 = getelementptr inbounds [2 x i8], [2 x i8]* @const_string1, i32 0, i32 0
    call void @print(i8* %const_string_pointer_0)
    br label %for_step

then_basicblock0:                                            ; preds = else_basicblock 
    %make_28 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg54
    %getelementptr_reg_59 = getelementptr inbounds i32*, i32** %make_28, i32 %mem2reg54
    %load_result_59 = load i32*, i32** %getelementptr_reg_59
    store i32 %mem2reg16, i32 %mem2reg55
    %getelementptr_reg_60 = getelementptr inbounds i32, i32* %load_result_59, i32 %mem2reg55
    %load_result_60 = load i32, i32* %getelementptr_reg_60
    %make_29 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg56
    %getelementptr_reg_61 = getelementptr inbounds i32*, i32** %make_29, i32 %mem2reg56
    %load_result_61 = load i32*, i32** %getelementptr_reg_61
    %getelementptr_reg_62 = getelementptr inbounds i32, i32* %load_result_61, i32 0
    %load_result_62 = load i32, i32* %getelementptr_reg_62
    %sub_3 = sub i32 15, %load_result_62
    %make_30 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg57
    %getelementptr_reg_63 = getelementptr inbounds i32*, i32** %make_30, i32 %mem2reg57
    %load_result_63 = load i32*, i32** %getelementptr_reg_63
    %getelementptr_reg_64 = getelementptr inbounds i32, i32* %load_result_63, i32 1
    %load_result_64 = load i32, i32* %getelementptr_reg_64
    %sub_4 = sub i32 %sub_3, %load_result_64
    store i32 %sub_4, i32* %getelementptr_reg_60
    %make_31 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg58
    %getelementptr_reg_65 = getelementptr inbounds i32*, i32** %make_31, i32 %mem2reg58
    %load_result_65 = load i32*, i32** %getelementptr_reg_65
    store i32 %mem2reg16, i32 %mem2reg59
    %getelementptr_reg_66 = getelementptr inbounds i32, i32* %load_result_65, i32 %mem2reg59
    %load_result_66 = load i32, i32* %getelementptr_reg_66
    %sgt_0 = icmp sgt i32 %load_result_66, 0
    store i1 %sgt_0, i1 %mem2reg1
    br i1 %sgt_0, label %short_circuit_AND_branch_AND6, label %short_circuit_AND_end_AND6

else_basicblock0:                                            ; preds = else_basicblock 
    store i32 %mem2reg13, i32 %mem2reg60
    store i32 1, i32 %mem2reg13
    br label %for_condition1

if_end_basicblock0:                                          ; preds = then_basicblock0 else_basicblock0 if_withoutelse_end_basicblock1 for_end_merge1 
    br label %if_end_basicblock

short_circuit_AND_end_AND6:                                  ; preds = then_basicblock0 short_circuit_AND_branch_AND6 
    store i1 %mem2reg1, i1 %mem2reg61
    store i1 %mem2reg61, i1 %mem2reg0
    br i1 %mem2reg61, label %short_circuit_AND_branch_AND7, label %short_circuit_AND_end_AND7

short_circuit_AND_branch_AND6:                               ; preds = then_basicblock0 
    %make_32 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg62
    %getelementptr_reg_67 = getelementptr inbounds i32*, i32** %make_32, i32 %mem2reg62
    %load_result_67 = load i32*, i32** %getelementptr_reg_67
    store i32 %mem2reg16, i32 %mem2reg63
    %getelementptr_reg_68 = getelementptr inbounds i32, i32* %load_result_67, i32 %mem2reg63
    %load_result_68 = load i32, i32* %getelementptr_reg_68
    %slt_0 = icmp slt i32 %load_result_68, 10
    store i1 %slt_0, i1 %mem2reg1
    br label %short_circuit_AND_end_AND6

short_circuit_AND_end_AND7:                                  ; preds = short_circuit_AND_end_AND6 short_circuit_AND_branch_AND7 
    store i1 %mem2reg0, i1 %mem2reg64
    br i1 %mem2reg64, label %single_then_basicblock1, label %if_withoutelse_end_basicblock1

short_circuit_AND_branch_AND7:                               ; preds = short_circuit_AND_end_AND6 
    %color = load i32*, i32** @color
    %make_33 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg65
    %getelementptr_reg_69 = getelementptr inbounds i32*, i32** %make_33, i32 %mem2reg65
    %load_result_69 = load i32*, i32** %getelementptr_reg_69
    store i32 %mem2reg16, i32 %mem2reg66
    %getelementptr_reg_70 = getelementptr inbounds i32, i32* %load_result_69, i32 %mem2reg66
    %load_result_70 = load i32, i32* %getelementptr_reg_70
    %getelementptr_reg_71 = getelementptr inbounds i32, i32* %color, i32 %load_result_70
    %load_result_71 = load i32, i32* %getelementptr_reg_71
    %eq_11 = icmp eq i32 %load_result_71, 0
    store i1 %eq_11, i1 %mem2reg0
    br label %short_circuit_AND_end_AND7

single_then_basicblock1:                                     ; preds = short_circuit_AND_end_AND7 
    %color_0 = load i32*, i32** @color
    %make_34 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg67
    %getelementptr_reg_72 = getelementptr inbounds i32*, i32** %make_34, i32 %mem2reg67
    %load_result_72 = load i32*, i32** %getelementptr_reg_72
    store i32 %mem2reg16, i32 %mem2reg68
    %getelementptr_reg_73 = getelementptr inbounds i32, i32* %load_result_72, i32 %mem2reg68
    %load_result_73 = load i32, i32* %getelementptr_reg_73
    %getelementptr_reg_74 = getelementptr inbounds i32, i32* %color_0, i32 %load_result_73
    %load_result_74 = load i32, i32* %getelementptr_reg_74
    store i32 1, i32* %getelementptr_reg_74
    store i32 %mem2reg16, i32 %mem2reg69
    %eq_12 = icmp eq i32 mem2reg69, 2
    br i1 %eq_12, label %then_basicblock1, label %else_basicblock1

if_withoutelse_end_basicblock1:                              ; preds = single_then_basicblock1 short_circuit_AND_end_AND7 if_end_basicblock1 
    br label %if_end_basicblock0

then_basicblock1:                                            ; preds = single_then_basicblock1 
    store i32 %mem2reg17, i32 %mem2reg70
    %add_20 = add i32 mem2reg70, 1
    store i32 %mem2reg15, i32 %mem2reg71
    %make_35 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg72
    %getelementptr_reg_75 = getelementptr inbounds i32*, i32** %make_35, i32 %mem2reg72
    %load_result_75 = load i32*, i32** %getelementptr_reg_75
    store i32 %mem2reg16, i32 %mem2reg73
    %getelementptr_reg_76 = getelementptr inbounds i32, i32* %load_result_75, i32 %mem2reg73
    %load_result_76 = load i32, i32* %getelementptr_reg_76
    %add_21 = add i32 mem2reg71, %load_result_76
    call void @search(i32 %add_20, i32 0, i32 %add_21)
    br label %if_end_basicblock1

else_basicblock1:                                            ; preds = single_then_basicblock1 
    store i32 %mem2reg17, i32 %mem2reg74
    store i32 %mem2reg16, i32 %mem2reg75
    %add_22 = add i32 mem2reg75, 1
    store i32 %mem2reg15, i32 %mem2reg76
    %make_36 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg77
    %getelementptr_reg_77 = getelementptr inbounds i32*, i32** %make_36, i32 %mem2reg77
    %load_result_77 = load i32*, i32** %getelementptr_reg_77
    store i32 %mem2reg16, i32 %mem2reg78
    %getelementptr_reg_78 = getelementptr inbounds i32, i32* %load_result_77, i32 %mem2reg78
    %load_result_78 = load i32, i32* %getelementptr_reg_78
    %add_23 = add i32 mem2reg76, %load_result_78
    call void @search(i32 mem2reg74, i32 %add_22, i32 %add_23)
    br label %if_end_basicblock1

if_end_basicblock1:                                          ; preds = then_basicblock1 else_basicblock1 
    %color_1 = load i32*, i32** @color
    %make_37 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg79
    %getelementptr_reg_79 = getelementptr inbounds i32*, i32** %make_37, i32 %mem2reg79
    %load_result_79 = load i32*, i32** %getelementptr_reg_79
    store i32 %mem2reg16, i32 %mem2reg80
    %getelementptr_reg_80 = getelementptr inbounds i32, i32* %load_result_79, i32 %mem2reg80
    %load_result_80 = load i32, i32* %getelementptr_reg_80
    %getelementptr_reg_81 = getelementptr inbounds i32, i32* %color_1, i32 %load_result_80
    %load_result_81 = load i32, i32* %getelementptr_reg_81
    store i32 0, i32* %getelementptr_reg_81
    br label %if_withoutelse_end_basicblock1

for_condition1:                                              ; preds = else_basicblock0 for_step1 
    store i32 %mem2reg13, i32 %mem2reg81
    %sle_1 = icmp sle i32 mem2reg81, 9
    br i1 %sle_1, label %for_body1, label %for_end_merge1

for_step1:                                                   ; preds = for_body1 if_withoutelse_end_basicblock2 
    store i32 %mem2reg13, i32 %mem2reg82
    %add_28 = add i32 mem2reg82, 1
    store i32 %add_28, i32 %mem2reg13
    br label %for_condition1

for_body1:                                                   ; preds = for_condition1 
    %color_2 = load i32*, i32** @color
    store i32 %mem2reg13, i32 %mem2reg83
    %getelementptr_reg_82 = getelementptr inbounds i32, i32* %color_2, i32 %mem2reg83
    %load_result_82 = load i32, i32* %getelementptr_reg_82
    %eq_13 = icmp eq i32 %load_result_82, 0
    br i1 %eq_13, label %single_then_basicblock2, label %if_withoutelse_end_basicblock2

for_end_merge1:                                              ; preds = for_condition1 
    br label %if_end_basicblock0

single_then_basicblock2:                                     ; preds = for_body1 
    %color_3 = load i32*, i32** @color
    store i32 %mem2reg13, i32 %mem2reg84
    %getelementptr_reg_83 = getelementptr inbounds i32, i32* %color_3, i32 %mem2reg84
    %load_result_83 = load i32, i32* %getelementptr_reg_83
    store i32 1, i32* %getelementptr_reg_83
    %make_38 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg85
    %getelementptr_reg_84 = getelementptr inbounds i32*, i32** %make_38, i32 %mem2reg85
    %load_result_84 = load i32*, i32** %getelementptr_reg_84
    store i32 %mem2reg16, i32 %mem2reg86
    %getelementptr_reg_85 = getelementptr inbounds i32, i32* %load_result_84, i32 %mem2reg86
    %load_result_85 = load i32, i32* %getelementptr_reg_85
    store i32 %mem2reg13, i32 %mem2reg87
    store i32 %mem2reg87, i32* %getelementptr_reg_85
    store i32 %mem2reg16, i32 %mem2reg88
    %eq_14 = icmp eq i32 mem2reg88, 2
    br i1 %eq_14, label %then_basicblock2, label %else_basicblock2

if_withoutelse_end_basicblock2:                              ; preds = single_then_basicblock2 for_body1 if_end_basicblock2 
    br label %for_step1

then_basicblock2:                                            ; preds = single_then_basicblock2 
    store i32 %mem2reg17, i32 %mem2reg89
    %add_24 = add i32 mem2reg89, 1
    store i32 %mem2reg15, i32 %mem2reg90
    store i32 %mem2reg13, i32 %mem2reg91
    %add_25 = add i32 mem2reg90, mem2reg91
    call void @search(i32 %add_24, i32 0, i32 %add_25)
    br label %if_end_basicblock2

else_basicblock2:                                            ; preds = single_then_basicblock2 
    store i32 %mem2reg17, i32 %mem2reg92
    store i32 %mem2reg16, i32 %mem2reg93
    %add_26 = add i32 mem2reg93, 1
    store i32 %mem2reg15, i32 %mem2reg94
    store i32 %mem2reg13, i32 %mem2reg95
    %add_27 = add i32 mem2reg94, mem2reg95
    call void @search(i32 mem2reg92, i32 %add_26, i32 %add_27)
    br label %if_end_basicblock2

if_end_basicblock2:                                          ; preds = then_basicblock2 else_basicblock2 
    %make_39 = load i32**, i32*** @make
    store i32 %mem2reg17, i32 %mem2reg96
    %getelementptr_reg_86 = getelementptr inbounds i32*, i32** %make_39, i32 %mem2reg96
    %load_result_86 = load i32*, i32** %getelementptr_reg_86
    store i32 %mem2reg16, i32 %mem2reg97
    %getelementptr_reg_87 = getelementptr inbounds i32, i32* %load_result_86, i32 %mem2reg97
    %load_result_87 = load i32, i32* %getelementptr_reg_87
    store i32 0, i32* %getelementptr_reg_87
    %color_4 = load i32*, i32** @color
    store i32 %mem2reg13, i32 %mem2reg98
    %getelementptr_reg_88 = getelementptr inbounds i32, i32* %color_4, i32 %mem2reg98
    %load_result_88 = load i32, i32* %getelementptr_reg_88
    store i32 0, i32* %getelementptr_reg_88
    br label %if_withoutelse_end_basicblock2

return_block0:                                               ; preds = if_withoutelse_end_basicblock 
    ret void
}
define dso_local void @origin(i32 %N_para) {
entrance_block0:                                             
    store i32 0, i32 %mem2reg99
    store i32 %N_para, i32 %mem2reg99
    %make = load i32**, i32*** @make
    store i32 %mem2reg99, i32 %mem2reg100
    %mul_bytes = mul i32 mem2reg100, 8
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 %mem2reg100, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32**
    store i32** %array_addr, i32*** @make
    %i = load i32, i32* @i
    store i32 0, i32* @i
    br label %for_condition

for_condition:                                               ; preds = entrance_block0 for_step 
    %i_0 = load i32, i32* @i
    store i32 %mem2reg99, i32 %mem2reg101
    %slt = icmp slt i32 %i_0, mem2reg101
    br i1 %slt, label %for_body, label %for_end_merge

for_step:                                                    ; preds = for_body for_end_merge0 
    %i_3 = load i32, i32* @i
    %add_0 = add i32 %i_3, 1
    store i32 %add_0, i32* @i
    br label %for_condition

for_body:                                                    ; preds = for_condition 
    %make_0 = load i32**, i32*** @make
    %i_1 = load i32, i32* @i
    %getelementptr_reg = getelementptr inbounds i32*, i32** %make_0, i32 %i_1
    %load_result = load i32*, i32** %getelementptr_reg
    store i32 %mem2reg99, i32 %mem2reg102
    %mul_bytes_0 = mul i32 mem2reg102, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 %mem2reg102, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** %getelementptr_reg
    %j = load i32, i32* @j
    store i32 0, i32* @j
    br label %for_condition0

for_end_merge:                                               ; preds = for_condition 
    br label %return_block0

for_condition0:                                              ; preds = for_body for_step0 
    %j_0 = load i32, i32* @j
    store i32 %mem2reg99, i32 %mem2reg103
    %slt_0 = icmp slt i32 %j_0, mem2reg103
    br i1 %slt_0, label %for_body0, label %for_end_merge0

for_step0:                                                   ; preds = for_body0 
    %j_2 = load i32, i32* @j
    %add = add i32 %j_2, 1
    store i32 %add, i32* @j
    br label %for_condition0

for_body0:                                                   ; preds = for_condition0 
    %make_1 = load i32**, i32*** @make
    %i_2 = load i32, i32* @i
    %getelementptr_reg_0 = getelementptr inbounds i32*, i32** %make_1, i32 %i_2
    %load_result_0 = load i32*, i32** %getelementptr_reg_0
    %j_1 = load i32, i32* @j
    %getelementptr_reg_1 = getelementptr inbounds i32, i32* %load_result_0, i32 %j_1
    %load_result_1 = load i32, i32* %getelementptr_reg_1
    store i32 0, i32* %getelementptr_reg_1
    br label %for_step0

for_end_merge0:                                              ; preds = for_condition0 
    br label %for_step

return_block0:                                               ; preds = for_end_merge 
    ret void
}
define dso_local i32 @main() {
entrance_block0:                                             
    call void @GLOBAL__sub_I_main_mx()
    store i32 0, i32 %mem2reg104
    %count = load i32*, i32** @count
    %getelementptr_reg = getelementptr inbounds i32, i32* %count, i32 0
    %load_result = load i32, i32* %getelementptr_reg
    store i32 0, i32* %getelementptr_reg
    call void @origin(i32 3)
    call void @search(i32 0, i32 0, i32 0)
    %count_0 = load i32*, i32** @count
    %getelementptr_reg_0 = getelementptr inbounds i32, i32* %count_0, i32 0
    %load_result_0 = load i32, i32* %getelementptr_reg_0
    %call_toString = call i8* @toString(i32 %load_result_0)
    call void @println(i8* %call_toString)
    store i32 0, i32 %mem2reg104
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    store i32 %mem2reg104, i32 %mem2reg105
    ret i32 %mem2reg105
}
define dso_local void @GLOBAL__sub_I_main_mx() {
entrance_block0:                                             
    %mul_bytes = mul i32 10, 4
    %sum_bytes = add i32 %mul_bytes, 4
    %malloca = call i8* @_f_malloc(i32 %sum_bytes)
    %array_cast_i8_to_i32 = bitcast i8* %malloca to i32*
    store i32 10, i32* %array_cast_i8_to_i32
    %array_tmp_begin_i32 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32, i32 1
    %array_addr = bitcast i32* %array_tmp_begin_i32 to i32*
    store i32* %array_addr, i32** @color
    %mul_bytes_0 = mul i32 1, 4
    %sum_bytes_0 = add i32 %mul_bytes_0, 4
    %malloca_0 = call i8* @_f_malloc(i32 %sum_bytes_0)
    %array_cast_i8_to_i32_0 = bitcast i8* %malloca_0 to i32*
    store i32 1, i32* %array_cast_i8_to_i32_0
    %array_tmp_begin_i32_0 = getelementptr inbounds i32, i32* %array_cast_i8_to_i32_0, i32 1
    %array_addr_0 = bitcast i32* %array_tmp_begin_i32_0 to i32*
    store i32* %array_addr_0, i32** @count
    br label %return_block0

return_block0:                                               ; preds = entrance_block0 
    ret void
}
