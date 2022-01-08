package Backend;

import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRmodule.IRmodule;
import IR.IRvisitor;
import IR.Instru.*;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;

public class Instructin_select implements IRvisitor {
    public IRmodule iRmodule;
    public ASM_Module cur_module;
    public ASM_Basicblock cur_basicblock;
    public ASM_Function cur_function;


    public Instructin_select (IRmodule iRmodule_){
        iRmodule=iRmodule_;


    }
    @Override
    public void visit(BinaryInstruction it) {

    }

    @Override
    public void visit(BrInstruction it) {

    }

    @Override
    public void visit(CallInstruction it) {

    }

    @Override
    public void visit(CmpInstruction it) {

    }

    @Override
    public void visit(LoadInstruction it) {

    }

    @Override
    public void visit(PhiInstruction it) {

    }

    @Override
    public void visit(RetInstruction it) {

    }

    @Override
    public void visit(StoreInstruction it) {

    }

    @Override
    public void visit(AllocateInstruction it) {

    }

    @Override
    public void visit(IRbasicblock it) {

    }

    @Override
    public void visit(IRfunction it) {

    }

    @Override
    public void visit(IRmodule it) {

    }

    @Override
    public void visit(GetElementPtrInstruction it) {

    }

    @Override
    public void visit(BitCastInstruction it) {

    }
}
