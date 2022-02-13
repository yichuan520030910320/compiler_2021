package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.BaseOperand;
import IR.Operand.ConstOperand_Null;
import IR.Operand.Register;
import IR.TypeSystem.PointerType;

//  store i32 0, i32* %1, align 4
public class StoreInstruction extends BaseInstru {
    public BaseOperand source_operand;
    public BaseOperand dest_operand;
    public StoreInstruction(IRbasicblock iRbasicblock,BaseOperand source_operand_,BaseOperand dest_operand_) {
        super(iRbasicblock);
        source_operand=source_operand_;
        if (dest_operand_==null){
            System.out.println("what ??");
        }
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
        if (source_operand instanceof ConstOperand_Null)return "store "+((PointerType)dest_operand.type).get_low_dim_type()+" null"+", "+dest_operand.unit_output();
        return "store "+source_operand.unit_output()+", "+dest_operand.unit_output();
    }
}
