package Backend;

import IR.IRmodule.IRmodule;
import IR.Operand.ConstOperand_String;
import IR.Operand.Global_variable;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.ASM_StackFrame.ASM_Stack_Frame;
import RISCV.Instruction.*;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Physical_Register;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Map;

public class ASMprinter implements ASMVisitor {
    public PrintWriter file_print;

    public boolean stdout = false;
    private final String tab = "    ";

    public ASM_Module asm_module;

    public IRmodule iRmodule;

    private final Physical_Register s0, sp, ra, s2;

    public ASMprinter(IRmodule iRmodule_, ASM_Module asm_module_) throws FileNotFoundException {
        iRmodule = iRmodule_;
        asm_module = asm_module_;
        s0 = asm_module_.physical_registers.get(8);
        sp = asm_module_.physical_registers.get(2);
        ra = asm_module_.physical_registers.get(1);
        s2 = asm_module_.physical_registers.get(18);

    }

    public void run_print() {
        asm_module.accept(this);
        file_print.close();

    }

    void f_println(Base_RISCV_Instruction index) {
        if (stdout) {
            System.out.println(tab + index);
            return;
        }
        file_print.println(tab + index);
    }

    void f_println(String index) {
        if (stdout) {
            System.out.println(index);
            return;
        }
        file_print.println(index);
    }

    @Override
    public void visit(ASM_Basicblock it) {
        f_println(it.asm_basic_block_label + ":");

        for (int i = 0; i < it.Riscv_instruction_in_block.size(); i++) {
            f_println(it.Riscv_instruction_in_block.get(i));
        }
    }

    @Override
    public void visit(ASM_Function it) {
        f_println(tab + ".globl" + " " + it.asm_function_name + "\t\t\t\t\t# start function : " + it.asm_function_name);
        f_println(tab + ".p2align\t2");
        f_println(it.asm_function_name + ":");
        for (int i = 0; i < it.asm_basicblock_in_function.size(); i++) {
            ASM_Basicblock asm_basicblock = it.asm_basicblock_in_function.get(i);
            int stack_offset = it.virtual_reg_offset+it.max_call_para;
            if (i == 0) {
                if (!checkrange(stack_offset)) {
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, s2, sp, s0, null));
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Li(s2, new Immediate((stack_offset + 12))));

                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Store(4, s2, s0, new Immediate(0)));
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, s2, sp, s2, null));
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Li(s2, new Immediate((stack_offset + 4))));

                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Store(4, s2, ra, new Immediate(0)));
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, s2, sp, s2, null));
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Li(s2, new Immediate((stack_offset + 8))));

                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, s2, sp, sp, null));
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Li(s2, new Immediate(-(stack_offset + 12))));
                } else {
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.addi, sp, null, s0, new Immediate((stack_offset + 12))));
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Store(4, sp, s0, new Immediate(stack_offset + 4)));
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Store(4, sp, ra, new Immediate(stack_offset + 8)));
                    asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.addi, sp, null, sp, new Immediate(-(stack_offset + 12))));
                }
            }
            if (asm_basicblock==it.tail_basicblock) {
                if (!checkrange(stack_offset)) {
                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Li(s2, new Immediate((stack_offset + 4))));
                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, s2, sp, s2, null));
                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Load(4, s2, s0, new Immediate(0)));

                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Li(s2, new Immediate((stack_offset + 8))));
                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, s2, sp, s2, null));
                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Load(4, s2, ra, new Immediate(0)));


                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Li(s2, new Immediate((stack_offset + 12))));
                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, s2, sp, sp, null));


                } else {
                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Load(4, sp, s0, new Immediate(stack_offset + 4)));
                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Load(4, sp, ra, new Immediate(stack_offset + 8)));
                    asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.addi, sp, null, sp, new Immediate((stack_offset + 12))));
                }
                asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Ret());

            }
            asm_basicblock.accept(this);
        }
        f_println("# end function : " + it.asm_function_name);
        f_println("");
    }

    private boolean checkrange(int stack) {
        //to do it because my stackframe need to add 12 or 8
        return stack >= -2024 && stack < 2024;

    }

    @Override
    public void visit(ASM_Module it) {
        f_println(tab + ".text");
        f_println("");
        for (Map.Entry<String, ASM_Function> entry : asm_module.all_function.entrySet()) {
            entry.getValue().accept(this);
        }
        f_println("");
        f_println("\t.section\t.sdata");
        for (Map.Entry<String, Global_variable> entry : iRmodule.Global_variable_map.entrySet()) {
            //string must be printed seperately
            if (entry.getValue().initoperand instanceof ConstOperand_String) continue;
            f_println("\t.p2align\t2");
            f_println("\t.globl\t" + entry.getKey());
            f_println(entry.getKey() + ":");
            f_println("\t.word\t0");
            f_println("");
        }
        f_println("");
        for (Map.Entry<String, Global_variable> entry : iRmodule.string_map.entrySet()) {
            f_println("\t.section\t.rodata\n" +
                    "\t.p2align\t2");
            f_println(entry.getValue().GlobalVariableName + ":");
            String transString;
            transString = entry.getKey().replace("\\", "\\\\");
            transString = transString.replace("\n", "\\n");
            transString = transString.replace("\0", "");
            transString = transString.replace("\t", "\\t");
            transString = transString.replace("\"", "\\\"");
            f_println("\t.string\t" + "\"" + transString + "\"");
            f_println("");
        }

    }

    @Override
    public void visit(ASM_Stack_Frame it) {

    }

    @Override
    public void visit(RISCV_Instruction_Binary it) {

    }

    @Override
    public void visit(RISCV_Instruction_Branch it) {

    }

    @Override
    public void visit(RISCV_Instruction_Call it) {

    }

    @Override
    public void visit(RISCV_Instruction_J it) {

    }

    @Override
    public void visit(RISCV_Instruction_Lui it) {

    }

    @Override
    public void visit(RISCV_Instruction_Move it) {

    }

    @Override
    public void visit(RISCV_Instruction_Ret it) {

    }

    @Override
    public void visit(RISCV_Instruction_Store it) {

    }
}
