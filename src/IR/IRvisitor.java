package IR;

import IR.Instru.*;

public interface IRvisitor {
    void visit(BinaryInstruction it);

    void visit(BrInstruction it);

    void visit(CallInstruction it);

    void visit(CmpInstruction it);

    void visit(LoadInstruction it);

    void visit(PhiInstruction it);

    void visit(RetInstruction it);

    void visit(StoreInstruction it);
}
