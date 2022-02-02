package Backend;

import Optimize.LivenessAnalysis;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.Instruction.*;
import RISCV.Operand.Base_RISCV_Operand;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;
import RISCV.Operand.Register.Physical_Register;
import RISCV.Operand.Register.Virtual_Register;

import java.util.ListIterator;
import java.util.Map;

public class HorribleStackAlllocate {
    public ASM_Module asm_module;
    public ASM_Basicblock curbasicblock;
    public ASM_Function curfunction;
    public Physical_Register t3, t4, t5, t6, sp, s0,ra;
    public ListIterator<Base_RISCV_Instruction> it;

    public HorribleStackAlllocate(ASM_Module asm_module_) {

        asm_module = asm_module_;
        t3 = asm_module_.physical_registers.get(28);
        t4 = asm_module_.physical_registers.get(29);
        t5 = asm_module_.physical_registers.get(30);
        t6 = asm_module_.physical_registers.get(31);
        sp = asm_module_.physical_registers.get(2);
        s0 = asm_module_.physical_registers.get(8);
        ra=asm_module_.physical_registers.get(1);

        for (Map.Entry<String, ASM_Function> entry : asm_module.all_function.entrySet()) {
            new LivenessAnalysis(entry.getValue(),ra,s0);
            for (int i = 0; i < entry.getValue().asm_basicblock_in_function.size(); i++) {
                curfunction = entry.getValue();

                    curbasicblock = curfunction.asm_basicblock_in_function.get(i);
                    it = curbasicblock.Riscv_instruction_in_block.listIterator(0);
                    while (it.hasNext()) {
                        //note that the first it.next mean the first element
                        Base_RISCV_Instruction instruction = it.next();
                        if (instruction.rs1 != null) {
                            instruction.rs1 = (Base_RISCV_Register) Horrible_LoadStore_onStack(instruction.rs1, t3, true);
                        }
                        if (instruction.rs2 != null) {
                            instruction.rs2 = (Base_RISCV_Register) Horrible_LoadStore_onStack(instruction.rs2, t4, true);
                        }
                        if (instruction.rd != null) {
                            instruction.rd = (Base_RISCV_Register) Horrible_LoadStore_onStack(instruction.rd, t5, false);
                        }
                    }

            }
        }
    }

    //true for load && false for store
    private Base_RISCV_Operand Horrible_LoadStore_onStack(Base_RISCV_Operand operand1, Base_RISCV_Operand operand2, boolean load_or_store) {
        //cope with the global var condition
        //cope with stackframe size out of range
        if (operand1 instanceof Physical_Register) return operand1;
        else {
            assert operand1 instanceof Virtual_Register;
            if (!curfunction.Virtual_to_offset.containsKey(operand1)) {
                curfunction.alloca((Virtual_Register) operand1, ((Virtual_Register) operand1).byte_num);
            }
            int imm_ = -curfunction.Virtual_to_offset.get(operand1);
            if (checkimmrange(imm_)){
                if (load_or_store) {
                    it.previous();
                    it.add(new RISCV_Instruction_Load(((Virtual_Register) operand1).byte_num, s0, (Base_RISCV_Register) operand2, new Immediate(imm_)));
                    it.next();
                } else {
                    it.add(new RISCV_Instruction_Store(((Virtual_Register) operand1).byte_num, s0, (Base_RISCV_Register) operand2, new Immediate(imm_)));
                }  }
            else{
                if (load_or_store) {
                    it.previous();
                    outofrange_get_offset(imm_);
                     it.add(new RISCV_Instruction_Load(((Virtual_Register) operand1).byte_num, t6, (Base_RISCV_Register) operand2, new Immediate(0)));
                    it.next();
                } else {
                    outofrange_get_offset(imm_);
                    it.add(new RISCV_Instruction_Store(((Virtual_Register) operand1).byte_num, t6, (Base_RISCV_Register) operand2, new Immediate(0)));
                }
            }

            return operand2;
        }
    }
    private void outofrange_get_offset(int imm_){
        it.add(new RISCV_Instruction_Li(t6,new Immediate(imm_)));
        it.add(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add,s0,t6,t6,null));

    }


    public boolean checkimmrange(int imm_) {
        return imm_ >= -2048 && imm_ < 2048;
    }
}
