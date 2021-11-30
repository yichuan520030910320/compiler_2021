package AST;

import AST.EXPRnode.*;
import AST.EXPRnode.CONSTEXPRnode.Constbool_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Constint_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Constnull_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Conststring_ASTnode;
import AST.STATnode.*;
import AST.TYPEnode.Arraytype_ASTnode;
import AST.TYPEnode.Booltype_ASTnode;
import AST.TYPEnode.*;
import AST.VALDECLnode.*;

public interface ASTvisitor {

    void visit(Arraytype_ASTnode it);

    void visit(Booltype_ASTnode it);

    void visit(Classtype_ASTnode it);

    void visit(Inttype_ASTnode it);

    void visit(Nulltype_ASTnode it);

    void visit(Stringtype_ASTnode it);

    void visit(Voidtype_ASTnode it);

    void visit(Rootnode it);

    void visit(BinaryExp_ASTnode it);

    void visit(Constint_ASTnode it);

    void visit(Constbool_ASTnode it);

    void visit(Front_UnaryExp_ASTnode it);

    void visit(Conststring_ASTnode it);

    void visit(Constnull_ASTnode it);


    void visit(FunctioncallExp_ASTnode it);

    void visit(IdExp_ASTnode it);

    void visit(LambdaExp_ASTnode it);

    void visit(NewExp_ASTnode it);

    void visit(MemberExp_ASTnode it);

    void visit(Suite_ASTnode it);

    void visit(Singlevaluedecl_ASTnode it);

    void visit(Fundecl_ASTnode it);

    void visit(Classdecl_ASTnode it);

    void visit(Paralist_ASTnode it);

    void visit(Thisexpr_ASTnode it);

    void visit(Whilestat_ASTnode it);

    void visit(Valdeclstat_ASTnode it);

    void visit(Returnstat_ASTnode it);

    void visit(Ifstat_ASTnode it);

    void visit(Forstat_ASTnode it);

    void visit(Exprstat_ASTnode it);

    void visit(Continuestat_ASTnode it);

    void visit(Breakstat_ASTnode it);

    void visit(Constructdecl_ASTnode it);

    void visit(ArrayExp_ASTnode it);

    void visit(Post_UnaryExp_ASTnode it);


}
