package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

import java.util.LinkedList;

public class FunctioncallExp_ASTnode extends Expr_ASTnode{
public Expr_ASTnode funcname;
public LinkedList<Expr_ASTnode> paralist;

    public FunctioncallExp_ASTnode(position pos, Type_ASTnode type_, String index, Expr_ASTnode funcname_, LinkedList<Expr_ASTnode> paralist_) {


        super(pos, type_, index);
        funcname=funcname_;
        paralist=paralist_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
