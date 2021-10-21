package AST.STATnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import AST.VALDECLnode.Singlevaluedecl_ASTnode;
import Utils.position;

import java.util.ArrayList;

public class Valdeclstat_ASTnode extends Stat_ASTnode{
    public ArrayList<Singlevaluedecl_ASTnode> vardecllist;
    public Type_ASTnode type_instat;



    public Valdeclstat_ASTnode(position pos, ArrayList<Singlevaluedecl_ASTnode> vardecllist_, Type_ASTnode type_) {
        super(pos);
        vardecllist=vardecllist_;
        type_instat=type_;

    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
