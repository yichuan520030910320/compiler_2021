package Utils;

import AST.STATnode.Valdeclstat_ASTnode;
import AST.TYPEnode.Type_ASTnode;
import AST.VALDECLnode.Fundecl_ASTnode;

import java.util.HashMap;
import java.util.Map;

public class Scope {
    public Map<String, Fundecl_ASTnode> funcmap;
    public Map<String, Valdeclstat_ASTnode> valdelmap;
    public Scope parenscope;
    public Type_ASTnode funcreturntype;
    public Type_ASTnode classtype;
    Scope(Scope parentscope_){
        parenscope=parentscope_;
    }



}
