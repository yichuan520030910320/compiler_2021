package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.Register;
import IR.TypeSystem.Typesystem;

//%returnValue$addr.0 = alloca i32
public class AllocateInstruction extends BaseInstru {
    //allocate type attention ! not the type of the pointer
    public Typesystem allocate_type;
    //alocate result type is different from the allocate_type in fact the allocate result is the pointer of allocate type
    public Register allocate_result;

    public static int alloca_cnt = 0;

    public AllocateInstruction(IRbasicblock iRbasicblock, Typesystem allocate_type_, Register allocate_result_) {
        super(iRbasicblock);
        alloca_cnt++;
        allocate_type = allocate_type_;
        allocate_result = allocate_result_;
        allocate_result.Add_def(this);
    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return allocate_result.toString() + " = alloca " + allocate_type.toString();
    }
}
