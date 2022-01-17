package RISCV.ASM_Function;

import Backend.ASMVisitor;
import IR.Operand.Register;
import RISCV.ASM_Basicblock.ASM_Basicblock;
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
    //record the virtual reg and the offset
    public HashMap<Virtual_Register, Integer> Virtual_to_offset = new HashMap<>();

    public ASM_Function() {

    }

    public void alloca(Virtual_Register reg, int bytes) {
        virtual_reg_offset += bytes;
        Virtual_to_offset.put(reg, virtual_reg_offset);
    }

    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

}
