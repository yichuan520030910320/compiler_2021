package AST.EXPRnode;//用来访问数组  a[][10] 前面看成一个expr 后面也是一个expr 递归访问  |array=expression '['index=expression']'     #expr_array

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import IR.Operand.BaseOperand;
import Utils.position;

public class ArrayExp_ASTnode extends Expr_ASTnode{
    public Expr_ASTnode arr;
    public Expr_ASTnode index;

    //for ir
    public BaseOperand actual_addr=null;
    public ArrayExp_ASTnode(position pos, Type_ASTnode type_, String typename_,Expr_ASTnode arr_,Expr_ASTnode index_) {
        super(pos, type_, typename_);
        arr=arr_;
        index=index_;
    }
    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
