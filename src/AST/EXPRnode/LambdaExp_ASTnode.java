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

import java.util.ArrayList;

public class LambdaExp_ASTnode extends Expr_ASTnode {
    Type_ASTnode type;
    Paralist_ASTnode lambda_parslist;
    Suite_ASTnode suite;
    ArrayList<Expr_ASTnode> paralist;

    public LambdaExp_ASTnode(position pos, Type_ASTnode basictype_, String index, Type_ASTnode lambdareturn_type_,
                             Paralist_ASTnode lambdaparslist_,
                             Suite_ASTnode suite_,
                             ArrayList<Expr_ASTnode> paralist_) {
        super(pos, basictype_, index);
        type=lambdareturn_type_;
        lambda_parslist=lambdaparslist_;
        suite=suite_;
        paralist=paralist_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
