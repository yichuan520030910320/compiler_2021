package AST.STATnode;

import AST.ASTvisitor;
import AST.EXPRnode.Expr_ASTnode;
import Utils.position;

import java.util.ArrayList;

public class Ifstat_ASTnode extends Stat_ASTnode{
    Expr_ASTnode condition;
    Stat_ASTnode thenstat;
    Stat_ASTnode elsestat;

    public Ifstat_ASTnode(position pos,Expr_ASTnode condition_,
            Stat_ASTnode thenstat_,
            Stat_ASTnode elsestat_) {
        super(pos);
        condition=condition_;
        thenstat=thenstat_;
        elsestat=elsestat_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
