package AST.STATnode;

import AST.ASTvisitor;
import Utils.position;

public class Valdeclstat_ASTnode extends Stat_ASTnode{
    public Valdeclstat_ASTnode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
