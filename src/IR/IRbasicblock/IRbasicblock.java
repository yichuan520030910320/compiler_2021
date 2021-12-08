package IR.IRbasicblock;

import IR.IRfunction.IRfunction;
import IR.Instru.BaseInstru;
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

    public IRbasicblock(String blockname_, IRfunction irfunction_) {
        blockname = blockname_;
        iRfunction = irfunction_;
        link_in_basicblock = new LinkedList<>();
        terminal_instruction = null;
        pre_basicblock=new LinkedHashSet<>();
        nxt_basic_block=new LinkedHashSet<>();
    }
    @Override
    public String toString() {
        return blockname;
    }
}
