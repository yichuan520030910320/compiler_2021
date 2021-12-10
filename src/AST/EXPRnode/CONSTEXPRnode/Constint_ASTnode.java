package AST.EXPRnode.CONSTEXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Constint_ASTnode extends Constexpr_ASTnode{
public int val1;

    public Constint_ASTnode(position pos, Type_ASTnode type_, String val) {
        super(pos, type_, val);
        val1= Integer.parseInt(val);
    }


    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
