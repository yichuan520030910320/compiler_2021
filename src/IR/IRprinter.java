package IR;

import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRmodule.IRmodule;
import IR.Instru.*;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;

public class IRprinter implements IRvisitor {
    public PrintWriter file_print;
    public String source_file;

    public IRprinter(String path, String src) throws FileNotFoundException {
        file_print = new PrintWriter(new FileOutputStream(path));
        source_file = src;
    }

    @Override
    public void visit(BinaryInstruction it) {

    }

    @Override
    public void visit(BrInstruction it) {

    }

    @Override
    public void visit(CallInstruction it) {

    }

    @Override
    public void visit(CmpInstruction it) {

    }

    @Override
    public void visit(LoadInstruction it) {

    }

    @Override
    public void visit(PhiInstruction it) {

    }

    @Override
    public void visit(RetInstruction it) {

    }

    @Override
    public void visit(StoreInstruction it) {

    }

    @Override
    public void visit(AllocateInstruction it) {

    }

    @Override
    public void visit(IRbasicblock it) {

    }

    @Override
    public void visit(IRfunction it) {

    }

    @Override
    public void visit(IRmodule it) {
        f_println("; ModuleID = '" + source_file + "'");
        f_println("source_filename = \""+source_file+"\"");
        f_println("");




        file_print.close();
    }

    void f_println(String index) {
        file_print.println(index);
    }
}
