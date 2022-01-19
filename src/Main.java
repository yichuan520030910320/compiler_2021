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
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Objects;

public class Main {
    public static void main(String[] args) throws Exception {

        //chose the read option
        boolean localjudge =true;
        String name;
        InputStream input = null;boolean onlysemnatic=false;
        if (localjudge ) {
            name = "C:\\Users\\18303\\IdeaProjects\\Mx\\src\\selftest\\test.mx";
            input = new FileInputStream(name);
        } else {
            name="online_judge";
            input = System.in;
            for (int i = 0; i < args.length; ++i){
                if (args[i].charAt(0) == '-'){
                    if (Objects.equals(args[i], "-fsyntax-only"))
                        onlysemnatic = true;
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
            //System.out.println("Semantic Success");
            if (onlysemnatic)return;

            //ir builder
            IRbuilder irbuilder = new IRbuilder(gScope);
            ASTRoot.accept(irbuilder);

            if (localjudge){//print naive llvm
                IRprinter llvm_naive = new IRprinter("testout/naive_llvm.ll", name);

                //llvm_naive.stdout=true;
                llvm_naive.visit(irbuilder.module_in_irbuilder);
            }
            //System.out.println("IRbuild Success");


            //instrunction select
            Instructin_select instructin_select=new Instructin_select(irbuilder.module_in_irbuilder);

            //reg allocate
            HorribleStackAlllocate horribleStackAlllocate=new HorribleStackAlllocate(instructin_select.cur_module);

            //asm printer
            ASMprinter asMprinter_to_ravel=new ASMprinter(irbuilder.module_in_irbuilder,horribleStackAlllocate.asm_module);

            if (localjudge)asMprinter_to_ravel.file_print= new PrintWriter(new FileOutputStream("C:\\Users\\18303\\IdeaProjects\\Mx\\ravel\\test.s"));
            else asMprinter_to_ravel.file_print= new PrintWriter(new FileOutputStream("output.s"));
            asMprinter_to_ravel.run_print();



        } catch (Error er) {
            System.err.println(er.toString());
            System.out.println("Fail");
            throw new RuntimeException();
        }
    }
}
