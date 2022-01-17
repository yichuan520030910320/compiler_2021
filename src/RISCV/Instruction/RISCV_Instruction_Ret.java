package RISCV.Instruction;

import Backend.ASMVisitor;
import RISCV.ASM_Basicblock.ASM_Basicblock;

public class RISCV_Instruction_Ret extends Base_RISCV_Instruction {

    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

    public RISCV_Instruction_Ret() {
        super(null,null,null,null);
    }

    @Override
    public String toString() {
        return "ret";
    }
}
