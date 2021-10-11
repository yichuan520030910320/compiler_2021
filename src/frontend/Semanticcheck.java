package frontend;

import AST.ASTvisitor;
import AST.EXPRnode.*;
import AST.EXPRnode.CONSTEXPRnode.Constbool_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Constint_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Constnull_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Conststring_ASTnode;
import AST.Rootnode;
import AST.TYPEnode.*;

public class Semanticcheck implements ASTvisitor {
    @Override
    public void visit(Arraytype_ASTnode it) {

    }

    @Override
    public void visit(Booltype_ASTnode it) {

    }

    @Override
    public void visit(Classtype_ASTnode it) {

    }

    @Override
    public void visit(Inttype_ASTnode it) {

    }

    @Override
    public void visit(Nulltype_ASTnode it) {

    }

    @Override
    public void visit(Stringtype_ASTnode it) {

    }

    @Override
    public void visit(Voidtype_ASTnode it) {

    }

    @Override
    public void visit(Rootnode it) {

    }

    @Override
    public void visit(BinaryExp_ASTnode it) {

    }

    @Override
    public void visit(Constint_ASTnode it) {

    }

    @Override
    public void visit(Constbool_ASTnode it) {

    }

    @Override
    public void visit(UnaryExp_ASTnode it) {

    }

    @Override
    public void visit(Conststring_ASTnode it) {

    }

    @Override
    public void visit(Constnull_ASTnode it) {

    }

    @Override
    public void visit(FuntioncallExp_ASTnode it) {

    }

    @Override
    public void visit(IdExp_ASTnode it) {

    }

    @Override
    public void visit(LambdaExp_ASTnode it) {

    }

    @Override
    public void visit(NewExp_ASTnode it) {

    }
}
