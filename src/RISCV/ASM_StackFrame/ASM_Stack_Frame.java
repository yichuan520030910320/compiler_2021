package RISCV.ASM_StackFrame;

import Backend.ASMVisitor;

public class ASM_Stack_Frame {
    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

}
