package AST.EXPRnode;

import AST.ASTnode;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

abstract public class Expr_ASTnode extends ASTnode {
    String index;//内容
    Type_ASTnode type;
    public Expr_ASTnode(position pos,   Type_ASTnode type_,String typename_) {
        super(pos);
        type=type_;
        index=typename_;
    }
}
