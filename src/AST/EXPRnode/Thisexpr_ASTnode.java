package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Thisexpr_ASTnode extends Expr_ASTnode{
    public Thisexpr_ASTnode(position pos, String typename_) {
        super(pos, null, typename_);
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
