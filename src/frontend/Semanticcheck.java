package frontend;

import AST.ASTvisitor;
import AST.EXPRnode.*;
import AST.EXPRnode.CONSTEXPRnode.Constbool_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Constint_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Constnull_ASTnode;
import AST.EXPRnode.CONSTEXPRnode.Conststring_ASTnode;
import AST.Rootnode;
import AST.STATnode.*;
import AST.TYPEnode.*;
import AST.VALDECLnode.*;
import Utils.*;
import Utils.error.semanticerror;

public class Semanticcheck implements ASTvisitor {
    public globalscope Globalscope;
    public Scope currentscope;

    @Override
    public void visit(Arraytype_ASTnode it) {


    }

    @Override
    public void visit(Booltype_ASTnode it) {

    }

    @Override
    public void visit(Classtype_ASTnode it) {

    }

    @Override
    public void visit(Inttype_ASTnode it) {

    }

    @Override
    public void visit(Nulltype_ASTnode it) {

    }

    @Override
    public void visit(Stringtype_ASTnode it) {

    }

    @Override
    public void visit(Voidtype_ASTnode it) {

    }

    @Override
    public void visit(Rootnode it) {

    }

    @Override
    public void visit(BinaryExp_ASTnode it) {
        it.lhs.accept(this);
        it.rhs.accept(this);
        Binary_Enum op = it.op;
        switch (op) {
            case ADD -> {
                if (!((it.lhs.type.typename.equals("int") && it.rhs.type.typename.equals("int")) || (it.lhs.type.typename.equals("string") && it.rhs.type.typename.equals("string")))) {
                    throw new semanticerror("error in add .. op", it.pos);
                }
                if (it.lhs.type.typename.equals("int")) {
                    it.type.typename = "int";
                } else {
                    it.type.typename = "string";
                }
            }
            case SUB, MOD, MUL, DIV, LEFT_SHIFT, RIGHT_SHIFT, Bitwise_and, Bitwise_or, Bitwise_xor -> {
                if (!((it.lhs.type.typename.equals("int") && it.rhs.type.typename.equals("int")))) {
                    throw new semanticerror("error in add .. op", it.pos);
                }
                it.type.typename = "int";
            }
            case EQUAL -> {
                if (!it.lhs.isleft) throw new semanticerror(" binary rhs can't be assign ", it.pos);
                if (it.lhs.type.typename.equals("string") && it.rhs.type.typename.equals("null")) {
                    throw new semanticerror("error in binary ,can't assign string with null", it.pos);
                }
                if ((!it.lhs.type.gettype().equals(it.rhs.type.gettype())) && (!it.rhs.type.typename.equals("null"))) {
                    throw new semanticerror(" error in binary not match compare in equal ", it.pos);
                }
            }
            case AND, OR -> {
                if (!it.lhs.type.typename.equals("bool") && it.rhs.type.typename.equals("bool")) {
                    throw new semanticerror("error in binary bool && ||", it.pos);
                }
                it.type.typename = "bool";

            }
            case EQUALEQUAL, NOT_EQUAL -> {
                if (!it.lhs.type.gettype().equals(it.rhs.type.gettype())) {
                    throw new semanticerror("error in binary not match compare in 1 ", it.pos);
                }
                it.type.typename = "bool";
            }
            case GREATER, GREATEREQUAL, LESSER, LESSEREQUAL -> {
                if (!it.lhs.type.gettype().equals(it.rhs.type.gettype())) {
                    throw new semanticerror("error in binary not match compare in 2", it.pos);
                }
                if (it.lhs.type.typename.equals("bool") && it.rhs.type.typename.equals("bool")) {
                    throw new semanticerror("error in binary bool < >", it.pos);
                }
                it.type.typename = "bool";

            }
            default -> System.out.println("you choose a op that doesn't exsit in binarynode in semantic check");
        }

    }

    @Override
    public void visit(Constint_ASTnode it) {
        it.type = new Inttype_ASTnode(it.pos, "int");
    }

    @Override
    public void visit(Constbool_ASTnode it) {
        it.type = new Booltype_ASTnode(it.pos, "bool");
    }

    @Override
    public void visit(Front_UnaryExp_ASTnode it) {
        it.expr.accept(this);
        Single_Enum op = it.op;
        switch (op) {
            case SELFPLUS, SELFSUB, ADD, SUB -> {
                if (!it.expr.type.typename.equals("int")) {
                    throw new semanticerror("error in front expr ++..", it.pos);
                }
            }
            case NOT -> {
                if (!it.expr.type.typename.equals("bool")) {
                    throw new semanticerror("error in front expr,!..", it.pos);
                }
            }
            case TILDE -> {
            }
        }
        it.type = it.expr.type;
    }

    @Override
    public void visit(Conststring_ASTnode it) {
        it.type = new Stringtype_ASTnode(it.pos, "string");

    }

    @Override
    public void visit(Constnull_ASTnode it) {
        it.type = new Nulltype_ASTnode(it.pos, "null", 0);
    }

    @Override
    public void visit(FunctioncallExp_ASTnode it) {
//特判string 等一些特殊的函数
        Fundecl_ASTnode Function = null;
        if (it.funcname instanceof MemberExp_ASTnode || it.funcname instanceof IdExp_ASTnode) {
            it.funcname.accept(this);
            if (it.funcname instanceof MemberExp_ASTnode) {
                MemberExp_ASTnode mem = (MemberExp_ASTnode) it.funcname;
                Function = currentscope.getfundecl_inclass(mem.index, it.pos);
                if (Function == null) {
                    throw new semanticerror("error in function call can't find fun declar", it.pos);
                }
            } else if (it.funcname instanceof IdExp_ASTnode) {
                Function = currentscope.getfundecl(it.funcname.index, it.pos);
                if (Function == null) {
                    throw new semanticerror("error in function call can't find id declar", it.pos);
                }
            }
        } else {
            throw new semanticerror(" function call type wrong ", it.pos);
        }

        assert Function != null;
        if (Function.paralist_infuction.paralist.size() != it.paralist.size()) {
            throw new semanticerror("para size in funccall", it.pos);
        }


        //todo cope with the para
        for (int i = 0; i < it.paralist.size(); i++) {
            it.paralist.get(i).accept(this);
        }

    }

    @Override
    public void visit(IdExp_ASTnode it) {
        Type_ASTnode returntype = currentscope.find_type(it.index, it.pos);
        if (returntype != null) {
            it.type = returntype;
        } else {
            throw new semanticerror("error in id don't be stated before", it.pos);
        }
    }

    @Override
    public void visit(LambdaExp_ASTnode it) {

    }

    @Override
    public void visit(NewExp_ASTnode it) {

    }

    @Override
    public void visit(MemberExp_ASTnode it) {
        String mem = it.member;
        it.classcall.accept(this);
        Type_ASTnode ittype = it.type;
        if (ittype instanceof Classtype_ASTnode) {
            Classdecl_ASTnode it_class_index = Globalscope.find_class_index(it.index, it.pos);
            if (it_class_index == null) {
                throw new semanticerror("error in memxipr 1", it.pos);
            }
            Type_ASTnode exprtype = it_class_index.classscope.FinddefunScope(it.member, it.pos);
            if (exprtype == null) {
                throw new semanticerror("can't find index in the classdef", it.pos);
            }
            it.type = exprtype;
        }
    }

    @Override
    public void visit(Suite_ASTnode it) {

    }


    @Override
    public void visit(Singlevaluedel_ASTnode it) {

    }

    @Override
    public void visit(Fundecl_ASTnode it) {

    }

    @Override
    public void visit(Classdecl_ASTnode it) {

    }

    @Override
    public void visit(Paralist_ASTnode it) {

    }

    @Override
    public void visit(Thisexpr_ASTnode it) {

    }

    @Override
    public void visit(Whilestat_ASTnode it) {

    }

    @Override
    public void visit(Valdeclstat_ASTnode it) {

    }

    @Override
    public void visit(Returnstat_ASTnode it) {

    }

    @Override
    public void visit(Ifstat_ASTnode it) {

    }

    @Override
    public void visit(Forstat_ASTnode it) {

    }

    @Override
    public void visit(Exprstat_ASTnode it) {

    }

    @Override
    public void visit(Continuestat_ASTnode it) {

    }

    @Override
    public void visit(Breakstat_ASTnode it) {

    }

    @Override
    public void visit(Constructdel_ASTnode it) {

    }

    @Override
    public void visit(ArrayExp_ASTnode it) {
        it.arr.accept(this);
        it.index.accept(this);
        if (!it.index.type.typename.equals("int"))
            throw new semanticerror("index can't be not int in arrayexprnode", it.pos);
        it.type = it.arr.type;
        it.type.dim -= 1;
    }

    @Override
    public void visit(Post_UnaryExp_ASTnode it) {
        if (!it.isleft) throw new semanticerror("postunaryexp can't be right type", it.pos);
        it.expr.accept(this);
        Single_Enum op = it.op;
        switch (op) {
            case SELFPLUS, SELFSUB, ADD, SUB -> {
                if (!it.expr.type.typename.equals("int")) {
                    throw new semanticerror("error in front expr ++..", it.pos);
                }
                it.isleft = false;
            }
            case NOT -> {
                if (!it.expr.type.typename.equals("bool")) {
                    throw new semanticerror("error in front expr,!..", it.pos);
                }

            }
            case TILDE -> {
            }
        }
        it.type = it.expr.type;
    }
}
