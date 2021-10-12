package AST.STATnode;

import AST.ASTvisitor;
import AST.EXPRnode.Expr_ASTnode;
import Utils.position;

import java.util.ArrayList;

public class Forstat_ASTnode extends Stat_ASTnode{
    Exprstat_ASTnode initexpr;
    Valdeclstat_ASTnode initvaldecl;
    Expr_ASTnode condition;
    Expr_ASTnode incr;
    ArrayList<Stat_ASTnode> suite_in_for;

    public Forstat_ASTnode(position pos,Exprstat_ASTnode initexpr_,
            Valdeclstat_ASTnode initvaldecl_,
            Expr_ASTnode condition_,
            Expr_ASTnode incr_,
            ArrayList<Stat_ASTnode> suite_in_for_) {
        super(pos);
        initexpr=initexpr_;
        initvaldecl=initvaldecl_;
        condition=condition_;
        incr=incr_;
        suite_in_for=suite_in_for_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
