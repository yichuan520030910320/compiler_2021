package IR.Utils;

import AST.TYPEnode.*;
import IR.IRmodule.IRmodule;
import IR.TypeSystem.IntegerSubType;
import IR.TypeSystem.IntegerType;
import IR.TypeSystem.Typesystem;
import IR.TypeSystem.VoidType;

public class ASTtype_to_IRtype {
    public IRmodule ir_module;
    public ASTtype_to_IRtype(IRmodule ir_module_){
        ir_module=ir_module_;
    }
    public Typesystem asttype_to_irtype(Type_ASTnode asttype){
       if (asttype instanceof Inttype_ASTnode){
            return new IntegerType(IntegerSubType.i32);
        }else if (asttype instanceof Booltype_ASTnode){
            return  new IntegerType(IntegerSubType.i1);
        }
        else if (asttype instanceof Arraytype_ASTnode){


        }else if (asttype instanceof Classtype_ASTnode){

        }else if (asttype instanceof Stringtype_ASTnode){

        }
        return new VoidType();
    }
}
