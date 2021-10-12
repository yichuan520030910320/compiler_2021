package AST.VALDECLnode;

import AST.ASTvisitor;
import AST.STATnode.Suite_ASTnode;
import Utils.position;

public class Constructdel_ASTnode extends Declare_ASTnode {
    String classname;
    Paralist_ASTnode paralist_infuction;
    Suite_ASTnode suite;

    public Constructdel_ASTnode(position pos, String classname_,
                                Paralist_ASTnode paralist_infuction_,
                                Suite_ASTnode suite_) {
        super(pos);
        classname = classname_;
        paralist_infuction = paralist_infuction_;
        suite = suite_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
