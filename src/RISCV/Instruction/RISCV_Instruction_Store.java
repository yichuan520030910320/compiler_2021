package RISCV.Instruction;

import Backend.ASMVisitor;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;

public class RISCV_Instruction_Store extends Base_RISCV_Instruction {
    enum Store_Type {
        sb, sh, sw
    }

    Store_Type store_type;
    //M[R[rs1]+imm](7:0)=R[rs2](7:0)
    public RISCV_Instruction_Store(int store_bytes, Base_RISCV_Register rs1_, Base_RISCV_Register rs2_, Immediate imm_) {
        super(rs1_, rs2_,null, imm_);
        if (store_bytes == 1) store_type = Store_Type.sb;
        else if (store_bytes == 2) store_type = Store_Type.sh;
        else store_type = Store_Type.sw;
    }

    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return store_type.name() + "\t" + rs2 + "," + immediate + "(" + rs1 + ")";
    }
}
