package IR.TypeSystem;

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
}
