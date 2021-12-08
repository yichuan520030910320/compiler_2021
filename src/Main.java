import IR.IRbuilder;
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
        InputStream input = null;
        if (op == 1) {
            String name = "C:\\Users\\18303\\IdeaProjects\\Mx\\src\\selftest\\test.mx";
            input = new FileInputStream(name);
        } else {
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

            //ir builder
            IRbuilder irbuilder = new IRbuilder(gScope);
            ASTRoot.accept(irbuilder);

            //print llvm




            System.out.println("Semantic Success");

        } catch (Error er) {
            System.err.println(er.toString());
            System.out.println("Fail");
            throw new RuntimeException();


        }
    }
}
