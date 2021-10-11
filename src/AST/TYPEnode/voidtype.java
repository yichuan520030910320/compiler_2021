package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.position;

public class voidtype extends Type{
    public voidtype(position pos, String index_, int dim_) {
        super(pos, index_, dim_);
    }

    @Override
    public int getDim() {
        return super.getDim();
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
