package RISCV.Instruction;

import Backend.ASMVisitor;

public class RISCV_Instruction_J extends Base_RISCV_Instruction{
    public String target_block_name;
    public RISCV_Instruction_J(String target_block_name_){
        super(null,null,null,null);
        target_block_name=target_block_name_;
    }
    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "j\t"+target_block_name;
    }
}
