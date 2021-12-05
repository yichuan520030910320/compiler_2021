package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.Operand.BaseOperand;
import IR.TypeSystem.Typesystem;

public class Ret_Instruction extends BaseInstru{
    public BaseOperand Ret_Operand;
    public Typesystem Ret_Type;

    public Ret_Instruction(IRbasicblock iRbasicblock,BaseOperand RetOperand,Typesystem RetType) {
        super(iRbasicblock);
        Ret_Operand=RetOperand;
        Ret_Type=RetType;
    }
}
