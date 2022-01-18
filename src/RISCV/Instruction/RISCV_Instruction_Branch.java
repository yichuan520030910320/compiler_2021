package RISCV.Instruction;

import Backend.ASMVisitor;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.Operand.Base_RISCV_Operand;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;

import java.util.Locale;

public class RISCV_Instruction_Branch extends Base_RISCV_Instruction{

    public enum BranchType{
        BEQZ, BNEZ, BLEZ, BGEZ, BLTZ, BGTZ
    }
    BranchType branchType;
    String jmpdest;

    public RISCV_Instruction_Branch(BranchType branchType_, Base_RISCV_Register rs1,String jmplabel) {
        super(rs1,null,null,null);
        branchType=branchType_;

        jmpdest=jmplabel;
    }

    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return branchType.toString().toLowerCase(Locale.ROOT)+"\t"+rs1+",\t"+jmpdest;
    }
}
