package AST.TYPEnode;

import AST.ASTnode;
import Utils.position;

abstract public class Type_ASTnode extends ASTnode {

    public String typename;//typename


    public String gettype() {
        return null;
    }

    public Type_ASTnode(position pos, String typename_) {
        super(pos);

        this.typename = typename_;
    }

    public void comparetype(Type_ASTnode t) {

    }

}
