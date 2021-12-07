package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.BaseOperand;
import IR.Operand.Register;

//  store i32 0, i32* %1, align 4
public class StoreInstruction extends BaseInstru {
    public BaseOperand source_operand;
    public BaseOperand dest_operand;
    public StoreInstruction(IRbasicblock iRbasicblock,BaseOperand source_operand_,BaseOperand dest_operand_) {
        super(iRbasicblock);
        source_operand=source_operand_;
        dest_operand=dest_operand_;
        if (source_operand instanceof Register) source_operand.Add_be_used(this);
        if (dest_operand instanceof Register) dest_operand.Add_def(this);
    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

//store i32 9, i32* %c$addr.0
    @Override
    public String toString() {
        return "store "+dest_operand.unit_output()+", "+source_operand.unit_output();
    }
}
