package AST.TYPEnode;

import AST.ASTvisitor;
import Utils.error.semanticerror;
import Utils.position;

public class Classtype_ASTnode extends Type_ASTnode {
    String classname;
    public Classtype_ASTnode(position pos, String index_, int dim_, String classname_) {
        super(pos, index_, dim_);
        this.classname=classname_;
    }

    @Override
    public int getDim() {
        return 0;
    }

    @Override
    public String gettype() {
        return classname;
    }

    @Override
    public void comparetype(Type_ASTnode t) {
        if(!t.gettype().equals(classname)){
            throw new semanticerror(" class type don't match",pos);
        }
    }

    @Override
    public void accept(ASTvisitor visitor) {
        visitor.visit(this);

    }
}
