package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import IR.Operand.BaseOperand;
import Utils.position;

public class Front_UnaryExp_ASTnode extends Expr_ASTnode {
    public Expr_ASTnode expr;
    public Single_Enum op;

    // for the expr such as (++(++a))++ in ir we must record the acual addr because it can be used as lvalue but a++ can only be used as right value
    public BaseOperand actual_addr;

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
