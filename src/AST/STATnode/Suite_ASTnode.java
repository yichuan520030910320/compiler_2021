package AST.STATnode;

import AST.ASTvisitor;
import Utils.position;

import java.util.ArrayList;

public class Suite_ASTnode extends Stat_ASTnode{
    public ArrayList<Stat_ASTnode> statlist;
    public Suite_ASTnode(position pos,ArrayList<Stat_ASTnode> statlist_) {
        super(pos);
        statlist=statlist_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
