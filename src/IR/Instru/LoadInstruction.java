package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.BaseOperand;
import IR.Operand.Register;

//  %6 = load i32, i32* %2, align 4
public class LoadInstruction extends BaseInstru {
    public BaseOperand destination_register;
    public BaseOperand source_pointer;



    public LoadInstruction(IRbasicblock iRbasicblock,BaseOperand destination_register_,BaseOperand source_pointer_) {
        super(iRbasicblock);
        destination_register=destination_register_;
        source_pointer=source_pointer_;
        //to add the relation :instruction use operands
        if (source_pointer instanceof Register)source_pointer.Add_be_used(this);
        destination_register.Add_def(this);
    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

//eg : %c.0 = load i32, i32* %c$addr.0
    @Override
    public String toString() {
        return destination_register.toString()+" = load "+destination_register.type.toString()+", "+source_pointer.unit_output();
    }
}
