package Optimize;

import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.Instruction.Base_RISCV_Instruction;
import RISCV.Operand.Register.Base_RISCV_Register;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class LivenessAnalysis {
    public ASM_Function asm_function;
    public HashMap<ASM_Basicblock, HashSet<Base_RISCV_Register>> blockdef = new HashMap<>(), blockuse = new HashMap<>(),
            block_livein = new HashMap<>(), block_liveout = new HashMap<>();

    //apply block optimize
    public LivenessAnalysis(ASM_Function asm_function_) {
        //todo mantain the instruction use def&& block pre,nxt
        asm_function = asm_function_;
        for (int i = 0; i < asm_function.asm_basicblock_in_function.size(); i++) {
            ASM_Basicblock asm_basicblock = asm_function.asm_basicblock_in_function.get(i);
            //tiger book 17.4.2
            //kill stand for def &&gen stand for use
            HashSet<Base_RISCV_Register> gen = new HashSet<>();
            HashSet<Base_RISCV_Register> kill = new HashSet<>();
            for (int j = 0; j < asm_basicblock.Riscv_instruction_in_block.size(); j++) {
                Base_RISCV_Instruction base_riscv_instruction = asm_basicblock.Riscv_instruction_in_block.get(j);
                for (Base_RISCV_Register ptr : base_riscv_instruction.use_reg) {
                    if (!kill.contains(ptr)) gen.add(ptr);
                }
                kill.addAll(base_riscv_instruction.def_reg);
            }
            blockuse.put(asm_basicblock, gen);
            blockdef.put(asm_basicblock, kill);
            block_livein.put(asm_basicblock,new HashSet<>());
            block_liveout.put(asm_basicblock,new HashSet<>());
        }
        for (int i = 0; i < asm_function.asm_basicblock_in_function.size(); i++) {
            //chapter 10 iteration function
            ASM_Basicblock asm_basicblock = asm_function.asm_basicblock_in_function.get(i);
            while (true){

                HashSet<Base_RISCV_Register>livein_prime=block_livein.get(asm_basicblock);
                HashSet<Base_RISCV_Register>liveout_prime=block_liveout.get(asm_basicblock);

                HashSet<Base_RISCV_Register> new_in=new HashSet<>(liveout_prime);
                new_in.removeAll(blockdef.get(asm_basicblock));
                new_in.addAll(blockuse.get(asm_basicblock));

                HashSet<Base_RISCV_Register>new_out=new HashSet<>();
                for (ASM_Basicblock asmBasicblocknxt:asm_basicblock.nxt_basicblock)new_out.addAll(block_livein.get(asmBasicblocknxt));

                if (equals(livein_prime,new_in)&&equals(liveout_prime,new_out))break;
                block_livein.replace(asm_basicblock,new_in);
                block_liveout.replace(asm_basicblock,new_out);
            }
        }
    }
    public static boolean equals(HashSet<?> set1, HashSet<?> set2){
        if(set1 == null || set2 ==null){//null就直接不比了
            return false;
        }
        if(set1.size()!=set2.size()){//大小不同也不用比了
            return false;
        }
        return set1.containsAll(set2);//最后比containsAll
    }
}
