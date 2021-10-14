package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.semanticerror;
import Utils.position;

import javax.swing.text.Position;

public class Arraytype_ASTnode extends Type_ASTnode {
    public Type_ASTnode arraytype;
    int dim;

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

    @Override
    public String gettype() {
        return arraytype.gettype() + '[' + dim + ']';
    }


    @Override
    public void comparetype(Type_ASTnode t) {
        if (!t.gettype().equals(gettype())) {
            throw new semanticerror("array type don't match", pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
