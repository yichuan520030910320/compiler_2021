package AST.EXPRnode.CONSTEXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Conststring_ASTnode extends Constexpr_ASTnode{
    public Conststring_ASTnode(position pos, Type_ASTnode type_, String index) {



        super(pos, type_,index.substring(1,index.length()-1));

    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
