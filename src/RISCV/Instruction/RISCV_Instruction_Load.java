package RISCV.Instruction;

import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;

public class RISCV_Instruction_Load extends Base_RISCV_Instruction{
    enum Load_Type{
        lb,lh,lw
    }
    //about global ld rd x rs1
    //R[rd]={48^(')b0,M[R[rs1]+imm](15:0)}
    Load_Type load_type;
    public String global_data_name=null;
    public RISCV_Instruction_Load(int load_bytes,Base_RISCV_Register rs1_,Base_RISCV_Register rd_,Immediate imm_) {
        super(rs1_,null,rd_,imm_);
        if (imm_!=null&&imm_.imm_val==-16){

            System.out.println("debug .... here");
        }
        if (load_bytes==1)load_type=Load_Type.lb;
        else if (load_bytes==2)load_type=Load_Type.lh;
        else load_type=Load_Type.lw;

    }

    @Override
    public String toString() {
        if (!(global_data_name==null))return load_type.name()+"\t"+rd+","+global_data_name;
        return load_type.name()+"\t"+rd+","+immediate+"("+rs1+")";
    }
}
