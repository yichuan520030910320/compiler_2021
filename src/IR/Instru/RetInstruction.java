package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.Operand.BaseOperand;
import IR.TypeSystem.Typesystem;

public class RetInstruction extends BaseInstru{
    public BaseOperand Ret_Operand;
    public Typesystem Ret_Type;

    public RetInstruction(IRbasicblock iRbasicblock, BaseOperand RetOperand, Typesystem RetType) {
        super(iRbasicblock);
        Ret_Operand=RetOperand;
        Ret_Type=RetType;
    }
}
