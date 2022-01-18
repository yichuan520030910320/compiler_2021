package IR.Operand;
//"hjs\0Ahsk\00"  in ir stand for char* a="hjs\nhsk";

import IR.TypeSystem.Typesystem;

//@.str = private unnamed_addr constant [7 x i8] c"hsjkdh\00", align 1
public class ConstOperand_String extends BaseOperand {
    public String conststring;

    public ConstOperand_String(Typesystem typesystem,String const_string_) {
        super(typesystem);conststring=const_string_;
    }

    @Override
    public String toString() {
        return conststring;
    }

    @Override
    public String unit_output() {
        return " = private unnamed_addr constant [" +
                (conststring.length() + 1) +
                " x i8] c\"" +
                conststring.replace("\\", "\\5C").
                        replace("\n", "\\0A").
                        replace("\t", "\\09").
                        replace("\"", "\\22").
                        replace("\0", "\\00") +
                "\", align 1";
    }
}
