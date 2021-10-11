package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class NewExp_ASTnode extends Expr_ASTnode{
    public NewExp_ASTnode(position pos, Type_ASTnode type_, String index) {
        super(pos, type_, index);
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
