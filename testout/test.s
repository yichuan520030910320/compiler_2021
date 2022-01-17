    .text

    .global main					# start function : main
    .p2align	2
main:
.LBB_main_entrance_block0:
    addi	sp,sp,-32
    sw	ra,28(sp)
    sw	s0,24(sp)
    addi	s0,sp,32
    call	GLOBAL__sub_I_main.mx
    li	t5,1
    sw	t5,-16(s0)
    lw	t3,-16(s0)
    mv	a0,t3
    call	printlnInt
    sw	zero,-12(s0)
    j	.LBB_main_return_block0
.LBB_main_return_block0:
    lw	t5,-12(s0)
    sw	t5,-20(s0)
    lw	t3,-20(s0)
    mv	a0,t3
    lw	s0,20(sp)
    lw	ra,28(sp)
    addi	sp,sp,32
    ret
# end function : main

    .global GLOBAL__sub_I_main.mx					# start function : GLOBAL__sub_I_main.mx
    .p2align	2
GLOBAL__sub_I_main.mx:
.LBB_GLOBAL__sub_I_main.mx_entrance_block0:
    addi	sp,sp,-20
    sw	ra,16(sp)
    sw	s0,12(sp)
    addi	s0,sp,20
    j	.LBB_GLOBAL__sub_I_main.mx_return_block0
.LBB_GLOBAL__sub_I_main.mx_return_block0:
    mv	a0,zero
    lw	s0,8(sp)
    lw	ra,16(sp)
    addi	sp,sp,20
    ret
# end function : GLOBAL__sub_I_main.mx

