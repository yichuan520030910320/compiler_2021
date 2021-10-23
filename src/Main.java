import Parser.MxErrorListener;
import Parser.MxLexer;
import Parser.MxParser;
import Utils.error.error;
import Utils.globalscope;
import frontend.ASTbuilder;
import frontend.Semanticcheck;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import AST.*;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws Exception {
        Scanner scanner = new Scanner(System.in);
        String name = scanner.nextLine();
      // String name = "C:\\Users\\18303\\IdeaProjects\\Mx\\src\\selftest\\test.mx";
        InputStream input = System.in;
        try {
            globalscope gScope = new globalscope(null);
            MxLexer lexer = new MxLexer(CharStreams.fromStream(input));
            lexer.removeErrorListeners();
            lexer.addErrorListener(new MxErrorListener());
            MxParser parser = new MxParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new MxErrorListener());
            ParseTree parseTreeRoot = parser.program();//only throw one error ?
            ASTbuilder astBuilder = new ASTbuilder(gScope);
            Rootnode ASTRoot;
            ASTRoot = (Rootnode) astBuilder.visit(parseTreeRoot);
            Semanticcheck semanticchecker=new Semanticcheck(gScope);
            semanticchecker.visit(ASTRoot);

            System.out.println("you can debug here");

            System.out.println("Success");

        } catch (error er) {
            System.err.println(er.toString());
            System.out.println("Fail");
            throw new RuntimeException();



        }
        System.out.println(" good you at least finish it!!");
    }
}
