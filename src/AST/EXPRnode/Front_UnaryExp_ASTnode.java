package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Front_UnaryExp_ASTnode extends Expr_ASTnode {
    Expr_ASTnode expr;
    Single_Enum op;

    public Front_UnaryExp_ASTnode(position pos, Type_ASTnode type_, Expr_ASTnode expr_, Single_Enum op_) {
        super(pos, type_,null);
        op=op_;
        expr=expr_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
