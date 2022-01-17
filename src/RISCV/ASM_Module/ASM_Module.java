package RISCV.ASM_Module;

import Backend.ASMVisitor;
import RISCV.ASM_Function.ASM_Function;
import RISCV.Operand.Register.Physical_Register;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.function.Function;

public class ASM_Module {
    public static ArrayList<String> PhyRegName = new ArrayList<>(Arrays.asList(
            "zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2", "s0", "s1",
            "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
            "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"));
    public ArrayList<Physical_Register> physical_registers=new ArrayList<>();
    public HashMap<String, ASM_Function> all_function=new HashMap<>();
    public HashMap<String, ASM_Function> external_function=new HashMap<>();
    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }
    public ASM_Module(){

        for (String s : PhyRegName) {
            physical_registers.add(new Physical_Register(s));
        }
    }


}
