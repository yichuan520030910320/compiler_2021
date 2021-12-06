package IR.TypeSystem;

public class PointerType extends Typesystem{
    Typesystem Base_Pointer_Type;

    @Override
    public String toString() {
        return Base_Pointer_Type.toString()+"*";
    }
}
