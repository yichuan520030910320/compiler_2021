    .text

    .globl exchange					# start function : exchange
    .p2align	2
exchange:
.LBB_exchange_entrance_block0:
    addi	sp,sp,-20
    sw	ra,16(sp)
    sw	s0,12(sp)
    addi	s0,sp,20
    mv	t1,zero
    mv	t0,zero
    mv	t2,a0
    mv	t0,a1
    lw	a0,a
    li	t1,4
    mul	t1,t1,t2
    add	t1,a0,t1
    lw	t1,0(t1)
    lw	a0,a
    li	a1,4
    mul	t2,a1,t2
    add	t2,a0,t2
    lw	a0,0(t2)
    lw	a1,a
    li	a0,4
    mul	a0,a0,t0
    add	a0,a1,a0
    lw	a0,0(a0)
    sw	a0,0(t2)
    lw	t2,a
    li	a0,4
    mul	t0,a0,t0
    add	t0,t2,t0
    lw	t2,0(t0)
    sw	t1,0(t0)
    j	.LBB_exchange_return_block0
.LBB_exchange_return_block0:
    lw	s0,12(sp)
    lw	ra,16(sp)
    addi	sp,sp,20
    ret
# end function : exchange

    .globl main					# start function : main
    .p2align	2
main:
.LBB_main_entrance_block0:
    addi	sp,sp,-24
    sw	ra,20(sp)
    sw	s0,16(sp)
    addi	s0,sp,24
    sw	s4,-12(s0)
    call	GLOBAL__sub_I_main_mx
    mv	s4,zero
    mv	a0,zero
    lw	t0,n
    call	getString
    call	_str_parseInt
    la	t0,n
    sw	a0,0(t0)
    lw	t0,a
    lw	s4,n
    li	t0,4
    mul	t0,s4,t0
    addi	a0,t0,4
    call	_f_malloc
    sw	s4,0(a0)
    addi	t0,a0,4
    la	t1,a
    sw	t0,0(t1)
    mv	s4,zero
    j	.LBB_main_for_condition
.LBB_main_for_condition:
    lw	t0,a
    addi	t0,t0,-4
    lw	t0,0(t0)
    slt	t0,s4,t0
    beqz	t0,	.LBB_main_for_end_merge
    j	.LBB_main_for_body
.LBB_main_for_step:
    addi	t0,s4,1
    mv	s4,t0
    j	.LBB_main_for_condition
.LBB_main_for_body:
    lw	t1,a
    li	t0,4
    mul	t0,t0,s4
    add	t1,t1,t0
    lw	t0,0(t1)
    sw	s4,0(t1)
    j	.LBB_main_for_step
.LBB_main_for_end_merge:
    call	makeHeap
    call	heapSort
    mv	s4,zero
    j	.LBB_main_for_condition0
.LBB_main_for_condition0:
    lw	t0,a
    addi	t0,t0,-4
    lw	t0,0(t0)
    slt	t0,s4,t0
    beqz	t0,	.LBB_main_for_end_merge0
    j	.LBB_main_for_body0
.LBB_main_for_step0:
    addi	t0,s4,1
    mv	s4,t0
    j	.LBB_main_for_condition0
.LBB_main_for_body0:
    lw	t1,a
    li	t0,4
    mul	t0,t0,s4
    add	t0,t1,t0
    lw	a0,0(t0)
    call	toString
    la	a1,const_string0
    call	_str_concatenate
    call	print
    j	.LBB_main_for_step0
.LBB_main_for_end_merge0:
    la	a0,const_string1
    call	print
    mv	a0,zero
    j	.LBB_main_return_block0
.LBB_main_return_block0:
    lw	s4,-12(s0)
    lw	s0,16(sp)
    lw	ra,20(sp)
    addi	sp,sp,24
    ret
# end function : main

    .globl adjustHeap					# start function : adjustHeap
    .p2align	2
adjustHeap:
.LBB_adjustHeap_entrance_block0:
    addi	sp,sp,-20
    sw	ra,16(sp)
    sw	s0,12(sp)
    addi	s0,sp,20
    mv	a1,a0
    mv	a0,zero
    mv	a0,zero
    mv	t1,zero
    mv	t1,zero
    mv	t0,zero
    mv	t2,zero
    mv	a0,zero
    mv	t2,a1
    mv	t0,zero
    mv	t1,zero
    j	.LBB_adjustHeap_while_condition
.LBB_adjustHeap_while_condition:
    li	t1,2
    mul	t1,t0,t1
    slt	t1,t1,t2
    beqz	t1,	.LBB_adjustHeap_while_end_merge
    j	.LBB_adjustHeap_while_body
.LBB_adjustHeap_while_body:
    li	t1,2
    mul	t1,t0,t1
    li	a0,2
    mul	a0,t0,a0
    addi	a0,a0,1
    slt	a0,a0,t2
    beqz	a0,	.LBB_adjustHeap_short_circuit_AND_end_AND
    j	.LBB_adjustHeap_short_circuit_AND_branch_AND
.LBB_adjustHeap_while_end_merge:
    mv	a0,zero
    j	.LBB_adjustHeap_return_block0
.LBB_adjustHeap_short_circuit_AND_end_AND:
    beqz	a0,	.LBB_adjustHeap_if_withoutelse_end_basicblock
    j	.LBB_adjustHeap_single_then_basicblock
.LBB_adjustHeap_short_circuit_AND_branch_AND:
    lw	a1,a
    li	a0,2
    mul	a0,t0,a0
    addi	a0,a0,1
    li	a2,4
    mul	a0,a2,a0
    add	a0,a1,a0
    lw	a2,0(a0)
    lw	a0,a
    li	a1,2
    mul	a3,t0,a1
    li	a1,4
    mul	a1,a1,a3
    add	a0,a0,a1
    lw	a0,0(a0)
    slt	a0,a2,a0
    j	.LBB_adjustHeap_short_circuit_AND_end_AND
.LBB_adjustHeap_single_then_basicblock:
    li	t1,2
    mul	t1,t0,t1
    addi	t1,t1,1
    j	.LBB_adjustHeap_if_withoutelse_end_basicblock
.LBB_adjustHeap_if_withoutelse_end_basicblock:
    lw	a0,a
    li	a1,4
    mul	a1,a1,t0
    add	a0,a0,a1
    lw	a2,0(a0)
    lw	a1,a
    li	a0,4
    mul	a0,a0,t1
    add	a0,a1,a0
    lw	a0,0(a0)
    sgt	a0,a2,a0
    beqz	a0,	.LBB_adjustHeap_else_basicblock
    j	.LBB_adjustHeap_then_basicblock
.LBB_adjustHeap_then_basicblock:
    lw	a1,a
    li	a0,4
    mul	a0,a0,t0
    add	a0,a1,a0
    lw	a0,0(a0)
    lw	a1,a
    li	a2,4
    mul	t0,a2,t0
    add	a2,a1,t0
    lw	t0,a
    li	a1,4
    mul	a1,a1,t1
    add	t0,t0,a1
    lw	t0,0(t0)
    sw	t0,0(a2)
    lw	a1,a
    li	t0,4
    mul	t0,t0,t1
    add	t0,a1,t0
    lw	a1,0(t0)
    sw	a0,0(t0)
    mv	t0,t1
    j	.LBB_adjustHeap_if_end_basicblock
.LBB_adjustHeap_else_basicblock:
    j	.LBB_adjustHeap_while_end_merge
.LBB_adjustHeap_if_end_basicblock:
    j	.LBB_adjustHeap_while_condition
.LBB_adjustHeap_return_block0:
    lw	s0,12(sp)
    lw	ra,16(sp)
    addi	sp,sp,20
    ret
# end function : adjustHeap

    .globl heapSort					# start function : heapSort
    .p2align	2
heapSort:
.LBB_heapSort_entrance_block0:
    addi	sp,sp,-24
    sw	ra,20(sp)
    sw	s0,16(sp)
    addi	s0,sp,24
    sw	s2,-12(s0)
    mv	s2,zero
    mv	t0,zero
    mv	a0,zero
    mv	t0,zero
    mv	s2,zero
    j	.LBB_heapSort_for_condition
.LBB_heapSort_for_condition:
    lw	t0,n
    slt	t0,s2,t0
    beqz	t0,	.LBB_heapSort_for_end_merge
    j	.LBB_heapSort_for_body
.LBB_heapSort_for_step:
    addi	t0,s2,1
    mv	s2,t0
    j	.LBB_heapSort_for_condition
.LBB_heapSort_for_body:
    lw	t0,a
    lw	t0,0(t0)
    lw	t1,a
    addi	a0,t1,0
    lw	t1,0(a0)
    lw	a1,a
    lw	t1,n
    sub	t1,t1,s2
    addi	t1,t1,-1
    li	t2,4
    mul	t1,t2,t1
    add	t1,a1,t1
    lw	t1,0(t1)
    sw	t1,0(a0)
    lw	t2,a
    lw	t1,n
    sub	t1,t1,s2
    addi	a0,t1,-1
    li	t1,4
    mul	t1,t1,a0
    add	t1,t2,t1
    lw	t2,0(t1)
    sw	t0,0(t1)
    lw	t0,n
    sub	t0,t0,s2
    addi	a0,t0,-1
    call	adjustHeap
    j	.LBB_heapSort_for_step
.LBB_heapSort_for_end_merge:
    mv	a0,zero
    j	.LBB_heapSort_return_block0
.LBB_heapSort_return_block0:
    lw	s2,-12(s0)
    lw	s0,16(sp)
    lw	ra,20(sp)
    addi	sp,sp,24
    ret
# end function : heapSort

    .globl makeHeap					# start function : makeHeap
    .p2align	2
makeHeap:
.LBB_makeHeap_entrance_block0:
    addi	sp,sp,-24
    sw	ra,20(sp)
    sw	s0,16(sp)
    addi	s0,sp,24
    sw	s4,-12(s0)
    mv	t0,zero
    mv	a1,zero
    mv	t0,zero
    mv	s4,zero
    mv	a0,zero
    lw	t0,n
    addi	t1,t0,-1
    li	t0,2
    div	t0,t1,t0
    mv	s4,t0
    mv	t0,zero
    mv	a1,zero
    j	.LBB_makeHeap_while_condition
.LBB_makeHeap_while_condition:
    slt	t0,s4,zero
    xori	t0,t0,1
    beqz	t0,	.LBB_makeHeap_while_end_merge
    j	.LBB_makeHeap_while_body
.LBB_makeHeap_while_body:
    li	t0,2
    mul	a1,s4,t0
    li	t0,2
    mul	t0,s4,t0
    addi	t0,t0,1
    lw	t1,n
    slt	t0,t0,t1
    beqz	t0,	.LBB_makeHeap_short_circuit_AND_end_AND
    j	.LBB_makeHeap_short_circuit_AND_branch_AND
.LBB_makeHeap_while_end_merge:
    mv	a0,zero
    j	.LBB_makeHeap_return_block0
.LBB_makeHeap_short_circuit_AND_end_AND:
    beqz	t0,	.LBB_makeHeap_if_withoutelse_end_basicblock
    j	.LBB_makeHeap_single_then_basicblock
.LBB_makeHeap_short_circuit_AND_branch_AND:
    lw	t2,a
    li	t0,2
    mul	t0,s4,t0
    addi	t0,t0,1
    li	t1,4
    mul	t0,t1,t0
    add	t0,t2,t0
    lw	a0,0(t0)
    lw	t2,a
    li	t0,2
    mul	t0,s4,t0
    li	t1,4
    mul	t0,t1,t0
    add	t0,t2,t0
    lw	t0,0(t0)
    slt	t0,a0,t0
    j	.LBB_makeHeap_short_circuit_AND_end_AND
.LBB_makeHeap_single_then_basicblock:
    li	t0,2
    mul	t0,s4,t0
    addi	a1,t0,1
    j	.LBB_makeHeap_if_withoutelse_end_basicblock
.LBB_makeHeap_if_withoutelse_end_basicblock:
    lw	t0,a
    li	t1,4
    mul	t1,t1,s4
    add	t0,t0,t1
    lw	t1,0(t0)
    lw	t0,a
    li	t2,4
    mul	t2,t2,a1
    add	t0,t0,t2
    lw	t0,0(t0)
    sgt	t0,t1,t0
    beqz	t0,	.LBB_makeHeap_if_withoutelse_end_basicblock0
    j	.LBB_makeHeap_single_then_basicblock0
.LBB_makeHeap_single_then_basicblock0:
    mv	a0,s4
    call	exchange
    j	.LBB_makeHeap_if_withoutelse_end_basicblock0
.LBB_makeHeap_if_withoutelse_end_basicblock0:
    addi	t0,s4,-1
    mv	s4,t0
    j	.LBB_makeHeap_while_condition
.LBB_makeHeap_return_block0:
    lw	s4,-12(s0)
    lw	s0,16(sp)
    lw	ra,20(sp)
    addi	sp,sp,24
    ret
# end function : makeHeap

    .globl GLOBAL__sub_I_main_mx					# start function : GLOBAL__sub_I_main_mx
    .p2align	2
GLOBAL__sub_I_main_mx:
.LBB_GLOBAL__sub_I_main_mx_entrance_block0:
    addi	sp,sp,-20
    sw	ra,16(sp)
    sw	s0,12(sp)
    addi	s0,sp,20
    j	.LBB_GLOBAL__sub_I_main_mx_return_block0
.LBB_GLOBAL__sub_I_main_mx_return_block0:
    lw	s0,12(sp)
    lw	ra,16(sp)
    addi	sp,sp,20
    ret
# end function : GLOBAL__sub_I_main_mx


	.section	.sdata
	.p2align	2
	.globl	a
a:
	.word	0

	.p2align	2
	.globl	n
n:
	.word	0


	.section	.rodata
	.p2align	2
const_string0:
	.string	" "

	.section	.rodata
	.p2align	2
const_string1:
	.string	"\n"

