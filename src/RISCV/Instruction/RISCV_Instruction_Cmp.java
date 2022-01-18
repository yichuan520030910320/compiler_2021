package RISCV.Instruction;


import IR.Instru.Enum_Compare_IRInstruction;
import RISCV.Operand.Register.Base_RISCV_Register;

public class RISCV_Instruction_Cmp extends Base_RISCV_Instruction{
    public enum RISCVCompareType{
        seq,sne,seqz,snez,slt,sle,sgt,sge
    }
    public RISCVCompareType cmp_type;
    public RISCV_Instruction_Cmp(RISCVCompareType cmp, Base_RISCV_Register rs1_, Base_RISCV_Register rs2_, Base_RISCV_Register rd_) {
        super(rs1_, rs2_, rd_, null);
        cmp_type=cmp;
    }

    @Override
    public String toString() {
        if (cmp_type==RISCVCompareType.seqz||cmp_type==RISCVCompareType.snez)return cmp_type.name()+"\t"+rd+","+rs1;
        return cmp_type.name()+"\t"+rd+","+rs1+","+rs2;
    }
}
