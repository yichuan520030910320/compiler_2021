package AST.EXPRnode.CONSTEXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Constbool_ASTnode extends Constexpr_ASTnode {
    public boolean index;

    public Constbool_ASTnode(position pos, Type_ASTnode type_, String typename_) {
        super(pos, type_, typename_);
        if (typename_.equals("false")) index = false;
        else index = true;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
