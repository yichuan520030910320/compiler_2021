package IR.Operand;

import IR.TypeSystem.Typesystem;

public class Register extends BaseOperand{
    public String RegName;
    public Register(Typesystem typesystem,String Regname_) {
        super(typesystem);
        RegName=Regname_;
    }

    @Override
    public String toString() {
        return "%"+RegName;
    }

    @Override
    public String unit_output() {
        return type.toString()+" %"+RegName;
    }
}
