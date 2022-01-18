package RISCV.Instruction;

import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;

public class RISCV_Instruction_La extends Base_RISCV_Instruction {
    public String gloal_addr;
//R[rd]=" address "
    public RISCV_Instruction_La(String gloal_addr_, Base_RISCV_Register rd_) {
        super(null, null, rd_, null);
        gloal_addr = gloal_addr_;
    }
    @Override
    public String toString() {
        return "la\t" + rd + "," + gloal_addr;
    }
}
