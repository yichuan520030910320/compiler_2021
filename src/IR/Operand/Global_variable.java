package IR.Operand;

import IR.TypeSystem.Typesystem;

public class Global_variable extends BaseOperand{
    BaseOperand initoprand;
    String GlobalVariableName;
    public Global_variable(Typesystem typesystem) {
        super(typesystem);
    }

    @Override
    public String toString() {
        return null;
    }

    @Override
    public String unit_output() {
        return null;
    }
}
