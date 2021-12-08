package IR.TypeSystem;

public class PointerType extends Typesystem{
    Typesystem Base_Pointer_Type;
    public PointerType(Typesystem Base_pointer_type_){
        Base_Pointer_Type=Base_pointer_type_;
    }

    @Override
    public String toString() {
        return Base_Pointer_Type.toString()+"*";
    }
}
