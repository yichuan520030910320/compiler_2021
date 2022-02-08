package IR.TypeSystem;

import IR.Operand.BaseOperand;
import IR.Operand.ConstOperand_Null;

public class PointerType extends Typesystem {
    public Typesystem Base_Pointer_Type;
    public int dim;
    public PointerType(Typesystem Base_pointer_type_) {
        if ((Base_pointer_type_ instanceof PointerType)) {
            dim = ((PointerType) Base_pointer_type_).dim + 1;
            Base_Pointer_Type = ((PointerType) Base_pointer_type_).Base_Pointer_Type;
        } else {
            dim = 1;
            Base_Pointer_Type = Base_pointer_type_;
        }
    }
    public Typesystem get_low_dim_type(){
        if (dim>1) {
            PointerType tmp= new PointerType(Base_Pointer_Type);
            tmp.dim= dim-1;
            return tmp;
        }else {
            return Base_Pointer_Type;
        }
    }
    @Override
    public String toString() {
        return Base_Pointer_Type.toString() + "*".repeat(dim);
    }

    @Override
    public int byte_num() {
        return 8;
    }

    @Override
    public BaseOperand defaulttype() {
        return new ConstOperand_Null(new VoidType());
    }
}
