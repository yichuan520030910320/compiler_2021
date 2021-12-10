package AST.TYPEnode;

import AST.ASTnode;
import AST.ASTvisitor;
import Utils.position;

 public class Type_ASTnode extends ASTnode {

    public String typename;//typename
    public int dim=0;



    public String gettype() {
        if (dim==0)return typename;
        return typename+'[' + dim + ']';
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

     @Override
     public void accept(ASTvisitor visitor) {

     }
 }
