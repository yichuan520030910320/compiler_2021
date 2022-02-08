package IR.TypeSystem;

import IR.Operand.BaseOperand;

import java.util.ArrayList;

public class StructType extends Typesystem {
    public String classname;
    public ArrayList<Typesystem> parament_list;
    public ArrayList<Integer> prefix_sum_bytenum=new ArrayList<>();

    public StructType(String classname_,ArrayList<Typesystem> parament_list_){
        classname=classname_;
        parament_list=parament_list_;
    }

    @Override
    public String toString() {
        return "%"+classname;
    }
    //only used for irprinter
    public String class_type_unit(){
        StringBuilder struct_tostring = new StringBuilder();
        struct_tostring.append("%");
        struct_tostring.append(classname);
        struct_tostring.append(" = type {");
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
        struct_tostring.append(" }");
        return struct_tostring.toString();
    }

    @Override
    public int byte_num() {
        int size=0;
        for (int i = 0; i <parament_list.size() ; i++) {
            size+=parament_list.get(i).byte_num();
        }
        return size;


    }

    @Override
    public BaseOperand defaulttype() {
        throw new RuntimeException("default in struct type");
    }
}
