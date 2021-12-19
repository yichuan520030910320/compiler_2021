package IR.IRmodule;

import IR.IRfunction.IRfunction;
import IR.IRvisitor;
import IR.Operand.ConstOperand_String;
import IR.Operand.Global_variable;
import IR.TypeSystem.*;

import java.util.HashMap;
import java.util.Map;


//===----------------------------------------------------------------------===//
//the biggest fundamental class
//the inherit relationship: Module -- Global Define && Function -- BasicBlock -- IRInstruction my structure
//
//===----------------------------------------------------------------------===//

public class IRmodule {
    public Map<String, StructType> Module_Struct_Map=new HashMap<>();
    public Map<String, IRfunction> Module_Function_Map=new HashMap<>();
    public Map<String, Global_variable> Global_variable_map=new HashMap<>();

    //used for string declare
    public Map<String, Global_variable> string_map=new HashMap<>();

    //only used to print the head external function  for irprinter
    public Map<String,IRfunction> External_Function_Map=new HashMap<>();
    //only used to print the nxt internal function   for irprinter
    public Map<String, IRfunction> Internal_Function_Map=new HashMap<>();

    public IRmodule(){

    }

    /// inspired by the elegant design of lrh
    ///  the stringmap in module stand for it.val----->Globalvar(reg :const_string_## operand:it.val type:pointtype)
    public Global_variable add_global_string(String stringname){
        //we can reuse the same string to get better performance&& easy to write
        if (string_map.containsKey(stringname)){
            return string_map.get(stringname);
        }else {
            Global_variable return_globalstring=new Global_variable(new PointerType(new ArrayType(new IntegerType(IntegerSubType.i8), stringname.length())),"const_string"+String.valueOf(string_map.size()));
            return_globalstring.initoperand=new ConstOperand_String(new PointerType(new IntegerType(IntegerSubType.i8)),stringname);
            string_map.put(stringname,return_globalstring);
            Global_variable_map.put(stringname,return_globalstring);
            return return_globalstring;
        }
    }

    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }
}
