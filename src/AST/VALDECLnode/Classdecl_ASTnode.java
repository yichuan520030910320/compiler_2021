package AST.VALDECLnode;

import AST.ASTvisitor;
import AST.STATnode.Valdeclstat_ASTnode;
import Utils.Scope;
import Utils.position;

import java.util.ArrayList;

public class Classdecl_ASTnode extends Declare_ASTnode {
    public String classname;
    public ArrayList<Fundecl_ASTnode> functionlist;
    public ArrayList<Valdeclstat_ASTnode> valdecllist;
    public ArrayList<Constructdecl_ASTnode> constructerlist;// many constructer maybe
    public Scope classscope;

    public Classdecl_ASTnode(position pos, String classname_, ArrayList<Fundecl_ASTnode> functionlist_,
                             ArrayList<Valdeclstat_ASTnode> valdecllist_,
                             ArrayList<Constructdecl_ASTnode> constructerlist_) {
        super(pos);
        classname = classname_;
        functionlist = functionlist_;
        valdecllist = valdecllist_;
        constructerlist = constructerlist_;
        classscope=new Scope(null);

    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
