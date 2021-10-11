package AST;

import AST.TYPEnode.Type;
import Utils.position;

abstract public class ASTnode {
    public position pos;
    public ASTnode(position pos) {
        this.pos=pos;

    }
    abstract public void accept(ASTvisitor visitor);
}
