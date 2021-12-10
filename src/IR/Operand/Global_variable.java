package IR.Operand;

import IR.TypeSystem.Typesystem;

public class Global_variable extends BaseOperand{
    public BaseOperand initoperand;
    //behave like register name
    public String GlobalVariableName;
    public Global_variable(Typesystem typesystem,String GlobalVariableName_) {
        super(typesystem);
        GlobalVariableName=GlobalVariableName_;
    }

    @Override
    public String toString() {
        return "@"+GlobalVariableName;
    }

    @Override
    public String unit_output() {
        return type.toString()+" @"+GlobalVariableName;
    }
}
