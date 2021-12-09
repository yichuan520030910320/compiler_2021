package IR.IRfunction;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Instru.AllocateInstruction;
import IR.Instru.LoadInstruction;
import IR.Instru.RetInstruction;
import IR.Operand.BaseOperand;
import IR.Operand.BaseUser;
import IR.Operand.Register;
import IR.TypeSystem.FunctionType;
import IR.TypeSystem.PointerType;
import IR.TypeSystem.VoidType;

import java.util.ArrayList;
import java.util.LinkedList;

public class IRfunction extends BaseUser {
    public FunctionType function_type;
    public ArrayList<BaseOperand> paramentlist;
    public String functionname;
    public IRbasicblock entry_block;
    public IRbasicblock return_block;
    public LinkedList<IRbasicblock> block_list;
    public Register return_reg;
    boolean is_builtin;

    public IRfunction(FunctionType function_type_, String functionname_, boolean is_builtin_) {
        function_type = function_type_;
        functionname = functionname_;
        is_builtin = is_builtin_;
        block_list = new LinkedList<>();
        entry_block = new IRbasicblock("entrance_block0", this);
        return_block = new IRbasicblock("return_block0", this);
        if (function_type.returntype instanceof VoidType) {
            return_block.link_in_basicblock.add(new RetInstruction(return_block, null, new VoidType()));
        } else {
            return_reg= new Register(new PointerType(function_type.returntype), "return_register_infunction");
            entry_block.link_in_basicblock.add(new AllocateInstruction(entry_block, function_type.returntype,return_reg));
            Register eventual_returnval = new Register(function_type.returntype, "returnval");
            return_block.link_in_basicblock.add(new LoadInstruction(return_block, eventual_returnval, return_reg));
            return_block.link_in_basicblock.add(new RetInstruction(return_block, eventual_returnval, function_type.returntype));
        }
        block_list.add(entry_block);
    }
    //used for declare in irprinter
    public String name_and_para(){
        StringBuilder name_para=new StringBuilder();
        name_para.append(functionname);
name_para.append("(");
        for (int i = 0; i <function_type.parament_list.size() ; i++) {
            name_para.append(function_type.parament_list.get(i).unit_output());
            if (!(i==function_type.parament_list.size()-1))name_para.append(",");
        }
        name_para.append(")");
        return name_para.toString();
    }

    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

}
