package RISCV.Instruction;

import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;

public class RISCV_Instruction_Load extends Base_RISCV_Instruction{
    enum Load_Type{
        lb,lh,lw
    }
    Load_Type load_type;
    public RISCV_Instruction_Load(int load_bytes,Base_RISCV_Register rd_,Base_RISCV_Register rs1_,Immediate imm_) {
        super(rs1_,null,rd_,imm_);
        if (load_bytes==1)load_type=Load_Type.lb;
        else if (load_bytes==2)load_type=Load_Type.lh;
        else load_type=Load_Type.lw;

    }

    @Override
    public String toString() {
        return load_type.name()+"\t"+rd+",\t"+immediate+"("+rs1+")";
    }
}
