package BackendOptimizen;

import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.Instruction.Base_RISCV_Instruction;
import RISCV.Instruction.RISCV_Instruction_Load;
import RISCV.Instruction.RISCV_Instruction_Move;
import RISCV.Instruction.RISCV_Instruction_Store;
import RISCV.Operand.Register.Base_RISCV_Register;
import RISCV.Operand.Register.Physical_Register;

import javax.print.attribute.HashAttributeSet;
import java.util.HashSet;
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


        }

    }

    void load_store_peephole(ASM_Basicblock asm_basicblock) {
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
                    if (base_riscv_instruction1 instanceof RISCV_Instruction_Load){
                        if (base_riscv_instruction1.rs1!=null&&
                                base_riscv_instruction1.immediate.imm_val==base_riscv_instruction.immediate.imm_val&&
                                base_riscv_instruction.rs1== base_riscv_instruction1.rs1&&
                                base_riscv_instruction.rs2==base_riscv_instruction1.rd
                        ){
                            it.remove();
                            it.add(new RISCV_Instruction_Move(base_riscv_instruction1.rd,base_riscv_instruction.rs2));


                        }



                    }


                }

            }
        }


    }

    void calculate_peephole(ASM_Basicblock asm_basicblock) {

        //$$
        //\begin{aligned}
        //&\text { add I } r_{2}, 0 \Rightarrow r_{7} \\
        //&\text { mult } r_{4}, r_{7} \Rightarrow r_{10} \Rightarrow \text { mult } r_{4}, r_{2} \Rightarrow r_{10}
        //\end{aligned}
        //$$

    }
}


