package IR.TypeSystem;

import IR.Operand.BaseOperand;

public class ArrayType extends Typesystem{
    public Typesystem basetype;
    public int len;
    public ArrayType(Typesystem basetype_,int len_){
        basetype=basetype_;
        len=len_;
    }
    @Override
    public String toString() {
        return "["+len+" x "+basetype.toString()+"]";
    }

    @Override
    public int byte_num() {
        return basetype.byte_num()*len;
    }

    @Override
    public BaseOperand defaulttype() {
        throw new RuntimeException("default in function type");
    }


}
