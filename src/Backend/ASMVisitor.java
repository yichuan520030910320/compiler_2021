package Backend;

import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.ASM_StackFrame.ASM_Stack_Frame;
import RISCV.Instruction.*;

public interface ASMVisitor {
    void visit(ASM_Basicblock it);
    void visit(ASM_Function it);

    void visit(ASM_Module it);

    void visit(ASM_Stack_Frame it);

    void visit(RISCV_Instruction_Binary it);

    void visit(RISCV_Instruction_Branch it);

    void visit(RISCV_Instruction_Call it);

    void visit(RISCV_Instruction_J it);

    void visit(RISCV_Instruction_Lui it);

    void visit(RISCV_Instruction_Move it);

    void visit(RISCV_Instruction_Ret it);

    void visit(RISCV_Instruction_Store it);
}
