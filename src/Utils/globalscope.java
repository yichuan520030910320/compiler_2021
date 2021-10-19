package Utils;

import AST.TYPEnode.Classtype_ASTnode;
import AST.TYPEnode.Type_ASTnode;

import java.util.HashMap;
import java.util.Map;

public class globalscope extends Scope {
    public Map<String, Classtype_ASTnode> classrecord;//classtype string


    globalscope(Scope parentscope_) {
        super(parentscope_);
        classrecord = new HashMap<>();

    }

    public boolean addclass_id(String classname, position pos) {
        if (classrecord.containsKey(classname)) {
            return false;
        }
        classrecord.put(classname, new Classtype_ASTnode(pos, classname, classname));
        return true;
    }
}
