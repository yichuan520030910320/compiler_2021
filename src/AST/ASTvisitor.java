package AST;

import AST.TYPEnode.arrytype;
import AST.TYPEnode.booltype;
import AST.TYPEnode.*;

public interface ASTvisitor {

    void visit(arrytype it);
    void visit(booltype it);
    void visit(classtype it);
    void visit(inttype it);
    void visit(nulltype it);
    void visit(stringtype it);
    void visit(voidtype it);
    void visit(Rootnode it);



}
