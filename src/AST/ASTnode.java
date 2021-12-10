package AST;

import Utils.position;

abstract public class ASTnode {
    public position pos;
    public ASTnode(position pos) {
        this.pos=pos;
    }
    ASTnode(){}
    abstract public void accept(ASTvisitor visitor);
}
