package RISCV.Operand.Register;

public class Physical_Register extends Base_RISCV_Register{
    public String regname;
    public Physical_Register(String regname_){regname=regname_;}
    @Override
    public String toString() {
        return regname;
    }
}
