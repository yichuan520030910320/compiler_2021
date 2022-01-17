package RISCV.Instruction;

import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;

public class RISCV_Instruction_Li extends Base_RISCV_Instruction{


    public RISCV_Instruction_Li(Base_RISCV_Register rs1_, Base_RISCV_Register rs2_, Base_RISCV_Register rd_, Immediate imm_) {
        super(rs1_, rs2_, rd_, imm_);
    }

    @Override
    public String toString() {
        return null;
    }
}
