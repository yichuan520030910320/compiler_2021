package Optimize;

import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.Instruction.Base_RISCV_Instruction;
import RISCV.Operand.Register.Base_RISCV_Register;
import RISCV.Operand.Register.Physical_Register;

import java.util.HashMap;
import java.util.HashSet;

public class LivenessAnalysis {
    public ASM_Function asm_function;
    public HashMap<ASM_Basicblock, HashSet<Base_RISCV_Register>> blockdef = new HashMap<>(), blockuse = new HashMap<>(),
            block_livein = new HashMap<>(), block_liveout = new HashMap<>();

    //apply block optimize
    public LivenessAnalysis(ASM_Function asm_function_, Physical_Register ra_, Physical_Register s0_) {
        //todo mantain the instruction use def&& block pre,nxt
        asm_function = asm_function_;
        for (int i = 0; i < asm_function.asm_basicblock_in_function.size(); i++) {
            ASM_Basicblock asm_basicblock = asm_function.asm_basicblock_in_function.get(i);
            //tiger book 17.4.2
            //kill stand for def &&gen stand for use
            HashSet<Base_RISCV_Register> gen = new HashSet<>();
            HashSet<Base_RISCV_Register> kill = new HashSet<>();

            //for the instruction :sw	ra,20(sp)
            //    sw	s0,16(sp)
            //    addi	s0,sp,24
            kill.add(ra_);
            kill.add(s0_);

            for (int j = 0; j < asm_basicblock.Riscv_instruction_in_block.size(); j++) {
                Base_RISCV_Instruction base_riscv_instruction = asm_basicblock.Riscv_instruction_in_block.get(j);
                for (Base_RISCV_Register ptr : base_riscv_instruction.use_reg) {
                    if (!kill.contains(ptr)) gen.add(ptr);
                }
                kill.addAll(base_riscv_instruction.def_reg);
            }

            kill.add(ra_);
            kill.add(s0_);


            System.out.println("kill and gen in asm: " + asm_basicblock.asm_basic_block_label);
            System.out.println(gen);
            System.out.println(kill);


            blockuse.put(asm_basicblock, gen);
            blockdef.put(asm_basicblock, kill);
            block_livein.put(asm_basicblock, gen);
            block_liveout.put(asm_basicblock, new HashSet<>());
        }

        //chapter 10 iteration function

        while (true) {
            boolean flag = false;
            for (int i = asm_function.asm_basicblock_in_function.size() - 1; i >= 0; i--) {
                ASM_Basicblock asm_basicblock = asm_function.asm_basicblock_in_function.get(i);
                HashSet<Base_RISCV_Register> live_in_ = block_livein.get(asm_basicblock);
                HashSet<Base_RISCV_Register> live_out_ = block_liveout.get(asm_basicblock);
                int pre_live_in_num = live_in_.size();
                int pre_live_out_num = live_out_.size();
                live_out_.removeAll(blockdef.get(asm_basicblock));
                live_in_.addAll(live_out_);
                for (ASM_Basicblock asmBasicblocknxt : asm_basicblock.nxt_basicblock)
                    live_out_.addAll(block_livein.get(asmBasicblocknxt));
                flag = flag || pre_live_in_num != live_in_.size() || pre_live_out_num != live_out_.size();

//                    ASM_Basicblock asm_basicblock = asm_function.asm_basicblock_in_function.get(i);
//                    HashSet<Base_RISCV_Register> livein_prime = block_livein.get(asm_basicblock);
//                    HashSet<Base_RISCV_Register> liveout_prime = block_liveout.get(asm_basicblock);
//                    System.out.println("asmbb : "+asm_basicblock.asm_basic_block_label);
//                    System.out.println(liveout_prime);
//
//                    HashSet<Base_RISCV_Register> new_in = new HashSet<>(liveout_prime);
//                    new_in.removeAll(blockdef.get(asm_basicblock));
//                    new_in.addAll(blockuse.get(asm_basicblock));
//
//                    HashSet<Base_RISCV_Register> new_out = new HashSet<>();
//                    for (ASM_Basicblock asmBasicblocknxt : asm_basicblock.nxt_basicblock)
//                        new_out.addAll(block_livein.get(asmBasicblocknxt));
//
//                    if (equals(livein_prime, new_in) && equals(liveout_prime, new_out)) {
//                        flag=true;
//                        continue;
//                    }
//                    flag=false;
//                    block_livein.replace(asm_basicblock, new_in);
//                    block_liveout.replace(asm_basicblock, new_out);
            }
            if (flag) break;
        }

    }

    public static boolean equals(HashSet<?> set1, HashSet<?> set2) {
        if (set1 == null || set2 == null) {//null就直接不比了
            return false;
        }
        if (set1.size() != set2.size()) {//大小不同也不用比了
            return false;
        }
        return set1.containsAll(set2);//最后比containsAll
    }
}
