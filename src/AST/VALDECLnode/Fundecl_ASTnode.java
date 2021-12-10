package AST.VALDECLnode;

import AST.ASTvisitor;
import AST.STATnode.Suite_ASTnode;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

public class Fundecl_ASTnode extends Declare_ASTnode {//先去判断isvoid 然后如果是void 则type=null
    public Type_ASTnode returntype;
    public String functionname;
    public Paralist_ASTnode paralist_infuction;
    public Suite_ASTnode suite;
    public boolean isvoid;

    public Fundecl_ASTnode(position pos, Type_ASTnode returntype_,
                           String functionname_,
                           Paralist_ASTnode paralist_infuction_,
                           Suite_ASTnode suite_,boolean isvoid_) {
        super(pos);
        returntype = returntype_;
        functionname = functionname_;
        paralist_infuction = paralist_infuction_;
        suite = suite_;
        isvoid=isvoid_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
