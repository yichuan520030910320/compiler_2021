package IR.TypeSystem;

import java.util.ArrayList;

public class StructType extends Typesystem {
    public String classname;
    public ArrayList<Typesystem> parament_list;

    @Override
    public String toString() {
        StringBuilder struct_tostring = null;
        assert false;
        struct_tostring.append("%class.");
        struct_tostring.append(classname);
        struct_tostring.append(" type= {");
        for (int i = 0; i < parament_list.size(); i++) {
            if (i == parament_list.size() - 1) {
                struct_tostring.append(" ");
                struct_tostring.append(parament_list.get(i).toString());
            } else {
                struct_tostring.append(" ");
                struct_tostring.append(parament_list.get(i).toString());
                struct_tostring.append(",");
            }
        }
        return struct_tostring.toString();
    }
}
