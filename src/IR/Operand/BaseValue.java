package IR.Operand;

import IR.Instru.BaseInstru;

import java.util.LinkedHashMap;
import java.util.Map;

public class BaseValue {
    public Map<BaseInstru,Integer> def_map;
    public BaseValue(){
        def_map=new LinkedHashMap<>();
    }
    public void Add_be_used(BaseInstru baseInstru){
        if (def_map.containsKey(baseInstru)){
            def_map.replace(baseInstru,def_map.get(baseInstru)+1);
        }else def_map.put(baseInstru,0);
    }
}
