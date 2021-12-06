package IR.Operand;

import IR.TypeSystem.Typesystem;
//@.str = private unnamed_addr constant [7 x i8] c"hsjkdh\00", align 1
public class ConstOperand_String extends BaseOperand{
    String conststring;
    public ConstOperand_String(Typesystem typesystem) {
        super(typesystem);
    }
    public String string_const_global(){
        StringBuilder string_const=null;
        assert false;
        string_const.append(" = private unnamed_addr constant [");
        string_const.append((conststring.length()+1));
        string_const.append(" x i8] c\"");
        // how to consider transfer work
        string_const.append(conststring);
        string_const.append("\\00\", align 1");
        return string_const.toString();
    }
    @Override
    public String toString() {
        return conststring;
    }
}
