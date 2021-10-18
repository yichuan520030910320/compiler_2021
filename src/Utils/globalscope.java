package Utils;

import AST.TYPEnode.Classtype_ASTnode;
import AST.TYPEnode.Type_ASTnode;

import java.util.Map;

public class globalscope extends Scope{
    public Map<String, Type_ASTnode> typemap;//record the class
    public Map<String, Classtype_ASTnode> classrecord;


    globalscope(Scope parentscope_) {
        super(parentscope_);
    }
}
