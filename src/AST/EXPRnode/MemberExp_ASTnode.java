package AST.EXPRnode;//  like class A{int b}; A a; a.b=1;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import IR.Operand.BaseOperand;
import Utils.position;

public class MemberExp_ASTnode extends Expr_ASTnode {
    public Expr_ASTnode classcall;//a
    public String member;//b

    public BaseOperand lvalue_addr;

    public MemberExp_ASTnode(position pos, Type_ASTnode type_, String typename_, Expr_ASTnode classcall_, String member_) {
        super(pos, type_, typename_);
        classcall=classcall_;
        member=member_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
