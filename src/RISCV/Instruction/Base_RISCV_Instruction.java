package RISCV.Instruction;

import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;

import java.util.HashSet;

abstract public class Base_RISCV_Instruction {
    public Base_RISCV_Register rs1,rs2,rd;
    public Immediate immediate;
    public ASM_Basicblock asm_basicblock;

    public Base_RISCV_Instruction(Base_RISCV_Register rs1_,Base_RISCV_Register rs2_,Base_RISCV_Register rd_,Immediate imm_) {
        rs1=rs1_;
        rs2=rs2_;
        rd=rd_;
        immediate=imm_;

    }

    //add use def chain
    public HashSet<Base_RISCV_Register> reg_def=new HashSet<>(),reg_use=new HashSet<>();

public abstract String toString();
}
