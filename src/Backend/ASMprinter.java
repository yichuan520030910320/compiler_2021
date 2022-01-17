package Backend;

import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.ASM_StackFrame.ASM_Stack_Frame;
import RISCV.Instruction.*;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;

public class ASMprinter implements ASMVisitor{
    public PrintWriter file_print;

    public boolean stdout=false;
    private String tab = "    ";

    public ASM_Module asm_module;

    public ASMprinter(ASM_Module asm_module_,String path) throws FileNotFoundException {
        asm_module=asm_module_;
        file_print = new PrintWriter(new FileOutputStream(path));


        //print module here and inductive function and basicblock in the subfunction




        file_print.close();
    }
    void f_println(String index) {

        if (stdout) {
            System.out.println(index);
            return;
        }
        file_print.println(index);
    }

    @Override
    public void visit(ASM_Basicblock it) {

    }

    @Override
    public void visit(ASM_Function it) {

    }

    @Override
    public void visit(ASM_Module it) {

    }

    @Override
    public void visit(ASM_Stack_Frame it) {

    }

    @Override
    public void visit(RISCV_Instruction_Binary it) {

    }

    @Override
    public void visit(RISCV_Instruction_Branch it) {

    }

    @Override
    public void visit(RISCV_Instruction_Call it) {

    }

    @Override
    public void visit(RISCV_Instruction_J it) {

    }

    @Override
    public void visit(RISCV_Instruction_Lui it) {

    }

    @Override
    public void visit(RISCV_Instruction_Move it) {

    }

    @Override
    public void visit(RISCV_Instruction_Ret it) {

    }

    @Override
    public void visit(RISCV_Instruction_Store it) {

    }
}
