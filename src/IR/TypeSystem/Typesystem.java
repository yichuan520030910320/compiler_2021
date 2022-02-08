package IR.TypeSystem;

import IR.Operand.BaseOperand;

public abstract class Typesystem {
    //to do add typecollecter to collect the class

    abstract public String toString();
    abstract public int byte_num();
    abstract public BaseOperand defaulttype();

}
