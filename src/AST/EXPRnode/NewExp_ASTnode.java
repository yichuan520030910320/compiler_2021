package AST.EXPRnode;

import AST.ASTvisitor;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

import java.util.ArrayList;

public class NewExp_ASTnode extends Expr_ASTnode {

    public ArrayList<Expr_ASTnode> newlist;
    public int dim;
    public Type_ASTnode type;


    public NewExp_ASTnode(position pos, Type_ASTnode basictype_, String index, ArrayList<Expr_ASTnode> newlist_,
                          int dim_,
                          Type_ASTnode type_) {
        super(pos, basictype_, index);
        dim = dim_;
        type = type_;
        newlist = newlist_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
