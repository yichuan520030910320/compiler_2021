package Backend;

import RISCV.ASM_Module.ASM_Module;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;

public class ASMprinter {
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

}
