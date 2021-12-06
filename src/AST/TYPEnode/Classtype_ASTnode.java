package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.SemanticError;
import Utils.position;

public class Classtype_ASTnode extends Type_ASTnode {
    public String classname;
    public Classtype_ASTnode(position pos, String index_,  String classname_) {
        super(pos, index_);
        this.classname=classname_;
    }



    @Override
    public String gettype() {
        return classname;
    }

    @Override
    public void comparetype(Type_ASTnode t) {
        if(!t.gettype().equals(classname)){
            throw new SemanticError(" class type don't match",pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
