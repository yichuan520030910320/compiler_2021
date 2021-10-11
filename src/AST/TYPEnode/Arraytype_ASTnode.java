package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.semanticerror;

public class Arraytype_ASTnode extends Type_ASTnode {
    public Type_ASTnode arraytype;

    public Arraytype_ASTnode(Type_ASTnode t, int dim) {
        super(t.pos,t.index,t.dim);
        this.arraytype=t;
    }

    @Override
    public String gettype() {
        return arraytype.gettype() + '[' + dim + ']';
    }

    @Override
    public int getDim() {
        return dim;
    }

    @Override
    public void comparetype(Type_ASTnode t) {
        if (!t.gettype().equals(gettype())){
            throw new semanticerror("array type don't match",pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
