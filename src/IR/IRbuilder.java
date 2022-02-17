package IR;

import AST.ASTvisitor;
import AST.EXPRnode.*;
import AST.EXPRnode.CONSTEXPRnode.*;
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

import java.util.LinkedList;
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
    //for break continue
    private final Stack<IRbasicblock> break_basicblock_stack = new Stack<>();
    private final Stack<IRbasicblock> continue_basicblock_stack = new Stack<>();
    //record pointer to class
    private Classdecl_ASTnode current_class_detail = null;

    private boolean if_need_init_function = false;


    public IRbuilder(globalscope semantic_globalscope_) {

        module_in_irbuilder = new IRmodule();
        semantic_globalscope = semantic_globalscope_;
        current_ir_scope = new IR_scope(null);
        type_trans = new AST_to_IR_trans(module_in_irbuilder);


        //add build_in
        IRfunction builtinfunction;
        LinkedList<Parament> builtin_para;
        FunctionType builtin_functiontype;

        //void print(string str);
        builtin_para = new LinkedList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "str_0"));
        builtin_functiontype = new FunctionType(new VoidType(), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "print", true);
        module_in_irbuilder.Module_Function_Map.put("print", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("print", builtinfunction);

        //void println(string str);
        builtin_para = new LinkedList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "str_0"));
        builtin_functiontype = new FunctionType(new VoidType(), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "println", true);
        module_in_irbuilder.Module_Function_Map.put("println", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("println", builtinfunction);

        //void printInt(int n);
        builtin_para = new LinkedList<>();
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32), "n_0"));
        builtin_functiontype = new FunctionType(new VoidType(), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "printInt", true);
        module_in_irbuilder.Module_Function_Map.put("printInt", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("printInt", builtinfunction);

        //void printlnInt(int n);
        builtin_para = new LinkedList<>();
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32), "n_0"));
        builtin_functiontype = new FunctionType(new VoidType(), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "printlnInt", true);
        module_in_irbuilder.Module_Function_Map.put("printlnInt", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("printlnInt", builtinfunction);

        //string getString();
        builtin_para = new LinkedList<>();
        builtin_functiontype = new FunctionType(new PointerType(new IntegerType(IntegerSubType.i8)), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "getString", true);
        module_in_irbuilder.Module_Function_Map.put("getString", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("getString", builtinfunction);

        //int getInt();
        builtin_para = new LinkedList<>();
        builtin_functiontype = new FunctionType(new IntegerType(IntegerSubType.i32), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "getInt", true);
        module_in_irbuilder.Module_Function_Map.put("getInt", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("getInt", builtinfunction);

        //string toString(int i);
        builtin_para = new LinkedList<>();
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32), "i_0"));
        builtin_functiontype = new FunctionType(new PointerType(new IntegerType(IntegerSubType.i8)), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "toString", true);
        module_in_irbuilder.Module_Function_Map.put("toString", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("toString", builtinfunction);

        //int _str_ord(const char* str,int pos)
        builtin_para = new LinkedList<>();
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
        builtin_para = new LinkedList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "lhs"));
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "rhs"));
        builtin_functiontype = new FunctionType(new PointerType(new IntegerType(IntegerSubType.i8)), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "_str_concatenate", true);
        module_in_irbuilder.Module_Function_Map.put("_str_concatenate", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("_str_concatenate", builtinfunction);

        //char * _f_malloc(int n)
        builtin_para = new LinkedList<>();
        builtin_para.add(new Parament((new IntegerType(IntegerSubType.i32)), "n"));
        builtin_functiontype = new FunctionType(new PointerType(new IntegerType(IntegerSubType.i8)), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "_f_malloc", true);
        module_in_irbuilder.Module_Function_Map.put("_f_malloc", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("_f_malloc", builtinfunction);

        //int _str_length(const char* str)
        builtin_para = new LinkedList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "str"));
        builtin_functiontype = new FunctionType(new IntegerType(IntegerSubType.i32), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "_str_length", true);
        module_in_irbuilder.Module_Function_Map.put("_str_length", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("_str_length", builtinfunction);

        //const char* _str_substring(const char* str,int left,int right)
        builtin_para = new LinkedList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "str"));
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32), "left"));
        builtin_para.add(new Parament(new IntegerType(IntegerSubType.i32), "right"));
        builtin_functiontype = new FunctionType(new PointerType(new IntegerType(IntegerSubType.i8)), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "_str_substring", true);
        module_in_irbuilder.Module_Function_Map.put("_str_substring", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("_str_substring", builtinfunction);

        //int _str_parseInt(const char* str)
        builtin_para = new LinkedList<>();
        builtin_para.add(new Parament(new PointerType(new IntegerType(IntegerSubType.i8)), "str"));
        builtin_functiontype = new FunctionType((new IntegerType(IntegerSubType.i32)), builtin_para);
        builtinfunction = new IRfunction(builtin_functiontype, "_str_parseInt", true);
        module_in_irbuilder.Module_Function_Map.put("_str_parseInt", builtinfunction);
        module_in_irbuilder.External_Function_Map.put("_str_parseInt", builtinfunction);
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
        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Classdecl_ASTnode) {
                LinkedList<Typesystem> para = new LinkedList<>();
                StructType tmp = new StructType(("class." + ((Classdecl_ASTnode) it.list.get(i)).classname), para);
                module_in_irbuilder.Module_Struct_Map.put(((Classdecl_ASTnode) it.list.get(i)).classname, tmp);
            }
        }
        IRfunction collect_function;
        LinkedList<Parament> collect_function_para;
        FunctionType collect_function_type;
        ///collect the class inner function
        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Classdecl_ASTnode) {
                Classdecl_ASTnode nowclass = (Classdecl_ASTnode) it.list.get(i);
                StructType classtype = module_in_irbuilder.Module_Struct_Map.get(nowclass.classname);
                LinkedList<Typesystem> para = classtype.parament_list;
                int typenumcnt = 0;
                for (int j = 0; j < nowclass.valdecllist.size(); j++) {
                    for (int k = 0; k < nowclass.valdecllist.get(j).vardecllist.size(); k++) {
                        Valdeclstat_ASTnode tmp = nowclass.valdecllist.get(j);
                        para.add(type_trans.asttype_to_irtype(tmp.vardecllist.get(k).type));
                        //cnt the prefix sum
                        if (typenumcnt == 0) {
                            classtype.prefix_sum_bytenum.add(0);
                            typenumcnt++;
                        } else {
                            classtype.prefix_sum_bytenum.add(classtype.prefix_sum_bytenum.get((typenumcnt) - 1) + para.get(typenumcnt).byte_num());
                            typenumcnt++;
                        }
                    }
                }
                nowclass.prefix_sum_bytenum_in_ast = classtype.prefix_sum_bytenum;
                for (int j = 0; j < nowclass.constructerlist.size(); j++) {
                    Constructdecl_ASTnode constru = nowclass.constructerlist.get(j);
                    //add function paraments
                    collect_function_para = new LinkedList<>();
                    Parament this_class = new Parament(new PointerType(module_in_irbuilder.Module_Struct_Map.get(nowclass.classname)), "this");
                    collect_function_para.add(this_class);
                    collect_function_type = new FunctionType(new VoidType(), collect_function_para);
                    collect_function = new IRfunction(collect_function_type, nowclass.classname + "." + constru.classname, false);
                    module_in_irbuilder.Module_Function_Map.put(nowclass.classname + "." + constru.classname, collect_function);
                    module_in_irbuilder.Internal_Function_Map.put(nowclass.classname + "." + constru.classname, collect_function);
                }

                for (int j = 0; j < nowclass.functionlist.size(); j++) {
                    Fundecl_ASTnode functiondecl = nowclass.functionlist.get(j);
                    //add function paraments
                    collect_function_para = new LinkedList<>();
                    Parament this_class = new Parament(new PointerType(module_in_irbuilder.Module_Struct_Map.get(nowclass.classname)), "this");
                    collect_function_para.add(this_class);
                    if (functiondecl.paralist_infuction != null) {
                        for (int k = 0; k < functiondecl.paralist_infuction.paralist.size(); k++) {
                            collect_function_para.add(new Parament(type_trans.asttype_to_irtype(functiondecl.paralist_infuction.paralist.get(k).type), functiondecl.paralist_infuction.paralist.get(k).name + "_para"));
                        }
                    }
                    //add type
                    collect_function_type = new FunctionType(type_trans.asttype_to_irtype(functiondecl.returntype), collect_function_para);
                    // build function
                    collect_function = new IRfunction(collect_function_type, nowclass.classname + "." + functiondecl.functionname, false);
                    module_in_irbuilder.Module_Function_Map.put(nowclass.classname + "." + functiondecl.functionname, collect_function);
                    module_in_irbuilder.Internal_Function_Map.put(nowclass.classname + "." + functiondecl.functionname, collect_function);
                }
            }
        }

        ///collect the function name information

        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Fundecl_ASTnode) {
                //get the ast functiondecl
                Fundecl_ASTnode functiondecl = (Fundecl_ASTnode) it.list.get(i);
                //build the type translator
                AST_to_IR_trans type_translator = new AST_to_IR_trans(module_in_irbuilder);
                //add function paramentlist
                collect_function_para = new LinkedList<>();
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


        for (int i = 0; i < it.list.size(); i++) {
            if (it.list.get(i) instanceof Valdeclstat_ASTnode) {
                if_need_init_function = true;
                break;
            }
        }

        if (if_need_init_function) {///add init function
            LinkedList<Parament> tmp = new LinkedList<>();
            FunctionType global_init = new FunctionType(new VoidType(), tmp);
            IRfunction GLOBAL__sub_I_main_mx = new IRfunction(global_init, "GLOBAL__sub_I_main_mx", false);
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
        }

        current_function = null;
        current_basicblock = null;


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

            //todo string binary
            //todo array assign
            if (it.lhs.type.typename.equals("string") && it.rhs.type.typename.equals("string")) {
                it.lhs.accept(this);
                it.rhs.accept(this);
                switch (it.op) {
                    case EQUAL -> {
                        //lhs just can be id
                        current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.rhs.ir_operand, lvalue_judge(it.lhs)));
                        //it may not use :just for   --->foo(a=b+1) this seem weird
                        it.ir_operand = it.rhs.ir_operand;
                    }
                    case ADD -> {
                        LinkedList<BaseOperand> para_list_;
                        para_list_ = new LinkedList<>();
                        para_list_.add(it.lhs.ir_operand);
                        para_list_.add(it.rhs.ir_operand);
                        IRfunction tmpcunction = module_in_irbuilder.Module_Function_Map.get("_str_concatenate");
                        Register stringadd = new Register(new PointerType(new IntegerType(IntegerSubType.i8)), "string_add");
                        current_function.renaming_add(stringadd);
                        current_basicblock.instruction_add(new CallInstruction(current_basicblock, stringadd, para_list_, tmpcunction));
                        it.ir_operand = stringadd;
                    }
                    case EQUALEQUAL, NOT_EQUAL, GREATEREQUAL, LESSER, LESSEREQUAL, GREATER -> {
                        LinkedList<BaseOperand> para_list_;
                        para_list_ = new LinkedList<>();
                        
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

            if (it.lhs.ir_operand instanceof ConstOperand_Integer && it.rhs.ir_operand instanceof ConstOperand_Integer && (!it.op.equals(Binary_Enum.EQUAL))) {
                // cope with int&&bool
                Binary_Enum op = it.op;
                if (op == Binary_Enum.ADD)
                    it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), ((ConstOperand_Integer) it.lhs.ir_operand).value + ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.SUB)
                    it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), ((ConstOperand_Integer) it.lhs.ir_operand).value - ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.MUL)
                    it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), ((ConstOperand_Integer) it.lhs.ir_operand).value * ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.DIV)
                    it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), ((ConstOperand_Integer) it.lhs.ir_operand).value / ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.MOD)
                    it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), ((ConstOperand_Integer) it.lhs.ir_operand).value % ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.Bitwise_xor)
                    it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), ((ConstOperand_Integer) it.lhs.ir_operand).value ^ ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.Bitwise_or)
                    it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), ((ConstOperand_Integer) it.lhs.ir_operand).value | ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.Bitwise_and)
                    it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), ((ConstOperand_Integer) it.lhs.ir_operand).value & ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.RIGHT_SHIFT)
                    it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), ((ConstOperand_Integer) it.lhs.ir_operand).value >> ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.LEFT_SHIFT)
                    it.ir_operand = new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), ((ConstOperand_Integer) it.lhs.ir_operand).value << ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.EQUALEQUAL)
                    it.ir_operand = new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), ((ConstOperand_Integer) it.lhs.ir_operand).value == ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.NOT_EQUAL)
                    it.ir_operand = new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), ((ConstOperand_Integer) it.lhs.ir_operand).value != ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.GREATEREQUAL)
                    it.ir_operand = new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), ((ConstOperand_Integer) it.lhs.ir_operand).value >= ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.GREATER)
                    it.ir_operand = new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), ((ConstOperand_Integer) it.lhs.ir_operand).value > ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.LESSEREQUAL)
                    it.ir_operand = new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), ((ConstOperand_Integer) it.lhs.ir_operand).value <= ((ConstOperand_Integer) it.rhs.ir_operand).value);
                else if (op == Binary_Enum.LESSER)
                    it.ir_operand = new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), ((ConstOperand_Integer) it.lhs.ir_operand).value < ((ConstOperand_Integer) it.rhs.ir_operand).value);
                return;
            }

            // cope with int&&bool
            switch (it.op) {
                case EQUAL -> {
                    if ((!(it.lhs instanceof IdExp_ASTnode)) || current_ir_scope.find_id_to_reg(it.lhs.index) == null)
                        it.lhs.accept(this);
                    //it.lhs.accept(this);
                    it.rhs.accept(this);
                    current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.rhs.ir_operand, lvalue_judge(it.lhs)));
                    it.ir_operand = it.rhs.ir_operand;
                }
                case ADD, SUB, MOD, DIV, MUL, LEFT_SHIFT, RIGHT_SHIFT, Bitwise_and, Bitwise_xor, Bitwise_or -> {
                    it.lhs.accept(this);
                    it.rhs.accept(this);
                    set_binary_op(it.op, it);
                }
                case EQUALEQUAL, NOT_EQUAL, GREATEREQUAL, LESSER, LESSEREQUAL, GREATER -> {
                    it.lhs.accept(this);
                    it.rhs.accept(this);
                    Object op = type_trans.enum_trans(it.op);
                    Register tmpreg = new Register(new IntegerType(IntegerSubType.i1), op.toString());
                    current_function.renaming_add(tmpreg);
                    current_basicblock.instruction_add(new CmpInstruction(current_basicblock, tmpreg, (Enum_Compare_IRInstruction) op, it.lhs.ir_operand, it.rhs.ir_operand));
                    it.ir_operand = tmpreg;
                }
                default -> throw new IllegalStateException("Unexpected value: " + it.op);
            }
        } else {
            if (it.lhs.ir_operand instanceof ConstOperand_Bool && it.rhs.ir_operand instanceof ConstOperand_Bool) {
                switch (it.op) {
                    case OR -> it.ir_operand = new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), ((ConstOperand_Bool) it.lhs.ir_operand).bool_value || ((ConstOperand_Bool) it.rhs.ir_operand).bool_value);
                    case AND -> it.ir_operand = new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), ((ConstOperand_Bool) it.lhs.ir_operand).bool_value && ((ConstOperand_Bool) it.rhs.ir_operand).bool_value);
                }
                return;
            }


            it.lhs.accept(this);
            shortpath(it, it.op);
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
                current_basicblock.instruction_add(new StoreInstruction(current_basicblock, tmpreg, lvalue_judge(it.expr)));
                it.actual_addr = lvalue_judge(it.expr);
                it.ir_operand = tmpreg;
            }
            case SUB -> {
                Register tmpreg = new Register(new IntegerType(IntegerSubType.i32), it.op.toString() + "_single_front");
                current_function.renaming_add(tmpreg);
                current_basicblock.instruction_add(new BinaryInstruction(current_basicblock, tmpreg, it.expr.ir_operand, new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), -1), Enum_Binary_IRInstruction.mul));
                it.ir_operand = tmpreg;
            }
            case ADD -> it.ir_operand = it.expr.ir_operand;
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
        LinkedList<BaseOperand> tmp_get_element_ptr_list = new LinkedList<>();
        tmp_get_element_ptr_list.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 0));
        tmp_get_element_ptr_list.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 0));
        current_basicblock.instruction_add(new GetElementPtrInstruction(current_basicblock, tmp_const_str, global_string, tmp_get_element_ptr_list));
        it.ir_operand = tmp_const_str;
    }

    @Override
    public void visit(Constnull_ASTnode it) {
        it.ir_operand = new ConstOperand_Null(new VoidType());
    }

    //public CallInstruction(IRbasicblock iRbasicblock, Register call_result_, LinkedList<BaseOperand> paralist_, IRfunction call_fuction_)
    @Override
    public void visit(FunctioncallExp_ASTnode it) {
        LinkedList<BaseOperand> para_list_ = new LinkedList<>();

        //cope with such as getdim():only function name and parament
        if (it.funcname instanceof IdExp_ASTnode) {


            if (it.funcname.index.equals("print") || it.funcname.index.equals("println")) {
                opt_print(it.paralist.get(0), it.funcname.index.equals("print"));
                it.ir_operand = null;
                return;
            }


            ///get function detail and irfunction
            Fundecl_ASTnode function = null;
            IRfunction irfunction = null;
            //first to find the function in class
            if (current_class_detail != null) {
                function = current_class_detail.classscope.funcmap.get(it.funcname.index);
                irfunction = module_in_irbuilder.Module_Function_Map.get(current_class_detail.classname + "." + it.funcname.index);
                //if have the function in the class then load this and put it in the parament
                if (!(function == null && irfunction == null)) {
                    Register Implicit_call_inclass = new Register(new PointerType(module_in_irbuilder.Module_Struct_Map.get(current_class_detail.classname)), "Implicit_call_inclass");
                    current_function.renaming_add(Implicit_call_inclass);
                    current_basicblock.instruction_add(new LoadInstruction(current_basicblock, Implicit_call_inclass, current_ir_scope.find_id_to_reg("this_addr")));
                    para_list_.add(Implicit_call_inclass);
                }
            }
            //if not find  find it in global
            if (function == null && irfunction == null) {
                function = semantic_globalscope.getfundecl(it.funcname.index, null);
                irfunction = module_in_irbuilder.Module_Function_Map.get(it.funcname.index);
            }
            //visit parament
            if (it.paralist != null) {
                for (int i = 0; i < it.paralist.size(); i++) {
                    it.paralist.get(i).accept(this);
                    para_list_.add(it.paralist.get(i).ir_operand);
                }
            }


            //add call instruction
            Register callreg;
            if (!(function.returntype instanceof Voidtype_ASTnode)) {
                callreg = new Register(irfunction.function_type.returntype, "call_" + function.functionname);
                current_function.renaming_add(callreg);
            } else callreg = null;
            current_basicblock.instruction_add(new CallInstruction(current_basicblock, callreg, para_list_, irfunction));

            it.ir_operand = callreg;
        } else if (it.funcname instanceof MemberExp_ASTnode) {
            //a.test()
            ((MemberExp_ASTnode) it.funcname).classcall.accept(this);

            //first we cope with two special function call
            if (((MemberExp_ASTnode) it.funcname).classcall.type instanceof Arraytype_ASTnode && ((MemberExp_ASTnode) it.funcname).member.equals("size")) {
                array_size(it);
                return;
            }

            //get irfunction
            String class_name = ((MemberExp_ASTnode) it.funcname).classcall.type.typename;
            Classdecl_ASTnode classdecl_asTnode = semantic_globalscope.classdetailmap.get(class_name);
            Fundecl_ASTnode class_function = classdecl_asTnode.classscope.funcmap.get(((MemberExp_ASTnode) it.funcname).member);
            IRfunction irfunction = module_in_irbuilder.Module_Function_Map.get(class_name + "." + ((MemberExp_ASTnode) it.funcname).member);
            if (irfunction == null && class_name.equals("string")) {
                irfunction = module_in_irbuilder.Module_Function_Map.get("_str_" + ((MemberExp_ASTnode) it.funcname).member);
            }

            //add this as parament
            para_list_.add(((MemberExp_ASTnode) it.funcname).classcall.ir_operand);

            if (it.paralist != null) {
                for (int i = 0; i < it.paralist.size(); i++) {
                    it.paralist.get(i).accept(this);
                    para_list_.add(it.paralist.get(i).ir_operand);
                }
            }
            Register callreg;
            if (!(class_function.returntype.typename.equals("void"))) {
                callreg = new Register(irfunction.function_type.returntype, "call_" + class_name + "_" + class_function.functionname);
                current_function.renaming_add(callreg);
            } else callreg = null;
            current_basicblock.instruction_add(new CallInstruction(current_basicblock, callreg, para_list_, irfunction));
            it.ir_operand = callreg;
        }
    }


    /*
     * optimize print
     * print(A + B + C) -> print(A), print(B), print(C)
     * print(toString(A)) -> printInt(A)
     */
    void opt_print(Expr_ASTnode expr, Boolean if_print) {
        if (expr instanceof BinaryExp_ASTnode) {
            opt_print(((BinaryExp_ASTnode) expr).lhs, true);
            opt_print(((BinaryExp_ASTnode) expr).rhs, if_print);
        } else if (expr instanceof FunctioncallExp_ASTnode && ((FunctioncallExp_ASTnode) expr).funcname.index != null && ((FunctioncallExp_ASTnode) expr).funcname.index.equals("toString")) {
            ((FunctioncallExp_ASTnode) expr).paralist.get(0).accept(this);
            LinkedList<BaseOperand> para_list_ = new LinkedList<>();
            para_list_.add(((FunctioncallExp_ASTnode) expr).paralist.get(0).ir_operand);
            IRfunction irfunction = null;
            String print_ot_println = if_print ? "printInt" : "printlnInt";
            irfunction = module_in_irbuilder.Module_Function_Map.get(print_ot_println);
            current_basicblock.instruction_add(new CallInstruction(current_basicblock, null, para_list_, irfunction));
        } else {
            //normal operation and recursion
            //print (a) println(a)
            expr.accept(this);
            LinkedList<BaseOperand> para_list_ = new LinkedList<>();
            para_list_.add(expr.ir_operand);
            IRfunction irfunction = null;
            String print_ot_println = if_print ? "print" : "println";
            irfunction = module_in_irbuilder.Module_Function_Map.get(print_ot_println);
            current_basicblock.instruction_add(new CallInstruction(current_basicblock, null, para_list_, irfunction));
        }


    }

    @Override
    public void visit(IdExp_ASTnode it) {
        //naive type but it work now don't find bug
        BaseOperand id_reg = current_ir_scope.find_id_to_reg(it.index);
        //single val decl before
        if (id_reg != null) {
            Register load_reg = new Register(type_trans.asttype_to_irtype(it.type), it.index);
            current_function.renaming_add(load_reg);
            current_basicblock.instruction_add(new LoadInstruction(current_basicblock, load_reg, id_reg));
            it.ir_operand = load_reg;
        } else {
            //when meet an id in class
            //I use the scope map to find this register which is put into the map in the funcdecl node you can ctrl+F "this_addr" to find it
            Register thisreg = new Register(new PointerType(module_in_irbuilder.Module_Struct_Map.get(current_class_detail.classname)), "this_reg");
            current_function.renaming_add(thisreg);
            current_basicblock.instruction_add(new LoadInstruction(current_basicblock, thisreg, current_ir_scope.find_id_to_reg("this_addr")));
            //get offset for gep
            int cnt = 0;
            boolean flag = false;
            Typesystem member_type = null;
            for (int i = 0; i < current_class_detail.valdecllist.size(); i++) {
                for (int j = 0; j < current_class_detail.valdecllist.get(i).vardecllist.size(); j++) {
                    if (it.index.equals(current_class_detail.valdecllist.get(i).vardecllist.get(j).name)) {
                        flag = true;
                        member_type = type_trans.asttype_to_irtype(current_class_detail.valdecllist.get(i).vardecllist.get(j).type);
                        break;
                    }
                    cnt++;
                }
                if (flag) break;
            }

            LinkedList<BaseOperand> para_gep = new LinkedList<>();
            para_gep.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 0));
            para_gep.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), cnt));
            Register gep_in_id = new Register(new PointerType(member_type), current_class_detail.classname + "." + it.index + "_gep_in_id");
            current_function.renaming_add(gep_in_id);
            GetElementPtrInstruction gep = new GetElementPtrInstruction(current_basicblock, gep_in_id, thisreg, para_gep);
            gep.prefix_sum_bytenum = current_class_detail.prefix_sum_bytenum_in_ast;
            current_basicblock.instruction_add(gep);
            current_ir_scope.id_map.put(it.index, gep_in_id);

            Register load_reg = new Register(member_type, current_class_detail.classname + "." + it.index + "_load_reg");
            current_function.renaming_add(load_reg);
            current_basicblock.instruction_add(new LoadInstruction(current_basicblock, load_reg, gep_in_id));
            it.ir_operand = load_reg;


        }
    }

    @Override
    public void visit(LambdaExp_ASTnode it) {

//nothing to do
    }

    @Override
    public void visit(NewExp_ASTnode it) {
        if (it.dim > 0) {
            //array
            Typesystem node_type = type_trans.asttype_to_irtype(((Arraytype_ASTnode) it.type).arraytype);
            LinkedList<BaseOperand> new_list = new LinkedList<>();
            for (int i = 0; i < it.newlist.size(); i++) {
                it.newlist.get(i).accept(this);
                new_list.add(it.newlist.get(i).ir_operand);
            }
            for (int i = 0; i < it.type.dim; i++) {
                node_type = new PointerType(node_type);
            }
            it.ir_operand = mollca_array(0, new_list, node_type);
        } else
        //new class
        {
            //malloc
            StructType classtype = module_in_irbuilder.Module_Struct_Map.get(it.type.typename);
            Register class_malloc = new Register(new PointerType(new IntegerType(IntegerSubType.i8)), "class_malloc");
            current_function.renaming_add(class_malloc);
            LinkedList<BaseOperand> call_para = new LinkedList<>();
            call_para.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), classtype.byte_num()));
            current_basicblock.instruction_add(new CallInstruction(current_basicblock, class_malloc, call_para, module_in_irbuilder.External_Function_Map.get("_f_malloc")));

            //bit cast
            Register class_ptr = new Register(new PointerType(classtype), "class_ptr");
            current_function.renaming_add(class_ptr);
            current_basicblock.instruction_add(new BitCastInstruction(current_basicblock, class_ptr, class_malloc, new PointerType(classtype)));

            it.ir_operand = class_ptr;
            //IF have construction we then call it to initialize it
            int constructernum = semantic_globalscope.classdetailmap.get(it.type.typename).constructerlist.size();
            if (constructernum != 0) {
                //because the constructer name is the same as the class name
                IRfunction constructer = module_in_irbuilder.Module_Function_Map.get(it.type.typename + "." + it.type.typename);
                LinkedList<BaseOperand> call_paralist = new LinkedList<>();
                call_paralist.add(class_ptr);
                current_basicblock.instruction_add(new CallInstruction(current_basicblock, null, call_paralist, constructer));
            }
        }
    }

    @Override
    public void visit(MemberExp_ASTnode it) {
        it.classcall.accept(this);
        //get pos for element ptr
        String class_name = it.classcall.type.typename;
        Classdecl_ASTnode class_decl = semantic_globalscope.classdetailmap.get(class_name);
        int cnt = 0;
        boolean flag = false;
        Typesystem member_type = null;
        for (int i = 0; i < class_decl.valdecllist.size(); i++) {
            for (int j = 0; j < class_decl.valdecllist.get(i).vardecllist.size(); j++) {
                if (it.member.equals(class_decl.valdecllist.get(i).vardecllist.get(j).name)) {
                    flag = true;
                    member_type = type_trans.asttype_to_irtype(class_decl.valdecllist.get(i).vardecllist.get(j).type);
                    break;
                }
                cnt++;
            }
            if (flag) break;
        }
        Register class_mem_gep_reg = new Register(new PointerType(member_type), "class_mem_gep_reg");
        current_function.renaming_add(class_mem_gep_reg);
        //gep
        LinkedList<BaseOperand> getelementptr_para = new LinkedList<>();
        getelementptr_para.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 0));
        getelementptr_para.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), cnt));
        GetElementPtrInstruction geptmp = new GetElementPtrInstruction(current_basicblock, class_mem_gep_reg, it.classcall.ir_operand, getelementptr_para);
        geptmp.prefix_sum_bytenum = class_decl.prefix_sum_bytenum_in_ast;
        current_basicblock.instruction_add(geptmp);
        //load it
        Register load_member = new Register(member_type, "load_member");
        current_function.renaming_add(load_member);
        current_basicblock.instruction_add(new LoadInstruction(current_basicblock, load_member, class_mem_gep_reg));

        it.ir_operand = load_member;
        it.lvalue_addr = class_mem_gep_reg;


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
        else if (!current_basicblock.check_taiL_br()) { //naive just for int when the complex type it needs to bo modified
            if (it.expression != null) it.expression.accept(this);
            //allocate the ram and create the reg
            Register single_allocate = new Register(new PointerType(type_trans.asttype_to_irtype(it.type)), it.name + "_addr");
            current_function.renaming_add(single_allocate);
            //add scope map : string---->addr reg
            current_ir_scope.id_map.put(it.name, single_allocate);
            //add two instructions
            if (!current_basicblock.check_taiL_br()) {
                //current_function.entry_block.link_in_basicblock.addFirst(new StoreInstruction(current_function.entry_block, type_trans.asttype_to_irtype(it.type).defaulttype(), single_allocate));
                current_function.entry_block.link_in_basicblock.addFirst(new AllocateInstruction(current_function.entry_block, type_trans.asttype_to_irtype(it.type), single_allocate));
            }
            if (it.expression != null) {
                if (it.expression instanceof LambdaExp_ASTnode) return;//special judge for lambda not put in ir
                current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.expression.ir_operand, single_allocate));
            }
        }
    }


    @Override
    public void visit(Constructdecl_ASTnode it) {
        current_ir_scope = new IR_scope(current_ir_scope);
        IRfunction Function = module_in_irbuilder.Module_Function_Map.get(current_class_detail.classname + "." + it.classname);
        current_function = Function;
        current_basicblock = Function.entry_block;
        add_this_pointer_inclasspara(Function);
        if (it.suite != null) it.suite.accept(this);
        //add for the special condition such as void function without return
        if (!current_basicblock.check_taiL_br())
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, Function.return_block, null));
        Function.block_list.add(Function.return_block);
        current_ir_scope = current_ir_scope.parent_scope;

    }

    @Override
    public void visit(Fundecl_ASTnode it) {
        current_ir_scope = new IR_scope(current_ir_scope);

        IRfunction Function;
        if (current_class_detail != null) {
            Function = module_in_irbuilder.Module_Function_Map.get(current_class_detail.classname + "." + it.functionname);
        } else {
            Function = module_in_irbuilder.Module_Function_Map.get(it.functionname);
        }
        current_function = Function;
        current_basicblock = Function.entry_block;
        //first collect the xx_para and put it into the scope map the visit the paranode and allocate for space and sote the para value into it
        if (it.paralist_infuction != null) {
            for (int i = 0; i < it.paralist_infuction.paralist.size(); i++) {
                Singlevaluedecl_ASTnode tmp = it.paralist_infuction.paralist.get(i);
                Register tmp_para = new Register(type_trans.asttype_to_irtype(tmp.type), tmp.name + "_para");
                current_ir_scope.id_map.put(tmp.name + "_para", tmp_para);
                current_function.para_map_fic_for_codegen.put(tmp.name + "_para", tmp_para);
                //current_function.paramentlist.add(tmp_para);
                it.paralist_infuction.paralist.get(i).accept(this);
                current_basicblock.instruction_add(new StoreInstruction(current_basicblock, current_ir_scope.id_map.get(tmp.name + "_para"), current_ir_scope.id_map.get(tmp.name)));
            }
        }
        //add this (function in class need this pointer)
        if (current_class_detail != null) {
            add_this_pointer_inclasspara(Function);
        }
        //visit internal class
        if (it.suite != null) it.suite.accept(this);
        //add for the special condition such as void function without return
        if (!current_basicblock.check_taiL_br())
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, Function.return_block, null));
        Function.block_list.add(Function.return_block);
        if (it.functionname.equals("main") && if_need_init_function) {
            current_function.entry_block.link_in_basicblock.addFirst(new CallInstruction(current_function.entry_block, null, null, module_in_irbuilder.Module_Function_Map.get("GLOBAL__sub_I_main_mx")));
        }
        current_ir_scope = current_ir_scope.parent_scope;
    }

    @Override
    public void visit(Classdecl_ASTnode it) {
        current_class_detail = it;
        current_ir_scope = new IR_scope(current_ir_scope);
        for (int i = 0; i < it.constructerlist.size(); i++) {
            it.constructerlist.get(i).accept(this);
        }
        for (int i = 0; i < it.functionlist.size(); i++) {
            it.functionlist.get(i).accept(this);
        }
        current_ir_scope = current_ir_scope.parent_scope;
        current_class_detail = null;
    }

    @Override
    public void visit(Paralist_ASTnode it) {
//nothing to do
    }

    @Override
    public void visit(Thisexpr_ASTnode it) {
        Register thisexpr_reg = new Register(new PointerType(module_in_irbuilder.Module_Struct_Map.get(current_class_detail.classname)), "thisexpr_reg");
        current_function.renaming_add(thisexpr_reg);
        current_basicblock.instruction_add(new LoadInstruction(current_basicblock, thisexpr_reg, current_ir_scope.find_id_to_reg("this_addr")));
        it.ir_operand = thisexpr_reg;
    }

    @Override
    public void visit(Whilestat_ASTnode it) {
        //declare basic block
        IRbasicblock while_condition = create_block("while_condition");
        IRbasicblock while_body = create_block("while_body");
        IRbasicblock while_end_merge = create_block("while_end_merge");


        //maintain the continue break stack
        continue_basicblock_stack.push(while_condition);
        break_basicblock_stack.push(while_end_merge);

        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, while_condition, null));
        current_basicblock = while_condition;
        it.condition.accept(this);
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.condition.ir_operand, while_body, while_end_merge));
        current_basicblock = while_body;
        if (it.while_stats != null) it.while_stats.accept(this);

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


            //add current br instruction
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.condition.ir_operand, then_basicblock, if_end_basicblock));

            //add the br instruction for thenblock and elseblock
            current_basicblock = then_basicblock;
            if (it.thenstat != null) it.thenstat.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, if_end_basicblock, null));

            current_basicblock = if_end_basicblock;


        }
        current_ir_scope = current_ir_scope.parent_scope;
    }

    //may be ugly but it is tested ok
    @Override
    public void visit(Forstat_ASTnode it) {
        //naive for with the most simple condition diff by if have condition  because whether have condition cuase the structure a lot
        current_ir_scope = new IR_scope(current_ir_scope);
        if (it.initexpr != null) it.initexpr.accept(this);
        //declare basic block
        IRbasicblock condition_for = it.condition != null ? create_block("for_condition") : null;
        IRbasicblock for_step = it.incr != null ? create_block("for_step") : null;
        IRbasicblock for_body = create_block("for_body");
        IRbasicblock for_end_merge = create_block("for_end_merge");


//I simply make four decision
        if (for_step != null && condition_for != null) {
            break_basicblock_stack.push(for_end_merge);
            continue_basicblock_stack.push(for_step);

            //add instruction
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, condition_for, null));

            current_basicblock = condition_for;
            it.condition.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.condition.ir_operand, for_body, for_end_merge));

            current_basicblock = for_body;
            if (it.suite_in_for != null) it.suite_in_for.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, for_step, null));

            continue_basicblock_stack.pop();
            break_basicblock_stack.pop();

            current_basicblock = for_step;
            it.incr.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, condition_for, null));


        } else if (for_step == null && condition_for != null) {


            break_basicblock_stack.push(for_end_merge);
            continue_basicblock_stack.push(condition_for);

            //add instruction
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, condition_for, null));

            current_basicblock = condition_for;
            it.condition.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.condition.ir_operand, for_body, for_end_merge));

            current_basicblock = for_body;
            if (it.suite_in_for != null) it.suite_in_for.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, condition_for, null));

            continue_basicblock_stack.pop();
            break_basicblock_stack.pop();

        } else if (for_step != null) {

            continue_basicblock_stack.push(for_step);
            break_basicblock_stack.push(for_end_merge);

            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, for_body, null));

            current_basicblock = for_body;
            if (it.suite_in_for != null) it.suite_in_for.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, for_step, null));

            continue_basicblock_stack.pop();
            break_basicblock_stack.pop();

            current_basicblock = for_step;
            it.incr.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, for_body, null));
        } else {

            continue_basicblock_stack.push(for_body);
            break_basicblock_stack.push(for_end_merge);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, for_body, null));

            current_basicblock = for_body;
            if (it.suite_in_for != null) it.suite_in_for.accept(this);
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, for_body, null));

            continue_basicblock_stack.pop();
            break_basicblock_stack.pop();

        }
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
    public void visit(ArrayExp_ASTnode it) {
        it.arr.accept(this);
        it.index.accept(this);
        // get the ptr offset
        Register getelementptr_reg = new Register(it.arr.ir_operand.type, "getelementptr_reg");
        current_function.renaming_add(getelementptr_reg);
        LinkedList<BaseOperand> getelemrmtptr_para_offset = new LinkedList<>();
        getelemrmtptr_para_offset.add(it.index.ir_operand);
        current_basicblock.instruction_add(new GetElementPtrInstruction(current_basicblock, getelementptr_reg, it.arr.ir_operand, getelemrmtptr_para_offset));

        //load in the reg
        Register load_result = new Register(((PointerType) it.arr.ir_operand.type).get_low_dim_type(), "load_result");
        current_function.renaming_add(load_result);
        current_basicblock.instruction_add(new LoadInstruction(current_basicblock, load_result, getelementptr_reg));

        it.ir_operand = load_result;
        //for assign (in the mem)
        it.actual_addr = getelementptr_reg;


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
                current_basicblock.instruction_add(new StoreInstruction(current_basicblock, tmpreg, lvalue_judge(it.expr)));
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
        LinkedList<Parament> builtin_para_ = new LinkedList<>();
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
            default -> throw new IRbuilderError(" str cmp error", null);
        }
    }

    private Register mollca_array(int loop_dim, LinkedList<BaseOperand> new_list_, Typesystem return_type) {
        //inspired by lrh use a reg to record the current pointer and it can be optimized by using the call phi
        //naive only one dim
        Typesystem malloca_size = ((PointerType) return_type).get_low_dim_type();
        //calculate the byte size
        Register mul_bytes = new Register(new IntegerType(IntegerSubType.i32), "mul_bytes");
        current_function.renaming_add(mul_bytes);
        current_basicblock.instruction_add(new BinaryInstruction(current_basicblock, mul_bytes, new_list_.get(loop_dim), new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), malloca_size.byte_num()), Enum_Binary_IRInstruction.mul));
        Register sum_bytes = new Register(new IntegerType(IntegerSubType.i32), "sum_bytes");
        current_function.renaming_add(sum_bytes);
        current_basicblock.instruction_add(new BinaryInstruction(current_basicblock, sum_bytes, mul_bytes, new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 4), Enum_Binary_IRInstruction.add));

        //call malloca
        LinkedList<BaseOperand> fun_para = new LinkedList<>();
        fun_para.add(sum_bytes);
        IRfunction call_func = module_in_irbuilder.External_Function_Map.get("_f_malloc");
        Register malloca = new Register(new PointerType(new IntegerType(IntegerSubType.i8)), "malloca");
        current_function.renaming_add(malloca);
        current_basicblock.instruction_add(new CallInstruction(current_basicblock, malloca, fun_para, call_func));

        //bit cast to return type
        Register array_cast_i8_to_i32 = new Register(new PointerType(new IntegerType(IntegerSubType.i32)), "array_cast_i8_to_i32");
        current_function.renaming_add(array_cast_i8_to_i32);
        current_basicblock.instruction_add(new BitCastInstruction(current_basicblock, array_cast_i8_to_i32, malloca, new PointerType(new IntegerType(IntegerSubType.i32))));

        //store the len at pos:-1
        current_basicblock.instruction_add(new StoreInstruction(current_basicblock, new_list_.get(loop_dim), array_cast_i8_to_i32));

        //set array begin
        LinkedList<BaseOperand> get_ele_ptr_offset = new LinkedList<>();
        get_ele_ptr_offset.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 1));
        Register array_tmp_begin_i32 = new Register(new PointerType(new IntegerType(IntegerSubType.i32)), "array_tmp_begin_i32");
        current_function.renaming_add(array_tmp_begin_i32);
        current_basicblock.instruction_add(new GetElementPtrInstruction(current_basicblock, array_tmp_begin_i32, array_cast_i8_to_i32, get_ele_ptr_offset));


        //when the type don't consistent we can bit cast
        Register array_addr = new Register(return_type, "array_addr");
        current_function.renaming_add(array_addr);
        current_basicblock.instruction_add(new BitCastInstruction(current_basicblock, array_addr, array_tmp_begin_i32, return_type));

        if (loop_dim < new_list_.size() - 1) {
            Register arrayptrcnt = new Register(new PointerType(new IntegerType(IntegerSubType.i32)), "arrayptrcnt");
            current_function.renaming_add(arrayptrcnt);
            if (!current_basicblock.check_taiL_br()) {
                current_function.entry_block.link_in_basicblock.addFirst(new AllocateInstruction(current_function.entry_block, new IntegerType(IntegerSubType.i32), arrayptrcnt));
            }
            current_basicblock.instruction_add(new StoreInstruction(current_basicblock, new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 0), arrayptrcnt));


            //basicblock declare
            IRbasicblock new_condition = create_block("new_condition");
            IRbasicblock new_loop_body = create_block("new_loop_body");
            IRbasicblock new_end = create_block("new_end");

            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, new_condition, null));

            current_basicblock = new_condition;
            Register load_tmp_current_pointer = new Register(new IntegerType(IntegerSubType.i32), "load_tmp_ptr_cnt");
            current_function.renaming_add(load_tmp_current_pointer);
            current_basicblock.instruction_add(new LoadInstruction(current_basicblock, load_tmp_current_pointer, arrayptrcnt));

            Register addr_cmp_result = new Register(new IntegerType(IntegerSubType.i1), "addr_cmp_result");
            current_function.renaming_add(addr_cmp_result);
            current_basicblock.instruction_add(new CmpInstruction(current_basicblock, addr_cmp_result, Enum_Compare_IRInstruction.slt, load_tmp_current_pointer, new_list_.get(loop_dim)));

            current_basicblock.instruction_add(new BrInstruction(current_basicblock, addr_cmp_result, new_loop_body, new_end));

            current_basicblock = new_loop_body;
            LinkedList<BaseOperand> para_gep = new LinkedList<>();
            para_gep.add(load_tmp_current_pointer);
            Register geparrayaddr = new Register(return_type, "geparrayaddr");
            current_function.renaming_add(geparrayaddr);
            current_basicblock.instruction_add(new GetElementPtrInstruction(current_basicblock, geparrayaddr, array_addr, para_gep));

            Register array_addr_head = mollca_array(loop_dim + 1, new_list_, ((PointerType) return_type).get_low_dim_type());
            current_function.renaming_add(array_addr_head);

            //store the pointer in the heap for instance a[3][2]  store the second level pointer in the first level heap
            current_basicblock.instruction_add(new StoreInstruction(current_basicblock, array_addr_head, geparrayaddr));

            Register add_one_ptr = new Register(new IntegerType(IntegerSubType.i32), "add_one_ptr");
            current_function.renaming_add(add_one_ptr);
            current_basicblock.instruction_add(new BinaryInstruction(current_basicblock, add_one_ptr, load_tmp_current_pointer, new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 1), Enum_Binary_IRInstruction.add));

            current_basicblock.instruction_add(new StoreInstruction(current_basicblock, add_one_ptr, arrayptrcnt));

            //unconditional br to condition
            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, new_condition, null));
            current_basicblock = new_end;


//            LinkedList<BaseOperand> get_ele_ptr_tail_offset = new LinkedList<>();
//            get_ele_ptr_tail_offset.add(new_list_.get(loop_dim));
//            Register array_tail_addr = new Register(return_type, "array_tail_addr");
//            current_function.renaming_add(array_tail_addr);
//            current_basicblock.instruction_add(new GetElementPtrInstruction(current_basicblock, array_tail_addr, array_addr, get_ele_ptr_tail_offset));
//
//            //alloca a space to record the currnt array pointer (in the first level)
//            Register current_array_ptr_addr = new Register(new PointerType(return_type), "current_array_ptr_addr");
//            current_function.renaming_add(current_array_ptr_addr);
//            if (!current_basicblock.check_taiL_br()) {
//                current_function.entry_block.link_in_basicblock.addFirst(new StoreInstruction(current_function.entry_block,return_type.defaulttype(),current_array_ptr_addr));
//                current_function.entry_block.link_in_basicblock.addFirst(new AllocateInstruction(current_function.entry_block, return_type, current_array_ptr_addr));
//            }
//            current_basicblock.instruction_add(new StoreInstruction(current_basicblock, array_addr, current_array_ptr_addr));
//
//            //basicblock declare
//            IRbasicblock new_condition = create_block("new_condition");
//            IRbasicblock new_loop_body = create_block("new_loop_body");
//            IRbasicblock new_end = create_block("new_end");
//

//
//            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, new_condition, null));
//
//            current_basicblock = new_condition;
//            Register load_tmp_current_pointer = new Register(return_type, "load_tmp_current_pointer");
//            current_function.renaming_add(load_tmp_current_pointer);
//            current_basicblock.instruction_add(new LoadInstruction(current_basicblock, load_tmp_current_pointer, current_array_ptr_addr));
//
//            Register addr_cmp_result = new Register(new IntegerType(IntegerSubType.i1), "addr_cmp_result");
//            current_function.renaming_add(addr_cmp_result);
//            current_basicblock.instruction_add(new CmpInstruction(current_basicblock, addr_cmp_result, Enum_Compare_IRInstruction.slt, load_tmp_current_pointer, array_tail_addr));
//
//            current_basicblock.instruction_add(new BrInstruction(current_basicblock, addr_cmp_result, new_loop_body, new_end));
//
//            current_basicblock = new_loop_body;
//            Register array_addr_head = mollca_array(loop_dim + 1, new_list_, ((PointerType) return_type).get_low_dim_type());
//            current_function.renaming_add(array_addr_head);
//
//            //store the pointer in the heap for instance a[3][2]  store the second level pointer in the first level heap
//            current_basicblock.instruction_add(new StoreInstruction(current_basicblock, array_addr_head, load_tmp_current_pointer));
//
//            //set the next array pointer
//            LinkedList<BaseOperand> get_ele_ptr_offset2 = new LinkedList<>();
//            get_ele_ptr_offset2.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), 1));
//            Register nxt_pointer = new Register(return_type, "nxt_pointer");
//            current_function.renaming_add(nxt_pointer);
//            current_basicblock.instruction_add(new GetElementPtrInstruction(current_basicblock, nxt_pointer, load_tmp_current_pointer, get_ele_ptr_offset2));
//
//            current_basicblock.instruction_add(new StoreInstruction(current_basicblock, nxt_pointer, current_array_ptr_addr));
//            //unconditional br to condition
//            current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, new_condition, null));
//            current_basicblock = new_end;

        }
        return array_addr;
    }

    private BaseOperand lvalue_judge(Expr_ASTnode it) {
        if (it instanceof IdExp_ASTnode) return current_ir_scope.find_id_to_reg(it.index);
        else if (it instanceof ArrayExp_ASTnode) {
            return ((ArrayExp_ASTnode) it).actual_addr;
        } else if (it instanceof MemberExp_ASTnode) {
            return ((MemberExp_ASTnode) it).lvalue_addr;
        } else if (it instanceof Front_UnaryExp_ASTnode) return ((Front_UnaryExp_ASTnode) it).actual_addr;
        return current_ir_scope.find_id_to_reg(it.index);
    }

    private void shortpath(BinaryExp_ASTnode it, Binary_Enum op) {
        //cope with Short circuit
        IRbasicblock short_circuit_and_end = create_block("short_circuit_" + op.name() + "_end_" + it.op);
        IRbasicblock short_circuit_and_branch = create_block("short_circuit_" + op.name() + "_branch_" + it.op);
        //pointer
        Register result_reg = new Register(new PointerType(new IntegerType(IntegerSubType.i1)), it.op.toString() + "_addr");
        current_function.renaming_add(result_reg);
        //alloca and store
        if (!current_basicblock.check_taiL_br()) {
            //current_function.entry_block.link_in_basicblock.addFirst(new StoreInstruction(current_function.entry_block, new ConstOperand_Bool(new IntegerType(IntegerSubType.i1), false), result_reg));
            current_function.entry_block.link_in_basicblock.addFirst(new AllocateInstruction(current_function.entry_block, new IntegerType(IntegerSubType.i1), result_reg));
        }
        current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.lhs.ir_operand, result_reg));
        switch (op) {
            case AND -> current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.lhs.ir_operand, short_circuit_and_branch, short_circuit_and_end));
            case OR -> current_basicblock.instruction_add(new BrInstruction(current_basicblock, it.lhs.ir_operand, short_circuit_and_end, short_circuit_and_branch));
        }
        //cope with the branch
        current_basicblock = short_circuit_and_branch;
        it.rhs.accept(this);
        current_basicblock.instruction_add(new StoreInstruction(current_basicblock, it.rhs.ir_operand, result_reg));
        current_basicblock.instruction_add(new BrInstruction(current_basicblock, null, short_circuit_and_end, null));
        //cope with the end
        current_basicblock = short_circuit_and_end;
        Register load_node_iroperand = new Register(new IntegerType(IntegerSubType.i1), it.op.toString() + "_short_circuit");
        current_function.renaming_add(load_node_iroperand);
        current_basicblock.instruction_add(new LoadInstruction(current_basicblock, load_node_iroperand, result_reg));
        //assign
        it.ir_operand = load_node_iroperand;
    }

    private void array_size(FunctioncallExp_ASTnode it) {
        Register bitcast_i32 = new Register(new PointerType(new IntegerType(IntegerSubType.i32)), "bitcast_i32");
        current_function.renaming_add(bitcast_i32);
        current_basicblock.instruction_add(new BitCastInstruction(current_basicblock, bitcast_i32, ((MemberExp_ASTnode) (it.funcname)).classcall.ir_operand, new PointerType(new IntegerType(IntegerSubType.i32))));

        Register gep_size = new Register(new PointerType(new IntegerType(IntegerSubType.i32)), "gep_size");
        current_function.renaming_add(gep_size);
        LinkedList<BaseOperand> geppara = new LinkedList<>();
        geppara.add(new ConstOperand_Integer(new IntegerType(IntegerSubType.i32), -1));
        current_basicblock.instruction_add(new GetElementPtrInstruction(current_basicblock, gep_size, bitcast_i32, geppara));

        Register size_load = new Register(new IntegerType(IntegerSubType.i32), "size_load");
        current_function.renaming_add(size_load);
        current_basicblock.instruction_add(new LoadInstruction(current_basicblock, size_load, gep_size));

        it.ir_operand = size_load;
    }

    private void add_this_pointer_inclasspara(IRfunction Function) {
        Register this_addr = new Register(new PointerType(new PointerType(module_in_irbuilder.Module_Struct_Map.get(current_class_detail.classname))), "this_addr");
        current_function.renaming_add(this_addr);
        if (!current_basicblock.check_taiL_br()) {
            //current_function.entry_block.link_in_basicblock.addFirst(new StoreInstruction(current_function.entry_block, ((PointerType) this_addr.type).get_low_dim_type().defaulttype(), this_addr));
            current_function.entry_block.link_in_basicblock.addFirst(new AllocateInstruction(current_function.entry_block, ((PointerType) this_addr.type).get_low_dim_type(), this_addr));
        }
        current_ir_scope.id_map.put("this_addr", this_addr);
        //fix a bug in instruction selector
        Register thispara_reg = new Register(Function.function_type.parament_list.get(0).type, "this");
        current_function.renaming_add(this_addr);
        current_basicblock.instruction_add(new StoreInstruction(current_basicblock, thispara_reg, this_addr));
        current_function.para_map_fic_for_codegen.put("this", thispara_reg);

    }
}
