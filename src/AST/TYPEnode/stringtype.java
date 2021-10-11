package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.semanticerror;
import Utils.position;

public class stringtype extends Type{
    public stringtype(position pos, String index_, int dim_) {
        super(pos, index_, dim_);
    }
    @Override
    public String gettype() {
        return "string";
    }
    @Override
    public void comparetype(Type t) {
        if(!gettype().equals("string")){
            throw new semanticerror("string type don't match",pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
