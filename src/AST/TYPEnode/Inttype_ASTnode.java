package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.SemanticError;
import Utils.position;

public class Inttype_ASTnode extends Type_ASTnode {
    public Inttype_ASTnode(position pos, String index_) {
        super(pos, index_);
    }

    @Override
    public String gettype() {
        return "int";
    }

    @Override
    public void comparetype(Type_ASTnode t) {
        if(!gettype().equals("int")){
            throw new SemanticError("int type don't match",pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
