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

import java.util.ArrayList;

public class Semanticcheck implements ASTvisitor {
    public globalscope Globalscope;
    public Scope currentscope;
    boolean infun = false, inclass = false;
    int inloop = 0;

    public Semanticcheck(globalscope gScope) {
        Globalscope = gScope;
    }

    @Override
    public void visit(Arraytype_ASTnode it) {
        //nothing
    }

    @Override
    public void visit(Booltype_ASTnode it) {
        //nothing
    }

    @Override
    public void visit(Classtype_ASTnode it) {
        //nothing
    }

    @Override
    public void visit(Inttype_ASTnode it) {
        //nothing
    }

    @Override
    public void visit(Nulltype_ASTnode it) {
        //nothing
    }

    @Override
    public void visit(Stringtype_ASTnode it) {
        //nothing
    }

    @Override
    public void visit(Voidtype_ASTnode it) {
        //nothing
    }

    @Override
    public void visit(Rootnode it) {
        currentscope = Globalscope;
        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Classdecl_ASTnode) {
                if (!Globalscope.ifcontainclassname(((Classdecl_ASTnode) it.list.get(i)).classname)) {
                    Globalscope.insertclass((((Classdecl_ASTnode) it.list.get(i)).classname), (Classdecl_ASTnode) it.list.get(i));
                    Classtype_ASTnode classtype = new Classtype_ASTnode(it.list.get(i).pos, ((Classdecl_ASTnode) it.list.get(i)).classname, ((Classdecl_ASTnode) it.list.get(i)).classname);
                    Globalscope.classrecord.put((((Classdecl_ASTnode) it.list.get(i)).classname), classtype);
                } else throw new semanticerror(" class def the same", it.list.get(i).pos);
            }
        }


        //内联函数和函数处理定义
        ArrayList<Singlevaluedecl_ASTnode> list0 = new ArrayList<>();
        list0.add(new Singlevaluedecl_ASTnode(null, new Stringtype_ASTnode(null, "string"), "str", null));
        Paralist_ASTnode para0 = new Paralist_ASTnode(null, list0);
        Fundecl_ASTnode fundecl0 = new Fundecl_ASTnode(null, new Voidtype_ASTnode(null, null), "print", para0, null, true);
        Globalscope.funcmap.put("print", fundecl0);


        ArrayList<Singlevaluedecl_ASTnode> list = new ArrayList<>();
        list.add(new Singlevaluedecl_ASTnode(null, new Stringtype_ASTnode(null, "string"), "str", null));
        Paralist_ASTnode para = new Paralist_ASTnode(null, list);
        Fundecl_ASTnode fundecl = new Fundecl_ASTnode(null, new Voidtype_ASTnode(null, null), "println", para, null, true);
        Globalscope.funcmap.put("println", fundecl);


        ArrayList<Singlevaluedecl_ASTnode> list1 = new ArrayList<>();
        list1.add(new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "n", null));
        Paralist_ASTnode para1 = new Paralist_ASTnode(null, list1);
        Fundecl_ASTnode fundecl1 = new Fundecl_ASTnode(null, new Voidtype_ASTnode(null, null), "printInt", para1, null, true);
        Globalscope.funcmap.put("printInt", fundecl1);


        ArrayList<Singlevaluedecl_ASTnode> list2 = new ArrayList<>();
        list2.add(new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "n", null));
        Paralist_ASTnode para2 = new Paralist_ASTnode(null, list2);
        Fundecl_ASTnode fundecl2 = new Fundecl_ASTnode(null, new Voidtype_ASTnode(null, null), "printlnInt", para2, null, true);
        Globalscope.funcmap.put("printlnInt", fundecl2);

        ArrayList<Singlevaluedecl_ASTnode> list3 = new ArrayList<>();
        Paralist_ASTnode para3 = new Paralist_ASTnode(null, list3);
        Fundecl_ASTnode fundecl3 = new Fundecl_ASTnode(null, new Stringtype_ASTnode(null, "string"), "getString", para3, null, false);
        Globalscope.funcmap.put("getString", fundecl3);


        ArrayList<Singlevaluedecl_ASTnode> list4 = new ArrayList<>();
        Paralist_ASTnode para4 = new Paralist_ASTnode(null, list4);
        Fundecl_ASTnode fundecl4 = new Fundecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "getInt", para4, null, false);
        Globalscope.funcmap.put("getInt", fundecl4);

        ArrayList<Singlevaluedecl_ASTnode> list5 = new ArrayList<>();
        list5.add(new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "i", null));
        Paralist_ASTnode para5 = new Paralist_ASTnode(null, list5);
        Fundecl_ASTnode fundecl5 = new Fundecl_ASTnode(null, new Stringtype_ASTnode(null, "string"), "toString", para5, null, false);
        Globalscope.funcmap.put("toString", fundecl5);


        // 下面收集各个fun
        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Fundecl_ASTnode) {
                if (!Globalscope.ifcontainfunname(((Fundecl_ASTnode) it.list.get(i)).functionname)) {
                    if (Globalscope.ifcontainclassname(((Fundecl_ASTnode) it.list.get(i)).functionname)) {
                        throw new semanticerror(" function declare the same as the class", it.list.get(i).pos);
                    }
                    Globalscope.insertfunc(((Fundecl_ASTnode) it.list.get(i)).functionname, (Fundecl_ASTnode) it.list.get(i));
                } else throw new semanticerror("function declare the same in root", it.list.get(i).pos);
            }
        }


        //collect inner class
        for (int i = 0; i < it.list.size(); i++) {

            if (it.list.get(i) instanceof Classdecl_ASTnode ) {
                Classdecl_ASTnode tmpclass= (Classdecl_ASTnode) it.list.get(i);
                for (int j = 0; j < tmpclass.functionlist.size(); j++) {
                    Fundecl_ASTnode fun_inclass = tmpclass.functionlist.get(i);
                    if (tmpclass.classscope.funcmap.containsKey(fun_inclass.functionname)) {
                        throw new semanticerror("class fun the same name", fun_inclass.pos);
                    }
                    tmpclass.classscope.funcmap.put(fun_inclass.functionname, fun_inclass);
                }
                for (int j = 0; j < tmpclass.valdecllist.size(); j++) {
                    Valdeclstat_ASTnode tmpvaldecl = tmpclass.valdecllist.get(i);
                    if (!Globalscope.checktype(tmpvaldecl.type_instat, tmpvaldecl.pos)) {
                        throw new semanticerror("type don't exist in Global in root check", tmpvaldecl.pos);
                    }

                }
            }
        }//insert string todo

        Classdecl_ASTnode stringdecl = new Classdecl_ASTnode(null, "string", null, null, null);
        {
            ArrayList<Singlevaluedecl_ASTnode> stringlist = new ArrayList<>();
            Paralist_ASTnode stringpara = new Paralist_ASTnode(null, stringlist);
            Fundecl_ASTnode stringfundecl = new Fundecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "length", stringpara, null, false);
            stringdecl.classscope.funcmap.put("length", stringfundecl);

            ArrayList<Singlevaluedecl_ASTnode> stringlist1 = new ArrayList<>();
            Singlevaluedecl_ASTnode stringsingle11 = new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "left", null);
            Singlevaluedecl_ASTnode stringsingle12 = new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "right", null);
            stringlist1.add(stringsingle11);
            stringlist1.add(stringsingle12);
            Paralist_ASTnode stringpara1 = new Paralist_ASTnode(null, stringlist1);
            Fundecl_ASTnode stringfundecl1 = new Fundecl_ASTnode(null, new Stringtype_ASTnode(null, "string"), "substring", stringpara1, null, false);
            stringdecl.classscope.funcmap.put("substring", stringfundecl1);

            ArrayList<Singlevaluedecl_ASTnode> stringlist2 = new ArrayList<>();
            Paralist_ASTnode stringpara2 = new Paralist_ASTnode(null, stringlist2);
            Fundecl_ASTnode stringfundecl2 = new Fundecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "parseInt", stringpara2, null, false);
            stringdecl.classscope.funcmap.put("substring", stringfundecl2);

            ArrayList<Singlevaluedecl_ASTnode> stringlist3 = new ArrayList<>();
            Singlevaluedecl_ASTnode stringsingle3 = new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "pos", null);
            stringlist1.add(stringsingle3);
            Paralist_ASTnode stringpara3 = new Paralist_ASTnode(null, stringlist3);
            Fundecl_ASTnode stringfundecl3 = new Fundecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "ord", stringpara3, null, false);
            stringdecl.classscope.funcmap.put("ord", stringfundecl3);
        }
        Globalscope.classdetailmap.put("string", stringdecl);
        Globalscope.classrecord.put("string", new Classtype_ASTnode(null, "string", "string"));

        for (int i = 0; i < it.list.size(); i++) {
            it.list.get(i).accept(this);
        }


        // variable def don't satisfy forward reference so we can check one by one


    }

    @Override
    public void visit(BinaryExp_ASTnode it) {

        it.lhs.accept(this);
        it.rhs.accept(this);

        Binary_Enum op = it.op;
        switch (op) {
            case ADD -> {
                if ((!it.lhs.type.gettype().equals(it.rhs.type.gettype())) && (!it.rhs.type.typename.equals("null"))) {
                    throw new semanticerror(" error in binary not match compare in equal ", it.pos);
                }

                if (!((it.lhs.type.typename.equals("int") && it.rhs.type.typename.equals("int")) || (it.lhs.type.typename.equals("string") && it.rhs.type.typename.equals("string")))) {
                    throw new semanticerror("error in add .. op", it.pos);
                }
                if (it.lhs.type.typename.equals("int")) {
                    it.type = new Inttype_ASTnode(it.pos, "int");
                } else {
                    it.type = new Stringtype_ASTnode(it.pos, "string");
                }
            }
            case SUB, MOD, MUL, DIV, LEFT_SHIFT, RIGHT_SHIFT, Bitwise_and, Bitwise_or, Bitwise_xor -> {
                if (!((it.lhs.type.typename.equals("int") && it.rhs.type.typename.equals("int")))) {
                    throw new semanticerror("error in add .. op", it.pos);
                }
                it.type = new Inttype_ASTnode(it.pos, "int");

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
                it.type = new Booltype_ASTnode(it.pos, "bool");

            }
            case EQUALEQUAL, NOT_EQUAL -> {
                if (!it.lhs.type.gettype().equals(it.rhs.type.gettype())) {
                    System.out.println(it.lhs.type.gettype());
                    System.out.println(it.rhs.type.gettype());
                    throw new semanticerror("error in binary not match compare in 1 ", it.pos);
                }
                it.type = new Booltype_ASTnode(it.pos, "bool");

            }
            case GREATER, GREATEREQUAL, LESSER, LESSEREQUAL -> {
                if (!it.lhs.type.gettype().equals(it.rhs.type.gettype())) {
                    throw new semanticerror("error in binary not match compare in 2", it.pos);
                }
                if (it.lhs.type.typename.equals("bool") && it.rhs.type.typename.equals("bool")) {
                    throw new semanticerror("error in binary bool < >", it.pos);
                }
                it.type = new Booltype_ASTnode(it.pos, "bool");

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
        currentscope = new Scope(currentscope);


        Fundecl_ASTnode Function = null;
        if (it.funcname instanceof MemberExp_ASTnode || it.funcname instanceof IdExp_ASTnode) {
            it.funcname.accept(this);
            if (it.funcname instanceof MemberExp_ASTnode ) {
                MemberExp_ASTnode mem= (MemberExp_ASTnode) it.funcname;
                Classdecl_ASTnode class_mem = Globalscope.classdetailmap.get(mem.index);
                Scope classscope = class_mem.classscope;
                Function = classscope.getfundecl_inclass(mem.index, it.pos);
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


        for (int i = 0; i < it.paralist.size(); i++) {
            it.paralist.get(i).accept(this);
            if (!it.paralist.get(i).type.gettype().equals(Function.paralist_infuction.paralist.get(i).type.typename)) {
                throw new semanticerror("para type mismatch in funccall", it.paralist.get(i).pos);
            }
        }
        if (Function.returntype instanceof Arraytype_ASTnode){
            it.type=new Arraytype_ASTnode(Function.returntype,it.pos);

        }else {
            it.type=new Classtype_ASTnode(it.pos ,Function.returntype.typename,Function.returntype.typename);
        }
        it.type.typename = Function.returntype.typename;
        it.type.dim = Function.returntype.dim;
        currentscope = currentscope.parentscope;

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

        currentscope = new Scope(currentscope);
        currentscope.funcreturntype = it.type;
        infun = true;
        for (int i = 0; i < it.lambda_parslist.paralist.size(); i++) {
            if (currentscope.valdelmap.containsKey(it.lambda_parslist.paralist.get(i).name)) {
                throw new semanticerror(" lambda contain the same", it.lambda_parslist.paralist.get(i).pos);
            }
            currentscope.valdelmap.put(it.lambda_parslist.paralist.get(i).name, it.lambda_parslist.paralist.get(i).type);
        }
        if (it.paralist.size() != it.lambda_parslist.paralist.size())
            throw new semanticerror("paralist size don't fit to the define", it.pos);
        for (int i = 0; i < it.suite.statlist.size(); i++) {
            if (it.suite.statlist.get(i) instanceof Returnstat_ASTnode) {
                it.suite.statlist.get(i).accept(this);
                it.type = ((Returnstat_ASTnode) it.suite.statlist.get(i)).renturnexpr.type;
                it.typeinlambda = ((Returnstat_ASTnode) it.suite.statlist.get(i)).renturnexpr.type;
                break;
            }
            it.suite.statlist.get(i).accept(this);
        }
        for (int i = 0; i < it.paralist.size(); i++) {
            it.paralist.get(i).accept(this);
            if (!it.paralist.get(i).type.gettype().equals(it.lambda_parslist.paralist.get(i).type.gettype())) {
                throw new semanticerror("lambda don't match para type", it.lambda_parslist.paralist.get(i).pos);
            }
        }
        infun = false;
        currentscope = currentscope.parentscope;

    }

    @Override
    public void visit(NewExp_ASTnode it) {
        if (it.dim == 0) {
            it.type.accept(this);
            if (it.type.gettype().equals("int") || it.type.gettype().equals("bool") || it.type.gettype().equals("string")) {
                throw new semanticerror("new dim =0 wrong type", it.pos);
            }
        } else {
            for (int i = 0; i < it.newlist.size(); i++) {
                it.newlist.get(i).accept(this);
                Type_ASTnode elementtype = it.newlist.get(i).type;
                if (!elementtype.gettype().equals("int")) {
                    throw new semanticerror(" element must be int in new ", it.newlist.get(i).pos);
                }
            }
        }
    }

    @Override
    public void visit(MemberExp_ASTnode it) {
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
        currentscope = new Scope(currentscope);
        for (int i = 0; i < it.statlist.size(); i++) {
            it.statlist.get(i).accept(this);
        }
        currentscope = currentscope.parentscope;
    }


    @Override
    public void visit(Singlevaluedecl_ASTnode it) {
        if (it.expression != null) {
            it.expression.accept(this);
            if (it.expression instanceof NewExp_ASTnode) {
                if (!it.type.gettype().equals(((NewExp_ASTnode) it.expression).type1.gettype())) {
                    throw new semanticerror("type don't fit in single define", it.pos);
                }
            } else if (!it.type.gettype().equals(it.expression.type.gettype())) {
                throw new semanticerror("type don't fit in single define", it.pos);
            }
        }
        Globalscope.checktype(it.type, it.pos);
        currentscope.defval(it.name, it.type, it.pos);
    }

    @Override
    public void visit(Fundecl_ASTnode it) {
        if (inclass) {
            if (it.functionname.equals(currentscope.classtype.typename)) {
                throw new semanticerror(" function name the same as the class", it.pos);
            }
        }
        Globalscope.checktype(it.returntype, it.pos);
        currentscope = new Scope(currentscope);
        infun = true;
        if (it.paralist_infuction != null) {
            for (int i = 0; i < it.paralist_infuction.paralist.size(); i++) {
                if (currentscope.valdelmap.containsKey(it.paralist_infuction.paralist.get(i).name)) {
                    throw new semanticerror(" function def the same variable", it.paralist_infuction.paralist.get(i).pos);
                }
                currentscope.valdelmap.put(it.paralist_infuction.paralist.get(i).name, it.paralist_infuction.paralist.get(i).type);
            }
        }
        currentscope.funcreturntype = it.returntype;

        for (int i = 0; i < it.suite.statlist.size(); i++) {
            it.suite.statlist.get(i).accept(this);
        }
        infun = false;
        currentscope = currentscope.parentscope;
    }

    @Override
    public void visit(Classdecl_ASTnode it) {
        currentscope = new Scope(currentscope);
        inclass = true;
        for (int i = 0; i < it.functionlist.size(); i++) {
            it.functionlist.get(i).accept(this);
        }
        for (int i = 0; i < it.valdecllist.size(); i++) {
            it.valdecllist.get(i).accept(this);
        }
        for (int i = 0; i < it.constructerlist.size(); i++) {
            it.constructerlist.get(i).accept(this);
        }
        inclass = false;
        currentscope = currentscope.parentscope;
    }

    @Override
    public void visit(Paralist_ASTnode it) {
        //nothing
    }

    @Override
    public void visit(Thisexpr_ASTnode it) {
        if (inclass && infun) {
            it.type = currentscope.classtype;
        } else {
            throw new semanticerror("error in this", it.pos);
        }
    }

    @Override
    public void visit(Whilestat_ASTnode it) {
        it.condition.accept(this);
        if (!it.condition.type.gettype().equals("bool")) {
            throw new semanticerror("while condition must be bool", it.pos);
        }
        inloop++;
        it.while_stats.accept(this);
        inloop--;
    }

    @Override
    public void visit(Valdeclstat_ASTnode it) {
        Globalscope.checktype(it.type_instat, it.pos);
        for (int i = 0; i < it.vardecllist.size(); i++) {
            it.vardecllist.get(i).accept(this);
        }
    }

    @Override
    public void visit(Returnstat_ASTnode it) {
        if (!infun) throw new semanticerror("return must in functioon", it.pos);
        if (it.renturnexpr == null) {
            if (currentscope.funcreturntype.gettype().equals("void")) {
                throw new semanticerror("return none but noot void", it.pos);
            }
        } else {
            it.renturnexpr.accept(this);
              if (!it.renturnexpr.type.gettype().equals(currentscope.funcreturntype.gettype())) {
                throw new semanticerror("return type don't match", it.pos);
            }
        }
    }

    @Override
    public void visit(Ifstat_ASTnode it) {
        it.condition.accept(this);
        if (!it.condition.type.gettype().equals("bool")) {
            throw new semanticerror("if condition must be bool", it.pos);
        }
        currentscope = new Scope(currentscope);
        it.thenstat.accept(this);
        currentscope = currentscope.parentscope;
        if (it.elsestat != null) {
            currentscope = new Scope(currentscope);
            it.elsestat.accept(this);
            currentscope = currentscope.parentscope;
        }
    }

    @Override
    public void visit(Forstat_ASTnode it) {
        currentscope = new Scope(currentscope);
        if (it.initexpr != null) it.initexpr.accept(this);
        if (it.initvaldecl != null) it.initvaldecl.accept(this);
        if (it.condition != null) {
            it.condition.accept(this);
            if (!it.condition.type.gettype().equals("bool")) {
                throw new semanticerror("loop for condition must be bool", it.pos);
            }
        }
        if (it.incr != null) it.incr.accept(this);

        inloop++;
        it.suite_in_for.accept(this);
        inloop--;
        currentscope = currentscope.parentscope;
    }

    @Override
    public void visit(Exprstat_ASTnode it) {
        it.expr.accept(this);
    }

    @Override
    public void visit(Continuestat_ASTnode it) {
        if (inloop <= 0) throw new semanticerror("continue not in loop", it.pos);

    }

    @Override
    public void visit(Breakstat_ASTnode it) {
        if (inloop <= 0) throw new semanticerror("break not in loop", it.pos);
    }

    @Override
    public void visit(Constructdecl_ASTnode it) {
        currentscope = new Scope(currentscope);
        infun = true;
        if (it.classname.equals(currentscope.classtype.typename)) {
            for (int i = 0; i < it.paralist_infuction.paralist.size(); i++) {
                if (currentscope.valdelmap.containsKey(it.paralist_infuction.paralist.get(i).name)) {
                    throw new semanticerror(" construct def the same variable", it.paralist_infuction.paralist.get(i).pos);
                }
                currentscope.valdelmap.put(it.paralist_infuction.paralist.get(i).name, it.paralist_infuction.paralist.get(i).type);
            }
            for (int i = 0; i < it.suite.statlist.size(); i++) {
                it.suite.statlist.get(i).accept(this);
            }
            //返回值类型不用检查吧？
            infun = false;
            currentscope = currentscope.parentscope;
        } else {
            throw new semanticerror("constructer name wrong ", it.pos);
        }
    }

    @Override
    public void visit(ArrayExp_ASTnode it) {
        it.arr.accept(this);
        it.index.accept(this);
        if (!it.index.type.gettype().equals("int"))
            throw new semanticerror("index can't be not int in arrayexprnode", it.pos);
if (it.arr instanceof NewExp_ASTnode){
    it.type=new Arraytype_ASTnode(it.arr.type,it.pos);
    it.type.typename=it.arr.type.typename;
    it.type.dim=((NewExp_ASTnode) it.arr).dim-1;
    return;
    //fix for array-9.mx

}


        if (it.arr.type instanceof Arraytype_ASTnode) {
            it.type = new Arraytype_ASTnode(it.arr.type, null);
            it.type.typename = it.arr.type.typename;
            it.type.dim = it.arr.type.dim - 1;
        } else if (it.arr.type instanceof Classtype_ASTnode) {
            it.type = new Classtype_ASTnode(it.pos, it.arr.type.typename, it.arr.type.typename);
            it.type.typename = it.arr.type.typename;
            it.type.dim = it.arr.type.dim - 1;
        }

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
