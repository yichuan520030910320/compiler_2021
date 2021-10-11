package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class LambdaExp_ASTnode extends Expr_ASTnode{
    public LambdaExp_ASTnode(position pos, Type_ASTnode type_, String index) {
        super(pos, type_, index);
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
