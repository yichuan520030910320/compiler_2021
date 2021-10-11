package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.semanticerror;
import Utils.position;

public class arrytype extends Type {
    public Type arraytype;

    public arrytype(Type t,int dim) {
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
    public void comparetype(Type t) {
        if (!t.gettype().equals(gettype())){
            throw new semanticerror("array type don't match",pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
