package AST;

import Utils.position;

import java.util.ArrayList;

public class Rootnode extends ASTnode{
    public ArrayList<ASTnode> list;

    public Rootnode(position pos) {
        super(pos);
        list=new ArrayList<ASTnode>();
    }
    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
