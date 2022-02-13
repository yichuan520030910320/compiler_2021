    .text

    .globl qpow					# start function : qpow
    .p2align	2
qpow:
.LBB_qpow_entrance_block0:
    addi	sp,sp,-20
    sw	ra,16(sp)
    sw	s0,12(sp)
    addi	s0,sp,20
    mv	t0,a0
    li	a0,1
    j	.LBB_qpow_while_condition
.LBB_qpow_while_condition:
    sgt	t1,a1,zero
    beqz	t1,	.LBB_qpow_while_end_merge
    j	.LBB_qpow_while_body
.LBB_qpow_while_body:
    andi	t1,a1,1
    xori	t1,t1,1
    seqz	t1,t1
    beqz	t1,	.LBB_qpow_if_withoutelse_end_basicblock
    j	.LBB_qpow_single_then_basicblock
.LBB_qpow_while_end_merge:
    j	.LBB_qpow_return_block0
.LBB_qpow_single_then_basicblock:
    mul	t1,a0,t0
    rem	a0,t1,a2
    j	.LBB_qpow_if_withoutelse_end_basicblock
.LBB_qpow_if_withoutelse_end_basicblock:
    mv	t1,t0
    mul	t0,t0,t1
    rem	t0,t0,a2
    li	t1,2
    div	a1,a1,t1
    j	.LBB_qpow_while_condition
.LBB_qpow_return_block0:
    lw	s0,12(sp)
    lw	ra,16(sp)
    addi	sp,sp,20
    ret
# end function : qpow

    .globl main					# start function : main
    .p2align	2
main:
.LBB_main_entrance_block0:
    addi	sp,sp,-20
    sw	ra,16(sp)
    sw	s0,12(sp)
    addi	s0,sp,20
    call	GLOBAL__sub_I_main_mx
    li	a0,2
    li	a1,10
    li	a2,10000
    call	qpow
    call	printlnInt
    mv	a0,zero
    j	.LBB_main_return_block0
.LBB_main_return_block0:
    lw	s0,12(sp)
    lw	ra,16(sp)
    addi	sp,sp,20
    ret
# end function : main

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

