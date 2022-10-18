import Backend.ASMprinter;
import Backend.Instructin_select;
import BackendOptimizen.Peephole;
import IR.IRbuilder;
import IR.IRprinter;
import IR.Instru.AllocateInstruction;
import MidEndOptimizen.CFG_optimizen;
import MidEndOptimizen.Mem2Reg;
import Optimize.Graph_Coloring;
import Parser.MxErrorListener;
import Parser.MxLexer;
import Parser.MxParser;
import Utils.Builtin_Printer;
import Utils.error.Error;
import Utils.globalscope;
import frontend.ASTbuilder;
import frontend.Semanticcheck;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import AST.*;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Objects;

public class Compiler {
    public static void main(String[] args) throws Exception {

        //chose the read option
        boolean localjudge =false;
        boolean local_test_ir = false;
        boolean inlinux=false;
        String name;
        InputStream input = null;
        boolean onlysemnatic = false;
        boolean opt = false;
        if (localjudge && (!local_test_ir)) {
            if (!inlinux)name = "C:\\Users\\18303\\IdeaProjects\\Mx\\src\\selftest\\test.mx";
            else name = "/mnt/c/Users/18303/IdeaProjects/Mx/src/selftest/test.mx";

            input = new FileInputStream(name);
        } else {
            name = "online_judge";
            input = System.in;
            for (int i = 0; i < args.length; ++i) {
                if (args[i].charAt(0) == '-') {
                    if (Objects.equals(args[i], "-fsyntax-only"))
                        onlysemnatic = true;
                }
                if (args[i].charAt(0) == '-') {
                    if (Objects.equals(args[i], "-opt"))
                        opt = true;
                }
            }
        }
        try {
            //lexer and parser
            MxLexer lexer = new MxLexer(CharStreams.fromStream(input));
            lexer.removeErrorListeners();
            lexer.addErrorListener(new MxErrorListener());
            MxParser parser = new MxParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new MxErrorListener());
            ParseTree parseTreeRoot = parser.program();

            //from paser_tree to ast_tree
            globalscope gScope = new globalscope(null);
            ASTbuilder astBuilder = new ASTbuilder(gScope);
            Rootnode ASTRoot;
            ASTRoot = (Rootnode) astBuilder.visit(parseTreeRoot);

            //semantic check
            Semanticcheck semanticchecker = new Semanticcheck(gScope);
            semanticchecker.visit(ASTRoot);
            if (onlysemnatic) return;

            //ir builder
            IRbuilder irbuilder = new IRbuilder(gScope);
            ASTRoot.accept(irbuilder);
            if (!local_test_ir) System.out.println("-------------irbuild finish-------------");

            if (localjudge&&(!local_test_ir)) {//print naive llvm
                IRprinter llvm_naive = new IRprinter("testout/naive_llvm.ll", name);
                if (local_test_ir == true) llvm_naive.stdout = true;
                llvm_naive.visit(irbuilder.module_in_irbuilder);
            }

            //begin opt
            CFG_optimizen cfg_optimizen = new CFG_optimizen(irbuilder.module_in_irbuilder);
            cfg_optimizen.run();

            if (localjudge&&(local_test_ir)) {//print naive llvm
                IRprinter llvm_naive = new IRprinter("testout/naive_llvm.ll", name);
                if (local_test_ir == true) llvm_naive.stdout = true;
                llvm_naive.visit(irbuilder.module_in_irbuilder);
            }

            if (localjudge&&(!local_test_ir)) {//print naive llvm
                IRprinter llvm_naive = new IRprinter("testout/optllvm.ll", name);
                if (local_test_ir == true) llvm_naive.stdout = true;
                llvm_naive.visit(irbuilder.module_in_irbuilder);
            }


            if ((!(AllocateInstruction.alloca_cnt > 270)) || opt) {
                Mem2Reg mem2Reg = new Mem2Reg(irbuilder.module_in_irbuilder);
            }


            if (!local_test_ir) System.out.println("-------------opt finish-------------");

//            if (localjudge){//print naive llvm
//                IRprinter llvm_naive = new IRprinter("testout/naive_llvm_after_mem2reg.ll", name);
//                if (local_test_ir==true)llvm_naive.stdout=true;
//                llvm_naive.visit(irbuilder.module_in_irbuilder);
//            }
            //instrunction select
            Instructin_select instructin_select = new Instructin_select(irbuilder.module_in_irbuilder);

            if (!local_test_ir) System.out.println("-------------inst select finish-------------");


            ASMprinter asMprinter_to_ravel1 = new ASMprinter(irbuilder.module_in_irbuilder, instructin_select.cur_module);
//            if (localjudge) {
//                asMprinter_to_ravel1.file_print = new PrintWriter(new FileOutputStream("C:\\Users\\18303\\IdeaProjects\\Mx\\ravel\\testpre.s"));
//                asMprinter_to_ravel1.run_print();
//            }
            //reg allocate
            //HorribleStackAlllocate horribleStackAlllocate=new HorribleStackAlllocate(instructin_select.cur_module);
            Graph_Coloring graph_coloring = new Graph_Coloring(instructin_select.cur_module);

            if (!local_test_ir) System.out.println("-------------graph coloring finish-------------");


            //backend optimizen
            Peephole peephole_ = new Peephole(instructin_select.cur_module);


            if (!local_test_ir) System.out.println("-------------asm opt finish-------------");



            //asm printer
            ASMprinter asMprinter_to_ravel = new ASMprinter(irbuilder.module_in_irbuilder, instructin_select.cur_module);
            if (localjudge) {
                if (!inlinux)   asMprinter_to_ravel.file_print = new PrintWriter(new FileOutputStream("C:\\Users\\18303\\IdeaProjects\\Mx\\ravel\\test.s"));
                else   asMprinter_to_ravel.file_print = new PrintWriter(new FileOutputStream("/mnt/c/Users/18303/IdeaProjects/Mx/ravel/test.s"));
            }else {
                asMprinter_to_ravel.file_print = new PrintWriter(new FileOutputStream("output.s"));
                Builtin_Printer builtin_printer = new Builtin_Printer("builtin.s");
            }
            asMprinter_to_ravel.run_print();
        } catch (Error er) {
            System.err.println(er.toString());
            System.out.println("Fail");
            throw new RuntimeException();
        }
    }

}


