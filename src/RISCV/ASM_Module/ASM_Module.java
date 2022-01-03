package RISCV.ASM_Module;

import RISCV.ASM_Function.ASM_Function;

import java.util.HashMap;
import java.util.function.Function;

public class ASM_Module {
    public HashMap<String, ASM_Function> all_function=new HashMap<>();
    public HashMap<String, ASM_Function> external_function=new HashMap<>();

}
