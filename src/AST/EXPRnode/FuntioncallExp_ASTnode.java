package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

import java.util.ArrayList;

public class FuntioncallExp_ASTnode extends Expr_ASTnode{
String funcname;
ArrayList<Expr_ASTnode> paralist;

    public FuntioncallExp_ASTnode(position pos, Type_ASTnode type_, String index,String funcname_,ArrayList<Expr_ASTnode> paralist_) {


        super(pos, type_, index);
        funcname=funcname_;
        paralist=paralist_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
