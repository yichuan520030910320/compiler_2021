package IR.Operand;

import IR.TypeSystem.Typesystem;

public class Mem2Reg_Register extends BaseOperand{
    public static int reg_cnt=0;
    private int cur_cnt;
    public Mem2Reg_Register(Typesystem typesystem) {
        super(typesystem);
        cur_cnt=reg_cnt;
        reg_cnt++;
    }


    @Override
    public String toString() {
        return "mem2reg"+cur_cnt;
    }

    @Override
    public String unit_output() {
        return type.toString()+" %mem2reg"+cur_cnt;
    }
}
