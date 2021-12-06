package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.SemanticError;
import Utils.position;

public class Arraytype_ASTnode extends Type_ASTnode {
    public Type_ASTnode arraytype;//这个存储的是带有dim 基类存储的是basic类型的


    public Arraytype_ASTnode(Type_ASTnode t, position pos) {
        super(pos, t.typename);
        if (t instanceof Arraytype_ASTnode) {
            arraytype = ((Arraytype_ASTnode) t).arraytype;
            dim = ((Arraytype_ASTnode) t).dim+1;
        } else {
            arraytype = t;
            dim = 1;
        }
    }
    public Arraytype_ASTnode(Type_ASTnode t, position pos,int dim_){
        super(pos, t.typename);
        dim=dim_;
    }

    @Override
    public String gettype() {

        if (dim==0) return  arraytype.gettype();
        return arraytype.gettype() + '[' + dim + ']';
    }


    @Override
    public void comparetype(Type_ASTnode t) {
        if (!t.gettype().equals(gettype())) {
            throw new SemanticError("array type don't match", pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
