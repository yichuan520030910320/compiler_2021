package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.position;

public class Voidtype_ASTnode extends Type_ASTnode {
    public Voidtype_ASTnode(position pos, String index_) {
        super(pos, index_);
    }
    @Override
    public String gettype() {
        return "void";
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
