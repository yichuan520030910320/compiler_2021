package MidEndOptimizen;

import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRmodule.IRmodule;
import IR.Instru.BaseInstru;
import IR.Instru.BrInstruction;
import IR.Operand.ConstOperand_Bool;
import RISCV.Instruction.Base_RISCV_Instruction;
import RISCV.Operand.Register.Base_RISCV_Register;
import Utils.error.IRbuilderError;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Map;

public class CFG_optimizen extends IR_Pass {
    public ListIterator<IRbasicblock> it;

    public CFG_optimizen(IRmodule iRmodule_) {
        super(iRmodule_);
    }

    @Override
    public boolean run() {
        for (Map.Entry<String, IRfunction> entry : iRmodule.Internal_Function_Map.entrySet()) {
            IRfunction tmpirrunction = entry.getValue();
            changed |= run_on_function(tmpirrunction);
        }

        return changed;
    }

    private boolean run_on_function(IRfunction iRfunction) {
        boolean ifchanged = false;

        while (true) {
            boolean thisloop;
            thisloop = remove_meaningless_branch(iRfunction);
            thisloop |= removeunreachableblock_andmergeblock(iRfunction);
            if (thisloop == false) break;
            else ifchanged = true;
        }
        return ifchanged;
    }

    private boolean remove_meaningless_branch(IRfunction iRfunction) {
        boolean ifchanged = false;
        //remove if(true)
        LinkedList<IRbasicblock> dfsorder = iRfunction.get_DFS_Block_list();
        for (int i = dfsorder.size() - 1; i >= 0; i--) {
            IRbasicblock iRbasicblock = dfsorder.get(i);
            BaseInstru baseInstru = iRbasicblock.gettail();
            if (baseInstru instanceof BrInstruction) {
                if (((BrInstruction) baseInstru).cond != null && ((BrInstruction) baseInstru).cond instanceof ConstOperand_Bool) {
                    boolean cond = ((ConstOperand_Bool) ((BrInstruction) baseInstru).cond).bool_value;
                    IRbasicblock uncoditional;
                    IRbasicblock redundancy;
                    if (cond) {
                        uncoditional = ((BrInstruction) baseInstru).true_block;
                        redundancy = ((BrInstruction) baseInstru).false_block;
                    } else {
                        uncoditional = ((BrInstruction) baseInstru).false_block;
                        redundancy = ((BrInstruction) baseInstru).true_block;
                    }
                    iRbasicblock.nxt_basic_block.remove(redundancy);
                    redundancy.pre_basicblock.remove(iRbasicblock);
                    for (IRbasicblock iRbasicblock1:redundancy.nxt_basic_block){
                        iRbasicblock1.pre_basicblock.remove(redundancy);
                    }
                    iRbasicblock.set_tail(new BrInstruction(iRbasicblock, null, uncoditional, null));
                    ifchanged = true;
                }
            }
        }


        return ifchanged;

    }

    private boolean removeunreachableblock_andmergeblock(IRfunction iRfunction) {
        boolean ifchanged = false;
        LinkedList<IRbasicblock> dfsorder = iRfunction.get_DFS_Block_list();
        it = iRfunction.block_list.listIterator(0);
        while (it.hasNext()) {
            //note that the first it.next mean the first element
            IRbasicblock iRbasicblock = it.next();
            if (!dfsorder.contains(iRbasicblock)) {
                for (IRbasicblock iRbasicblockpre : iRbasicblock.pre_basicblock) {
                    iRbasicblockpre.nxt_basic_block.remove(iRbasicblock);
                }
                for (IRbasicblock iRbasicblocknxt : iRbasicblock.nxt_basic_block) {
                    iRbasicblocknxt.pre_basicblock.remove(iRbasicblock);
                }
                it.remove();
                ifchanged=true;

            } else {
                if (iRbasicblock.pre_basicblock.size() == 1) {
                    IRbasicblock iRbasicblock1 = iRbasicblock.pre_basicblock.iterator().next();
                    if (iRbasicblock1.nxt_basic_block.size() == 1) {
                        IRbasicblock nxtbasicblock = iRbasicblock1.nxt_basic_block.iterator().next();
                        if (nxtbasicblock != iRbasicblock) throw new IRbuilderError("cfgbuild error", null);
                        iRbasicblock1.link_in_basicblock.removeLast();
                        iRbasicblock1.link_in_basicblock.addAll(iRbasicblock.link_in_basicblock);

                        iRbasicblock1.nxt_basic_block = new HashSet<>(iRbasicblock.nxt_basic_block);
                        for (IRbasicblock iRbasicblocknxt:iRbasicblock.nxt_basic_block){
                            iRbasicblocknxt.pre_basicblock.remove(iRbasicblock);
                            iRbasicblocknxt.pre_basicblock.add(iRbasicblock1);
                        }
                        if (iRbasicblock == iRfunction.return_block) iRfunction.return_block = iRbasicblock1;
                        it.remove();
                        ifchanged=true;
                    }
                }


            }

        }


        return ifchanged;
    }

}
