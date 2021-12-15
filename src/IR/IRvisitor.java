package IR;

import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRmodule.IRmodule;
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

    void visit(AllocateInstruction it);

    void visit(IRbasicblock it);

    void visit(IRfunction it);

    void visit(IRmodule it);

    void visit(GetElementPtrInstruction it);

    void visit(BitCastInstruction it);
}
