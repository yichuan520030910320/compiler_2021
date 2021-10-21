package AST.TYPEnode;

import AST.ASTnode;
import Utils.position;

abstract public class Type_ASTnode extends ASTnode {

    public String typename;//typename
    public int dim=0;


    public String gettype() {
        return null;
    }
    public String  getbasictype(){
        return typename;
    }//used for array basic

    public Type_ASTnode(position pos, String typename_) {
        super(pos);

        this.typename = typename_;
    }

    public void comparetype(Type_ASTnode t) {

    }

}
