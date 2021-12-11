package Utils;

import AST.TYPEnode.Type_ASTnode;
import AST.VALDECLnode.Fundecl_ASTnode;
import Utils.error.SemanticError;

import java.util.HashMap;
import java.util.Map;

public class Scope {//basic scope
    public Map<String, Fundecl_ASTnode> funcmap = new HashMap<>();
    public Map<String, Type_ASTnode> valdelmap = new HashMap<>();
    public Scope parentscope;
    public Type_ASTnode funcreturntype;//record current scope func
    public Type_ASTnode classtype;//record current scope class

    public Scope(Scope parentscope_) {
        parentscope = parentscope_;
        funcmap = new HashMap<>();
        valdelmap = new HashMap<>();
        funcreturntype = null;
        classtype = null;
    }

    public boolean ifcontainvariable(String idname, position pos) {
        return valdelmap.containsKey(idname);
    }

    public Type_ASTnode gettype_invalmap(String name) {
        return valdelmap.get(name);
    }

    public boolean ifcontainfunc(String idname, position pos) {
        return funcmap.containsKey(idname);
    }

    //

    public Type_ASTnode find_type(String idname, position pos) {
        if (valdelmap.containsKey(idname)) {
            return valdelmap.get(idname);
        } else {
            if (funcmap.containsKey(idname)) {
                return funcmap.get(idname).returntype;
            } else {
                return parentscope.find_type(idname, pos);
            }
        }

    }

    public Type_ASTnode FinddefunScope(String idname, position pos) {
        if (valdelmap.containsKey(idname)) {
            return valdelmap.get(idname);
        } else {
            if (funcmap.containsKey(idname)) {
                return funcmap.get(idname).returntype;
            } else {
                return null;
            }
        }

    }

    public Fundecl_ASTnode getfundecl(String idname, position pos) {

        if (funcmap.containsKey(idname)) {
            return funcmap.get(idname);
        } else {

            return parentscope.getfundecl(idname, pos);
        }
    }

    public Fundecl_ASTnode getfundecl_inclass(String idname, position pos) {
        return funcmap.getOrDefault(idname, null);
    }


    public Type_ASTnode getclass() {
        if (classtype == null) {
            if (parentscope == null) return null;
            else return parentscope.getclass();
        } else {
            return classtype;
        }
    }

    public void defval(String valname, Type_ASTnode type, position pos) {
        if (valdelmap.containsKey(valname)) {
            throw new SemanticError("already exist yhe value in the scope", pos);
        }
        valdelmap.put(valname, type);
    }
}
