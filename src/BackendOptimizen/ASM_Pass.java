package BackendOptimizen;

import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;

abstract public class ASM_Pass {
    public ASM_Module asm_module;
    public  ASM_Pass(ASM_Module asm_module_){
        asm_module=asm_module_;
    }
    abstract public void run_on_function(ASM_Function asm_function_);
}
