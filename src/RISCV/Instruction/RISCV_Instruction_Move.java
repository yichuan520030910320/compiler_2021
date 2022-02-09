package RISCV.Instruction;

import Backend.ASMVisitor;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.Operand.Base_RISCV_Operand;
import RISCV.Operand.Register.Base_RISCV_Register;

public class RISCV_Instruction_Move extends Base_RISCV_Instruction{
    //equal to reg[rd]=reg[0]+reg[rs1] add operand
    public RISCV_Instruction_Move(Base_RISCV_Register rs1_, Base_RISCV_Register rd_){

        super(rs1_,null,rd_,null);

        if (rs1_==null){

            System.out.println("...?");
        }
    }
    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "mv\t"+rd+","+rs1;
    }
}
