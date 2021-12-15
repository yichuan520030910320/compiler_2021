package IR.TypeSystem;

import IR.Operand.Parament;

import java.util.ArrayList;

public class FunctionType extends Typesystem{
    public Typesystem returntype;
    public ArrayList<Parament> parament_list;
    public FunctionType(Typesystem returntype_,ArrayList<Parament> parament_list_){
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
}
