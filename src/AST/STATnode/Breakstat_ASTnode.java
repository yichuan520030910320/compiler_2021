package AST.STATnode;

import AST.ASTvisitor;
import Utils.position;

public class Breakstat_ASTnode extends Stat_ASTnode{
    public Breakstat_ASTnode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
