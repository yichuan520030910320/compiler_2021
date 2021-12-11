package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.BaseOperand;
import IR.Operand.Register;
import IR.TypeSystem.PointerType;

import java.util.ArrayList;

public class GetElementPtrInstruction extends BaseInstru {
    public Register result_register;
    // source ptr can be global var
    public BaseOperand source_ptr;
    public ArrayList<BaseOperand> index_offset;


    public GetElementPtrInstruction(IRbasicblock iRbasicblock, Register result_register_, BaseOperand source_ptr_, ArrayList<BaseOperand> index_offset_) {
        super(iRbasicblock);
        result_register = result_register_;
        source_ptr = source_ptr_;
        index_offset = index_offset_;
    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        StringBuilder returnstring = new StringBuilder(result_register.toString() + " = getelementptr inbounds " + ((PointerType)source_ptr.type).get_low_dim_type() + ", " + source_ptr.unit_output() + ", ");
        for (int i = 0; i < index_offset.size(); i++) {
            returnstring.append(index_offset.get(i).unit_output());
            if (i != index_offset.size() - 1) returnstring.append(", ");
        }
        return returnstring.toString();
    }
}