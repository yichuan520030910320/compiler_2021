package IR.IRmodule;

import IR.IRfunction.IRfunction;
import IR.IRvisitor;
import IR.Operand.Global_variable;

import java.util.HashMap;
import java.util.Map;
//Module -- Global Define && Function -- BasicBlock -- IRInstruction my structure
public class IRmodule {
    public Map<String, IRfunction> Module_Function_Map=new HashMap<>();
    public Map<String, Global_variable> Global_variable_map=new HashMap<>();



    //only used to print the head external function
    public Map<String,IRfunction> External_Function_Map=new HashMap<>();
    public IRmodule(){

    }
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }
}
