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
import java.util.HashSet;
import java.util.LinkedList;
import java.util.HashMap;

public class IRfunction extends BaseUser {
    public FunctionType function_type;
    public LinkedList<BaseOperand> paramentlist = new LinkedList<>();
    public String functionname;
    public IRbasicblock entry_block;
    public IRbasicblock return_block;
    public LinkedList<IRbasicblock> block_list;
    public Register return_reg;
    boolean is_builtin;
    public HashMap<String, Register> para_map_fic_for_codegen = new HashMap<>();

    //renaming map just for llvm
    public HashMap<String, Integer> reg_map = new HashMap<>();
    public HashMap<String, Integer> basicblock_map = new HashMap<>();

    //for cfg
    public LinkedList<IRbasicblock> iRbasicblocks_DFS_Order;
    public HashSet<IRbasicblock> visited_iRbasicblocks;

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
            return_reg = new Register(new PointerType(function_type.returntype), "return_register_infunction_addr");
            entry_block.link_in_basicblock.add(new AllocateInstruction(entry_block, function_type.returntype, return_reg));
            //entry_block.link_in_basicblock.add(new StoreInstruction(entry_block, function_type.returntype.defaulttype(), return_reg));
            Register eventual_returnval = new Register(function_type.returntype, "returnval");
            return_block.link_in_basicblock.add(new LoadInstruction(return_block, eventual_returnval, return_reg));
            return_block.link_in_basicblock.add(new RetInstruction(return_block, eventual_returnval, function_type.returntype));
        }
        block_list.add(entry_block);
    }

    //just to avoid the same name registser or the same name basicblock
    public void renaming_add(BaseUser add_index) {
        if (add_index instanceof Register) {
            if (reg_map.containsKey(((Register) add_index).RegName)) {
                int tmpcnt = reg_map.get(((Register) add_index).RegName);
                reg_map.replace(((Register) add_index).RegName, tmpcnt + 1);
                ((Register) add_index).RegName = new String(((Register) add_index).RegName + "_" + String.valueOf(tmpcnt));

            } else {
                reg_map.put(((Register) add_index).RegName, 0);
            }
        } else if (add_index instanceof IRbasicblock) {
            if (basicblock_map.containsKey(((IRbasicblock) add_index).blockname)) {
                int tmpcnt = basicblock_map.get(((IRbasicblock) add_index).blockname);
                basicblock_map.replace(((IRbasicblock) add_index).blockname, tmpcnt + 1);
                ((IRbasicblock) add_index).blockname = ((IRbasicblock) add_index).blockname + tmpcnt;
            } else {
                basicblock_map.put(((IRbasicblock) add_index).blockname, 0);
            }
        }
    }

    //used for declare in irprinter
    public String name_and_para() {
        StringBuilder name_para = new StringBuilder();
        name_para.append(functionname);
        name_para.append("(");
        for (int i = 0; i < function_type.parament_list.size(); i++) {
            name_para.append(function_type.parament_list.get(i).unit_output());
            if (!(i == function_type.parament_list.size() - 1)) name_para.append(",");
        }
        name_para.append(")");
        return name_para.toString();
    }

    public LinkedList<IRbasicblock> get_DFS_Block_list() {
        visited_iRbasicblocks = new HashSet<>();
        iRbasicblocks_DFS_Order = new LinkedList<>();
        entry_block.dfs_father = null;
        dfs_basicblock(entry_block);
        return iRbasicblocks_DFS_Order;

    }

    private void dfs_basicblock(IRbasicblock iRbasicblock) {
        visited_iRbasicblocks.add(iRbasicblock);
        iRbasicblocks_DFS_Order.add(iRbasicblock);
        for (IRbasicblock iRbasicblock1 : iRbasicblock.nxt_basic_block) {
            if (!visited_iRbasicblocks.contains(iRbasicblock1)) {
                iRbasicblock1.dfs_father = iRbasicblock;
                dfs_basicblock(iRbasicblock1);
            }
        }
    }

    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

}
