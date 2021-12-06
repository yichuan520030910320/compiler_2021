package IR.Operand;

import IR.TypeSystem.Typesystem;

abstract public class BaseOperand {
public Typesystem type;
public BaseOperand(Typesystem typesystem){
    type=typesystem;
}
    abstract public String toString();

}
