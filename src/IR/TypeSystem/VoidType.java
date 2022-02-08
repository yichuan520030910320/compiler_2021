package IR.TypeSystem;

import IR.Operand.BaseOperand;

public class VoidType extends Typesystem {
    public VoidType() {
    }

    @Override
    public String toString() {
        return "void";
    }

    @Override
    public int byte_num() {
        return 0;
    }

    @Override
    public BaseOperand defaulttype() {
        throw new RuntimeException("default in void type");
    }
}
