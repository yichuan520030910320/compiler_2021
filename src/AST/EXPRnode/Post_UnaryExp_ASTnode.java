package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Post_UnaryExp_ASTnode extends Expr_ASTnode{
    Expr_ASTnode expr;
    Single_Enum op;
    public Post_UnaryExp_ASTnode(position pos ,Expr_ASTnode expr_,Single_Enum op_) {
        super(pos, null,null);
        expr=expr_;
        op=op_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
