package IR.Operand;

import IR.Instru.BaseInstru;

import java.util.LinkedHashMap;
import java.util.Map;
//def
public class BaseUser extends BaseValue {
    public Map<BaseInstru,Integer> use_map;
    public BaseUser(){
        use_map=new LinkedHashMap<>();
    }
    public void Add_def(BaseInstru baseInstru){//eg binary result
        if (use_map.containsKey(baseInstru)){
            use_map.replace(baseInstru,use_map.get(baseInstru)+1);
        }else use_map.put(baseInstru,0);
    }

}
