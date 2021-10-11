package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.semanticerror;
import Utils.position;

public class inttype extends Type{
    public inttype(position pos, String index_, int dim_) {
        super(pos, index_, dim_);
    }

    @Override
    public String gettype() {
        return "int";
    }

    @Override
    public void comparetype(Type t) {
        if(!gettype().equals("int")){
            throw new semanticerror("int type don't match",pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
