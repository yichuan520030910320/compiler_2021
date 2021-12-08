package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.BaseOperand;
import IR.Operand.Register;
import IR.TypeSystem.Typesystem;
import IR.TypeSystem.VoidType;

public class RetInstruction extends BaseInstru{
    public BaseOperand Ret_Operand;
    public Typesystem Ret_Type;

    public RetInstruction(IRbasicblock iRbasicblock, BaseOperand RetOperand, Typesystem RetType) {
        super(iRbasicblock);
        Ret_Operand=RetOperand;
        Ret_Type=RetType;
        if (RetOperand instanceof Register)RetOperand.Add_be_used(this);
    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {

        if (Ret_Type instanceof VoidType)return  "ret void";
         else return "ret "+Ret_Operand.unit_output();
    }
}
