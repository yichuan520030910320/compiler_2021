package RISCV.ASM_Function;

import RISCV.ASM_Basicblock.ASM_Basicblock;

import java.util.LinkedList;

public class ASM_Function {
    public String asm_function_name;
    public LinkedList<ASM_Basicblock> asm_basicblock_in_function=new LinkedList<>();
    public  ASM_Basicblock head_basicblock;
    public  ASM_Basicblock tail_basicblock;


}
