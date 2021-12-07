package IR.Operand;

import IR.TypeSystem.Typesystem;
//eg @mmmmm = dso_local global i8 1, align 1
public class ConstOperand_Bool extends BaseOperand{
    public boolean bool_value;
    public ConstOperand_Bool(Typesystem typesystem,boolean bool_value_) {
        super(typesystem);
        bool_value=bool_value_;
    }

    @Override
    public String toString() {
        return String.valueOf(bool_value);
    }

    @Override
    public String unit_output() {
        return type.toString()+" "+String.valueOf(bool_value);
    }
}
