package AST.STATnode;

import AST.ASTvisitor;
import Utils.position;

import java.util.LinkedList;

public class Suite_ASTnode extends Stat_ASTnode{
    public LinkedList<Stat_ASTnode> statlist;
    public Suite_ASTnode(position pos,LinkedList<Stat_ASTnode> statlist_) {
        super(pos);
        statlist=statlist_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
