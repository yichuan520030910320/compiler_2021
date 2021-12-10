package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Post_UnaryExp_ASTnode extends Expr_ASTnode{
    public Expr_ASTnode expr;
    public Single_Enum op;
    public Post_UnaryExp_ASTnode(position pos ,Type_ASTnode type_,Expr_ASTnode expr_,Single_Enum op_) {
        super(pos, type_,null);
        expr=expr_;
        op=op_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
