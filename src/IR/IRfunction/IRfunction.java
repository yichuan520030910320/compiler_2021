package IR.IRfunction;

import IR.IRbasicblock.IRbasicblock;
import IR.Operand.BaseOperand;
import IR.Operand.BaseUser;
import IR.TypeSystem.FunctionType;

import java.util.ArrayList;
import java.util.LinkedList;

public class IRfunction extends BaseUser {
    public FunctionType function_type;
    public ArrayList<BaseOperand> paramentlist;
    public String functionname;
    public IRbasicblock entry_block;
    public IRbasicblock exit_block;
    public LinkedList<IRbasicblock> block_list;
    boolean is_builtin;

    public IRfunction(FunctionType function_type_,String functionname_,boolean is_builtin_){
        function_type=function_type_;
        functionname=functionname_;
        is_builtin=is_builtin_;
        block_list=new LinkedList<>();
        entry_block=new IRbasicblock("entrance_block",this);
        block_list.add(entry_block);
    }

}
