package MidEndOptimizen;

import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRmodule.IRmodule;
import IR.IRvisitor;
import IR.Instru.*;
import IR.Operand.BaseOperand;
import IR.Operand.Mem2Reg_Register;
import IR.Operand.Register;
import IR.TypeSystem.PointerType;
import IR.TypeSystem.Typesystem;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

public class Mem2Reg implements IRvisitor {
    public IRmodule iRmodule;

    public HashMap<BaseOperand, Mem2Reg_Register> allocate_map;
    public HashMap<BaseOperand, Mem2Reg_Register> load_map;

    public Mem2Reg(IRmodule iRmodule_) {
        iRmodule = iRmodule_;
        //if (AllocateInstruction.alloca_cnt>270)return;
        for (Map.Entry<String, IRfunction> entry : iRmodule.Internal_Function_Map.entrySet()) {
            IRfunction tmpirrunction = entry.getValue();
            allocate_map = new HashMap<>();
            load_map = new HashMap<>();
            for (int i = 0; i < tmpirrunction.block_list.size(); i++) {
                run_basicblock(tmpirrunction.block_list.get(i));
            }
        }
    }

    void run_basicblock(IRbasicblock iRbasicblock) {
        LinkedList<BaseInstru> newinstrulist = new LinkedList<>();
        for (int i = 0; i < iRbasicblock.link_in_basicblock.size(); i++) {
            BaseInstru baseInstru = iRbasicblock.link_in_basicblock.get(i);
            if (baseInstru instanceof AllocateInstruction) {
                allocate_map.put(((AllocateInstruction) baseInstru).allocate_result, new Mem2Reg_Register(((AllocateInstruction) baseInstru).allocate_type));
                continue;
            } else if (baseInstru instanceof LoadInstruction) {
                if (allocate_map.containsKey(((LoadInstruction) baseInstru).source_pointer)) {
                    Typesystem desttype=allocate_map.get(((LoadInstruction) baseInstru).source_pointer).type;
                    Mem2Reg_Register mem2Reg_register=new Mem2Reg_Register( desttype);
                    load_map.put(((LoadInstruction) baseInstru).destination_register,mem2Reg_register);
                    newinstrulist.add(new StoreInstruction(iRbasicblock, allocate_map.get(((LoadInstruction) baseInstru).source_pointer),mem2Reg_register));
                    continue;
                }
            }
            baseInstru.accept(this);
            newinstrulist.add(baseInstru);
        }
        iRbasicblock.link_in_basicblock = newinstrulist;
    }

    @Override
    public void visit(BinaryInstruction it) {
        it.operand1 = chang_operand(it.operand1);
        it.operand2 = chang_operand(it.operand2);
    }

    @Override
    public void visit(BrInstruction it) {
        it.cond = chang_operand(it.cond);
    }

    @Override
    public void visit(CallInstruction it) {
        if (it.paralist!=null) {
            for (int i = 0; i < it.paralist.size(); i++) {
                it.paralist.set(i, chang_operand(it.paralist.get(i)));
            }
        }
    }

    @Override
    public void visit(CmpInstruction it) {
        it.operand1 = chang_operand(it.operand1);
        it.operand2 = chang_operand(it.operand2);
    }

    @Override
    public void visit(LoadInstruction it) {

    }

    @Override
    public void visit(PhiInstruction it) {

    }

    @Override
    public void visit(RetInstruction it) {
        it.Ret_Operand = chang_operand(it.Ret_Operand);
    }

    @Override
    public void visit(StoreInstruction it) {
        it.dest_operand = chang_operand(it.dest_operand);
        it.source_operand = chang_operand(it.source_operand);
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
        it.source_ptr = chang_operand(it.source_ptr);
        for (int i = 0; i <it.index_offset.size() ; i++) {
            it.index_offset.set(i,chang_operand(it.index_offset.get(i)));
        }
    }

    @Override
    public void visit(BitCastInstruction it) {
        it.source_reg=  chang_operand(it.source_reg);
//nothing to do
    }

    BaseOperand chang_operand(BaseOperand operand) {
        if (allocate_map.containsKey(operand)) return allocate_map.get(operand);
        else if (load_map.containsKey(operand)) return load_map.get(operand);
        return operand;
    }
}
