package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.SemanticError;
import Utils.position;

public class Booltype_ASTnode extends Type_ASTnode {
    public Booltype_ASTnode(position pos, String index_) {
        super(pos, index_);
    }

    @Override
    public String gettype() {
        return "bool";
    }

    @Override
    public void comparetype(Type_ASTnode t) {
        if(!t.gettype().equals("bool")){
            throw new SemanticError("bool  type can't match",pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
