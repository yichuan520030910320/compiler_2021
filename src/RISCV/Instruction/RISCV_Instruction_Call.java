package RISCV.Instruction;

import Backend.ASMVisitor;

public class RISCV_Instruction_Call extends Base_RISCV_Instruction{
    public String function_name;
    public RISCV_Instruction_Call(String function_name_){
        super(null,null,null,null);


        function_name=function_name_;
    }
    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return "call\t"+function_name;
    }
}
