package AST.STATnode;

import AST.ASTvisitor;
import AST.EXPRnode.Expr_ASTnode;
import Utils.position;


public class Whilestat_ASTnode extends Stat_ASTnode{
    public Expr_ASTnode condition;
    public Stat_ASTnode while_stats;
    public Whilestat_ASTnode(position pos, Expr_ASTnode condition_,
            Stat_ASTnode while_stats_) {
        super(pos);
        condition=condition_;
        while_stats=while_stats_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
