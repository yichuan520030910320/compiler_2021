package IR.Operand;

import IR.TypeSystem.Typesystem;

abstract public class BaseOperand extends BaseUser{
public Typesystem type;
public BaseOperand(Typesystem typesystem){
    type=typesystem;
}

    protected BaseOperand() {
    }

    abstract public String toString();
//to print (i32 0 or i32* %returnValue$addr.0 ) such of this
abstract public  String unit_output();

}
