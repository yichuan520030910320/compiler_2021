package AST.STATnode;

import AST.ASTvisitor;
import Utils.position;

import java.util.ArrayList;

public class Ifstat_ASTnode extends Stat_ASTnode{
    Exprstat_ASTnode condition;
    ArrayList<Stat_ASTnode> thenstat;
    ArrayList<Stat_ASTnode> elsestat;

    public Ifstat_ASTnode(position pos,Exprstat_ASTnode condition_,
            ArrayList<Stat_ASTnode> thenstat_,
            ArrayList<Stat_ASTnode> elsestat_) {
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
