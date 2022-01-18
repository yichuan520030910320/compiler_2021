package RISCV.Instruction;

import IR.Instru.BinaryInstruction;
import IR.Instru.Enum_Binary_IRInstruction;
import IR.Instru.Enum_Compare_IRInstruction;
import IR.Instru.StoreInstruction;
import IR.Operand.ConstOperand_Integer;
import IR.Operand.Register;
import IR.TypeSystem.IntegerSubType;
import IR.TypeSystem.IntegerType;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;

public class RISCV_Instruction_Cmp extends Base_RISCV_Instruction{
    public enum RISCVCompareType{
        seq,sne,slt,sle,sgt,sge
    }
    public RISCVCompareType cmp_type;
    public RISCV_Instruction_Cmp(Enum_Compare_IRInstruction cmp, Base_RISCV_Register rs1_, Base_RISCV_Register rs2_, Base_RISCV_Register rd_) {
        super(rs1_, rs2_, rd_, null);
        switch (cmp) {
            case  slt-> cmp_type=RISCVCompareType.slt;
            case  sgt-> cmp_type=RISCVCompareType.sgt;
            case  sle-> cmp_type=RISCVCompareType.sle;
            case  sge-> cmp_type=RISCVCompareType.sge;
            case  eq-> cmp_type=RISCVCompareType.seq;
            case  ne-> cmp_type=RISCVCompareType.sne;
        }
    }

    @Override
    public String toString() {
        return cmp_type.name()+"\t"+rd+","+rs1+","+rs2;
    }
}
