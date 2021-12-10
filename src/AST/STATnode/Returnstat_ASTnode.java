package AST.STATnode;

import AST.ASTvisitor;
import AST.EXPRnode.Expr_ASTnode;
import Utils.position;

public class Returnstat_ASTnode extends Stat_ASTnode{
    public boolean isvoid;
    public Expr_ASTnode renturnexpr;

    public Returnstat_ASTnode(position pos,boolean isvoid_,Expr_ASTnode expr) {
        super(pos);
        isvoid=isvoid_;
        renturnexpr=expr;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
