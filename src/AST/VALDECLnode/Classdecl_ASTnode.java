package AST.VALDECLnode;

import AST.ASTvisitor;
import AST.STATnode.Valdeclstat_ASTnode;
import Utils.Scope;
import Utils.position;

import java.util.LinkedList;

public class Classdecl_ASTnode extends Declare_ASTnode {
    public String classname;
    public LinkedList<Fundecl_ASTnode> functionlist;
    public LinkedList<Valdeclstat_ASTnode> valdecllist;
    public LinkedList<Constructdecl_ASTnode> constructerlist;// many constructer maybe
    public Scope classscope;

    //for codegen
    public LinkedList<Integer> prefix_sum_bytenum_in_ast=new LinkedList<>();


    public Classdecl_ASTnode(position pos, String classname_, LinkedList<Fundecl_ASTnode> functionlist_,
                             LinkedList<Valdeclstat_ASTnode> valdecllist_,
                             LinkedList<Constructdecl_ASTnode> constructerlist_) {
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
