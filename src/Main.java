import Parser.MxErrorListener;
import Parser.MxLexer;
import Parser.MxParser;
import Utils.error.error;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import AST.*;
import java.io.FileInputStream;
import java.io.InputStream;

public class Main {
    public static void main(String[] args) throws Exception {
        String name = "C:\\Users\\18303\\IdeaProjects\\Mx\\src\\test.mx";
        InputStream input = new FileInputStream(name);
        try {
            MxLexer lexer = new MxLexer(CharStreams.fromStream(input));
            lexer.removeErrorListeners();
            lexer.addErrorListener(new MxErrorListener());
            MxParser parser = new MxParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new MxErrorListener());
            ParseTree parseTreeRoot = parser.program();//only throw one error ?
        } catch (error er) {
            System.err.println(er.toString());
            throw new RuntimeException();
        }


        System.out.println("nmsl");
    }
}
