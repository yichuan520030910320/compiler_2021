package RISCV.Operand.Imm;

import RISCV.Operand.Base_RISCV_Operand;

public class Immediate extends Base_RISCV_Operand {
    public int imm_val;
    public Immediate(int imm_val_){
        imm_val=imm_val_;
    }


    @Override
    public String toString() {
        return Integer.toString(imm_val);
    }
}
