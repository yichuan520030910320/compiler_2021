package AST.EXPRnode;//  like class A{int b}; A a; a.b=1;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class MemberExp_ASTnode extends Expr_ASTnode {
    public Expr_ASTnode member;//a
    public String index;//b

    public MemberExp_ASTnode(position pos, Type_ASTnode type_, String typename_, Expr_ASTnode member_, String index_) {
        super(pos, type_, typename_);
        member = member_;
        index = index_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
