package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.position;

public class nulltype extends Type {
    public nulltype(position pos, String index_, int dim_) {
        super(pos, index_, dim_);
    }
    @Override
    public String gettype() {
        return "null";
    }
    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
