package AST.VALDECLnode;

import AST.ASTvisitor;
import AST.STATnode.Suite_ASTnode;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Fundecl_ASTnode extends Declare_ASTnode {
    Type_ASTnode returntype;
    String functionname;
    Paralist_ASTnode paralist_infuction;
    Suite_ASTnode suite;

    public Fundecl_ASTnode(position pos, Type_ASTnode returntype_,
                           String functionname_,
                           Paralist_ASTnode paralist_infuction_,
                           Suite_ASTnode suite_) {
        super(pos);
        returntype = returntype_;
        functionname = functionname_;
        paralist_infuction = paralist_infuction_;
        suite = suite_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
