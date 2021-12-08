package AST.EXPRnode.CONSTEXPRnode;

import AST.ASTnode;
import AST.EXPRnode.Expr_ASTnode;
import AST.TYPEnode.Type_ASTnode;
import IR.Operand.BaseOperand;
import Utils.position;

abstract public class Constexpr_ASTnode  extends Expr_ASTnode {




    public Constexpr_ASTnode(position pos, Type_ASTnode type_, String val) {
        super(pos, type_, val);
    }
}
