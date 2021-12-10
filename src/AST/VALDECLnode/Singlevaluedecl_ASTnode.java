package AST.VALDECLnode;

import AST.ASTvisitor;
import AST.EXPRnode.Expr_ASTnode;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Singlevaluedecl_ASTnode extends Declare_ASTnode {

    public Type_ASTnode type;
    public String name;
    public Expr_ASTnode expression;

    public Singlevaluedecl_ASTnode(position pos, Type_ASTnode type_, String name_, Expr_ASTnode expression_) {
        super(pos);
        type=type_;
        name=name_;
        expression=expression_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
