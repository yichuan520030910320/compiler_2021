package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class IdExp_ASTnode extends Expr_ASTnode{
    public String id;
    public IdExp_ASTnode(position pos, Type_ASTnode type_, String index,String id_) {
        super(pos, type_, index);
        id=id_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
