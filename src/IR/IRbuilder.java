package IR;

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
import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRmodule.IRmodule;
import IR.Instru.BrInstruction;
import IR.Instru.CallInstruction;
import IR.Instru.StoreInstruction;
import IR.Operand.*;
import IR.TypeSystem.*;
import IR.Utils.ASTtype_to_IRtype;
import Utils.globalscope;

import java.util.ArrayList;

public class IRbuilder implements ASTvisitor {
    //collect ir information(some map)
    public IRmodule module_in_irbuilder;

    //record the current irbuilder pointer state
    public IRfunction current_function;
    public IRbasicblock current_basicblock;

    //scope from semantic
    public globalscope semantic_globalscope;

    public IRbuilder(globalscope semantic_globalscope_) {

        module_in_irbuilder = new IRmodule();
        semantic_globalscope = semantic_globalscope_;

        //add build_in
        IRfunction builtinfunction;
        ArrayList<Parament> builtin_para;
        FunctionType builtin_functiontype;

        //void print(string str);
        builtin_para=new ArrayList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8))));
        builtin_functiontype=new FunctionType(new VoidType(),builtin_para);
        builtinfunction=new IRfunction(builtin_functiontype,"print",true);
        module_in_irbuilder.Module_Function_Map.put("print",builtinfunction);
        module_in_irbuilder.External_Function_Map.put("print",builtinfunction);

        //void println(string str);
        builtin_para=new ArrayList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8))));
        builtin_functiontype=new FunctionType(new VoidType(),builtin_para);
        builtinfunction=new IRfunction(builtin_functiontype,"println",true);
        module_in_irbuilder.Module_Function_Map.put("println",builtinfunction);
        module_in_irbuilder.External_Function_Map.put("println",builtinfunction);

        //void printInt(int n);
        builtin_para=new ArrayList<>();
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32)));
        builtin_functiontype=new FunctionType(new VoidType(),builtin_para);
        builtinfunction=new IRfunction(builtin_functiontype,"printInt",true);
        module_in_irbuilder.Module_Function_Map.put("printInt",builtinfunction);
        module_in_irbuilder.External_Function_Map.put("printInt",builtinfunction);

        //void printlnInt(int n);
        builtin_para=new ArrayList<>();
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32)));
        builtin_functiontype=new FunctionType(new VoidType(),builtin_para);
        builtinfunction=new IRfunction(builtin_functiontype,"printlnInt",true);
        module_in_irbuilder.Module_Function_Map.put("printlnInt",builtinfunction);
        module_in_irbuilder.External_Function_Map.put("printlnInt",builtinfunction);

        //string getString();
        builtin_para=new ArrayList<>();
        builtin_functiontype=new FunctionType(new PointerType(new IntegerType(IntegerSubType.i8)),builtin_para);
        builtinfunction=new IRfunction(builtin_functiontype,"getString",true);
        module_in_irbuilder.Module_Function_Map.put("getString",builtinfunction);
        module_in_irbuilder.External_Function_Map.put("getString",builtinfunction);

        //int getInt();
        builtin_para=new ArrayList<>();
        builtin_functiontype=new FunctionType(new IntegerType(IntegerSubType.i32),builtin_para);
        builtinfunction=new IRfunction(builtin_functiontype,"getInt",true);
        module_in_irbuilder.Module_Function_Map.put("getInt",builtinfunction);
        module_in_irbuilder.External_Function_Map.put("getInt",builtinfunction);

        //string toString(int i);
        builtin_para=new ArrayList<>();
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32)));
        builtin_functiontype=new FunctionType(new PointerType(new IntegerType(IntegerSubType.i8)),builtin_para);
        builtinfunction=new IRfunction(builtin_functiontype,"toString",true);
        module_in_irbuilder.Module_Function_Map.put("toString",builtinfunction);
        module_in_irbuilder.External_Function_Map.put("toString",builtinfunction);

    }

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
        //collect class name


        //collect the class inner function

        //collect the function name information
        IRfunction collect_function;
        ArrayList<Parament> collect_function_para;
        FunctionType collect_function_type;
        for (int i = 0; i <it.list.size() ; i++) {
            if (it.list.get(i) instanceof Fundecl_ASTnode){
                //get the ast functiondecl
                Fundecl_ASTnode functiondecl= (Fundecl_ASTnode) it.list.get(i);
                //build the type translator
                ASTtype_to_IRtype type_translator=new ASTtype_to_IRtype(module_in_irbuilder);
                //add function paramentlist
                collect_function_para=new ArrayList<>();
                if (functiondecl.paralist_infuction!=null) {
                    for (int j = 0; j < functiondecl.paralist_infuction.paralist.size(); j++) {
                        collect_function_para.add(new Parament(type_translator.asttype_to_irtype(functiondecl.paralist_infuction.paralist.get(j).type)));
                    }
                }
                //add type
                collect_function_type=new FunctionType(type_translator.asttype_to_irtype(functiondecl.returntype),collect_function_para);
                // build function
                collect_function=new IRfunction(collect_function_type,functiondecl.functionname,false);
                module_in_irbuilder.Module_Function_Map.put(functiondecl.functionname,collect_function);
            }
        }
        //visit class
        for (int i = 0; i <it.list.size() ; i++) {
            if (it.list.get(i) instanceof Classdecl_ASTnode){
                it.list.get(i).accept(this);
            }
        }
        //visit function
        for (int i = 0; i <it.list.size() ; i++) {
            if (it.list.get(i) instanceof Fundecl_ASTnode){
                it.list.get(i).accept(this);
            }
        }



    }

    @Override
    public void visit(BinaryExp_ASTnode it) {

    }

    @Override
    public void visit(Constint_ASTnode it) {
        it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), it.val1);
    }

    @Override
    public void visit(Constbool_ASTnode it) {
        it.ir_operand = new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), it.index);
    }

    @Override
    public void visit(Front_UnaryExp_ASTnode it) {

    }

    @Override
    public void visit(Conststring_ASTnode it) {
        //todo
    }

    @Override
    public void visit(Constnull_ASTnode it) {
        it.ir_operand = new ConstOperand_Null(new VoidType());
    }

    //public CallInstruction(IRbasicblock iRbasicblock, Register call_result_, ArrayList<BaseOperand> paralist_, IRfunction call_fuction_)
    @Override
    public void visit(FunctioncallExp_ASTnode it) {
        if (it.funcname instanceof IdExp_ASTnode) {
            Fundecl_ASTnode function = semantic_globalscope.getfundecl(it.funcname.index, null);
            IRfunction irfunction = module_in_irbuilder.Module_Function_Map.get(it.funcname.index);
            assert irfunction != null;
            ArrayList<BaseOperand> para_list_;
            para_list_ = new ArrayList<>();
            for (int i = 0; i < it.paralist.size(); i++) {
                it.paralist.get(i).accept(this);
                para_list_.add(it.paralist.get(i).ir_operand);
            }
            Register callreg;
            if (!function.isvoid)
                callreg = new Register(irfunction.function_type.returntype, "call_" + function.functionname);
            else callreg = null;
            current_basicblock.link_in_basicblock.add(new CallInstruction(current_basicblock, callreg, para_list_, irfunction));
            it.ir_operand = callreg;
        } else if (it.funcname instanceof MemberExp_ASTnode) {

//todo
        }
    }

    @Override
    public void visit(IdExp_ASTnode it) {


    }

    @Override
    public void visit(LambdaExp_ASTnode it) {
//nothing to do
    }

    @Override
    public void visit(NewExp_ASTnode it) {

    }

    @Override
    public void visit(MemberExp_ASTnode it) {

    }

    @Override
    public void visit(Suite_ASTnode it) {
        for (int i = 0; i < it.statlist.size(); i++) {
            it.statlist.get(i).accept(this);
        }
    }

    @Override
    public void visit(Singlevaluedecl_ASTnode it) {

    }

    @Override
    public void visit(Fundecl_ASTnode it) {
        IRfunction Function = module_in_irbuilder.Module_Function_Map.get(it.functionname);
        current_function = Function;
        current_basicblock = Function.entry_block;
        for (int i = 0; i < it.suite.statlist.size(); i++) {
            it.suite.statlist.get(i).accept(this);
        }
        Function.block_list.add(Function.return_block);
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
        if (!it.isvoid) {
            it.renturnexpr.accept(this);
            current_basicblock.link_in_basicblock.add(new StoreInstruction(current_basicblock, it.renturnexpr.ir_operand, current_function.return_reg));
        }
        current_basicblock.link_in_basicblock.add(new BrInstruction(current_basicblock, null, current_function.return_block, null));
    }

    @Override
    public void visit(Ifstat_ASTnode it) {

    }

    @Override
    public void visit(Forstat_ASTnode it) {

    }

    @Override
    public void visit(Exprstat_ASTnode it) {
        it.expr.accept(this);

    }

    @Override
    public void visit(Continuestat_ASTnode it) {

    }

    @Override
    public void visit(Breakstat_ASTnode it) {

    }

    @Override
    public void visit(Constructdecl_ASTnode it) {

    }

    @Override
    public void visit(ArrayExp_ASTnode it) {

    }

    @Override
    public void visit(Post_UnaryExp_ASTnode it) {

    }
}
