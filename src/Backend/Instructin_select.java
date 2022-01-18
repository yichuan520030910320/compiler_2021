package Backend;

import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRmodule.IRmodule;
import IR.IRvisitor;
import IR.Instru.*;
import IR.Operand.*;
import IR.TypeSystem.VoidType;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.Instruction.*;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;
import RISCV.Operand.Register.Physical_Register;
import RISCV.Operand.Register.Virtual_Register;

import java.util.HashMap;
import java.util.Map;

public class Instructin_select implements IRvisitor {
    public IRmodule iRmodule;
    public ASM_Module cur_module;
    public ASM_Basicblock cur_basicblock;
    public ASM_Function cur_function;

    //record the corresponding relationship with irregister and virtual register
    public HashMap<BaseOperand, Base_RISCV_Register> IRreg_to_ASMreg = new HashMap<>();
    Physical_Register ra, sp, s0, a0;

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
        Base_RISCV_Register rs2 = transreg(it.operand2);
        RISCV_Instruction_Binary.RISCVBinarytype op;
        switch (it.op) {
            case add -> op = RISCV_Instruction_Binary.RISCVBinarytype.add;
            case sub -> op = RISCV_Instruction_Binary.RISCVBinarytype.sub;
            case mul -> op = RISCV_Instruction_Binary.RISCVBinarytype.mul;
            case sdiv -> op = RISCV_Instruction_Binary.RISCVBinarytype.div;
            case srem -> op = RISCV_Instruction_Binary.RISCVBinarytype.rem;
            case shl -> op = RISCV_Instruction_Binary.RISCVBinarytype.sll;
            case ashr -> op = RISCV_Instruction_Binary.RISCVBinarytype.sra;
            case and -> op = RISCV_Instruction_Binary.RISCVBinarytype.and;
            case or -> op = RISCV_Instruction_Binary.RISCVBinarytype.or;
            case xor -> op = RISCV_Instruction_Binary.RISCVBinarytype.xor;
            default -> throw new IllegalStateException("Unexpected value: " + it.op);
        }
        cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(op, rs1, rs2, rd, null));
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
        if (it.paralist != null) {
            for (int i = 0; i < Math.min(8, it.paralist.size()); i++) {
                Base_RISCV_Register rs1 = transreg(it.paralist.get(i));
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(rs1, cur_module.physical_registers.get(10 + i)));
            }
            for (int i = 8; i < it.paralist.size(); i++) {
                //todo
            }
        }

        cur_basicblock.add_tail_instru(new RISCV_Instruction_Call(it.call_fuction.functionname));
        if (!(it.call_fuction.function_type.returntype instanceof VoidType)) {
            Base_RISCV_Register call_result = transreg(it.call_result);
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(a0, call_result));
        }


    }

    @Override
    public void visit(CmpInstruction it) {
        Base_RISCV_Register rd = transreg(it.cmp_result);
        Base_RISCV_Register rs1 = transreg(it.operand1);
        Base_RISCV_Register rs2 = transreg(it.operand2);
        RISCV_Instruction_Cmp.RISCVCompareType cmp_type;
        Virtual_Register xor_result = new Virtual_Register("sub_virtual_reg", it.operand1.type.byte_num());
        switch (it.cmp_operation) {
            case slt -> cmp_type = RISCV_Instruction_Cmp.RISCVCompareType.slt;
            case sgt -> cmp_type = RISCV_Instruction_Cmp.RISCVCompareType.sgt;
            case sle -> cmp_type = RISCV_Instruction_Cmp.RISCVCompareType.sle;
            case sge -> cmp_type = RISCV_Instruction_Cmp.RISCVCompareType.sge;
            case eq -> {
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.xor, rs1, rs2, xor_result, null));
                cmp_type = RISCV_Instruction_Cmp.RISCVCompareType.seqz;
            }
            case ne -> {
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.xor, rs1, rs2, xor_result, null));
                cmp_type = RISCV_Instruction_Cmp.RISCVCompareType.snez;
            }
            default -> throw new IllegalStateException("Unexpected value: " + it.cmp_operation);
        }
        switch (it.cmp_operation) {
            case slt, sgt, sle, sge -> cur_basicblock.add_tail_instru(new RISCV_Instruction_Cmp(cmp_type, rs1, rs2, rd));
            case eq, ne -> cur_basicblock.add_tail_instru(new RISCV_Instruction_Cmp(cmp_type, xor_result, null, rd));
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
                    //todo
                }
            } else {
                //when the reg haven't be alloca before (it's also a virtual register)
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Load(it.destination_register.type.byte_num(), asm_rs1, asm_virtual_rd, null));
            }
        }
    }

    @Override
    public void visit(PhiInstruction it) {
//nothing to do
    }

    @Override
    public void visit(RetInstruction it) {
        if (it.Ret_Type instanceof VoidType) {
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(cur_module.physical_registers.get(0), cur_module.physical_registers.get(10)));
            return;
        }
        cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(IRreg_to_ASMreg.get(it.Ret_Operand), cur_module.physical_registers.get(10)));
        //put the ret in the printer
    }

    @Override
    public void visit(StoreInstruction it) {
        //eg M[R[rs1]+imm](7:0)=R[rs2](7:0)
        if (it.dest_operand instanceof Global_variable) {
            Virtual_Register globaltmp = new Virtual_Register("global_tmp", it.source_operand.type.byte_num());
            RISCV_Instruction_Store store_global = new RISCV_Instruction_Store(it.source_operand.type.byte_num(),transreg(it.source_operand), globaltmp,null);
            store_global.global_store_name = ((Global_variable) it.dest_operand).GlobalVariableName;
            cur_basicblock.add_tail_instru(store_global);
        } else {
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
                    //todo
                }
            } else {
                //when the reg haven't be alloca before (it's also a virtual register)
                //here the imm is useless
                cur_basicblock.add_tail_instru(new RISCV_Instruction_Store(it.source_operand.type.byte_num(), asm_rs1, asm_rs2, null));
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
        for (int i = 0; i < Math.min(it.function_type.parament_list.size(), 8); i++) {
            Base_RISCV_Register rd = transreg(it.paramentlist.get(i));
            cur_basicblock.add_tail_instru(new RISCV_Instruction_Move(cur_module.physical_registers.get(10 + i), rd));
        }
        for (int i = 8; i < it.paramentlist.size(); i++) {
//todo
            //first need to finish call
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

    }

    @Override
    public void visit(BitCastInstruction it) {

    }

    private Base_RISCV_Register transreg(BaseOperand iropreand) {
        //todo it is naive
        if (iropreand instanceof Register) {
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
        }
        return null;

    }

    public boolean checkimmrange(int imm_) {
        return imm_ >= -2048 && imm_ < 2048;
    }
}
