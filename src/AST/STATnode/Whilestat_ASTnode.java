package AST.STATnode;

import AST.ASTvisitor;
import AST.EXPRnode.Expr_ASTnode;
import Utils.position;

import java.util.ArrayList;

public class Whilestat_ASTnode extends Stat_ASTnode{
    Expr_ASTnode condition;
    ArrayList<Stat_ASTnode> while_stats;
    public Whilestat_ASTnode(position pos, Expr_ASTnode condition_,
            ArrayList<Stat_ASTnode> while_stats_) {
        super(pos);
        condition=condition_;
        while_stats=while_stats_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
