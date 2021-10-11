package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.semanticerror;
import Utils.position;

public class booltype extends Type{
    public booltype(position pos, String index_, int dim_) {
        super(pos, index_, dim_);
    }

    @Override
    public String gettype() {
        return "bool";
    }

    @Override
    public void comparetype(Type t) {
        if(!t.gettype().equals("bool")){
            throw new semanticerror("bool  type can't match",pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
