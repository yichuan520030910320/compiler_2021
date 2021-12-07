package IR.IRbasicblock;

import IR.IRfunction.IRfunction;
import IR.Instru.BaseInstru;

import java.util.LinkedList;

public class IRbasicblock {
    public String blockname;
    public IRfunction iRfunction;
    public LinkedList<BaseInstru> link_in_basicblock;
    public BaseInstru terminal_instruction;



}
