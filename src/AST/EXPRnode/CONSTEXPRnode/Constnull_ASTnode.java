package AST.EXPRnode.CONSTEXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Constnull_ASTnode extends Constexpr_ASTnode{
    public Constnull_ASTnode(position pos, Type_ASTnode type_, String typename_) {
        super(pos, type_, typename_);
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
