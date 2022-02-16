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
import Utils.error.SemanticError;


import java.util.LinkedList;

public class Semanticcheck implements ASTvisitor {
    public globalscope Globalscope;
    public Scope currentscope;
    boolean infun = false, inclass = false, inconstructer = false;
    int inlambda=0;
    int inloop = 0;
    String tempclassname;

    public void getparent_returntype(position pos) {
        if (infun) {
            if (currentscope.parentscope.funcreturntype == null) return;
            currentscope.funcreturntype = new
                    Type_ASTnode(pos, currentscope.parentscope.funcreturntype.typename)
            ;
            currentscope.funcreturntype.dim = currentscope.parentscope.funcreturntype.dim;
        }
    }

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
                } else throw new SemanticError(" class def the same", it.list.get(i).pos);
            }
        }


        //内联函数和函数处理定义
        LinkedList<Singlevaluedecl_ASTnode> list0 = new LinkedList<>();
        list0.add(new Singlevaluedecl_ASTnode(null, new Stringtype_ASTnode(null, "string"), "str", null));
        Paralist_ASTnode para0 = new Paralist_ASTnode(null, list0);
        Fundecl_ASTnode fundecl0 = new Fundecl_ASTnode(null, new Voidtype_ASTnode(null, null), "print", para0, null, true);
        Globalscope.funcmap.put("print", fundecl0);


        LinkedList<Singlevaluedecl_ASTnode> list = new LinkedList<>();
        list.add(new Singlevaluedecl_ASTnode(null, new Stringtype_ASTnode(null, "string"), "str", null));
        Paralist_ASTnode para = new Paralist_ASTnode(null, list);
        Fundecl_ASTnode fundecl = new Fundecl_ASTnode(null, new Voidtype_ASTnode(null, null), "println", para, null, true);
        Globalscope.funcmap.put("println", fundecl);


        LinkedList<Singlevaluedecl_ASTnode> list1 = new LinkedList<>();
        list1.add(new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "n", null));
        Paralist_ASTnode para1 = new Paralist_ASTnode(null, list1);
        Fundecl_ASTnode fundecl1 = new Fundecl_ASTnode(null, new Voidtype_ASTnode(null, null), "printInt", para1, null, true);
        Globalscope.funcmap.put("printInt", fundecl1);


        LinkedList<Singlevaluedecl_ASTnode> list2 = new LinkedList<>();
        list2.add(new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "n", null));
        Paralist_ASTnode para2 = new Paralist_ASTnode(null, list2);
        Fundecl_ASTnode fundecl2 = new Fundecl_ASTnode(null, new Voidtype_ASTnode(null, null), "printlnInt", para2, null, true);
        Globalscope.funcmap.put("printlnInt", fundecl2);

        Fundecl_ASTnode fundecl3 = new Fundecl_ASTnode(null, new Stringtype_ASTnode(null, "string"), "getString", null, null, false);
        Globalscope.funcmap.put("getString", fundecl3);


        Fundecl_ASTnode fundecl4 = new Fundecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "getInt", null, null, false);
        Globalscope.funcmap.put("getInt", fundecl4);

        LinkedList<Singlevaluedecl_ASTnode> list5 = new LinkedList<>();
        list5.add(new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "i", null));
        Paralist_ASTnode para5 = new Paralist_ASTnode(null, list5);
        Fundecl_ASTnode fundecl5 = new Fundecl_ASTnode(null, new Stringtype_ASTnode(null, "string"), "toString", para5, null, false);
        Globalscope.funcmap.put("toString", fundecl5);

        boolean hasmain = false;


        // 下面收集各个fun
        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Fundecl_ASTnode) {
                if (((Fundecl_ASTnode) it.list.get(i)).functionname.equals("main")) {
                    hasmain = true;
                    if (!((Fundecl_ASTnode) it.list.get(i)).returntype.typename.equals("int")) {
                        throw new SemanticError("error for main return ", it.pos);
                        //basic 12
                    }
                    if (((Fundecl_ASTnode) it.list.get(i)).paralist_infuction!=null){
                        throw new SemanticError(" main function should not have parameters.", it.pos);
                    }
                }
                if (!Globalscope.ifcontainfunname(((Fundecl_ASTnode) it.list.get(i)).functionname)) {
                    if (Globalscope.ifcontainclassname(((Fundecl_ASTnode) it.list.get(i)).functionname)) {
                        throw new SemanticError(" function declare the same as the class", it.list.get(i).pos);
                    }
                    Globalscope.insertfunc(((Fundecl_ASTnode) it.list.get(i)).functionname, (Fundecl_ASTnode) it.list.get(i));
                } else throw new SemanticError("function declare the same in root", it.list.get(i).pos);
            }
        }
        if (!hasmain) {
            throw new SemanticError("no main fuction my bro", it.pos);
        }


        //collect inner class
        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Classdecl_ASTnode) {
                Classdecl_ASTnode tmpclass = (Classdecl_ASTnode) it.list.get(i);
                for (int j = 0; j < tmpclass.functionlist.size(); j++) {
                    Fundecl_ASTnode fun_inclass = tmpclass.functionlist.get(j);
                    if (tmpclass.classscope.funcmap.containsKey(fun_inclass.functionname)) {
                        throw new SemanticError("class fun the same name", fun_inclass.pos);
                    }
                    tmpclass.classscope.funcmap.put(fun_inclass.functionname, fun_inclass);
                }
                for (int j = 0; j < tmpclass.valdecllist.size(); j++) {
                    Valdeclstat_ASTnode tmpvaldecl = tmpclass.valdecllist.get(j);
                    if (!Globalscope.checktype(tmpvaldecl.type_instat, tmpvaldecl.pos)) {
                        throw new SemanticError("type don't exist in Global in root check", tmpvaldecl.pos);
                    }
                    for (int k = 0; k < tmpclass.valdecllist.get(j).vardecllist.size(); k++) {
                        tmpclass.classscope.valdelmap.put(tmpclass.valdecllist.get(j).vardecllist.get(k).name, tmpclass.valdecllist.get(j).type_instat);
                    }


                }
                Globalscope.classdetailmap.put(((Classdecl_ASTnode) it.list.get(i)).classname, tmpclass);
            }
        }//insert string todo

        Classdecl_ASTnode stringdecl = new Classdecl_ASTnode(null, "string", null, null, null);
        {
            Fundecl_ASTnode stringfundecl = new Fundecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "length", null, null, false);
            stringdecl.classscope.funcmap.put("length", stringfundecl);

            LinkedList<Singlevaluedecl_ASTnode> stringlist1 = new LinkedList<>();
            Singlevaluedecl_ASTnode stringsingle11 = new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "left", null);
            Singlevaluedecl_ASTnode stringsingle12 = new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "right", null);
            stringlist1.add(stringsingle11);
            stringlist1.add(stringsingle12);
            Paralist_ASTnode stringpara1 = new Paralist_ASTnode(null, stringlist1);
            Fundecl_ASTnode stringfundecl1 = new Fundecl_ASTnode(null, new Stringtype_ASTnode(null, "string"), "substring", stringpara1, null, false);
            stringdecl.classscope.funcmap.put("substring", stringfundecl1);

            Fundecl_ASTnode stringfundecl2 = new Fundecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "parseInt", null, null, false);
            stringdecl.classscope.funcmap.put("parseInt", stringfundecl2);

            LinkedList<Singlevaluedecl_ASTnode> stringlist3 = new LinkedList<>();
            Singlevaluedecl_ASTnode stringsingle3 = new Singlevaluedecl_ASTnode(null, new Inttype_ASTnode(null, "int"), "pos", null);
            stringlist3.add(stringsingle3);
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
                if ((!(it.rhs.type.typename.equals(it.lhs.type.typename)&&it.rhs.type.dim==it.lhs.type.dim)) && (!it.rhs.type.typename.equals("null"))) {

                    System.out.println(it.lhs.type.gettype());
                    System.out.println(it.rhs.type.gettype());
                    throw new SemanticError(" error in binary not match compare in equal 00", it.pos);
                }

                if (!((it.lhs.type.typename.equals("int") && it.rhs.type.typename.equals("int")) || (it.lhs.type.typename.equals("string") && it.rhs.type.typename.equals("string")))) {
                    throw new SemanticError("error in add .. op", it.pos);
                }
                if (it.lhs.type.typename.equals("int")) {
                    it.type = new Inttype_ASTnode(it.pos, "int");
                } else {
                    it.type = new Stringtype_ASTnode(it.pos, "string");
                }
            }
            case SUB, MOD, MUL, DIV, LEFT_SHIFT, RIGHT_SHIFT, Bitwise_and, Bitwise_or, Bitwise_xor -> {
                if (!((it.lhs.type.typename.equals("int") && it.rhs.type.typename.equals("int")))) {
                    throw new SemanticError("error in add .. op", it.pos);
                }
                it.type = new Inttype_ASTnode(it.pos, "int");

            }
            case EQUAL -> {
                if (it.lhs.type.dim==0&&(it.rhs.type instanceof Nulltype_ASTnode)&&((it.lhs.type.typename.equals("int")||it.lhs.type.typename.equals("bool")||it.lhs.type.typename.equals("null")))){
                    throw new SemanticError(" null cannot be assigned to primitive type variable", it.pos);
                }
                if (it.lhs instanceof FunctioncallExp_ASTnode) {
                    throw new SemanticError("function call can't be at left", it.pos);

                }
                if (it.lhs instanceof Conststring_ASTnode || it.lhs instanceof Constbool_ASTnode || it.lhs instanceof Constint_ASTnode || it.lhs instanceof Constnull_ASTnode)
                    throw new SemanticError(" lhs can't be constant obj", it.pos);

                if (!it.lhs.isleft) throw new SemanticError(" binary rhs can't be assign ", it.pos);
                if (it.lhs.type.typename.equals("string") && it.rhs.type.typename.equals("null")) {
                    throw new SemanticError("error in binary ,can't assign string with null", it.pos);
                }
                if (it.lhs.index != null) {
                    if (it.lhs.index.equals("true") || it.lhs.index.equals("false")) {
                        throw new SemanticError("true or false can't be assigned", it.pos);
                    }
                }
                if ((!(it.lhs.type.typename.equals(it.rhs.type.typename)&&it.lhs.type.dim==it.rhs.type.dim)) && (!it.rhs.type.typename.equals("null"))) {
                    System.out.println(it.lhs.type.gettype());
                    System.out.println(it.rhs.type.gettype());
                    throw new SemanticError(" error in binary not match compare in equal 01", it.pos);
                }
            }
            case AND, OR -> {
                if (!(it.lhs.type.typename.equals("bool") && it.rhs.type.typename.equals("bool"))) {
                    throw new SemanticError("error in binary bool && ||", it.pos);
                }
                it.type = new Booltype_ASTnode(it.pos, "bool");

            }
            case EQUALEQUAL, NOT_EQUAL -> {
                if ((!(it.lhs.type.typename.equals(it.rhs.type.typename)&&it.lhs.type.dim==it.rhs.type.dim))&&(!(it.rhs.type instanceof Nulltype_ASTnode))) {
                    System.out.println(it.lhs.type.gettype());
                    System.out.println(it.rhs.type.gettype());
                    throw new SemanticError("error in binary not match compare in 1 ", it.pos);
                }
                it.type = new Booltype_ASTnode(it.pos, "bool");

            }
            case GREATER, GREATEREQUAL, LESSER, LESSEREQUAL -> {
                if ((!(it.lhs.type.typename.equals(it.rhs.type.typename)&&it.lhs.type.dim==it.rhs.type.dim))) {
                    throw new SemanticError("error in binary not match compare in 2", it.pos);
                }
                if (it.lhs.type.typename.equals("bool") ) {
                    throw new SemanticError("error in binary bool < >", it.pos);
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
                    throw new SemanticError("error in front expr ++..", it.pos);
                }
            }
            case NOT -> {
                if (!it.expr.type.typename.equals("bool")) {
                    throw new SemanticError("error in front expr,!..", it.pos);
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
        getparent_returntype(it.pos);
        Fundecl_ASTnode Function = null;
        if (it.funcname instanceof MemberExp_ASTnode || it.funcname instanceof IdExp_ASTnode) {
            it.funcname.accept(this);
            if (it.funcname instanceof MemberExp_ASTnode) {
                MemberExp_ASTnode mem = (MemberExp_ASTnode) it.funcname;
                if (mem.classcall instanceof Thisexpr_ASTnode) {
                    Classdecl_ASTnode tmpclassdecl = Globalscope.classdetailmap.get(tempclassname);
                    Function = tmpclassdecl.classscope.getfundecl_inclass(mem.member, it.pos);
                    if (Function == null) {
                        throw new SemanticError("no this function in class", it.pos);
                    }

                }// cope with this.D()
                else if (mem.classcall.type.typename.equals("string")) {
                    if (!Globalscope.classdetailmap.get("string").classscope.funcmap.containsKey(mem.member)) {
                        throw new SemanticError("string function call the wrong function", it.pos);
                    }
                    Function = Globalscope.classdetailmap.get("string").classscope.funcmap.get(mem.member);

                }//string
                else if (mem.classcall instanceof ArrayExp_ASTnode&&mem.member.equals("size")) {

                    Function = new Fundecl_ASTnode(it.pos, new Inttype_ASTnode(it.pos, "int"), "size", null, null, false);
                }//array
                else if (mem.classcall.type instanceof Arraytype_ASTnode&&mem.member.equals("size")){
                    //特判  也是array size相关的 misc 3 34

                   Function = new Fundecl_ASTnode(it.pos, new Inttype_ASTnode(it.pos, "int"), "size", null, null, false);
                }
                else if (mem.classcall instanceof IdExp_ASTnode) {
                    // call    class Array {}  Array a a.size()
                    Classdecl_ASTnode class_mem = Globalscope.classdetailmap.get(mem.classcall.type.typename);
                    Scope classscope = class_mem.classscope;
                    Function = classscope.getfundecl_inclass(mem.member, it.pos);
                    if (Function == null) {
                        throw new SemanticError("error in function call can't find fun declar1", it.pos);
                    }
                } else if (((MemberExp_ASTnode) it.funcname).classcall instanceof NewExp_ASTnode) {
                    //for (new C).func() + (new C).func();
                    String classname = ((MemberExp_ASTnode) it.funcname).classcall.type.typename;
                    Classdecl_ASTnode class_mem = Globalscope.classdetailmap.get(classname);
                    Function = class_mem.classscope.funcmap.get(((MemberExp_ASTnode) it.funcname).member);
                } else {//maybe useless?
                    Classdecl_ASTnode class_mem = Globalscope.classdetailmap.get(mem.classcall.type.typename);
                    Scope classscope = class_mem.classscope;
                    Function = classscope.getfundecl_inclass(((MemberExp_ASTnode) it.funcname).member, it.pos);
                    if (Function == null) {
                        throw new SemanticError("error in function call can't find fun declar2", it.pos);
                    }
                }
            } else if (it.funcname instanceof IdExp_ASTnode) {
                Function = currentscope.getfundecl(it.funcname.index, it.pos);
                if (Function == null) {
                    throw new SemanticError("error in function call can't find id declar", it.pos);
                }
            }
        } else {
            throw new SemanticError(" function call type wrong ", it.pos);
        }
        assert Function != null;
        if (Function.paralist_infuction != null) {
            if (Function.paralist_infuction.paralist.size() != it.paralist.size()) {
                throw new SemanticError("para size in funccall", it.pos);
            }
        } else {
            if (it.paralist != null) {
                throw new SemanticError("eroor para size in funcall", it.pos);
            }
        }
        if (it.paralist != null) {
            for (int i = 0; i < it.paralist.size(); i++) {
                it.paralist.get(i).accept(this);
                Type_ASTnode type_asTnode=it.paralist.get(i).type;
                Type_ASTnode type_asTnode1=Function.paralist_infuction.paralist.get(i).type;
                if ((!(type_asTnode.typename.equals(type_asTnode1.typename)&&type_asTnode.dim==type_asTnode1.dim))&&(!(type_asTnode instanceof Nulltype_ASTnode))){
                    throw new SemanticError("para type mismatch in funccall", it.paralist.get(i).pos);

                }
            }
        }

        it.type=new Type_ASTnode(it.pos, Function.returntype.typename);

        it.type.dim = Function.returntype.dim;
        currentscope = currentscope.parentscope;

    }

    @Override
    public void visit(IdExp_ASTnode it) {
        Type_ASTnode returntype = currentscope.find_type(it.index, it.pos);
        if (returntype != null) {
            it.type = returntype;
        } else {

            throw new SemanticError("error in id don't be stated before", it.pos);
        }
    }

    @Override
    public void visit(LambdaExp_ASTnode it) {

        currentscope = new Scope(currentscope);
        getparent_returntype(it.pos);
        it.type=it.typeinlambda;
        currentscope.funcreturntype = it.type;

        if (it.lambda_parslist!=null) {
            for (int i = 0; i < it.lambda_parslist.paralist.size(); i++) {
                if (currentscope.valdelmap.containsKey(it.lambda_parslist.paralist.get(i).name)) {
                    throw new SemanticError(" lambda contain the same", it.lambda_parslist.paralist.get(i).pos);
                }
                currentscope.valdelmap.put(it.lambda_parslist.paralist.get(i).name, it.lambda_parslist.paralist.get(i).type);
            }
            if (it.paralist.size() != it.lambda_parslist.paralist.size())
                throw new SemanticError("paralist size don't fit to the define", it.pos);

        }
        inlambda++;
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
                throw new SemanticError("lambda don't match para type", it.lambda_parslist.paralist.get(i).pos);
            }
        }
        inlambda--;

        currentscope = currentscope.parentscope;

    }

    @Override
    public void visit(NewExp_ASTnode it) {
        if (it.dim == 0) {
            it.type.accept(this);
            if (it.type.gettype().equals("int") || it.type.gettype().equals("bool") || it.type.gettype().equals("string")) {
                throw new SemanticError("new dim =0 wrong type", it.pos);
            }
        } else {
            for (int i = 0; i < it.newlist.size(); i++) {
                it.newlist.get(i).accept(this);
                Type_ASTnode elementtype = it.newlist.get(i).type;
                if (!elementtype.gettype().equals("int")) {
                    throw new SemanticError(" element must be int in new ", it.newlist.get(i).pos);
                }
            }
            it.type = it.type1;
        }
    }

    @Override
    public void visit(MemberExp_ASTnode it) {
        it.classcall.accept(this);
        Type_ASTnode ittype = it.type;
        if (it.classcall instanceof ArrayExp_ASTnode&&it.classcall.type.dim>0){
            if (!it.member.equals("size")) throw new SemanticError("array function isn't size1?", it.pos);
            it.type=new Inttype_ASTnode(it.pos,"int");
        }
        else if (it.classcall.type instanceof Arraytype_ASTnode&&it.classcall.type.dim>0){
            if (!it.member.equals("size")) throw new SemanticError("array function isn't size2?", it.pos);
            it.type=new Inttype_ASTnode(it.pos,"int");

        }
        else if (it.classcall.type != null) {
            Classdecl_ASTnode tmpclass = Globalscope.classdetailmap.get(it.classcall.type.typename);

            it.type = new Type_ASTnode(it.pos, tmpclass.classscope.find_type(it.member, it.pos).typename);

            it.type.dim = tmpclass.classscope.find_type(it.member, it.pos).dim;
        } else if (it.classcall instanceof Thisexpr_ASTnode) {
            //this.x
            Classdecl_ASTnode tmpclass = Globalscope.classdetailmap.get(tempclassname);
            if (tmpclass.classscope.valdelmap.containsKey(it.member)) {
                Type_ASTnode tmptype = tmpclass.classscope.valdelmap.get(it.member);
                it.type = new Type_ASTnode(it.pos, tmptype.typename);

                it.type.dim = tmptype.dim;
            } else throw new SemanticError("no val in this in menm ", it.pos);

        }


//below is useless? yes!!!
        if (ittype instanceof Classtype_ASTnode) {
            Classdecl_ASTnode it_class_index = Globalscope.find_class_index(it.index, it.pos);
            if (it_class_index == null) {
                throw new SemanticError("error in memexpr 1", it.pos);
            }
            Type_ASTnode exprtype = it_class_index.classscope.FinddefunScope(it.member, it.pos);
            if (exprtype == null) {
                throw new SemanticError("can't find index in the classdef", it.pos);
            }
            it.type = exprtype;
        }
    }

    @Override
    public void visit(Suite_ASTnode it) {
        currentscope = new Scope(currentscope);
        getparent_returntype(it.pos);

        for (int i = 0; i < it.statlist.size(); i++) {
            it.statlist.get(i).accept(this);
        }
        currentscope = currentscope.parentscope;
    }


    @Override
    public void visit(Singlevaluedecl_ASTnode it) {
        if (it.expression != null) {
           // if (inclass) throw new SemanticError("can't initial in the class", it.pos);
            it.expression.accept(this);
            if (it.expression instanceof NewExp_ASTnode) {
                if (!it.type.gettype().equals(((NewExp_ASTnode) it.expression).type1.gettype())) {
                    throw new SemanticError("type don't fit in single define1", it.pos);
                }
            } else if ((!(it.type.dim==it.expression.type.dim&&it.type.typename.equals(it.expression.type.typename))) && (!(it.expression instanceof Constnull_ASTnode))) {
                System.out.println(it.type.gettype());
                System.out.println(it.expression.type.gettype());
                throw new SemanticError("type don't fit in single define2", it.pos);
            }
        }
        Globalscope.checktype(it.type, it.pos);
        currentscope.defval(it.name, it.type, it.pos);
    }

    @Override
    public void visit(Fundecl_ASTnode it) {
        if (inclass) {
            if (it.functionname.equals(currentscope.classtype.typename)) {
                throw new SemanticError(" function name the same as the class", it.pos);
            }
        }
        Globalscope.checktype(it.returntype, it.pos);
        currentscope = new Scope(currentscope);
        getparent_returntype(it.pos);
        infun = true;
        if (it.paralist_infuction != null) {
            for (int i = 0; i < it.paralist_infuction.paralist.size(); i++) {
                if (currentscope.valdelmap.containsKey(it.paralist_infuction.paralist.get(i).name)) {
                    throw new SemanticError(" function def the same variable", it.paralist_infuction.paralist.get(i).pos);
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
        getparent_returntype(it.pos);
        currentscope.classtype = new Classtype_ASTnode(it.pos, it.classname, it.classname);
        inclass = true;
        tempclassname = it.classname;
        for (int i = 0; i < it.valdecllist.size(); i++) {
            it.valdecllist.get(i).accept(this);
        }

        //收集类里面所有的变量 放入clssscope 里面
        for (int i = 0; i < it.valdecllist.size(); i++) {
            for (int j = 0; j < it.valdecllist.get(i).vardecllist.size(); j++) {
                it.classscope.valdelmap.put(it.valdecllist.get(i).vardecllist.get(j).name, it.valdecllist.get(i).type_instat);
            }
        }
        currentscope.funcmap = it.classscope.funcmap;
        currentscope.valdelmap = it.classscope.valdelmap;


        for (int i = 0; i < it.functionlist.size(); i++) {
            it.functionlist.get(i).accept(this);
        }

        for (int i = 0; i < it.constructerlist.size(); i++) {
            inconstructer = true;
            it.constructerlist.get(i).accept(this);
            inconstructer = false;
        }
        tempclassname = null;
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
            if (it.type == null) {
                it.type = new Type_ASTnode(it.pos, tempclassname);
            }
        } else {
            throw new SemanticError("error in this", it.pos);
        }
    }

    @Override
    public void visit(Whilestat_ASTnode it) {
        it.condition.accept(this);
        if (!it.condition.type.gettype().equals("bool")) {
            throw new SemanticError("while condition must be bool", it.pos);
        }
        inloop++;
        currentscope = new Scope(currentscope);
        getparent_returntype(it.pos);
        if (it.while_stats != null) it.while_stats.accept(this);
        currentscope = currentscope.parentscope;
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
        if ((!infun)&&(inlambda<=0)) throw new SemanticError("return must in functioon", it.pos);
        if (it.renturnexpr == null) {
            if ((!inconstructer) && !currentscope.funcreturntype.gettype().equals("void")) {
                throw new SemanticError("return none but not void", it.pos);
            }
        } else if (it.renturnexpr instanceof Thisexpr_ASTnode) {
            if (!currentscope.funcreturntype.gettype().equals(tempclassname)) {
                throw new SemanticError("return this wrong", it.pos);
            }

        } else {
            it.renturnexpr.accept(this);
            if (inlambda>0)return;
//            if (!(it.renturnexpr.type.typename.equals(currentscope.funcreturntype.typename)&&it.renturnexpr.type.dim==currentscope.funcreturntype.dim))

            if ((!it.renturnexpr.type.gettype().equals(currentscope.funcreturntype.gettype()))&&(! (it.renturnexpr.type instanceof Nulltype_ASTnode))) {
                System.out.println(it.renturnexpr.type.gettype());
                System.out.println(currentscope.funcreturntype.gettype());
                throw new SemanticError("return type don't match", it.pos);
            }
        }
    }

    @Override
    public void visit(Ifstat_ASTnode it) {
        it.condition.accept(this);
        if (!it.condition.type.gettype().equals("bool")) {
            throw new SemanticError("if condition must be bool", it.pos);
        }
        if (it.thenstat != null) {
            currentscope = new Scope(currentscope);
            getparent_returntype(it.pos);
            it.thenstat.accept(this);
            currentscope = currentscope.parentscope;
        }
        if (it.elsestat != null) {
            currentscope = new Scope(currentscope);
            getparent_returntype(it.pos);
            it.elsestat.accept(this);
            currentscope = currentscope.parentscope;
        }
    }

    @Override
    public void visit(Forstat_ASTnode it) {
        currentscope = new Scope(currentscope);
        getparent_returntype(it.pos);
        if (it.initexpr != null) it.initexpr.accept(this);
        if (it.initvaldecl != null) it.initvaldecl.accept(this);
        if (it.condition != null) {
            it.condition.accept(this);
            if (!it.condition.type.gettype().equals("bool")) {
                throw new SemanticError("loop for condition must be bool", it.pos);
            }
        }
        if (it.incr != null) it.incr.accept(this);

        inloop++;

        if (it.suite_in_for != null) it.suite_in_for.accept(this);
        inloop--;
        currentscope = currentscope.parentscope;
    }

    @Override
    public void visit(Exprstat_ASTnode it) {
        it.expr.accept(this);
    }

    @Override
    public void visit(Continuestat_ASTnode it) {
        if (inloop <= 0) throw new SemanticError("continue not in loop", it.pos);

    }

    @Override
    public void visit(Breakstat_ASTnode it) {
        if (inloop <= 0) throw new SemanticError("break not in loop", it.pos);
    }

    @Override
    public void visit(Constructdecl_ASTnode it) {
        infun = true;
        if (it.classname.equals(currentscope.classtype.typename)) {
            currentscope = new Scope(currentscope);
            getparent_returntype(it.pos);
            if (it.paralist_infuction != null) {
                for (int i = 0; i < it.paralist_infuction.paralist.size(); i++) {
                    if (currentscope.valdelmap.containsKey(it.paralist_infuction.paralist.get(i).name)) {
                        throw new SemanticError(" construct def the same variable", it.paralist_infuction.paralist.get(i).pos);
                    }
                    currentscope.valdelmap.put(it.paralist_infuction.paralist.get(i).name, it.paralist_infuction.paralist.get(i).type);
                }
            }
            for (int i = 0; i < it.suite.statlist.size(); i++) {
                it.suite.statlist.get(i).accept(this);
            }
            //返回值类型不用检查吧？
            infun = false;
            currentscope = currentscope.parentscope;
        } else {
            throw new SemanticError("constructer name wrong ", it.pos);
        }
    }

    @Override
    public void visit(ArrayExp_ASTnode it) {
        it.arr.accept(this);
        it.index.accept(this);
        if (!it.index.type.gettype().equals("int"))
            throw new SemanticError("index can't be not int in arrayexprnode", it.pos);
        if (it.arr instanceof NewExp_ASTnode) {
            it.type = new Arraytype_ASTnode(it.arr.type, it.pos);
            it.type.typename = it.arr.type.typename;
            it.type.dim = ((NewExp_ASTnode) it.arr).dim - 1;
            return;
            //fix for array-9.mx
        }
        if (it.arr.type.dim>0 ||it.arr.type instanceof Arraytype_ASTnode) {
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
        it.expr.accept(this);
        if (!it.expr.isleft) throw new SemanticError("postunaryexp can't be right type", it.pos);
        Single_Enum op = it.op;
        switch (op) {
            case SELFPLUS, SELFSUB, ADD, SUB ,TILDE-> {
                if (!it.expr.type.typename.equals("int")) {
                    throw new SemanticError("error in front expr ++..", it.pos);
                }
                it.isleft = false;
            }
            case NOT -> {
                if (!it.expr.type.typename.equals("bool")) {
                    throw new SemanticError("error in front expr,!..", it.pos);
                }
            }
        }
        it.type = it.expr.type;
    }
}
