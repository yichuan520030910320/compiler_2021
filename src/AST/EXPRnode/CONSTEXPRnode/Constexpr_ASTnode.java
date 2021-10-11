package AST.EXPRnode.CONSTEXPRnode;

import AST.ASTnode;
import AST.EXPRnode.Expr_ASTnode;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

abstract public class Constexpr_ASTnode  extends Expr_ASTnode {
    //这里的string 就是值

    public Constexpr_ASTnode(position pos, Type_ASTnode type_, String val) {
        super(pos, type_, val);
    }
}
