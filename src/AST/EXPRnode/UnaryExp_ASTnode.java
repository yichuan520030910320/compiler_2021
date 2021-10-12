package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class UnaryExp_ASTnode extends Expr_ASTnode {
    Expr_ASTnode expr;
    Binary_Enum op;

    public UnaryExp_ASTnode(position pos, Type_ASTnode type_, String index,Expr_ASTnode expr_,Binary_Enum op_) {
        super(pos, type_, index);
        op=op_;
        expr=expr_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
