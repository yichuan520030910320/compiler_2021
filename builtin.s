	.text
	.file	"builtin.c"
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
	sw	a0, 8(sp)
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
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
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
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
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
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end3:
	.size	printlnInt, .Lfunc_end3-printlnInt
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
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	addi	a1, sp, 8
	call	__isoc99_scanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end4:
	.size	getInt, .Lfunc_end4-getInt
	.cfi_endproc
                                        # -- End function
	.globl	toString                # -- Begin function toString
	.p2align	2
	.type	toString,@function
toString:                               # @toString
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	sw	a0, 8(sp)
	addi	a0, zero, 13
	mv	a1, zero
	call	malloc
	lw	a2, 8(sp)
	sw	a0, 0(sp)
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	call	sprintf
	lw	a0, 0(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end5:
	.size	toString, .Lfunc_end5-toString
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
	addi	a0, zero, 1024
	mv	a1, zero
	call	malloc
	mv	a1, a0
	sw	a0, 8(sp)
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	__isoc99_scanf
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end6:
	.size	getString, .Lfunc_end6-getString
	.cfi_endproc
                                        # -- End function
	.globl	_str_ord                # -- Begin function _str_ord
	.p2align	2
	.type	_str_ord,@function
_str_ord:                               # @_str_ord
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
.Lfunc_end7:
	.size	_str_ord, .Lfunc_end7-_str_ord
	.cfi_endproc
                                        # -- End function
	.globl	_str_eq                 # -- Begin function _str_eq
	.p2align	2
	.type	_str_eq,@function
_str_eq:                                # @_str_eq
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	sw	a0, 8(sp)
	sw	a1, 0(sp)
	call	strcmp
	seqz	a0, a0
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end8:
	.size	_str_eq, .Lfunc_end8-_str_eq
	.cfi_endproc
                                        # -- End function
	.globl	_str_ne                 # -- Begin function _str_ne
	.p2align	2
	.type	_str_ne,@function
_str_ne:                                # @_str_ne
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	sw	a0, 8(sp)
	sw	a1, 0(sp)
	call	strcmp
	snez	a0, a0
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end9:
	.size	_str_ne, .Lfunc_end9-_str_ne
	.cfi_endproc
                                        # -- End function
	.globl	_str_lt                 # -- Begin function _str_lt
	.p2align	2
	.type	_str_lt,@function
_str_lt:                                # @_str_lt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	sw	a0, 8(sp)
	sw	a1, 0(sp)
	call	strcmp
	srli	a0, a0, 31
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end10:
	.size	_str_lt, .Lfunc_end10-_str_lt
	.cfi_endproc
                                        # -- End function
	.globl	_str_le                 # -- Begin function _str_le
	.p2align	2
	.type	_str_le,@function
_str_le:                                # @_str_le
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	sw	a0, 8(sp)
	sw	a1, 0(sp)
	call	strcmp
	slti	a0, a0, 1
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end11:
	.size	_str_le, .Lfunc_end11-_str_le
	.cfi_endproc
                                        # -- End function
	.globl	_str_gt                 # -- Begin function _str_gt
	.p2align	2
	.type	_str_gt,@function
_str_gt:                                # @_str_gt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	sw	a0, 8(sp)
	sw	a1, 0(sp)
	call	strcmp
	sgtz	a0, a0
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end12:
	.size	_str_gt, .Lfunc_end12-_str_gt
	.cfi_endproc
                                        # -- End function
	.globl	_str_ge                 # -- Begin function _str_ge
	.p2align	2
	.type	_str_ge,@function
_str_ge:                                # @_str_ge
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	sw	a0, 8(sp)
	sw	a1, 0(sp)
	call	strcmp
	not	a0, a0
	srli	a0, a0, 31
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end13:
	.size	_str_ge, .Lfunc_end13-_str_ge
	.cfi_endproc
                                        # -- End function
	.globl	_str_concatenate        # -- Begin function _str_concatenate
	.p2align	2
	.type	_str_concatenate,@function
_str_concatenate:                       # @_str_concatenate
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	.cfi_offset ra, -4
	sw	a0, 24(sp)
	sw	a1, 16(sp)
	addi	a0, zero, 1024
	mv	a1, zero
	call	malloc
	lw	a1, 24(sp)
	sw	a0, 8(sp)
	call	strcpy
	lw	a0, 8(sp)
	lw	a1, 16(sp)
	call	strcat
	lw	a0, 8(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end14:
	.size	_str_concatenate, .Lfunc_end14-_str_concatenate
	.cfi_endproc
                                        # -- End function
	.globl	_f_malloc               # -- Begin function _f_malloc
	.p2align	2
	.type	_f_malloc,@function
_f_malloc:                              # @_f_malloc
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	sw	a0, 8(sp)
	srai	a1, a0, 31
	call	malloc
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end15:
	.size	_f_malloc, .Lfunc_end15-_f_malloc
	.cfi_endproc
                                        # -- End function
	.globl	_str_length             # -- Begin function _str_length
	.p2align	2
	.type	_str_length,@function
_str_length:                            # @_str_length
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	sw	a0, 8(sp)
	call	strlen
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end16:
	.size	_str_length, .Lfunc_end16-_str_length
	.cfi_endproc
                                        # -- End function
	.globl	_str_substring          # -- Begin function _str_substring
	.p2align	2
	.type	_str_substring,@function
_str_substring:                         # @_str_substring
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
	addi	a0, a0, 1
	srai	a1, a0, 31
	call	malloc
	lw	a1, 24(sp)
	lw	a2, 20(sp)
	lw	a3, 16(sp)
	sw	a0, 8(sp)
	add	a1, a1, a2
	sub	a2, a3, a2
	call	memcpy
	lw	a0, 16(sp)
	lw	a1, 20(sp)
	lw	a2, 8(sp)
	sub	a0, a0, a1
	add	a0, a2, a0
	sb	zero, 0(a0)
	lw	a0, 8(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end17:
	.size	_str_substring, .Lfunc_end17-_str_substring
	.cfi_endproc
                                        # -- End function
	.globl	_str_parseInt           # -- Begin function _str_parseInt
	.p2align	2
	.type	_str_parseInt,@function
_str_parseInt:                          # @_str_parseInt
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	.cfi_offset ra, -4
	sw	a0, 8(sp)
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	addi	a2, sp, 4
	call	__isoc99_sscanf
	lw	a0, 4(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end18:
	.size	_str_parseInt, .Lfunc_end18-_str_parseInt
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s\n"
	.size	.L.str, 4

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%d"
	.size	.L.str.1, 3

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%d\n"
	.size	.L.str.2, 4

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"%s"
	.size	.L.str.3, 3

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
