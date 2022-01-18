	.text
	.file	"builtin1.c"
	.globl	print                   # -- Begin function print
	.p2align	2
	.type	print,@function
print:                                  # @print
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	mv	a1, a0
	sw	a0, 8(sp)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	print, .Lfunc_end0-print
	.cfi_endproc
                                        # -- End function
	.globl	println                 # -- Begin function println
	.p2align	2
	.type	println,@function
println:                                # @println
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	mv	a1, a0
	sw	a0, 8(sp)
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	println, .Lfunc_end1-println
	.cfi_endproc
                                        # -- End function
	.globl	printInt                # -- Begin function printInt
	.p2align	2
	.type	printInt,@function
printInt:                               # @printInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	mv	a1, a0
	sw	a0, 8(sp)
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end2:
	.size	printInt, .Lfunc_end2-printInt
	.cfi_endproc
                                        # -- End function
	.globl	printlnInt              # -- Begin function printlnInt
	.p2align	2
	.type	printlnInt,@function
printlnInt:                             # @printlnInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	mv	a1, a0
	sw	a0, 8(sp)
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	printf
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end3:
	.size	printlnInt, .Lfunc_end3-printlnInt
	.cfi_endproc
                                        # -- End function
	.globl	getString               # -- Begin function getString
	.p2align	2
	.type	getString,@function
getString:                              # @getString
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	addi	a0, zero, 257
	mv	a1, zero
	call	malloc
	mv	a1, a0
	sw	a0, 8(sp)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	__isoc99_scanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end4:
	.size	getString, .Lfunc_end4-getString
	.cfi_endproc
                                        # -- End function
	.globl	getInt                  # -- Begin function getInt
	.p2align	2
	.type	getInt,@function
getInt:                                 # @getInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	addi	a1, sp, 8
	call	__isoc99_scanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end5:
	.size	getInt, .Lfunc_end5-getInt
	.cfi_endproc
                                        # -- End function
	.globl	toString                # -- Begin function toString
	.p2align	2
	.type	toString,@function
toString:                               # @toString
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	sw	a0, 28(sp)
	beqz	a0, .LBB6_3
# %bb.1:
	lw	a1, 28(sp)
	addi	a0, zero, 1
	sb	zero, 12(sp)
	blt	a1, a0, .LBB6_4
# %bb.2:
	sb	zero, 13(sp)
	j	.LBB6_5
.LBB6_3:
	addi	a0, zero, 2
	mv	a1, zero
	call	malloc
	sw	a0, 24(sp)
	addi	a1, zero, 48
	sb	a1, 0(a0)
	lw	a0, 24(sp)
	sb	zero, 1(a0)
	lw	a0, 24(sp)
	j	.LBB6_13
.LBB6_4:
	lw	a1, 28(sp)
	sb	a0, 13(sp)
	neg	a0, a1
	sw	a0, 28(sp)
.LBB6_5:
	addi	a6, zero, 1
	lui	a1, 419430
	addi	a1, a1, 1639
	addi	a2, zero, 10
	addi	s0, sp, 14
	lw	a3, 28(sp)
	blt	a3, a6, .LBB6_7
.LBB6_6:                                # =>This Inner Loop Header: Depth=1
	lw	a3, 28(sp)
	mulh	a4, a3, a1
	srli	a5, a4, 31
	srai	a4, a4, 2
	lb	a0, 12(sp)
	add	a4, a4, a5
	mul	a5, a4, a2
	sub	a3, a3, a5
	addi	a5, a0, 1
	sb	a5, 12(sp)
	add	a0, s0, a0
	sb	a3, 0(a0)
	sw	a4, 28(sp)
	lw	a3, 28(sp)
	bge	a3, a6, .LBB6_6
.LBB6_7:
	lb	a0, 13(sp)
	lb	a1, 12(sp)
	add	a0, a0, a1
	addi	a0, a0, 1
	srai	a1, a0, 31
	call	malloc
	lb	a1, 13(sp)
	addi	a2, zero, 1
	sw	a0, 8(sp)
	blt	a1, a2, .LBB6_9
# %bb.8:
	lw	a0, 8(sp)
	addi	a1, zero, 45
	sb	a1, 0(a0)
.LBB6_9:
	sb	zero, 7(sp)
.LBB6_10:                               # =>This Inner Loop Header: Depth=1
	lb	a0, 7(sp)
	lb	a1, 12(sp)
	bge	a0, a1, .LBB6_12
# %bb.11:                               #   in Loop: Header=BB6_10 Depth=1
	lb	a0, 12(sp)
	lb	a1, 7(sp)
	sub	a0, a0, a1
	add	a0, a0, s0
	lb	a0, -1(a0)
	lb	a2, 13(sp)
	lw	a3, 8(sp)
	addi	a0, a0, 48
	add	a1, a1, a2
	add	a1, a3, a1
	sb	a0, 0(a1)
	lb	a0, 7(sp)
	addi	a0, a0, 1
	sb	a0, 7(sp)
	j	.LBB6_10
.LBB6_12:
	lb	a0, 12(sp)
	lb	a1, 13(sp)
	lw	a2, 8(sp)
	add	a0, a0, a1
	add	a0, a2, a0
	sb	zero, 0(a0)
	lw	a0, 8(sp)
.LBB6_13:
	sw	a0, 32(sp)
	lw	a0, 32(sp)
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end6:
	.size	toString, .Lfunc_end6-toString
	.cfi_endproc
                                        # -- End function
	.globl	__string_concatenate    # -- Begin function __string_concatenate
	.p2align	2
	.type	__string_concatenate,@function
__string_concatenate:                   # @__string_concatenate
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	.cfi_offset ra, -4
	sw	a0, 40(sp)
	sw	a1, 32(sp)
	sw	zero, 28(sp)
	sw	zero, 24(sp)
.LBB7_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 40(sp)
	lw	a1, 28(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB7_4
# %bb.2:                                #   in Loop: Header=BB7_1 Depth=1
	lw	a0, 28(sp)
	addi	a0, a0, 1
	sw	a0, 28(sp)
	j	.LBB7_1
.LBB7_3:                                #   in Loop: Header=BB7_4 Depth=1
	lw	a0, 24(sp)
	addi	a0, a0, 1
	sw	a0, 24(sp)
.LBB7_4:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 32(sp)
	lw	a1, 24(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	bnez	a0, .LBB7_3
# %bb.5:
	lw	a0, 28(sp)
	lw	a1, 24(sp)
	add	a0, a0, a1
	addi	a0, a0, 1
	srai	a1, a0, 31
	call	malloc
	sw	a0, 16(sp)
	sw	zero, 12(sp)
	sw	zero, 8(sp)
.LBB7_6:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 8(sp)
	lw	a1, 28(sp)
	bge	a0, a1, .LBB7_8
# %bb.7:                                #   in Loop: Header=BB7_6 Depth=1
	lw	a0, 8(sp)
	lw	a1, 40(sp)
	addi	a2, a0, 1
	sw	a2, 8(sp)
	lw	a2, 12(sp)
	add	a0, a1, a0
	lw	a1, 16(sp)
	lb	a0, 0(a0)
	addi	a3, a2, 1
	sw	a3, 12(sp)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB7_6
.LBB7_8:
	sw	zero, 8(sp)
.LBB7_9:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 8(sp)
	lw	a1, 24(sp)
	bge	a0, a1, .LBB7_11
# %bb.10:                               #   in Loop: Header=BB7_9 Depth=1
	lw	a0, 8(sp)
	lw	a1, 32(sp)
	addi	a2, a0, 1
	sw	a2, 8(sp)
	lw	a2, 12(sp)
	add	a0, a1, a0
	lw	a1, 16(sp)
	lb	a0, 0(a0)
	addi	a3, a2, 1
	sw	a3, 12(sp)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB7_9
.LBB7_11:
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	sb	zero, 0(a0)
	lw	a0, 16(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end7:
	.size	__string_concatenate, .Lfunc_end7-__string_concatenate
	.cfi_endproc
                                        # -- End function
	.globl	__string_equal          # -- Begin function __string_equal
	.p2align	2
	.type	__string_equal,@function
__string_equal:                         # @__string_equal
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	a0, 24(sp)
	sw	a1, 16(sp)
	sw	zero, 12(sp)
.LBB8_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB8_3
# %bb.2:                                #   in Loop: Header=BB8_1 Depth=1
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	snez	a0, a0
	bnez	a0, .LBB8_4
	j	.LBB8_6
.LBB8_3:                                #   in Loop: Header=BB8_1 Depth=1
	mv	a0, zero
	beqz	a0, .LBB8_6
.LBB8_4:                                #   in Loop: Header=BB8_1 Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	bne	a0, a1, .LBB8_7
# %bb.5:                                #   in Loop: Header=BB8_1 Depth=1
	lw	a0, 12(sp)
	addi	a0, a0, 1
	sw	a0, 12(sp)
	j	.LBB8_1
.LBB8_6:
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	xor	a0, a0, a1
	seqz	a0, a0
	sb	a0, 31(sp)
	j	.LBB8_8
.LBB8_7:
	sb	zero, 31(sp)
.LBB8_8:
	lb	a0, 31(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end8:
	.size	__string_equal, .Lfunc_end8-__string_equal
	.cfi_endproc
                                        # -- End function
	.globl	__string_notEqual       # -- Begin function __string_notEqual
	.p2align	2
	.type	__string_notEqual,@function
__string_notEqual:                      # @__string_notEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	a0, 24(sp)
	sw	a1, 16(sp)
	sw	zero, 12(sp)
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB9_3
# %bb.2:                                #   in Loop: Header=BB9_1 Depth=1
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	snez	a0, a0
	bnez	a0, .LBB9_4
	j	.LBB9_6
.LBB9_3:                                #   in Loop: Header=BB9_1 Depth=1
	mv	a0, zero
	beqz	a0, .LBB9_6
.LBB9_4:                                #   in Loop: Header=BB9_1 Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	bne	a0, a1, .LBB9_7
# %bb.5:                                #   in Loop: Header=BB9_1 Depth=1
	lw	a0, 12(sp)
	addi	a0, a0, 1
	sw	a0, 12(sp)
	j	.LBB9_1
.LBB9_6:
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	xor	a0, a0, a1
	snez	a0, a0
	j	.LBB9_8
.LBB9_7:
	addi	a0, zero, 1
.LBB9_8:
	sb	a0, 31(sp)
	lb	a0, 31(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end9:
	.size	__string_notEqual, .Lfunc_end9-__string_notEqual
	.cfi_endproc
                                        # -- End function
	.globl	__string_lessThan       # -- Begin function __string_lessThan
	.p2align	2
	.type	__string_lessThan,@function
__string_lessThan:                      # @__string_lessThan
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	a0, 24(sp)
	sw	a1, 16(sp)
	sw	zero, 12(sp)
.LBB10_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB10_3
# %bb.2:                                #   in Loop: Header=BB10_1 Depth=1
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	snez	a0, a0
	bnez	a0, .LBB10_4
	j	.LBB10_7
.LBB10_3:                               #   in Loop: Header=BB10_1 Depth=1
	mv	a0, zero
	beqz	a0, .LBB10_7
.LBB10_4:                               #   in Loop: Header=BB10_1 Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	blt	a0, a1, .LBB10_9
# %bb.5:                                #   in Loop: Header=BB10_1 Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	blt	a1, a0, .LBB10_10
# %bb.6:                                #   in Loop: Header=BB10_1 Depth=1
	lw	a0, 12(sp)
	addi	a0, a0, 1
	sw	a0, 12(sp)
	j	.LBB10_1
.LBB10_7:
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	bnez	a0, .LBB10_10
# %bb.8:
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB10_10
.LBB10_9:
	addi	a0, zero, 1
	sb	a0, 31(sp)
	j	.LBB10_11
.LBB10_10:
	sb	zero, 31(sp)
.LBB10_11:
	lb	a0, 31(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end10:
	.size	__string_lessThan, .Lfunc_end10-__string_lessThan
	.cfi_endproc
                                        # -- End function
	.globl	__string_greaterThan    # -- Begin function __string_greaterThan
	.p2align	2
	.type	__string_greaterThan,@function
__string_greaterThan:                   # @__string_greaterThan
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	a0, 24(sp)
	sw	a1, 16(sp)
	sw	zero, 12(sp)
.LBB11_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB11_3
# %bb.2:                                #   in Loop: Header=BB11_1 Depth=1
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	snez	a0, a0
	bnez	a0, .LBB11_4
	j	.LBB11_7
.LBB11_3:                               #   in Loop: Header=BB11_1 Depth=1
	mv	a0, zero
	beqz	a0, .LBB11_7
.LBB11_4:                               #   in Loop: Header=BB11_1 Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	blt	a0, a1, .LBB11_10
# %bb.5:                                #   in Loop: Header=BB11_1 Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	blt	a1, a0, .LBB11_8
# %bb.6:                                #   in Loop: Header=BB11_1 Depth=1
	lw	a0, 12(sp)
	addi	a0, a0, 1
	sw	a0, 12(sp)
	j	.LBB11_1
.LBB11_7:
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB11_9
.LBB11_8:
	addi	a0, zero, 1
	sb	a0, 31(sp)
	j	.LBB11_11
.LBB11_9:
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
.LBB11_10:
	sb	zero, 31(sp)
.LBB11_11:
	lb	a0, 31(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end11:
	.size	__string_greaterThan, .Lfunc_end11-__string_greaterThan
	.cfi_endproc
                                        # -- End function
	.globl	__string_lessEqual      # -- Begin function __string_lessEqual
	.p2align	2
	.type	__string_lessEqual,@function
__string_lessEqual:                     # @__string_lessEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	a0, 24(sp)
	sw	a1, 16(sp)
	sw	zero, 12(sp)
.LBB12_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB12_3
# %bb.2:                                #   in Loop: Header=BB12_1 Depth=1
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	snez	a0, a0
	bnez	a0, .LBB12_4
	j	.LBB12_7
.LBB12_3:                               #   in Loop: Header=BB12_1 Depth=1
	mv	a0, zero
	beqz	a0, .LBB12_7
.LBB12_4:                               #   in Loop: Header=BB12_1 Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	blt	a0, a1, .LBB12_10
# %bb.5:                                #   in Loop: Header=BB12_1 Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	blt	a1, a0, .LBB12_8
# %bb.6:                                #   in Loop: Header=BB12_1 Depth=1
	lw	a0, 12(sp)
	addi	a0, a0, 1
	sw	a0, 12(sp)
	j	.LBB12_1
.LBB12_7:
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB12_9
.LBB12_8:
	sb	zero, 31(sp)
	j	.LBB12_11
.LBB12_9:
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
.LBB12_10:
	addi	a0, zero, 1
	sb	a0, 31(sp)
.LBB12_11:
	lb	a0, 31(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end12:
	.size	__string_lessEqual, .Lfunc_end12-__string_lessEqual
	.cfi_endproc
                                        # -- End function
	.globl	__string_greaterEqual   # -- Begin function __string_greaterEqual
	.p2align	2
	.type	__string_greaterEqual,@function
__string_greaterEqual:                  # @__string_greaterEqual
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	a0, 24(sp)
	sw	a1, 16(sp)
	sw	zero, 12(sp)
.LBB13_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB13_3
# %bb.2:                                #   in Loop: Header=BB13_1 Depth=1
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	snez	a0, a0
	bnez	a0, .LBB13_4
	j	.LBB13_7
.LBB13_3:                               #   in Loop: Header=BB13_1 Depth=1
	mv	a0, zero
	beqz	a0, .LBB13_7
.LBB13_4:                               #   in Loop: Header=BB13_1 Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	blt	a0, a1, .LBB13_10
# %bb.5:                                #   in Loop: Header=BB13_1 Depth=1
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	lw	a2, 16(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	add	a1, a2, a1
	lb	a1, 0(a1)
	blt	a1, a0, .LBB13_8
# %bb.6:                                #   in Loop: Header=BB13_1 Depth=1
	lw	a0, 12(sp)
	addi	a0, a0, 1
	sw	a0, 12(sp)
	j	.LBB13_1
.LBB13_7:
	lw	a0, 24(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB13_9
.LBB13_8:
	addi	a0, zero, 1
	sb	a0, 31(sp)
	j	.LBB13_11
.LBB13_9:
	lw	a0, 16(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB13_8
.LBB13_10:
	sb	zero, 31(sp)
.LBB13_11:
	lb	a0, 31(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end13:
	.size	__string_greaterEqual, .Lfunc_end13-__string_greaterEqual
	.cfi_endproc
                                        # -- End function
	.globl	__string_length         # -- Begin function __string_length
	.p2align	2
	.type	__string_length,@function
__string_length:                        # @__string_length
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	a0, 8(sp)
	sw	zero, 4(sp)
.LBB14_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 8(sp)
	lw	a1, 4(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	beqz	a0, .LBB14_3
# %bb.2:                                #   in Loop: Header=BB14_1 Depth=1
	lw	a0, 4(sp)
	addi	a0, a0, 1
	sw	a0, 4(sp)
	j	.LBB14_1
.LBB14_3:
	lw	a0, 4(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end14:
	.size	__string_length, .Lfunc_end14-__string_length
	.cfi_endproc
                                        # -- End function
	.globl	__string_substring      # -- Begin function __string_substring
	.p2align	2
	.type	__string_substring,@function
__string_substring:                     # @__string_substring
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	.cfi_offset ra, -4
	sw	a0, 24(sp)
	sw	a1, 20(sp)
	sw	a2, 16(sp)
	sub	a0, a2, a1
	sw	a0, 12(sp)
	addi	a0, a0, 1
	srai	a1, a0, 31
	call	malloc
	sw	a0, 8(sp)
	sw	zero, 4(sp)
.LBB15_1:                               # =>This Inner Loop Header: Depth=1
	lw	a0, 4(sp)
	lw	a1, 12(sp)
	bge	a0, a1, .LBB15_3
# %bb.2:                                #   in Loop: Header=BB15_1 Depth=1
	lw	a0, 20(sp)
	lw	a1, 4(sp)
	lw	a2, 24(sp)
	add	a0, a0, a1
	add	a0, a2, a0
	lw	a2, 8(sp)
	lb	a0, 0(a0)
	add	a1, a2, a1
	sb	a0, 0(a1)
	lw	a0, 4(sp)
	addi	a0, a0, 1
	sw	a0, 4(sp)
	j	.LBB15_1
.LBB15_3:
	lw	a0, 8(sp)
	lw	a1, 12(sp)
	add	a0, a0, a1
	sb	zero, 0(a0)
	lw	a0, 8(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end15:
	.size	__string_substring, .Lfunc_end15-__string_substring
	.cfi_endproc
                                        # -- End function
	.globl	__string_parseInt       # -- Begin function __string_parseInt
	.p2align	2
	.type	__string_parseInt,@function
__string_parseInt:                      # @__string_parseInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	a0, 8(sp)
	sw	zero, 4(sp)
	sw	zero, 0(sp)
	addi	a0, zero, 48
	addi	a1, zero, 10
	j	.LBB16_3
.LBB16_1:                               #   in Loop: Header=BB16_3 Depth=1
	mv	a2, zero
	beqz	a2, .LBB16_6
.LBB16_2:                               #   in Loop: Header=BB16_3 Depth=1
	lw	a2, 0(sp)
	lw	a3, 8(sp)
	lw	a4, 4(sp)
	addi	a5, a2, 1
	sw	a5, 0(sp)
	add	a2, a3, a2
	lb	a2, 0(a2)
	mul	a3, a4, a1
	add	a2, a3, a2
	addi	a2, a2, -48
	sw	a2, 4(sp)
.LBB16_3:                               # =>This Inner Loop Header: Depth=1
	lw	a2, 8(sp)
	lw	a3, 0(sp)
	add	a2, a2, a3
	lb	a2, 0(a2)
	beqz	a2, .LBB16_1
# %bb.4:                                #   in Loop: Header=BB16_3 Depth=1
	lw	a2, 8(sp)
	lw	a3, 0(sp)
	add	a2, a2, a3
	lb	a2, 0(a2)
	blt	a2, a0, .LBB16_1
# %bb.5:                                #   in Loop: Header=BB16_3 Depth=1
	lw	a2, 8(sp)
	lw	a3, 0(sp)
	add	a2, a2, a3
	lb	a2, 0(a2)
	slti	a2, a2, 58
	bnez	a2, .LBB16_2
.LBB16_6:
	lw	a0, 4(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end16:
	.size	__string_parseInt, .Lfunc_end16-__string_parseInt
	.cfi_endproc
                                        # -- End function
	.globl	__string_ord            # -- Begin function __string_ord
	.p2align	2
	.type	__string_ord,@function
__string_ord:                           # @__string_ord
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	a0, 8(sp)
	sw	a1, 4(sp)
	add	a0, a0, a1
	lb	a0, 0(a0)
	addi	sp, sp, 16
	ret
.Lfunc_end17:
	.size	__string_ord, .Lfunc_end17-__string_ord
	.cfi_endproc
                                        # -- End function
	.globl	__array_size            # -- Begin function __array_size
	.p2align	2
	.type	__array_size,@function
__array_size:                           # @__array_size
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	a0, 8(sp)
	lw	a0, -4(a0)
	addi	sp, sp, 16
	ret
.Lfunc_end18:
	.size	__array_size, .Lfunc_end18-__array_size
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s"
	.size	.L.str, 3

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%s\n"
	.size	.L.str.1, 4

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%d"
	.size	.L.str.2, 3

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"%d\n"
	.size	.L.str.3, 4

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
