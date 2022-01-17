package RISCV.Instruction;

import Backend.ASMVisitor;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;

public class RISCV_Instruction_Binary extends Base_RISCV_Instruction{
    public enum RISCVBinarytype{
        add,sub,mul,div,rem,
        //set less than
        slt,sgt,
        //shift left shift right
        sll,sra,
        and,or,xor
    }
    RISCVBinarytype riscvBinarytype;

    public RISCV_Instruction_Binary(RISCVBinarytype riscvBinarytype_,Base_RISCV_Register rs1_, Base_RISCV_Register rs2_, Base_RISCV_Register rd_) {
        super(rs1_, rs2_, rd_, null);
        riscvBinarytype=riscvBinarytype_;
    }

    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return null;
    }
}
