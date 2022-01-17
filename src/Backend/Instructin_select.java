package Backend;

import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRmodule.IRmodule;
import IR.IRvisitor;
import IR.Instru.*;
import IR.Operand.BaseOperand;
import IR.Operand.Register;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.Instruction.RISCV_Instruction_Move;
import RISCV.Instruction.RISCV_Instruction_Ret;
import RISCV.Operand.Register.Virtual_Register;

import java.util.HashMap;

public class Instructin_select implements IRvisitor {
    public IRmodule iRmodule;
    public ASM_Module cur_module;
    public ASM_Basicblock cur_basicblock;
    public ASM_Function cur_function;

    //record the corresponding relationship with irregister and virtual register
    public HashMap<BaseOperand, Virtual_Register> IRreg_to_vitualreg = new HashMap<>();

    public Instructin_select(IRmodule iRmodule_) {
        iRmodule = iRmodule_;
        cur_module = new ASM_Module();


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
        cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(cur_module.physical_registers.get(10), IRreg_to_vitualreg.get(it.Ret_Operand)));
        cur_basicblock.add_tail_instru(new RISCV_Instruction_Ret());
    }

    @Override
    public void visit(StoreInstruction it) {

    }

    @Override
    public void visit(AllocateInstruction it) {
        Virtual_Register alloca_virtual_reg = new Virtual_Register(it.toString());
        IRreg_to_vitualreg.put(it.allocate_result, alloca_virtual_reg);
        cur_function.alloca(alloca_virtual_reg, it.allocate_type.byte_num());
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
