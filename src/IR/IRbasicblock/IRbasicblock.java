package IR.IRbasicblock;

import IR.IRfunction.IRfunction;
import IR.IRvisitor;
import IR.Instru.BaseInstru;
import IR.Instru.BrInstruction;
import IR.Operand.BaseUser;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;

public class IRbasicblock extends BaseUser {//可以记录其中的instru 使用
    public String blockname;
    //point to the function
    public IRfunction iRfunction;
    //the instruction index
    public LinkedList<BaseInstru> link_in_basicblock;
    //terminal instru temporarily don't know how to use it
    public BaseInstru terminal_instruction;
    //jump from where
    public HashSet<IRbasicblock> pre_basicblock;
    //jump to where
    public HashSet<IRbasicblock> nxt_basic_block;
    //for dfs
    public IRbasicblock dfs_father = null;

    public IRbasicblock(String blockname_, IRfunction irfunction_) {
        blockname = blockname_;
        iRfunction = irfunction_;
        link_in_basicblock = new LinkedList<>();
        terminal_instruction = null;
        pre_basicblock = new LinkedHashSet<>();
        nxt_basic_block = new LinkedHashSet<>();
    }

    public BaseInstru gettail() {
        return link_in_basicblock.get(link_in_basicblock.size() - 1);
    }

    public BaseInstru gethead() {
        return link_in_basicblock.get(0);
    }

    public void set_tail(BaseInstru baseInstru) {
        int size = link_in_basicblock.size() - 1;
        link_in_basicblock.set(size, baseInstru);
    }

    @Override
    public String toString() {
        return blockname;
    }

    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

    public void instruction_add(BaseInstru it) {
        if (check_taiL_br()) {
            return;
        }
        link_in_basicblock.add(it);
    }

    public void Addprebasicblock(IRbasicblock iRbasicblock){
        pre_basicblock.add(iRbasicblock);
    }
    public void Addnxtbasicblock(IRbasicblock iRbasicblock){
        nxt_basic_block.add(iRbasicblock);
    }
    public boolean check_taiL_br() {
        if (link_in_basicblock.size() == 0) return false;
        return link_in_basicblock.getLast() instanceof BrInstruction;
    }

}
