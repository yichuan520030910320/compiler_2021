package IR.TypeSystem;

import IR.Operand.BaseOperand;
import IR.Operand.Parament;

import java.util.LinkedList;

public class FunctionType extends Typesystem{
    public Typesystem returntype;
    public LinkedList<Parament> parament_list;
    public FunctionType(Typesystem returntype_,LinkedList<Parament> parament_list_){
        returntype=returntype_;
        parament_list=parament_list_;
    }
    @Override
    public String toString() {
        return null;
    }//don't need to do

    @Override
    public int byte_num() {
        return 0;
    }

    @Override
    public BaseOperand defaulttype() {
        throw new RuntimeException("defalut in function type");
    }


}
