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
import IR.Instru.*;
import IR.Operand.*;
import IR.TypeSystem.*;
import IR.Utils.AST_to_IR_trans;
import IR.Utils.IR_scope;
import Utils.error.IRbuilderError;
import Utils.globalscope;

import java.util.ArrayList;
import java.util.Stack;

public class IRbuilder implements ASTvisitor {
    //collect ir information(some map)
    public IRmodule module_in_irbuilder;

    //record the current irbuilder pointer state
    public IRfunction current_function;
    public IRbasicblock current_basicblock;

    //scope from semantic
    public globalscope semantic_globalscope;

    //current scope
    public IR_scope current_ir_scope;

    //transform
    public AST_to_IR_trans type_trans;

    private Stack<IRbasicblock> break_basicblock_stack = new Stack<>();
    private Stack<IRbasicblock> continue_basicblock_stack = new Stack<>();


    public IRbuilder(globalscope semantic_globalscope_) {

        module_in_irbuilder = new IRmodule();
        semantic_globalscope = semantic_globalscope_;
        current_ir_scope = new IR_scope(null);
        type_trans = new AST_to_IR_trans(module_in_irbuilder);

        //add build_in
        IRfunction builtinfunction;
        ArrayList<Parament> builtin_para;
        FunctionType builtin_functiontype;

        //void print(string str);
        builtin_para = new ArrayList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "str_0"));
        builtin_functiontype = new FunctionType(new VoidType(), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "print", true);
        module_in_irbuilder.Module_Function_Map.put("print", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("print", builtinfunction);

        //void println(string str);
        builtin_para = new ArrayList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "str_0"));
        builtin_functiontype = new FunctionType(new VoidType(), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "println", true);
        module_in_irbuilder.Module_Function_Map.put("println", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("println", builtinfunction);

        //void printInt(int n);
        builtin_para = new ArrayList<>();
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32), "n_0"));
        builtin_functiontype = new FunctionType(new VoidType(), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "printInt", true);
        module_in_irbuilder.Module_Function_Map.put("printInt", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("printInt", builtinfunction);

        //void printlnInt(int n);
        builtin_para = new ArrayList<>();
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32), "n_0"));
        builtin_functiontype = new FunctionType(new VoidType(), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "printlnInt", true);
        module_in_irbuilder.Module_Function_Map.put("printlnInt", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("printlnInt", builtinfunction);

        //string getString();
        builtin_para = new ArrayList<>();
        builtin_functiontype = new FunctionType(new PointerType(new IntegerType(IntegerSubType.i8)), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "getString", true);
        module_in_irbuilder.Module_Function_Map.put("getString", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("getString", builtinfunction);

        //int getInt();
        builtin_para = new ArrayList<>();
        builtin_functiontype = new FunctionType(new IntegerType(IntegerSubType.i32), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "getInt", true);
        module_in_irbuilder.Module_Function_Map.put("getInt", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("getInt", builtinfunction);

        //string toString(int i);
        builtin_para = new ArrayList<>();
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32), "i_0"));
        builtin_functiontype = new FunctionType(new PointerType(new IntegerType(IntegerSubType.i8)), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "toString", true);
        module_in_irbuilder.Module_Function_Map.put("toString", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("toString", builtinfunction);

        //int _str_ord(const char* str,int pos)
        builtin_para = new ArrayList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "str"));
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32), "pos"));
        builtin_functiontype = new FunctionType(new IntegerType(IntegerSubType.i32), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "_str_ord", true);
        module_in_irbuilder.Module_Function_Map.put("_str_ord", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("_str_ord", builtinfunction);

        //bool _str_eq(const char* lhs,const char* rhs)
        add_str_built_in_cmp("_str_eq");
        add_str_built_in_cmp("_str_ne");
        add_str_built_in_cmp("_str_lt");
        add_str_built_in_cmp("_str_le");
        add_str_built_in_cmp("_str_gt");
        add_str_built_in_cmp("_str_ge");

        //const char*_str_concatenate(const char* lhs,const char* rhs)
        builtin_para = new ArrayList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "lhs"));
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "rhs"));
        builtin_functiontype = new FunctionType(new PointerType(new IntegerType(IntegerSubType.i8)), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "_str_concatenate", true);
        module_in_irbuilder.Module_Function_Map.put("_str_concatenate", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("_str_concatenate", builtinfunction);
    }

    @Override
    public void visit(Arraytype_ASTnode it) {
//nothing to do
    }

    @Override
    public void visit(Booltype_ASTnode it) {
//nothing to do
    }

    @Override
    public void visit(Classtype_ASTnode it) {
//nothing to do
    }

    @Override
    public void visit(Inttype_ASTnode it) {
//nothing to do
    }

    @Override
    public void visit(Nulltype_ASTnode it) {
//nothing to do
    }

    @Override
    public void visit(Stringtype_ASTnode it) {
//nothing to do
    }

    @Override
    public void visit(Voidtype_ASTnode it) {
//nothing to do
    }

    @Override
    public void visit(Rootnode it) {
        ///collect class name


        ///collect the class inner function

        ///collect the function name information
        IRfunction collect_function;
        ArrayList<Parament> collect_function_para;
        FunctionType collect_function_type;
        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Fundecl_ASTnode) {
                //get the ast functiondecl
                Fundecl_ASTnode functiondecl = (Fundecl_ASTnode) it.list.get(i);
                //build the type translator
                AST_to_IR_trans type_translator = new AST_to_IR_trans(module_in_irbuilder);
                //add function paramentlist
                collect_function_para = new ArrayList<>();
                if (functiondecl.paralist_infuction != null) {
                    for (int j = 0; j < functiondecl.paralist_infuction.paralist.size(); j++) {
                        collect_function_para.add(new Parament(type_translator.asttype_to_irtype(functiondecl.paralist_infuction.paralist.get(j).type), functiondecl.paralist_infuction.paralist.get(j).name + "_para"));
                    }
                }
                //add type
                collect_function_type = new FunctionType(type_translator.asttype_to_irtype(functiondecl.returntype), collect_function_para);
                // build function
                collect_function = new IRfunction(collect_function_type, functiondecl.functionname, false);
                module_in_irbuilder.Module_Function_Map.put(functiondecl.functionname, collect_function);
                module_in_irbuilder.Internal_Function_Map.put(functiondecl.functionname, collect_function);
            }
        }

        ///add init function
        ArrayList<Parament> tmp = new ArrayList<>();
        FunctionType global_init = new FunctionType(new VoidType(), tmp);
        IRfunction GLOBAL__sub_I_main_mx = new IRfunction(global_init, "GLOBAL__sub_I_main.mx", false);
        module_in_irbuilder.Module_Function_Map.put(GLOBAL__sub_I_main_mx.functionname, GLOBAL__sub_I_main_mx);
        module_in_irbuilder.Internal_Function_Map.put(GLOBAL__sub_I_main_mx.functionname, GLOBAL__sub_I_main_mx);
        //set the state
        current_function = GLOBAL__sub_I_main_mx;
        current_basicblock = GLOBAL__sub_I_main_mx.entry_block;
        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Valdeclstat_ASTnode) {
                it.list.get(i).accept(this);
            }
        }
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, current_function.return_block, null));
        GLOBAL__sub_I_main_mx.block_list.add(GLOBAL__sub_I_main_mx.return_block);


        ///visit class
        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Classdecl_ASTnode) {
                it.list.get(i).accept(this);
            }
        }
        ///visit function
        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Fundecl_ASTnode) {
                it.list.get(i).accept(this);
            }
        }


    }

    @Override
    public void visit(BinaryExp_ASTnode it) {
        if (!(it.op == Binary_Enum.AND || it.op == Binary_Enum.OR)) {
            it.lhs.accept(this);
            it.rhs.accept(this);
            //todo string binary
            if (it.lhs.type.typename.equals("string") && it.rhs.type.typename.equals("string")) {
                switch (it.op) {
                    case EQUAL -> {
                        //lhs just can be id
                        current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.rhs.ir_operand, current_ir_scope.find_id_to_reg(it.lhs.index)));
                        //it may not use :just for   --->foo(a=b+1) this seem weird
                        it.ir_operand = it.rhs.ir_operand;
                        throw new IRbuilderError("what you can do this?", null);
                    }
                    case ADD -> {
                        ArrayList<BaseOperand> para_list_;
                        para_list_ = new ArrayList<>();
                        para_list_.add(it.lhs.ir_operand);
                        para_list_.add(it.rhs.ir_operand);
                        IRfunction tmpcunction = module_in_irbuilder.Module_Function_Map.get("_str_concatenate");
                        Register stringadd = new Register(new PointerType(new IntegerType(IntegerSubType.i8)), "string_add");
                        current_function.renaming_add(stringadd);
                        current_basicblock.instruction_add(new CallInstruction(current_basicblock, stringadd, para_list_, tmpcunction));
                        it.ir_operand = stringadd;
                    }
                    case EQUALEQUAL, NOT_EQUAL, GREATEREQUAL, LESSER, LESSEREQUAL, GREATER -> {
                        // todo
                        ArrayList<BaseOperand> para_list_;
                        para_list_ = new ArrayList<>();
                        para_list_.add(it.lhs.ir_operand);
                        para_list_.add(it.rhs.ir_operand);
                        String funcname = string_cmp_return(it.op);
                        IRfunction tmpcunction = module_in_irbuilder.Module_Function_Map.get(funcname);
                        Register tmpreg_cmp_result = new Register(new IntegerType(IntegerSubType.i1), "cmp_result" + funcname);
                        current_function.renaming_add(tmpreg_cmp_result);
                        current_basicblock.instruction_add(new CallInstruction(current_basicblock, tmpreg_cmp_result, para_list_, tmpcunction));
                        it.ir_operand = tmpreg_cmp_result;
                    }
                    default -> throw new IllegalStateException(" sring binary ir Unexpected value: " + it.op);
                }
                return;
            }

            // cope with int&&bool
            switch (it.op) {
                case EQUAL -> {
                    //lhs just can be id
                    current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.rhs.ir_operand, current_ir_scope.find_id_to_reg(it.lhs.index)));
                    //it may not use :just for   --->foo(a=b+1) this seem weird
                    it.ir_operand = it.rhs.ir_operand;
                }
                case ADD, SUB, MOD, DIV, MUL, LEFT_SHIFT, RIGHT_SHIFT, Bitwise_and, Bitwise_xor, Bitwise_or -> {
                    set_binary_op(it.op, it);
                }
                case EQUALEQUAL, NOT_EQUAL, GREATEREQUAL, LESSER, LESSEREQUAL, GREATER -> {
                    Object op = type_trans.enum_trans(it.op);
                    Register tmpreg = new Register(new IntegerType(IntegerSubType.i1), op.toString());
                    current_function.renaming_add(tmpreg);
                    current_basicblock.instruction_add(new CmpInstruction(current_basicblock, tmpreg, (Enum_Compare_IRInstruction) op, it.lhs.ir_operand, it.rhs.ir_operand));
                    it.ir_operand = tmpreg;
                }
                default -> throw new IllegalStateException("Unexpected value: " + it.op);
            }
        } else {
            it.lhs.accept(this);
            switch (it.op) {
                //inspired by happypig
                case AND -> {
                    //when debug this you must modify it in the below too not a good design
                    //cope with Short circuit
                    IRbasicblock short_circuit_and_end = create_block("short_circuit_and_end_" + it.op);
                    IRbasicblock short_circuit_and_branch = create_block("short_circuit_and_branch_" + it.op);
                    //relation
                    current_basicblock.nxt_basic_block.add(short_circuit_and_end);
                    current_basicblock.nxt_basic_block.add(short_circuit_and_branch);
                    short_circuit_and_end.pre_basicblock.add(current_basicblock);
                    short_circuit_and_end.pre_basicblock.add(short_circuit_and_branch);
                    short_circuit_and_branch.nxt_basic_block.add(short_circuit_and_end);
                    short_circuit_and_branch.pre_basicblock.add(current_basicblock);
                    //pointer
                    Register result_reg = new Register(new PointerType(new IntegerType(IntegerSubType.i1)), it.op.toString() + "_addr");
                    //alloca and store
                    current_basicblock.instruction_add(new AllocateInstruction(current_basicblock, new IntegerType(IntegerSubType.i1), result_reg));
                    current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.lhs.ir_operand, result_reg));
                    current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.lhs.ir_operand, short_circuit_and_branch, short_circuit_and_end));
                    //cope with the branch
                    current_basicblock = short_circuit_and_branch;
                    it.rhs.accept(this);
                    current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.rhs.ir_operand, result_reg));
                    current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, short_circuit_and_end, null));
                    //cope with the end
                    current_basicblock = short_circuit_and_end;
                    Register load_node_iroperand = new Register(new IntegerType(IntegerSubType.i1), it.op.toString() + "_short_circuit");
                    current_basicblock.instruction_add(new LoadInstruction(current_basicblock, load_node_iroperand, result_reg));
                    //assign
                    it.ir_operand = load_node_iroperand;
                }
                case OR -> {
                    //just modify the circuit order you can diff it with the above to find the small difference
                    //cope with Short circuit
                    IRbasicblock short_circuit_and_end = create_block("short_circuit_and_end_" + it.op);
                    IRbasicblock short_circuit_and_branch = create_block("short_circuit_and_branch_" + it.op);
                    //relation
                    current_basicblock.nxt_basic_block.add(short_circuit_and_end);
                    current_basicblock.nxt_basic_block.add(short_circuit_and_branch);
                    short_circuit_and_end.pre_basicblock.add(current_basicblock);
                    short_circuit_and_end.pre_basicblock.add(short_circuit_and_branch);
                    short_circuit_and_branch.nxt_basic_block.add(short_circuit_and_end);
                    short_circuit_and_branch.pre_basicblock.add(current_basicblock);
                    Register result_reg = new Register(new PointerType(new IntegerType(IntegerSubType.i1)), it.op.toString() + "_addr");
                    //alloca and store
                    current_basicblock.instruction_add(new AllocateInstruction(current_basicblock, new IntegerType(IntegerSubType.i1), result_reg));
                    current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.lhs.ir_operand, result_reg));
                    current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.lhs.ir_operand, short_circuit_and_end, short_circuit_and_branch));
                    //cope with the branch
                    current_basicblock = short_circuit_and_branch;
                    it.rhs.accept(this);
                    current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.rhs.ir_operand, result_reg));
                    current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, short_circuit_and_end, null));
                    //cope with the end
                    current_basicblock = short_circuit_and_end;
                    Register load_node_iroperand = new Register(new IntegerType(IntegerSubType.i1), it.op.toString() + "_short_circuit");
                    current_basicblock.instruction_add(new LoadInstruction(current_basicblock, load_node_iroperand, result_reg));
                    //assign
                    it.ir_operand = load_node_iroperand;
                }
            }

        }


    }

    @Override
    public void visit(Constint_ASTnode it) {
        it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), it.val1);
    }

    @Override
    public void visit(Constbool_ASTnode it) {
        it.ir_operand = new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), it.index);
    }


    //SELFPLUS,SELFSUB,SUB,ADD,NOT,//!
    //TILDE,//~
    @Override
    public void visit(Front_UnaryExp_ASTnode it) {
        it.expr.accept(this);
        switch (it.op) {
            case SELFPLUS, SELFSUB -> {
                Object op = type_trans.enum_trans(it.op);
                //create reg
                Register tmpreg = new Register(new IntegerType(IntegerSubType.i32), op.toString());
                current_function.renaming_add(tmpreg);
                //add instru
                current_basicblock.instruction_add(new BinaryInstruction(current_basicblock, tmpreg, it.expr.ir_operand, new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 1), (Enum_Binary_IRInstruction) op));
                current_basicblock.instruction_add(new StoreInstruction(current_basicblock, tmpreg, current_ir_scope.find_id_to_reg(it.expr.index)));
                it.ir_operand = tmpreg;
            }
            case SUB -> {
                Register tmpreg = new Register(new IntegerType(IntegerSubType.i32), it.op.toString() + "_single_front");
                current_function.renaming_add(tmpreg);
                current_basicblock.instruction_add(new BinaryInstruction(current_basicblock, tmpreg, it.expr.ir_operand, new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), -1), Enum_Binary_IRInstruction.mul));
                it.ir_operand = tmpreg;
            }
            case ADD -> {
                it.ir_operand = it.expr.ir_operand;
            }
            //%6 = xor i1 %5, true clang
            case NOT -> {
                Register tmpreg = new Register(new IntegerType(IntegerSubType.i1), it.op.toString());
                current_function.renaming_add(tmpreg);
                current_basicblock.instruction_add(new BinaryInstruction(current_basicblock, tmpreg, it.expr.ir_operand, new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), true), Enum_Binary_IRInstruction.xor));
                it.ir_operand = tmpreg;
            }
            //%7 = xor i32 %6, -1 clang
            case TILDE -> {
                Register tmpreg = new Register(new IntegerType(IntegerSubType.i32), it.op.toString());
                current_function.renaming_add(tmpreg);
                current_basicblock.instruction_add(new BinaryInstruction(current_basicblock, tmpreg, it.expr.ir_operand, new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), -1), Enum_Binary_IRInstruction.xor));
                it.ir_operand = tmpreg;
            }
        }


    }

    /// the stringmap in module stand for it.val----->Globalvar(reg :const_string_## operand:it.val type:pointtype)
    @Override
    public void visit(Conststring_ASTnode it) {
        Global_variable global_string = module_in_irbuilder.add_global_string(it.index);
        Register tmp_const_str = new Register(new PointerType(new IntegerType(IntegerSubType.i8)), "const_string_pointer");
        current_function.renaming_add(tmp_const_str);
        ArrayList<BaseOperand> tmp_get_element_ptr_list = new ArrayList<>();
        tmp_get_element_ptr_list.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 0));
        tmp_get_element_ptr_list.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 0));
        current_basicblock.instruction_add(new GetElementPtrInstruction(current_basicblock, tmp_const_str, global_string, tmp_get_element_ptr_list));
        it.ir_operand = tmp_const_str;
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
            if (it.paralist != null) {
                for (int i = 0; i < it.paralist.size(); i++) {
                    it.paralist.get(i).accept(this);
                    para_list_.add(it.paralist.get(i).ir_operand);
                }
            }
            Register callreg;
            if (!(function.returntype instanceof Voidtype_ASTnode)) {
                callreg = new Register(irfunction.function_type.returntype, "call_" + function.functionname);
                current_function.renaming_add(callreg);
            } else callreg = null;
            current_basicblock.instruction_add(new CallInstruction(current_basicblock, callreg, para_list_, irfunction));

            it.ir_operand = callreg;
        } else if (it.funcname instanceof MemberExp_ASTnode) {

//todo
        }
    }

    @Override
    public void visit(IdExp_ASTnode it) {
        //naive type but it work now don't find bug
        BaseOperand id_reg = current_ir_scope.find_id_to_reg(it.index);
        Register load_reg = new Register(type_trans.asttype_to_irtype(it.type), it.index);
        current_function.renaming_add(load_reg);
        current_basicblock.instruction_add(new LoadInstruction(current_basicblock, load_reg, id_reg));
        it.ir_operand = load_reg;
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
        current_ir_scope = new IR_scope(current_ir_scope);
        for (int i = 0; i < it.statlist.size(); i++) {
            it.statlist.get(i).accept(this);
        }
        current_ir_scope = current_ir_scope.parent_scope;
    }

    @Override
    public void visit(Singlevaluedecl_ASTnode it) {
        //global variable is almost the same as the below just change the global variable into register
        if (current_ir_scope.parent_scope == null) {
            if (it.expression != null) it.expression.accept(this);
            Global_variable tmp_globalvar = new Global_variable(new PointerType(type_trans.asttype_to_irtype(it.type)), it.name);
            module_in_irbuilder.Global_variable_map.put(it.name, tmp_globalvar);
            current_function.renaming_add(tmp_globalvar);
            current_ir_scope.id_map.put(it.name, tmp_globalvar);
            if (it.expression != null)
                current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.expression.ir_operand, tmp_globalvar));
            module_in_irbuilder.Global_variable_map.put(it.name, tmp_globalvar);
        }
        //local variable
        else { //naive just for int when the complex type it needs to bo modified
            if (it.expression != null) it.expression.accept(this);
            //allocate the ram and create the reg
            Register single_allocate = new Register(new PointerType(type_trans.asttype_to_irtype(it.type)), it.name + "_addr");
            current_function.renaming_add(single_allocate);
            //add scope map : string---->addr reg
            current_ir_scope.id_map.put(it.name, single_allocate);
            //add two instructions
            if (!current_basicblock.check_taiL_br())
                current_function.entry_block.link_in_basicblock.addFirst(new AllocateInstruction(current_basicblock, type_trans.asttype_to_irtype(it.type), single_allocate));
            if (it.expression != null) {
                current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.expression.ir_operand, single_allocate));
            }
        }
    }

    @Override
    public void visit(Fundecl_ASTnode it) {
        current_ir_scope = new IR_scope(current_ir_scope);
        IRfunction Function = module_in_irbuilder.Module_Function_Map.get(it.functionname);
        current_function = Function;
        current_basicblock = Function.entry_block;
        //first collect the xx_para and put it into the scope map the visit the paranode and allocate for space and sote the para value into it
        if (it.paralist_infuction != null) {
            for (int i = 0; i < it.paralist_infuction.paralist.size(); i++) {
                Singlevaluedecl_ASTnode tmp = it.paralist_infuction.paralist.get(i);
                current_ir_scope.id_map.put(tmp.name + "_para", new Register(type_trans.asttype_to_irtype(tmp.type), tmp.name + "_para"));
                it.paralist_infuction.paralist.get(i).accept(this);
                current_basicblock.instruction_add(new StoreInstruction(current_basicblock, current_ir_scope.id_map.get(tmp.name + "_para"), current_ir_scope.id_map.get(tmp.name)));
            }
        }
        for (int i = 0; i < it.suite.statlist.size(); i++) {
            it.suite.statlist.get(i).accept(this);
        }

        //add for the special condition such as void function without return
        if (!current_basicblock.check_taiL_br())
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, Function.return_block, null));

        Function.block_list.add(Function.return_block);
        if (it.functionname.equals("main")) {
            current_function.entry_block.link_in_basicblock.addFirst(new CallInstruction(current_basicblock, null, null, module_in_irbuilder.Module_Function_Map.get("GLOBAL__sub_I_main.mx")));
        }
        current_ir_scope = current_ir_scope.parent_scope;
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
        //declare basic block
        IRbasicblock while_condition = create_block("while_condition");
        IRbasicblock while_body = create_block("while_body");
        IRbasicblock while_end_merge = create_block("while_end_merge");
        //add relation
        current_basicblock.nxt_basic_block.add(while_condition);

        while_condition.nxt_basic_block.add(while_body);
        while_condition.nxt_basic_block.add(while_end_merge);
        while_condition.pre_basicblock.add(current_basicblock);
        while_condition.pre_basicblock.add(while_body);

        while_body.nxt_basic_block.add(while_condition);
        while_body.pre_basicblock.add(while_condition);

        while_end_merge.pre_basicblock.add(current_basicblock);

        //maintain the continue break stack
        continue_basicblock_stack.push(while_condition);
        break_basicblock_stack.push(while_end_merge);

        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, while_condition, null));
        current_basicblock = while_condition;
        it.condition.accept(this);
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.condition.ir_operand, while_body, while_end_merge));
        current_basicblock = while_body;
        it.while_stats.accept(this);

        continue_basicblock_stack.pop();
        break_basicblock_stack.pop();

        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, while_condition, null));
        current_basicblock = while_end_merge;
    }

    @Override
    public void visit(Valdeclstat_ASTnode it) {
        for (int i = 0; i < it.vardecllist.size(); i++) {
            it.vardecllist.get(i).accept(this);
        }

    }

    @Override
    public void visit(Returnstat_ASTnode it) {
        if (!it.isvoid) {
            it.renturnexpr.accept(this);
            current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.renturnexpr.ir_operand, current_function.return_reg));
        }
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, current_function.return_block, null));
    }

    @Override
    public void visit(Ifstat_ASTnode it) {
        it.condition.accept(this);
        current_ir_scope = new IR_scope(current_ir_scope);
        ///when there exist elsestate
        if (it.elsestat != null) {
            //declare for basicblock
            IRbasicblock then_basicblock = create_block("then_basicblock");
            IRbasicblock else_basicblock = create_block("else_basicblock");
            IRbasicblock if_end_basicblock = create_block("if_end_basicblock");

            // add for basicblock relationship
            current_basicblock.nxt_basic_block.add(then_basicblock);
            then_basicblock.pre_basicblock.add(current_basicblock);
            then_basicblock.nxt_basic_block.add(if_end_basicblock);
            if_end_basicblock.pre_basicblock.add(then_basicblock);

            current_basicblock.nxt_basic_block.add(else_basicblock);
            else_basicblock.pre_basicblock.add(current_basicblock);
            else_basicblock.nxt_basic_block.add(if_end_basicblock);
            if_end_basicblock.pre_basicblock.add(else_basicblock);

            //add current br instruction
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.condition.ir_operand, then_basicblock, else_basicblock));

            //add the br instruction for thenblock and elseblock
            current_basicblock = then_basicblock;
            it.thenstat.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, if_end_basicblock, null));

            current_basicblock = else_basicblock;
            it.elsestat.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, if_end_basicblock, null));

            current_basicblock = if_end_basicblock;
        }
        //without else stat
        else {
            //declare for basicblock
            IRbasicblock then_basicblock = create_block("single_then_basicblock");
            IRbasicblock if_end_basicblock = create_block("if_withoutelse_end_basicblock");

            // add for basicblock relationship
            current_basicblock.nxt_basic_block.add(then_basicblock);
            current_basicblock.nxt_basic_block.add(if_end_basicblock);
            then_basicblock.pre_basicblock.add(current_basicblock);
            then_basicblock.nxt_basic_block.add(if_end_basicblock);
            if_end_basicblock.pre_basicblock.add(then_basicblock);
            if_end_basicblock.pre_basicblock.add(current_basicblock);

            //add current br instruction
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.condition.ir_operand, then_basicblock, if_end_basicblock));

            //add the br instruction for thenblock and elseblock
            current_basicblock = then_basicblock;
            it.thenstat.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, if_end_basicblock, null));

            current_basicblock = if_end_basicblock;


        }
        current_ir_scope = current_ir_scope.parent_scope;


    }

    @Override
    public void visit(Forstat_ASTnode it) {
        //naive for with the most simple condition diff by if have condition  because whether have condition cuase the structure a lot
        current_ir_scope = new IR_scope(current_ir_scope);
        if (it.initexpr != null) it.initexpr.accept(this);
        //declare basic block
        IRbasicblock condition_for = create_block("for_condition");
        IRbasicblock for_step = create_block("for_step");
        IRbasicblock for_body = create_block("for_body");
        IRbasicblock for_end_merge = create_block("for_end_merge");
        //relation
        current_basicblock.nxt_basic_block.add(condition_for);
        condition_for.nxt_basic_block.add(for_end_merge);
        condition_for.nxt_basic_block.add(for_body);
        condition_for.pre_basicblock.add(current_basicblock);
        for_end_merge.pre_basicblock.add(condition_for);
        for_body.nxt_basic_block.add(for_step);
        for_body.pre_basicblock.add(condition_for);
        for_step.nxt_basic_block.add(condition_for);
        for_step.pre_basicblock.add(for_body);

        break_basicblock_stack.push(for_end_merge);
        continue_basicblock_stack.push(for_step);

        //add instruction
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, condition_for, null));

        current_basicblock = condition_for;
        it.condition.accept(this);
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.condition.ir_operand, for_body, for_end_merge));

        current_basicblock = for_body;
        it.suite_in_for.accept(this);
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, for_step, null));

        continue_basicblock_stack.pop();
        break_basicblock_stack.pop();

        current_basicblock = for_step;
        it.incr.accept(this);
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, condition_for, null));

        current_basicblock = for_end_merge;
        current_ir_scope = current_ir_scope.parent_scope;
    }

    @Override
    public void visit(Exprstat_ASTnode it) {
        it.expr.accept(this);
    }

    @Override
    public void visit(Continuestat_ASTnode it) {
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, continue_basicblock_stack.peek(), null));
    }

    @Override
    public void visit(Breakstat_ASTnode it) {
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, break_basicblock_stack.peek(), null));
    }

    @Override
    public void visit(Constructdecl_ASTnode it) {

    }

    @Override
    public void visit(ArrayExp_ASTnode it) {

    }

    @Override
    public void visit(Post_UnaryExp_ASTnode it) {
        it.expr.accept(this);
        switch (it.op) {
            case SELFPLUS, SELFSUB -> {
                it.ir_operand = it.expr.ir_operand;
                Object op = type_trans.enum_trans(it.op);
                //create reg
                Register tmpreg = new Register(new IntegerType(IntegerSubType.i32), op.toString());
                current_function.renaming_add(tmpreg);
                //add instru
                current_basicblock.instruction_add(new BinaryInstruction(current_basicblock, tmpreg, it.expr.ir_operand, new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 1), (Enum_Binary_IRInstruction) op));
                current_basicblock.instruction_add(new StoreInstruction(current_basicblock, tmpreg, current_ir_scope.find_id_to_reg(it.expr.index)));
            }
            default -> {
                throw new IRbuilderError("what are you doing", null);
            }
        }

    }


    //util function
    private void set_binary_op(Binary_Enum op_, BinaryExp_ASTnode it) {
        Object op = type_trans.enum_trans(op_);
        //create reg
        Register tmpreg = new Register(new IntegerType(IntegerSubType.i32), op.toString());
        current_function.renaming_add(tmpreg);
        //add instru
        current_basicblock.instruction_add(new BinaryInstruction(current_basicblock, tmpreg, it.lhs.ir_operand, it.rhs.ir_operand, (Enum_Binary_IRInstruction) op));
        it.ir_operand = tmpreg;
    }

    private IRbasicblock create_block(String blockname) {
        IRbasicblock return_block = new IRbasicblock(blockname, current_function);
        current_function.renaming_add(return_block);
        current_function.block_list.add(return_block);
        return return_block;
    }

    private void add_str_built_in_cmp(String cmp_name) {
        ArrayList<Parament> builtin_para_ = new ArrayList<>();
        builtin_para_.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "lhs"));
        builtin_para_.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "rhs"));
        FunctionType builtin_functiontype_ = new FunctionType(new IntegerType(IntegerSubType.i1), builtin_para_);
        IRfunction builtinfunction_ = new IRfunction(builtin_functiontype_, cmp_name, true);
        module_in_irbuilder.Module_Function_Map.put(cmp_name, builtinfunction_);
        module_in_irbuilder.External_Function_Map.put(cmp_name, builtinfunction_);
    }

    private String string_cmp_return(Binary_Enum op) {
        switch (op) {
            case GREATER -> {
                return "_str_gt";
            }
            case GREATEREQUAL -> {
                return "_str_ge";
            }
            case LESSER -> {
                return "_str_lt";
            }
            case LESSEREQUAL -> {
                return "_str_le";
            }
            case EQUALEQUAL -> {
                return "_str_eq";
            }
            case NOT_EQUAL -> {
                return "_str_ne";
            }
            default -> {
                throw new IRbuilderError("don't exist the op", null);
            }
        }
    }
}
