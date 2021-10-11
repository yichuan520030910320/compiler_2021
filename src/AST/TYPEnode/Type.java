package AST.TYPEnode;
import AST.ASTnode;
import Utils.position;
abstract public class Type extends ASTnode {
    public int dim;
    public String index;
    public int getDim (){return dim;}

    public String gettype() {
        return null;
    }

    public Type(position pos,String index_,int dim_){
        super(pos);
        this.dim=dim_;
        this.index=index_;
    }
    public void comparetype(Type t){


    }

}
