package BackendOptimizen;

import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.Instruction.*;

import java.util.ListIterator;
import java.util.Map;

//reference <engneering a compiler>
public class Peephole extends ASM_Pass {
    public Peephole(ASM_Module asm_module_) {
        super(asm_module_);
        for (Map.Entry<String, ASM_Function> entry : asm_module.all_function.entrySet()) {
            run_on_function(entry.getValue());
        }
    }

    @Override
    public void run_on_function(ASM_Function asm_function_) {
        for (int i = 0; i < asm_function_.asm_basicblock_in_function.size(); i++) {
            ASM_Basicblock asm_basicblock = asm_function_.asm_basicblock_in_function.get(i);
            load_store_peephole(asm_basicblock);
            load_redundancy_peephole(asm_basicblock);
            mv_redundancy_peephole(asm_basicblock);
            calculate_merge_peephole(asm_basicblock);
            calculate_simplify_peephole(asm_basicblock);
        }

    }

    void mv_redundancy_peephole(ASM_Basicblock asm_basicblock) {
        //mv	t1,zero
        //    mv	t1,zero
        //    mv	t1,zero
        //    mv	t1,zero
        ListIterator<Base_RISCV_Instruction> it;
        it = asm_basicblock.Riscv_instruction_in_block.listIterator(0);
        while (it.hasNext()) {
            Base_RISCV_Instruction base_riscv_instruction = it.next();
            if (base_riscv_instruction instanceof RISCV_Instruction_Move) {
                if (it.hasNext()) {
                    Base_RISCV_Instruction base_riscv_instruction1 = it.next();
                    if (base_riscv_instruction1 instanceof RISCV_Instruction_Move) {
                        if (base_riscv_instruction.rd == base_riscv_instruction1.rd) {
                            //System.out.println("redundancy load");
                            it.previous();
                            it.previous();
                            it.remove();
                        }
                    }
                }
            }
        }
    }

    void load_redundancy_peephole(ASM_Basicblock asm_basicblock) {
        //load t0, check
        //load t0 ,N
        ListIterator<Base_RISCV_Instruction> it;
        it = asm_basicblock.Riscv_instruction_in_block.listIterator(0);
        while (it.hasNext()) {
            Base_RISCV_Instruction base_riscv_instruction = it.next();
            if (base_riscv_instruction instanceof RISCV_Instruction_Load) {
                if (it.hasNext()) {
                    Base_RISCV_Instruction base_riscv_instruction1 = it.next();
                    if (base_riscv_instruction1 instanceof RISCV_Instruction_Load) {
                        if (base_riscv_instruction.rd == base_riscv_instruction1.rd) {
                            //System.out.println("redundancy load");
                            it.previous();
                            it.previous();
                            it.remove();
                        }
                    }
                }
            }
        }
    }

    void load_store_peephole(ASM_Basicblock asm_basicblock) {
        //remove loads following a same-address store.
        //$$
        //\begin{array}{ll}
        //\text { storeAI } r_{1} & \Rightarrow r_{a r p}, 8 \Rightarrow \text { storeAI } r_{1} \Rightarrow r_{a r p}, 8 \\
        //\text { loadAI } r_{\text {arp }}, 8 & \Rightarrow r_{15}
        //\end{array}
        //$$
        ListIterator<Base_RISCV_Instruction> it;
        it = asm_basicblock.Riscv_instruction_in_block.listIterator(0);
        while (it.hasNext()) {
            Base_RISCV_Instruction base_riscv_instruction = it.next();
            if (base_riscv_instruction instanceof RISCV_Instruction_Store) {
                if (it.hasNext()) {
                    Base_RISCV_Instruction base_riscv_instruction1 = it.next();
                    if (base_riscv_instruction1 instanceof RISCV_Instruction_Load) {
                        if (base_riscv_instruction1.rs1 != null &&
                                base_riscv_instruction1.immediate.imm_val == base_riscv_instruction.immediate.imm_val &&
                                base_riscv_instruction.rs1 == base_riscv_instruction1.rs1
                        ) {
                            //System.out.println("peephole l/s");
                            it.remove();
                            it.add(new RISCV_Instruction_Move( base_riscv_instruction.rs2, base_riscv_instruction1.rd));
                        }
                        //todo la t0 k
                        //sw t0 t1
                        //lw t2 k
                    }
                }
            }
        }


    }

    void calculate_merge_peephole(ASM_Basicblock asm_basicblock) {
        //$$
        //\begin{aligned}
        //&\text { add I } r_{2}, 0 \Rightarrow r_{7} \\
        //&\text { mult } r_{4}, r_{7} \Rightarrow r_{10} \Rightarrow \text { mult } r_{4}, r_{2} \Rightarrow r_{10}
        //\end{aligned}
        //$$
        ListIterator<Base_RISCV_Instruction> it;
        it = asm_basicblock.Riscv_instruction_in_block.listIterator(0);
        while (it.hasNext()) {
            Base_RISCV_Instruction base_riscv_instruction = it.next();
            if (it instanceof RISCV_Instruction_Binary && ((RISCV_Instruction_Binary) it).immediate != null && ((RISCV_Instruction_Binary) it).immediate.imm_val == 0) {
                if (it.hasNext()) {
                    Base_RISCV_Instruction base_riscv_instruction1 = it.next();
                    if (base_riscv_instruction1 instanceof RISCV_Instruction_Binary && base_riscv_instruction1.immediate == null) {
                        if (base_riscv_instruction.rd == base_riscv_instruction1.rs1) {
                            //System.out.println("peephole l/s 1");
                            it.remove();
                            it.previous();
                            it.remove();
                            it.add(new RISCV_Instruction_Binary(((RISCV_Instruction_Binary) base_riscv_instruction1).riscvBinarytype, base_riscv_instruction.rs1, base_riscv_instruction1.rs2, base_riscv_instruction1.rd, null));
                        } else if (base_riscv_instruction.rd == base_riscv_instruction1.rs2) {
                            //System.out.println("peephole l/s 2");
                            it.remove();
                            it.previous();
                            it.remove();
                            it.add(new RISCV_Instruction_Binary(((RISCV_Instruction_Binary) base_riscv_instruction1).riscvBinarytype, base_riscv_instruction1.rs1, base_riscv_instruction.rs1, base_riscv_instruction1.rd, null));
                        }
                    }
                }
            }
        }

    }

    void calculate_simplify_peephole(ASM_Basicblock asm_basicblock) {
        //$$
        //\begin{aligned}
        //&\text { add I } r_{2}, 0 \Rightarrow r_{7} \\
        //&\text { mult } r_{4}, r_{7} \Rightarrow r_{10} \Rightarrow \text { mult } r_{4}, r_{2} \Rightarrow r_{10}
        //\end{aligned}
        //$$
        ListIterator<Base_RISCV_Instruction> it;
        it = asm_basicblock.Riscv_instruction_in_block.listIterator(0);
        while (it.hasNext()) {
            Base_RISCV_Instruction base_riscv_instruction = it.next();
            if (base_riscv_instruction instanceof RISCV_Instruction_Binary) {
                switch (((RISCV_Instruction_Binary) base_riscv_instruction).riscvBinarytype) {
                    case add, sub, sll, sra, or, xor -> {
                        //may useless
                        if (base_riscv_instruction.rs2 == asm_module.physical_registers.get(0) && base_riscv_instruction.rs1 == base_riscv_instruction.rd) {
                            it.remove();
                        } else if (base_riscv_instruction.rs1 == asm_module.physical_registers.get(0) && base_riscv_instruction.rs2 == base_riscv_instruction.rd) {
                            it.remove();
                        }
                    }
                    case mul, div, rem -> {

                    }
                    //set less than
                    case slt, sgt -> {
                    }
                    case and -> {

                    }
                    case addi, srli, srai, ori, xori -> {
                        //useful
                        //System.out.println("peep simpilfy");
                        if (base_riscv_instruction.immediate.imm_val == 0 && base_riscv_instruction.rs1 == base_riscv_instruction.rd) {
                            it.remove();
                        }
                    }
                    case slli, slti, sltiu -> {

                    }
                    case andi -> {
                    }
                }
            } else if (base_riscv_instruction instanceof RISCV_Instruction_Move) {
                if (base_riscv_instruction.rd == base_riscv_instruction.rs1) it.remove();
            }
        }
    }
}


