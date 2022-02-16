package AST;

import Utils.position;

import java.util.LinkedList;

public class Rootnode extends ASTnode{
    public LinkedList<ASTnode> list;

    public Rootnode(position pos) {
        super(pos);
        list=new LinkedList<>();
    }
    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
