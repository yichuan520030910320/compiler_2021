package IR.Operand;

import IR.TypeSystem.Typesystem;

public class Global_variable extends BaseOperand{
    BaseOperand initoperand;
    String GlobalVariableName;
    public Global_variable(Typesystem typesystem,String GlobalVariableName_) {
        super(typesystem);
        GlobalVariableName=GlobalVariableName_;
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
