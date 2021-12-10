package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.BaseOperand;
import IR.Operand.Register;

public class BinaryInstruction extends BaseInstru{
    public BaseOperand result_operand;
    public BaseOperand operand1;
    public BaseOperand operand2;
    public Enum_Binary_IRInstruction op;
    public BinaryInstruction(IRbasicblock iRbasicblock, BaseOperand result_operand_, BaseOperand operand1_, BaseOperand operand2_, Enum_Binary_IRInstruction op_) {
        super(iRbasicblock);
        result_operand=result_operand_;
        operand1=operand1_;
        operand2=operand2_;
        op=op_;
        result_operand.Add_def(this);
        if (operand1 instanceof Register)operand1.Add_be_used(this);
        if (operand2 instanceof Register)operand2.Add_be_used(this);
    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

//eg %add.0 = add i32 9, %c.0
    @Override
    public String toString() {
        return result_operand.toString()+" = "+op.name()+" "+operand1.type.toString()+" "+operand1.toString()+", "+operand2.toString();
    }
}
