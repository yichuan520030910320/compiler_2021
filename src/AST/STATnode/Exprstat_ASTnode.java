package AST.STATnode;

import AST.ASTvisitor;
import AST.EXPRnode.Expr_ASTnode;
import Utils.position;

public class Exprstat_ASTnode extends Stat_ASTnode{
    public Expr_ASTnode expr;
    public Exprstat_ASTnode(position pos,Expr_ASTnode expr_) {
        super(pos);
        expr=expr_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
