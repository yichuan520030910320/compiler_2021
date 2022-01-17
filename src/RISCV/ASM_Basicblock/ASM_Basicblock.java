package RISCV.ASM_Basicblock;

import Backend.ASMVisitor;
import IR.IRvisitor;
import RISCV.Instruction.Base_RISCV_Instruction;

import java.util.HashSet;
import java.util.LinkedList;

public class ASM_Basicblock {
    public String asm_basic_block_label;
    public LinkedList<Base_RISCV_Instruction> Riscv_instruction_in_block=new LinkedList<>();
    public HashSet<ASM_Basicblock> pre_basicblock=new HashSet<>();
    public HashSet<ASM_Basicblock> nxt_basicblock=new HashSet<>();
    public ASM_Basicblock(String label){
        asm_basic_block_label=label;

    }

    public void add_tail_instru(Base_RISCV_Instruction instru){
        instru.asm_basicblock=this;
        Riscv_instruction_in_block.add(instru);
    }
    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

}
