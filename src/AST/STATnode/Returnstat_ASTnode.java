package AST.STATnode;

import AST.ASTvisitor;
import Utils.position;

public class Returnstat_ASTnode extends Stat_ASTnode{
    public Returnstat_ASTnode(position pos) {
        super(pos);
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
