package IR.TypeSystem;

import Utils.error.IRbuilderError;
import Utils.position;

public class IntegerType extends Typesystem {
    enum IntegerSubType {
        i1, i8, i32
    }
    ;
    public IntegerSubType Inttype;

    @Override
    public String toString() {
        if (Inttype==IntegerSubType.i1)return "i1";
        else if (Inttype==IntegerSubType.i8) return "i8";
        else if (Inttype==IntegerSubType.i32) return "i32";
        else throw new IRbuilderError(" intergertype weong",new position(0,0));
    }
}
