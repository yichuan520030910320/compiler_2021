package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.BaseOperand;
import IR.Operand.Register;

//    %greaterThan.0 = icmp sgt i32 %a.1, 1
public class CmpInstruction extends BaseInstru{
    public Register cmp_result;
    public Enum_Compare_IRInstruction cmp_operation;
    public BaseOperand operand1;
    public BaseOperand operand2;
    public CmpInstruction(IRbasicblock iRbasicblock,Register cmp_result_,Enum_Compare_IRInstruction cmp_operation_,BaseOperand operand1_,BaseOperand operand2_) {
        super(iRbasicblock);
        cmp_result=cmp_result_;
        cmp_operation=cmp_operation_;
        operand1=operand1_;
        operand2=operand2_;
        operand1.Add_be_used(this);
        operand2.Add_be_used(this);
        cmp_result.Add_def(this);
    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return cmp_result.toString()+" = icmp "+cmp_operation.name()+" "+operand1.type.toString()+" "+operand1.toString()+", "+operand2.toString();
    }
}
