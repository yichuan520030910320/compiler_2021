    .text

    .globl qpow					# start function : qpow
    .p2align	2
qpow:
.LBB_qpow_entrance_block0:
    addi	sp,sp,-44
    sw	ra,40(sp)
    sw	s0,36(sp)
    addi	s0,sp,44
    sw	zero,-12(s0)
    sw	zero,-16(s0)
    sw	zero,-20(s0)
    sw	zero,-24(s0)
    sw	zero,-28(s0)
    sw	zero,-32(s0)
    sw	a0,-28(s0)
    sw	a1,-24(s0)
    sw	a2,-20(s0)
    li	t0,1
    sw	t0,-16(s0)
    lw	t0,-28(s0)
    sw	t0,-12(s0)
    j	.LBB_qpow_while_condition
.LBB_qpow_while_condition:
    lw	t0,-24(s0)
    sgt	t0,t0,zero
    beqz	t0,	.LBB_qpow_while_end_merge
    j	.LBB_qpow_while_body
.LBB_qpow_while_body:
    lw	t0,-24(s0)
    li	t1,1
    and	t0,t0,t1
    li	t1,1
    xor	t0,t0,t1
    seqz	t0,t0
    beqz	t0,	.LBB_qpow_if_withoutelse_end_basicblock
    j	.LBB_qpow_single_then_basicblock
.LBB_qpow_while_end_merge:
    lw	t0,-16(s0)
    sw	t0,-32(s0)
    j	.LBB_qpow_return_block0
.LBB_qpow_single_then_basicblock:
    lw	t0,-16(s0)
    lw	t1,-16(s0)
    lw	t0,-12(s0)
    mul	t1,t1,t0
    lw	t0,-20(s0)
    rem	t0,t1,t0
    sw	t0,-16(s0)
    j	.LBB_qpow_if_withoutelse_end_basicblock
.LBB_qpow_if_withoutelse_end_basicblock:
    lw	t0,-12(s0)
    lw	t1,-12(s0)
    mul	t0,t0,t1
    lw	t1,-20(s0)
    rem	t0,t0,t1
    sw	t0,-12(s0)
    lw	t0,-24(s0)
    li	t1,2
    div	t0,t0,t1
    sw	t0,-24(s0)
    j	.LBB_qpow_while_condition
.LBB_qpow_return_block0:
    lw	a0,-32(s0)
    lw	s0,36(sp)
    lw	ra,40(sp)
    addi	sp,sp,44
    ret
# end function : qpow

    .globl main					# start function : main
    .p2align	2
main:
.LBB_main_entrance_block0:
    addi	sp,sp,-24
    sw	ra,20(sp)
    sw	s0,16(sp)
    addi	s0,sp,24
    call	GLOBAL__sub_I_main_mx
    sw	zero,-12(s0)
    li	a0,2
    li	a1,10
    li	a2,10000
    call	qpow
    call	toString
    call	println
    sw	zero,-12(s0)
    j	.LBB_main_return_block0
.LBB_main_return_block0:
    lw	a0,-12(s0)
    lw	s0,16(sp)
    lw	ra,20(sp)
    addi	sp,sp,24
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

