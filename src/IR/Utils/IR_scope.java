package IR.Utils;

import IR.Operand.BaseOperand;

import java.util.HashMap;
import java.util.Map;

public class IR_scope {
    // it is designed to map idname---->pointer_addr to ram
    public Map<String, BaseOperand> id_map;
    public IR_scope parent_scope=null;

    public IR_scope(IR_scope parent_scope_)
    {
        parent_scope=parent_scope_;
        id_map=new HashMap<>();
    }
    public BaseOperand find_id_to_reg(String id){
        if (id_map.containsKey(id))return id_map.get(id);
        else {
            if (parent_scope!=null)
            return parent_scope.find_id_to_reg(id);
            return null;
        }
    }
}
