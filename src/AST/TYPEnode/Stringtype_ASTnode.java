package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.semanticerror;
import Utils.position;

public class Stringtype_ASTnode extends Type_ASTnode {
    public Stringtype_ASTnode(position pos, String index_) {
        super(pos, index_);
    }
    @Override
    public String gettype() {
        return "string";
    }
    @Override
    public void comparetype(Type_ASTnode t) {
        if(!gettype().equals("string")){
            throw new semanticerror("string type don't match",pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
