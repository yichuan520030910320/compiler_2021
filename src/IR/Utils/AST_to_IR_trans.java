package IR.Utils;

import AST.EXPRnode.Binary_Enum;
import AST.EXPRnode.Single_Enum;
import AST.TYPEnode.*;
import IR.IRmodule.IRmodule;
import IR.Instru.Enum_Binary_IRInstruction;
import IR.Instru.Enum_Compare_IRInstruction;
import IR.TypeSystem.*;

public class AST_to_IR_trans {
    public IRmodule ir_module;
    public AST_to_IR_trans(IRmodule ir_module_){
        ir_module=ir_module_;
    }
    public Typesystem asttype_to_irtype(Type_ASTnode asttype){
       if (asttype instanceof Inttype_ASTnode){
            return new IntegerType(IntegerSubType.i32);
        }else if (asttype instanceof Booltype_ASTnode){
            return  new IntegerType(IntegerSubType.i1);
        }
        else if (asttype instanceof Arraytype_ASTnode){
            Typesystem tmp=asttype_to_irtype(((Arraytype_ASTnode) asttype).arraytype);
           for (int i = 0; i <asttype.dim ; i++) {
               tmp=new PointerType(tmp);
           }
           return tmp;
        }else if (asttype instanceof Classtype_ASTnode){
            return new PointerType(ir_module.Module_Struct_Map.get(asttype.typename));
        }else if (asttype instanceof Stringtype_ASTnode){
            return new PointerType(new IntegerType(IntegerSubType.i8));

        }
        return new VoidType();
    }
    public Object enum_trans(Object op){
        if (op== Binary_Enum.ADD) return Enum_Binary_IRInstruction.add;
        else if (op== Binary_Enum.SUB) return Enum_Binary_IRInstruction.sub;
        else if (op== Binary_Enum.MUL) return Enum_Binary_IRInstruction.mul;
        else if (op== Binary_Enum.DIV) return Enum_Binary_IRInstruction.sdiv;
        else if (op== Binary_Enum.MOD) return Enum_Binary_IRInstruction.srem;
        else if (op== Binary_Enum.Bitwise_xor) return Enum_Binary_IRInstruction.xor;
        else if (op== Binary_Enum.Bitwise_or) return Enum_Binary_IRInstruction.or;
        else if (op== Binary_Enum.Bitwise_and) return Enum_Binary_IRInstruction.and;
        else if (op== Binary_Enum.RIGHT_SHIFT) return Enum_Binary_IRInstruction.ashr;
        else if (op== Binary_Enum.LEFT_SHIFT) return Enum_Binary_IRInstruction.shl;
        else if (op== Single_Enum.SELFPLUS) return Enum_Binary_IRInstruction.add;
        else if (op== Single_Enum.SELFSUB) return Enum_Binary_IRInstruction.sub;
        else if (op== Binary_Enum.EQUALEQUAL) return Enum_Compare_IRInstruction.eq;
        else if (op== Binary_Enum.NOT_EQUAL) return Enum_Compare_IRInstruction.ne;
        else if (op== Binary_Enum.GREATEREQUAL) return Enum_Compare_IRInstruction.sge;
        else if (op== Binary_Enum.GREATER) return Enum_Compare_IRInstruction.sgt;
        else if (op== Binary_Enum.LESSEREQUAL) return Enum_Compare_IRInstruction.sle;
        else if (op== Binary_Enum.LESSER) return Enum_Compare_IRInstruction.slt;
        return null;



    }
}
