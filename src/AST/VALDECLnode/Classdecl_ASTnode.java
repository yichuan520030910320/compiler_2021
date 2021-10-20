package AST.VALDECLnode;

import AST.ASTvisitor;
import AST.STATnode.Valdeclstat_ASTnode;
import Utils.Scope;
import Utils.position;

import java.util.ArrayList;

public class Classdecl_ASTnode extends Declare_ASTnode {
    String classname;
    ArrayList<Fundecl_ASTnode> functionlist;
    ArrayList<Valdeclstat_ASTnode> valdecllist;
    ArrayList<Constructdel_ASTnode> constructerlist;// many constructer maybe
public Scope classscope;
    public Classdecl_ASTnode(position pos,String classname_,ArrayList<Fundecl_ASTnode> functionlist_,
            ArrayList<Valdeclstat_ASTnode> valdecllist_,
            ArrayList<Constructdel_ASTnode> constructerlist_) {
        super(pos);
        classname=classname_;
        functionlist=functionlist_;
        valdecllist=valdecllist_;
        constructerlist=constructerlist_;

    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
