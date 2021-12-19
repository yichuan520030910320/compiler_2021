package IR.Operand;

import IR.TypeSystem.Typesystem;

public class ConstOperand_Null extends BaseOperand{
    public ConstOperand_Null(Typesystem typesystem) {
        super(typesystem);
    }

    @Override
    public String toString() {
        return "null";
    }

    @Override
    public String unit_output() {
        return type.toString()+" "+"null";
    }
}
