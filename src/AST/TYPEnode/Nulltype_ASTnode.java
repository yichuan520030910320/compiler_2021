package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.position;

public class Nulltype_ASTnode extends Type_ASTnode {
    public Nulltype_ASTnode(position pos, String index_, int dim_) {
        super(pos, index_);
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
