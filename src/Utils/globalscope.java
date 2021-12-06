package Utils;

import AST.TYPEnode.Classtype_ASTnode;
import AST.TYPEnode.Type_ASTnode;
import AST.VALDECLnode.Classdecl_ASTnode;
import AST.VALDECLnode.Fundecl_ASTnode;
import Utils.error.SemanticError;

import java.util.HashMap;
import java.util.Map;

public class globalscope extends Scope {
    public Map<String, Classtype_ASTnode> classrecord;//classtype string
    public Map<String, Classdecl_ASTnode> classdetailmap;//record the class and it's detail

    public globalscope(Scope parentscope_) {
        super(parentscope_);
        classrecord = new HashMap<>();
        classdetailmap=new HashMap<>();

    }

    public boolean addclass_id(String classname, position pos) {
        if (classrecord.containsKey(classname)) {
            return false;
        }
        classrecord.put(classname, new Classtype_ASTnode(pos, classname, classname));
        return true;
    }

    public Classdecl_ASTnode find_class_index(String idname,position pos){
        if (classdetailmap.containsKey(idname)){
            return classdetailmap.get(idname);
        }return null;

    }

    @Override
    public Type_ASTnode find_type(String idname, position pos) {
        if (valdelmap.containsKey(idname)) {
            return valdelmap.get(idname);
        } else {
            if (funcmap.containsKey(idname)) {
                return funcmap.get(idname).returntype;
            } else {
                return classrecord.getOrDefault(idname, null);
            }
        }

    }
    public Fundecl_ASTnode getfundecl(String idname, position pos){

        return funcmap.getOrDefault(idname, null);
    }
    public boolean checktype(Type_ASTnode type_instat,position pos){
        if ((!classrecord.containsKey(type_instat.getbasictype())) && (!(type_instat.getbasictype().equals("bool") || type_instat.getbasictype().equals("int") ||type_instat.getbasictype().equals("void")|| type_instat.getbasictype().equals("string")))) {
            throw new SemanticError("type not define in the global", pos);
        }
        else return true;
    }

    public boolean ifcontainclassname(String classname){
        return classdetailmap.containsKey(classname);
    }
    public void insertclass(String classname,Classdecl_ASTnode classdecl){
        classdetailmap.put(classname,classdecl);
    }
    public boolean ifcontainfunname(String classname){
        return funcmap.containsKey(classname);
    }
    public void insertfunc(String classname,Fundecl_ASTnode func){
        funcmap.put(classname,func);
    }

}
