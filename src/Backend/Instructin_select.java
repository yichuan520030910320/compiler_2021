package Backend;

import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRmodule.IRmodule;
import IR.IRvisitor;
import IR.Instru.*;
import IR.Operand.*;
import IR.TypeSystem.PointerType;
import IR.TypeSystem.Typesystem;
import IR.TypeSystem.VoidType;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.Instruction.*;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;
import RISCV.Operand.Register.Physical_Register;
import RISCV.Operand.Register.Virtual_Register;
import Utils.error.IRbuilderError;
import Utils.error.InstSelectError;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

public class Instructin_select implements IRvisitor {
    public IRmodule iRmodule;
    public ASM_Module cur_module;
    public ASM_Basicblock cur_basicblock;
    public ASM_Function cur_function;

    //record the corresponding relationship with irregister and virtual register
    public HashMap<BaseOperand, Base_RISCV_Register> IRreg_to_ASMreg = new HashMap<>();
    Physical_Register ra, sp, s0, a0;

    public LinkedList<Virtual_Register> callee_saved_virtual_reg = new LinkedList<>();

    private int memregcnt = 0;

    public Instructin_select(IRmodule iRmodule_) {
        iRmodule = iRmodule_;
        cur_module = new ASM_Module();
        ra = cur_module.physical_registers.get(1);
        sp = cur_module.physical_registers.get(2);
        s0 = cur_module.physical_registers.get(8);
        a0 = cur_module.physical_registers.get(10);
        for (Map.Entry<String, IRfunction> entry : iRmodule_.Internal_Function_Map.entrySet()) {
            entry.getValue().accept(this);
        }
    }

    @Override
    public void visit(BinaryInstruction it) {
        Base_RISCV_Register rd = transreg(it.result_operand);
        Base_RISCV_Register rs1 = transreg(it.operand1);
        Base_RISCV_Register rs2 = null;
        RISCV_Instruction_Binary.RISCVBinarytype op;
        switch (it.op) {
            case add -> {
                op = RISCV_Instruction_Binary.RISCVBinarytype.add;
                if ((it.operand2 instanceof ConstOperand_Integer && checkimmrange(((ConstOperand_Integer) it.operand2).value))) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.addi, rs1, null, rd, new Immediate(((ConstOperand_Integer) it.operand2).value)));
                } else {
                    rs2 = transreg(it.operand2);
                }
            }
            case sub -> {
                op = RISCV_Instruction_Binary.RISCVBinarytype.sub;
                if ((it.operand2 instanceof ConstOperand_Integer && checkimmrange(((ConstOperand_Integer) it.operand2).value))) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.addi, rs1, null, rd, new Immediate(-((ConstOperand_Integer) it.operand2).value)));
                } else {
                    rs2 = transreg(it.operand2);
                }
            }
            case mul -> {
                op = RISCV_Instruction_Binary.RISCVBinarytype.mul;
                rs2 = transreg(it.operand2);
            }
            case sdiv -> {
                op = RISCV_Instruction_Binary.RISCVBinarytype.div;
                rs2 = transreg(it.operand2);
            }
            case srem -> {
                op = RISCV_Instruction_Binary.RISCVBinarytype.rem;
                rs2 = transreg(it.operand2);
            }
            case shl -> {
                op = RISCV_Instruction_Binary.RISCVBinarytype.sll;
                if ((it.operand2 instanceof ConstOperand_Integer && checkimmrange(((ConstOperand_Integer) it.operand2).value))) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.slli, rs1, null, rd, new Immediate(((ConstOperand_Integer) it.operand2).value)));
                } else {
                    rs2 = transreg(it.operand2);
                }
            }
            case ashr -> {
                op = RISCV_Instruction_Binary.RISCVBinarytype.sra;
                if ((it.operand2 instanceof ConstOperand_Integer && checkimmrange(((ConstOperand_Integer) it.operand2).value))) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.srai, rs1, null, rd, new Immediate(((ConstOperand_Integer) it.operand2).value)));
                } else {
                    rs2 = transreg(it.operand2);
                }
            }
            case and -> {
                op = RISCV_Instruction_Binary.RISCVBinarytype.and;
                if (it.operand2 instanceof ConstOperand_Bool) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.andi, rs1, null, rd, new Immediate(((ConstOperand_Bool) it.operand2).bool_value ? 1 : 0)));
                } else if ((it.operand2 instanceof ConstOperand_Integer && checkimmrange(((ConstOperand_Integer) it.operand2).value))) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.andi, rs1, null, rd, new Immediate(((ConstOperand_Integer) it.operand2).value)));
                } else {
                    rs2 = transreg(it.operand2);
                }
            }
            case or -> {
                op = RISCV_Instruction_Binary.RISCVBinarytype.or;
                if (it.operand2 instanceof ConstOperand_Bool) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.ori, rs1, null, rd, new Immediate(((ConstOperand_Bool) it.operand2).bool_value ? 1 : 0)));
                } else if ((it.operand2 instanceof ConstOperand_Integer && checkimmrange(((ConstOperand_Integer) it.operand2).value))) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.ori, rs1, null, rd, new Immediate(((ConstOperand_Integer) it.operand2).value)));
                } else {
                    rs2 = transreg(it.operand2);

                }
            }
            case xor -> {
                op = RISCV_Instruction_Binary.RISCVBinarytype.xor;
                if (it.operand2 instanceof ConstOperand_Bool) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.xori, rs1, null, rd, new Immediate(((ConstOperand_Bool) it.operand2).bool_value ? 1 : 0)));
                } else if ((it.operand2 instanceof ConstOperand_Integer && checkimmrange(((ConstOperand_Integer) it.operand2).value))) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.xori, rs1, null, rd, new Immediate(((ConstOperand_Integer) it.operand2).value)));
                } else {
                    rs2 = transreg(it.operand2);
                }
            }
            default -> throw new IllegalStateException("Unexpected value: " + it.op);
        }
        if (!(rs2 == null)) cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(op, rs1, rs2, rd, null));
    }

    // br l1         -> j l1
    // br %0 l1 l2   -> beqz %0 l2
    @Override
    public void visit(BrInstruction it) {
        if (it.cond != null) {
            String else_label = cur_function.iRbasicblockASM_basicblockHashMap.get(it.false_block).asm_basic_block_label;
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Branch(RISCV_Instruction_Branch.BranchType.BEQZ, transreg(it.cond), else_label));
        }
        cur_basicblock.add_tail_instru(new RISCV_Instruction_J(cur_function.iRbasicblockASM_basicblockHashMap.get(it.true_block).asm_basic_block_label));
    }

    @Override
    public void visit(CallInstruction it) {
        //for the bug 2022/2/3 in the log
        int spill_para_byte = 0;
        if (it.paralist != null) {
            for (int i = 0; i < Math.min(8, it.paralist.size()); i++) {
                Base_RISCV_Register rs1 = transreg(it.paralist.get(i));
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(rs1, cur_module.physical_registers.get(10 + i)));
            }
            for (int i = 8; i < it.paralist.size(); i++) {
                BaseOperand tmp_para = it.paralist.get(i);
                spill_para_byte += tmp_para.type.byte_num();
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Store(tmp_para.type.byte_num(), sp, transreg(tmp_para), new Immediate((i - 8) * 4)));
            }
        }

        cur_function.max_call_para = Math.max(spill_para_byte, cur_function.max_call_para);

        RISCV_Instruction_Call riscv_instruction_call = new RISCV_Instruction_Call(it.call_fuction.functionname);
        riscv_instruction_call.def_reg.addAll(cur_module.caller_registers);
        cur_basicblock.add_tail_instru(riscv_instruction_call);
        if (!(it.call_fuction.function_type.returntype instanceof VoidType)) {
            Base_RISCV_Register call_result = transreg(it.call_result);
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(a0, call_result));
        }
    }

    @Override
    public void visit(CmpInstruction it) {
        Base_RISCV_Register rd = transreg(it.cmp_result);
        Base_RISCV_Register rs1 = transreg(it.operand1);
        Base_RISCV_Register rs2 = null;
        RISCV_Instruction_Cmp.RISCVCompareType cmp_type;
        Virtual_Register xor_result = new Virtual_Register("sub_virtual_reg", it.operand1.type.byte_num());
        switch (it.cmp_operation) {
            case slt, sge -> {
                cmp_type = RISCV_Instruction_Cmp.RISCVCompareType.slt;
                rs2 = transreg(it.operand2);
            }
            case sgt, sle -> {
                cmp_type = RISCV_Instruction_Cmp.RISCVCompareType.sgt;
                rs2 = transreg(it.operand2);
            }
            case eq -> {
                cmp_type = RISCV_Instruction_Cmp.RISCVCompareType.seqz;
                if ((it.operand2 instanceof ConstOperand_Integer && checkimmrange(((ConstOperand_Integer) it.operand2).value))) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.xori, rs1, null, rd, new Immediate(((ConstOperand_Integer) it.operand2).value)));
                } else {
                    rs2 = transreg(it.operand2);
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.xor, rs1, rs2, xor_result, null));
                }
            }
            case ne -> {
                cmp_type = RISCV_Instruction_Cmp.RISCVCompareType.snez;

                if ((it.operand2 instanceof ConstOperand_Integer && checkimmrange(((ConstOperand_Integer) it.operand2).value))) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.xori, rs1, null, rd, new Immediate(((ConstOperand_Integer) it.operand2).value)));
                } else {
                    rs2 = transreg(it.operand2);
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.xor, rs1, rs2, xor_result, null));
                }
            }
            default -> throw new IllegalStateException("Unexpected value: " + it.cmp_operation);
        }
        switch (it.cmp_operation) {
            case slt, sgt -> cur_basicblock.add_tail_instru(new RISCV_Instruction_Cmp(cmp_type, rs1, rs2, rd));
            case eq, ne -> {
                if (!(rs2 == null)) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Cmp(cmp_type, xor_result, null, rd));
                } else {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Cmp(cmp_type, rd, null, rd));
                }
            }
            case sge, sle -> {
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Cmp(cmp_type, rs1, rs2, rd));
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.xori, rd, null, rd, new Immediate(1)));
            }
            default -> throw new IllegalStateException("Unexpected value: " + it.cmp_operation);
        }

    }

    @Override
    public void visit(LoadInstruction it) {
        Virtual_Register asm_virtual_rd = new Virtual_Register(it.destination_register.toString(), it.destination_register.type.byte_num());
        IRreg_to_ASMreg.put(it.destination_register, asm_virtual_rd);
        if (it.source_pointer instanceof Global_variable) {
            //pesudo instruction load t2 ,x,t1 there t1 is useless
            // %p_4 = load i32, i32* @p
            //load rd p is ok
            RISCV_Instruction_Load load_global = new RISCV_Instruction_Load(it.destination_register.type.byte_num(), null, transreg(it.destination_register), null);
            load_global.global_data_name = ((Global_variable) it.source_pointer).GlobalVariableName;
            cur_basicblock.add_tail_instru(load_global);
        } else {
            Base_RISCV_Register asm_rs1 = transreg(it.source_pointer);
            if (cur_function.Virtual_to_offset.containsKey(asm_rs1)) {
                //in this case means the reg is on the stack in another word it is alloca before
                int stackoffset = -cur_function.Virtual_to_offset.get(asm_rs1);
                if (checkimmrange(stackoffset)) {
                    //when I can use imm to load the correct reg
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Load(it.destination_register.type.byte_num(), s0, asm_virtual_rd, new Immediate(stackoffset)));
                } else {
                    //when the imm is out of the range
                    //li immreg 100000
                    //add t s0 t
                    //rs2=M[t]
                    Virtual_Register immreg = outofrangeadd(stackoffset);
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Store(4, immreg, transreg(it.destination_register), new Immediate(0)));
                }
            } else {
                //when the reg haven't be alloca before (it's also a virtual register)
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Load(it.destination_register.type.byte_num(), asm_rs1, asm_virtual_rd, new Immediate(0)));
            }
        }
    }

    @Override
    public void visit(PhiInstruction it) {
//nothing to do
    }

    @Override
    public void visit(RetInstruction it) {


        //recover the calleesaved
        for (int i = 0; i < cur_module.callee_registers.size(); i++) {
            Virtual_Register virtual_register = callee_saved_virtual_reg.get(i);
            Physical_Register physical_register = cur_module.callee_registers.get(i);
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(virtual_register, physical_register));
        }
        if (it.Ret_Type instanceof VoidType) {
            return;
        }
        cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(transreg(it.Ret_Operand), cur_module.physical_registers.get(10)));
        //put the ret in the printer
    }

    @Override
    public void visit(StoreInstruction it) {
        //eg M[R[rs1]+imm](7:0)=R[rs2](7:0)
        if (it.dest_operand instanceof Global_variable) {
            Virtual_Register la = new Virtual_Register("la", 4);
            cur_basicblock.add_tail_instru(new RISCV_Instruction_La(((Global_variable) it.dest_operand).GlobalVariableName, la));
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Store(4, la, transreg(it.source_operand), new Immediate(0)));
        } else {
            //mem2reg
            if (it.dest_operand instanceof Mem2Reg_Register) {
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(transreg(it.source_operand), transreg(it.dest_operand)));
                return;
            }

            Base_RISCV_Register asm_rs1 = transreg(it.dest_operand);
            Base_RISCV_Register asm_rs2 = transreg(it.source_operand);
            if (cur_function.Virtual_to_offset.containsKey(asm_rs1)) {
                //in this case means the reg is on the stack in another word it is alloca before
                int stackoffset = -cur_function.Virtual_to_offset.get(asm_rs1);
                if (checkimmrange(stackoffset)) {
                    //when I can use imm to load the correct reg
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Store(it.source_operand.type.byte_num(), s0, asm_rs2, new Immediate(stackoffset)));
                } else {
                    //when the imm is out of the range
                    //li immreg 100000
                    //add t s0 t
                    //M[t]=rs2
                    Virtual_Register immreg = outofrangeadd(stackoffset);
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Store(4, immreg, transreg(it.dest_operand), new Immediate(0)));
                }
            } else {
                //when the reg haven't be alloca before (it's also a virtual register)
                //here the imm is important it's related to rs1
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Store(it.source_operand.type.byte_num(), asm_rs1, asm_rs2, new Immediate(0)));
            }
        }
    }

    @Override
    public void visit(AllocateInstruction it) {
        Virtual_Register alloca_virtual_reg = new Virtual_Register(it.allocate_result.toString(), it.allocate_type.byte_num());
        IRreg_to_ASMreg.put(it.allocate_result, alloca_virtual_reg);
        cur_function.alloca(alloca_virtual_reg, it.allocate_type.byte_num());
    }

    @Override
    public void visit(IRbasicblock it) {
        for (int i = 0; i < it.link_in_basicblock.size(); i++) {
            it.link_in_basicblock.get(i).accept(this);
        }
    }

    @Override
    public void visit(IRfunction it) {
        cur_function = new ASM_Function(it);
        cur_module.all_function.put(it.functionname, cur_function);
        cur_basicblock = cur_function.head_basicblock;
        //mv the parament to the virtual reg

        // ------ Save callee-save registers ------
        callee_saved_virtual_reg.clear();
        for (int i = 0; i < cur_module.callee_registers.size(); i++) {
            Physical_Register physical_register = cur_module.callee_registers.get(i);
            Virtual_Register virtual_register = new Virtual_Register("callee_saved" + i, 4);
            callee_saved_virtual_reg.add(virtual_register);
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(physical_register, virtual_register));
        }

        for (int i = 0; i < Math.min(it.function_type.parament_list.size(), 8); i++) {
            String para_name = it.function_type.parament_list.get(i).paraname;
            BaseOperand para = it.para_map_fic_for_codegen.get(para_name);
            Base_RISCV_Register rd = transreg(para);
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(cur_module.physical_registers.get(10 + i), rd));
        }
        for (int i = 8; i < it.function_type.parament_list.size(); i++) {
            String para_name = it.function_type.parament_list.get(i).paraname;
            BaseOperand tmp_para = it.para_map_fic_for_codegen.get(para_name);
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Load(tmp_para.type.byte_num(), s0, transreg(tmp_para), new Immediate((i - 8) * 4)));
        }

        for (int i = 0; i < cur_function.asm_basicblock_in_function.size(); i++) {
            cur_basicblock = cur_function.asm_basicblock_in_function.get(i);
            it.block_list.get(i).accept(this);
        }
    }

    @Override
    public void visit(IRmodule it) {


    }

    @Override
    public void visit(GetElementPtrInstruction it) {
        if (it.source_ptr instanceof Global_variable) {
            if (!(((Global_variable) it.source_ptr).initoperand instanceof ConstOperand_String))
                throw new IRbuilderError("actual error in symbol collector", null);
            Base_RISCV_Register tmp = transreg(it.source_ptr);
            IRreg_to_ASMreg.put(it.result_register, tmp);
        } else {
            Base_RISCV_Register rd = transreg(it.result_register);
            if (it.prefix_sum_bytenum.size() == 0) {
                //is in the array

                BaseOperand offset_in_gep = it.index_offset.get(0);
                Typesystem reg_type = ((PointerType) it.result_register.type).get_low_dim_type();
                //change offset=byte_in_gep*offset
                assert it.result_register.type instanceof PointerType;
                if (offset_in_gep instanceof ConstOperand_Integer && checkimmrange(((ConstOperand_Integer) offset_in_gep).value * reg_type.byte_num())) {
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.addi, transreg(it.source_ptr), null, rd, new Immediate(((ConstOperand_Integer) offset_in_gep).value * reg_type.byte_num())));
                } else {
                    Virtual_Register byte_in_gep = new Virtual_Register("gep_byte", reg_type.byte_num());
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Li(byte_in_gep, new Immediate(reg_type.byte_num())));
                    Virtual_Register change_offset = new Virtual_Register("change_offset", reg_type.byte_num());
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.mul, byte_in_gep, transreg(offset_in_gep), change_offset, null));
                    //rd=rs+changeoffset
                    cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, transreg(it.source_ptr), change_offset, rd, null));
                }
            }

            if (it.index_offset.size() > 1) {
                //in class such as a.b
                BaseOperand offset_in_gep1 = it.index_offset.get(1);
                assert offset_in_gep1 instanceof ConstOperand_Integer;
                int offset_class = ((ConstOperand_Integer) offset_in_gep1).value;
                int total_byte_offset = it.prefix_sum_bytenum.get(offset_class);
                if (!checkimmrange(total_byte_offset)) throw new InstSelectError("class too big", null);
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.addi, transreg(it.source_ptr), null, rd, new Immediate(total_byte_offset)));
            }
        }

    }

    @Override
    public void visit(BitCastInstruction it) {
        Base_RISCV_Register tmp = transreg(it.source_reg);
        IRreg_to_ASMreg.put(it.result_reg, tmp);
    }

    private Base_RISCV_Register transreg(BaseOperand iropreand) {
        //todo it is naive

        if (iropreand instanceof Parament) {
            if (IRreg_to_ASMreg.containsKey(iropreand)) return IRreg_to_ASMreg.get(iropreand);
            Virtual_Register new_virtual_reg = new Virtual_Register(iropreand.toString(), iropreand.type.byte_num());
            IRreg_to_ASMreg.put(iropreand, new_virtual_reg);
            return new_virtual_reg;
        } else if (iropreand instanceof Register) {
            if (IRreg_to_ASMreg.containsKey(iropreand)) return IRreg_to_ASMreg.get(iropreand);
            Virtual_Register new_virtual_reg = new Virtual_Register(((Register) iropreand).RegName, iropreand.type.byte_num());
            IRreg_to_ASMreg.put(iropreand, new_virtual_reg);
            return new_virtual_reg;
        } else if (iropreand instanceof ConstOperand_Bool) {
            //if the operand is a const i will use li
            if (!((ConstOperand_Bool) iropreand).bool_value) return cur_module.physical_registers.get(0);
            Virtual_Register constli = new Virtual_Register("virtual_reg_const_li", 1);
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Li(constli, new Immediate(1)));
            return constli;
        } else if (iropreand instanceof ConstOperand_Integer) {
            //if the operand is a const i will use li
            if (((ConstOperand_Integer) iropreand).value == 0) return cur_module.physical_registers.get(0);
            Virtual_Register constli = new Virtual_Register("virtual_reg_const_li", 4);
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Li(constli, new Immediate(((ConstOperand_Integer) iropreand).value)));
            return constli;
        } else if (iropreand instanceof ConstOperand_Null) {
            return cur_module.physical_registers.get(0);

        } else if (iropreand instanceof Global_variable) {
            assert ((Global_variable) iropreand).initoperand instanceof ConstOperand_String;
            if (!(((Global_variable) iropreand).initoperand instanceof ConstOperand_String))
                throw new IRbuilderError(" actual error in inst select", null);
            Virtual_Register tmp_str_addrreg = new Virtual_Register("tmp_str_addrreg", 4);
            cur_basicblock.add_tail_instru(new RISCV_Instruction_La(iRmodule.string_map.get(((ConstOperand_String) ((Global_variable) iropreand).initoperand).conststring).GlobalVariableName, tmp_str_addrreg));
            return tmp_str_addrreg;

        } else if (iropreand instanceof Mem2Reg_Register) {
            if (IRreg_to_ASMreg.containsKey(iropreand)) return IRreg_to_ASMreg.get(iropreand);

            Virtual_Register new_virtual_reg = new Virtual_Register("mem2reg" + memregcnt++, iropreand.type.byte_num());
            IRreg_to_ASMreg.put(iropreand, new_virtual_reg);
            return new_virtual_reg;
        }
        throw new IRbuilderError(" actual error in inst select", null);

    }

    public Virtual_Register outofrangeadd(int stack) {
        Virtual_Register immreg = new Virtual_Register("immreg", 4);
        cur_basicblock.add_tail_instru(new RISCV_Instruction_Li(immreg, new Immediate(stack)));
        cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, s0, immreg, immreg, null));
        return immreg;
    }

    public boolean checkimmrange(int imm_) {
        return imm_ >= -2048 && imm_ < 2048;
    }
}
