package IR.Operand;
//"hjs\0Ahsk\00"  in ir stand for char* a="hjs\nhsk";
import IR.TypeSystem.Typesystem;
//@.str = private unnamed_addr constant [7 x i8] c"hsjkdh\00", align 1
public class ConstOperand_String extends BaseOperand{
    String conststring;
    public ConstOperand_String(Typesystem typesystem) {
        super(typesystem);
    }
    @Override
    public String toString() {
        return conststring;
    }

    @Override
    public String unit_output() {
        StringBuilder string_const=null;
        assert false;
        string_const.append(" = private unnamed_addr constant [");
        string_const.append((conststring.length()+1));
        string_const.append(" x i8] c\"");
        string_const.append(conststring.replace("\\","\\5c").replace("\n","\\0A").replace("\t","\\09").replace("\"","\\22").replace("\0", "\\00"));
        string_const.append("\", align 1");
        return string_const.toString();
    }
}
