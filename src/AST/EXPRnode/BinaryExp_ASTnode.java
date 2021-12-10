package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class BinaryExp_ASTnode extends Expr_ASTnode{
public Expr_ASTnode lhs,rhs;
public Binary_Enum op;

    public BinaryExp_ASTnode(position pos, Type_ASTnode type_,Expr_ASTnode tmp1,Expr_ASTnode tmp2,Binary_Enum op1) {
        super(pos, type_, null);
        lhs=tmp1;
        rhs=tmp2;
        op=op1;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
