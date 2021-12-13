package IR.Utils;

import AST.EXPRnode.Binary_Enum;
import AST.TYPEnode.*;
import IR.IRmodule.IRmodule;
import IR.Instru.Enum_Binary_IRInstruction;
import IR.Instru.Enum_Compare_IRInstruction;
import IR.TypeSystem.IntegerSubType;
import IR.TypeSystem.IntegerType;
import IR.TypeSystem.Typesystem;
import IR.TypeSystem.VoidType;

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


        }else if (asttype instanceof Classtype_ASTnode){

        }else if (asttype instanceof Stringtype_ASTnode){

        }
        return new VoidType();
    }
    public Object enum_trans(Object op){
        if (op== Binary_Enum.ADD) return Enum_Binary_IRInstruction.add;
        if (op== Binary_Enum.SUB) return Enum_Binary_IRInstruction.sub;
        if (op== Binary_Enum.MUL) return Enum_Binary_IRInstruction.mul;
        if (op== Binary_Enum.DIV) return Enum_Binary_IRInstruction.sdiv;
        if (op== Binary_Enum.Bitwise_xor) return Enum_Binary_IRInstruction.xor;
        if (op== Binary_Enum.Bitwise_or) return Enum_Binary_IRInstruction.or;
        if (op== Binary_Enum.Bitwise_and) return Enum_Binary_IRInstruction.and;
        if (op== Binary_Enum.RIGHT_SHIFT) return Enum_Binary_IRInstruction.ashr;
        if (op== Binary_Enum.LEFT_SHIFT) return Enum_Binary_IRInstruction.shl;
        if (op== Binary_Enum.EQUALEQUAL) return Enum_Compare_IRInstruction.eq;
        if (op== Binary_Enum.NOT_EQUAL) return Enum_Compare_IRInstruction.ne;
        if (op== Binary_Enum.GREATEREQUAL) return Enum_Compare_IRInstruction.sge;
        if (op== Binary_Enum.GREATER) return Enum_Compare_IRInstruction.sgt;
        if (op== Binary_Enum.LESSEREQUAL) return Enum_Compare_IRInstruction.sle;
        if (op== Binary_Enum.LESSER) return Enum_Compare_IRInstruction.slt;

        return null;



    }
}
