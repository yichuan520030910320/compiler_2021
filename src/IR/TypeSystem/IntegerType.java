package IR.TypeSystem;

import Utils.error.IRbuilderError;
import Utils.position;

public class IntegerType extends Typesystem {


    public IntegerSubType Inttype;
    public IntegerType(IntegerSubType enumtype){
        Inttype=enumtype;
    }

    @Override
    public String toString() {
        if (Inttype==IntegerSubType.i1)return "i1";
        else if (Inttype==IntegerSubType.i8) return "i8";
        else if (Inttype==IntegerSubType.i32) return "i32";
        else throw new IRbuilderError(" intergertype wrong",new position(0,0));
    }

    @Override
    public int byte_num() {
        if (Inttype==IntegerSubType.i1||Inttype==IntegerSubType.i8)return 4;
        else return 4;
    }
}
