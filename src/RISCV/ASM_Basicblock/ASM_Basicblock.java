package RISCV.ASM_Basicblock;

import RISCV.Instruction.Base_RISCV_Instruction;

import java.util.HashSet;
import java.util.LinkedList;

public class ASM_Basicblock {
    public LinkedList<Base_RISCV_Instruction> Riscv_instruction_in_block=new LinkedList<>();
    public HashSet<ASM_Basicblock> pre_basicblock=new HashSet<>();
    public HashSet<ASM_Basicblock> nxt_basicblock=new HashSet<>();
}
