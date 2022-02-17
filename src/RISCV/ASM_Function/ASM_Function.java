package RISCV.ASM_Function;

import Backend.ASMVisitor;
import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.Operand.Register;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.Operand.Register.Base_RISCV_Register;
import RISCV.Operand.Register.Virtual_Register;

import java.util.HashMap;
import java.util.LinkedList;

public class ASM_Function {
    public String asm_function_name;
    public LinkedList<ASM_Basicblock> asm_basicblock_in_function = new LinkedList<>();
    public HashMap<String, ASM_Basicblock> ir_basicblockname_to_asm_basicblock = new HashMap<>();
    public ASM_Basicblock head_basicblock;
    public ASM_Basicblock tail_basicblock;

    //record the frame size
    public int virtual_reg_offset;

    public int max_call_para=0;
    //record the virtual reg and the offset
    public HashMap<Base_RISCV_Register, Integer> Virtual_to_offset = new HashMap<>();
    //record bb to lbael(string)
    public HashMap<IRbasicblock, ASM_Basicblock> iRbasicblockASM_basicblockHashMap = new HashMap<>();

    public ASM_Function(IRfunction iRfunction) {
        virtual_reg_offset=8;// consider the sp and ra
        asm_function_name = iRfunction.functionname;
        //crate basic block and maintain the map for irbb to asmbb for use(eg: branch instruction)
        for (int i = 0; i < iRfunction.block_list.size(); i++) {
            IRbasicblock tmpbb = iRfunction.block_list.get(i);
            String tmpbb_name = ".LBB_" + asm_function_name + "_" + tmpbb.toString();
            ASM_Basicblock asm_basicblock=new ASM_Basicblock(tmpbb_name);
            iRbasicblockASM_basicblockHashMap.put(tmpbb, asm_basicblock);
            asm_basicblock_in_function.add(asm_basicblock);
        }

        //cope with the pass from ir to asm
        for (int i = 0; i < iRfunction.block_list.size(); i++) {
            IRbasicblock tmpbb = iRfunction.block_list.get(i);
            ASM_Basicblock asm_basicblock=asm_basicblock_in_function.get(i);
            if (tmpbb==iRfunction.return_block)tail_basicblock=asm_basicblock;
            for (IRbasicblock nxt_basic_block:tmpbb.nxt_basic_block)asm_basicblock.nxt_basicblock.add(iRbasicblockASM_basicblockHashMap.get(nxt_basic_block));
            for (IRbasicblock pre_basic_block:tmpbb.pre_basicblock)asm_basicblock.pre_basicblock.add(iRbasicblockASM_basicblockHashMap.get(pre_basic_block));
        }
        head_basicblock=asm_basicblock_in_function.getFirst();
    }

    public void alloca(Virtual_Register reg, int bytes) {
        virtual_reg_offset += bytes;
        Virtual_to_offset.put(reg, virtual_reg_offset);
    }

    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

}
