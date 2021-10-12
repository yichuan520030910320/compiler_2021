package AST.VALDECLnode;

import AST.ASTnode;
import AST.ASTvisitor;
import AST.EXPRnode.IdExp_ASTnode;
import AST.TYPEnode.Type_ASTnode;
import Utils.position;

import java.util.ArrayList;

public class Paralist_ASTnode extends ASTnode {

ArrayList<Singlevaluedel_ASTnode> paralist;
//这里 singlevaluedef的expressin 为null

    public Paralist_ASTnode(position pos,ArrayList<Singlevaluedel_ASTnode> paralist_) {
        super(pos);
        paralist=paralist_;
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);
    }
}
