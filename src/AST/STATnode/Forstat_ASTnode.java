package AST.STATnode;

import AST.ASTvisitor;
import AST.EXPRnode.Expr_ASTnode;
import Utils.position;


public class Forstat_ASTnode extends Stat_ASTnode {
    public Expr_ASTnode initexpr;
    public Valdeclstat_ASTnode initvaldecl;
    public Expr_ASTnode condition;
    public Expr_ASTnode incr;
    public Stat_ASTnode suite_in_for;

    public Forstat_ASTnode(position pos, Expr_ASTnode initexpr_,
                           Valdeclstat_ASTnode initvaldecl_,
                           Expr_ASTnode condition_,
                           Expr_ASTnode incr_,
                           Stat_ASTnode suite_in_for_) {
        super(pos);
        initexpr = initexpr_;
        initvaldecl = initvaldecl_;
        condition = condition_;
        incr = incr_;
        suite_in_for = suite_in_for_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
