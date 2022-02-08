package IR.TypeSystem;

import IR.Operand.BaseOperand;
import IR.Operand.ConstOperand_Bool;
import IR.Operand.ConstOperand_Integer;
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
        if (Inttype==IntegerSubType.i1||Inttype==IntegerSubType.i8)return 1;
        else return 4;
    }

    @Override
    public BaseOperand defaulttype() {
        if (Inttype==IntegerSubType.i1)return new ConstOperand_Bool(this,false);
        else return new ConstOperand_Integer(this,0);
    }
}
