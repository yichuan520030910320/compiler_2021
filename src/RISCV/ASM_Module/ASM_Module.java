package RISCV.ASM_Module;

import Backend.ASMVisitor;
import RISCV.ASM_Function.ASM_Function;
import RISCV.Operand.Register.Physical_Register;

import java.util.LinkedList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.function.Function;

public class ASM_Module {
    public static LinkedList<String> PhyRegName = new LinkedList<>(Arrays.asList(
            "zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2", "s0", "s1",
            "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
            "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"));
    //0 stand for special reg && 1 stand for caller saved && 2 stand for calle saved
    public static LinkedList<Integer> RegPrivilege = new LinkedList<>(Arrays.asList(0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1));

    public LinkedList<Physical_Register> physical_registers = new LinkedList<>();
    public LinkedList<Physical_Register> caller_registers = new LinkedList<>();
    public LinkedList<Physical_Register> callee_registers = new LinkedList<>();
    //used for graph coloring in the assign color function
    public LinkedList<Physical_Register> okColors = new LinkedList<>();
    //used as a tool for graphcoloring
    public HashMap<Physical_Register, Integer> physical_registerIntegerHashMap = new HashMap<>();
    public HashMap<String, ASM_Function> all_function = new HashMap<>();

    public void accept(ASMVisitor visitor) {
        visitor.visit(this);
    }

    public ASM_Module() {
        for (String s : PhyRegName) {
            physical_registers.add(new Physical_Register(s));
        }
        for (int i = 0; i < RegPrivilege.size(); i++) {
            physical_registerIntegerHashMap.put(physical_registers.get(i), i);
            if (RegPrivilege.get(i) == 1) caller_registers.add(physical_registers.get(i));
            else if (RegPrivilege.get(i) == 2) callee_registers.add(physical_registers.get(i));
        }
        okColors.addAll(caller_registers);
        okColors.addAll(callee_registers);
    }


}
