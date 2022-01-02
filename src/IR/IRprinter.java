package IR;

import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRmodule.IRmodule;
import IR.Instru.*;
import IR.Operand.ConstOperand_String;
import IR.Operand.Global_variable;
import IR.TypeSystem.PointerType;
import IR.TypeSystem.StructType;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Map;

public class IRprinter implements IRvisitor {
    public PrintWriter file_print;
    public String source_file;

    public boolean stdout=false;
    private String tab = "    ";

    public IRprinter(String path, String src) throws FileNotFoundException {
        file_print = new PrintWriter(new FileOutputStream(path));
        source_file = src;
    }

    @Override
    public void visit(BinaryInstruction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(BrInstruction it) {
        f_println(tab + it.toString());

    }

    @Override
    public void visit(CallInstruction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(CmpInstruction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(LoadInstruction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(PhiInstruction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(RetInstruction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(StoreInstruction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(AllocateInstruction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(GetElementPtrInstruction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(BitCastInstruction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(IRbasicblock it) {
        StringBuilder tmp_output = new StringBuilder(it.blockname + ":");
        tmp_output.append(" ".repeat(60 - it.blockname.length()));
        if (it.pre_basicblock.size() != 0) {
            tmp_output.append("; preds = ");
            for (Object object : it.pre_basicblock) {
                tmp_output.append(object).append(" ");
            }
        }
        f_println(tmp_output.toString());
        for (int i = 0; i < it.link_in_basicblock.size(); i++) {
            it.link_in_basicblock.get(i).accept(this);
        }
    }

    @Override
    public void visit(IRfunction it) {
        f_println(tab + it.toString());
    }

    @Override
    public void visit(IRmodule it) {
        f_println("; ModuleID = '" + source_file + "'");
        f_println("source_filename = \"" + source_file + "\"");
        f_println("target datalayout = \"e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128\"\n" +
                "target triple = \"x86_64-pc-linux-gnu\"");
        f_println("");

        for (Map.Entry<String, StructType> entry : it.Module_Struct_Map.entrySet()) {
            f_println(entry.getValue().class_type_unit());


        }


        //just for int need to be modiefied
        for (Map.Entry<String, Global_variable> entry : it.Global_variable_map.entrySet()) {
            //don't print the string here print it in the next
            if (entry.getValue().initoperand instanceof ConstOperand_String) continue;
            //a detial output inspired by gls
            StringBuilder tail = new StringBuilder(((PointerType) entry.getValue().type).dim > 1 ? "null" : "0");
            f_println(entry.getValue().toString() + " = dso_local global " + ((PointerType) entry.getValue().type).get_low_dim_type() + " " + tail.toString());
        }
        f_println("");


        for (Map.Entry<String, Global_variable> entry : it.string_map.entrySet()) {
            StringBuilder tmp = new StringBuilder(entry.getKey().replace("\\", "\\5C").
                    replace("\n", "\\0A").
                    replace("\t", "\\09").
                    replace("\"", "\\22").
                    replace("\0", "\\00"));

            f_println(entry.getValue().toString() + " = private unnamed_addr constant [" + (entry.getKey().length()) + " x i8] c\"" + tmp.toString() + "\", align 1");
        }
        f_println("");

        for (Map.Entry<String, IRfunction> entry : it.External_Function_Map.entrySet()) {
            f_println("declare " + entry.getValue().function_type.returntype.toString() + " @" + entry.getValue().name_and_para());
        }
        f_println("");

        for (Map.Entry<String, IRfunction> entry : it.Internal_Function_Map.entrySet()) {
            f_println("define dso_local " + entry.getValue().function_type.returntype + " @" + entry.getValue().name_and_para() + " {");
            IRfunction tmpirrunction = entry.getValue();
            for (int i = 0; i < tmpirrunction.block_list.size(); i++) {
                tmpirrunction.block_list.get(i).accept(this);
                if (i != tmpirrunction.block_list.size() - 1) f_println("");
            }
            f_println("}");
        }
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
