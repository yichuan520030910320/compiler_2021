package AST.EXPRnode;
//    int sum = [&](int a, int b) -> { return a + b; }(1, 2); // 正确
//    int sum2 = [&]() -> { return sum; }(12); // 错误
//    int sum3 = [&]() -> { return sum; }(); // 正确
//    int foo = [&] -> {return 1;}(); // 正确

import AST.ASTvisitor;
import AST.STATnode.Suite_ASTnode;
import AST.TYPEnode.Type_ASTnode;
import AST.VALDECLnode.Paralist_ASTnode;
import Utils.position;

import java.util.LinkedList;

public class LambdaExp_ASTnode extends Expr_ASTnode {//如果函数调用列表没有参数，则paralist为大小为0 用size来判断
    public Type_ASTnode typeinlambda;
    public Paralist_ASTnode lambda_parslist;
    public Suite_ASTnode suite;
    public LinkedList<Expr_ASTnode> paralist;

    public LambdaExp_ASTnode(position pos,  Type_ASTnode lambdareturn_type_,
                             Paralist_ASTnode lambdaparslist_,
                             Suite_ASTnode suite_,
                             LinkedList<Expr_ASTnode> paralist_) {
        super(pos,null,null);
        typeinlambda=lambdareturn_type_;
        lambda_parslist=lambdaparslist_;
        suite=suite_;
        paralist=paralist_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
