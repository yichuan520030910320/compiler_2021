package IR.TypeSystem;

import java.util.ArrayList;

public class FunctionType extends Typesystem{
    public Typesystem returntype;
    public ArrayList<Typesystem> parament_list;
    public FunctionType(Typesystem returntype_,ArrayList<Typesystem> parament_list_){
        returntype=returntype_;
        parament_list=parament_list_;
    }
    @Override
    public String toString() {
        return null;
    }//don't need to do
}
