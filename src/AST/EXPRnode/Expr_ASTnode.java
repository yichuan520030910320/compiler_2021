package AST.EXPRnode;

import AST.ASTnode;
import AST.TYPEnode.Type_ASTnode;
import IR.Operand.BaseOperand;
import Utils.position;

abstract public class Expr_ASTnode extends ASTnode {
    public String index;//内容
    public Type_ASTnode type;//设计失误 本来可以不用 完全不用 但也有可能未来会用于判断类型
    public boolean isleft = true;


    //for ir
    public BaseOperand ir_operand;
    public Expr_ASTnode(position pos, Type_ASTnode type_, String typename_) {
        super(pos);
        type = type_;
        index = typename_;
    }
}
