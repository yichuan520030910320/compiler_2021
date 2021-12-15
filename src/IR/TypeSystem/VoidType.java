package IR.TypeSystem;

public class VoidType extends Typesystem{
    public VoidType(){}

    @Override
    public String toString() {
        return "void";
    }

    @Override
    public int byte_num() {
        return 0;
    }
}
