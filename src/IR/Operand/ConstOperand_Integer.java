package IR.Operand;

import IR.TypeSystem.Typesystem;

public class ConstOperand_Integer extends BaseOperand{
    public int value;
    public ConstOperand_Integer(Typesystem typesystem,int value_) {
        super(typesystem);
        value=value_;
    }

    @Override
    public String toString() {
        return String.valueOf(value);
    }

    @Override
    public String unit_output() {
        return type.toString()+" "+String.valueOf(value);
    }
}
