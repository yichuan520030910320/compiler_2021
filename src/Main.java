import Backend.ASMprinter;
import Backend.HorribleStackAlllocate;
import Backend.Instructin_select;
import IR.IRbuilder;
import IR.IRprinter;
import Parser.MxErrorListener;
import Parser.MxLexer;
import Parser.MxParser;
import Utils.error.Error;
import Utils.globalscope;
import frontend.ASTbuilder;
import frontend.Semanticcheck;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import AST.*;

import java.io.FileInputStream;
import java.io.InputStream;

public class Main {
    public static void main(String[] args) throws Exception {

        //chose the read option
        int op = 1;
        String name;
        InputStream input = null;
        if (op == 1) {
            name = "C:\\Users\\18303\\IdeaProjects\\Mx\\src\\selftest\\test.mx";
            input = new FileInputStream(name);
        } else {
            name="online_judge";
            input = System.in;
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
            //System.out.println("Semantic Success");

            //ir builder
            IRbuilder irbuilder = new IRbuilder(gScope);
            ASTRoot.accept(irbuilder);

            //print naive llvm
            IRprinter llvm_naive=new IRprinter("testout/naive_llvm.ll",name);
            //llvm_naive.stdout=true;
            llvm_naive.visit(irbuilder.module_in_irbuilder);

            //System.out.println("IRbuild Success");

            //instrunction select
            Instructin_select instructin_select=new Instructin_select(irbuilder.module_in_irbuilder);
            instructin_select.visit(instructin_select.iRmodule);

            //reg allocate
            HorribleStackAlllocate horribleStackAlllocate=new HorribleStackAlllocate(instructin_select.cur_module);
            horribleStackAlllocate.reg_allocate();

            //asm printer
            ASMprinter asMprinter=new ASMprinter(horribleStackAlllocate.asm_module,"testout/output.s");


        } catch (Error er) {
            System.err.println(er.toString());
            System.out.println("Fail");
            throw new RuntimeException();


        }
    }
}
