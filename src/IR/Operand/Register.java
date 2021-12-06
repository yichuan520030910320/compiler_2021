package IR.Operand;

import IR.TypeSystem.Typesystem;

public class Register extends BaseOperand{
    String RegName;
    public Register(Typesystem typesystem) {
        super(typesystem);
    }

    @Override
    public String toString() {
        return null;
    }
}
