package RISCV.Operand.Register;

public class Virtual_Register extends Base_RISCV_Register {
    String vitural_reg_name;
    public int byte_num;
    public Virtual_Register(String vitural_reg_name_,int byte_num_){vitural_reg_name=vitural_reg_name_;
    byte_num=byte_num_;}
    @Override
    public String toString() {
        return vitural_reg_name;
    }
}
