package IR.Operand;

import IR.TypeSystem.Typesystem;

public class Parament extends BaseOperand{
    public String paraname;
    public Parament(Typesystem typesystem,String paraname_) {
        super(typesystem);
        paraname=paraname_;

    }

    @Override
    public String toString() {
        return paraname;
    }

    @Override
    public String unit_output() {
        return type.toString()+" %"+paraname;
    }
}
