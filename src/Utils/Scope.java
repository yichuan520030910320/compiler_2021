package Utils;

import AST.STATnode.Valdeclstat_ASTnode;
import AST.TYPEnode.Type_ASTnode;
import AST.VALDECLnode.Fundecl_ASTnode;

import java.util.HashMap;
import java.util.Map;

public class Scope {//basic scope
    public Map<String, Fundecl_ASTnode> funcmap=new HashMap<>();
    public Map<String, Type_ASTnode> valdelmap=new HashMap<>();
    public Scope parentscope;
    public Type_ASTnode funcreturntype;
    public Type_ASTnode classtype;
    Scope(Scope parentscope_){
        parentscope=parentscope_;
    }
    public boolean ifcontainvariable(String idname,position pos){
        return valdelmap.containsKey(idname);
    }



}
