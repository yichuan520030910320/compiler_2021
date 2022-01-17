package Backend;

import IR.IRfunction.IRfunction;
import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.ASM_StackFrame.ASM_Stack_Frame;
import RISCV.Instruction.*;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Physical_Register;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Map;

public class ASMprinter implements ASMVisitor {
    public PrintWriter file_print;

    public boolean stdout = false;
    private final String tab = "    ";

    public ASM_Module asm_module;

    private final Physical_Register s0, sp, ra;

    public ASMprinter(ASM_Module asm_module_, String path) throws FileNotFoundException {
        asm_module = asm_module_;
        s0 = asm_module_.physical_registers.get(8);
        sp = asm_module_.physical_registers.get(2);
        ra = asm_module_.physical_registers.get(1);
        file_print = new PrintWriter(new FileOutputStream(path));
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
            if (i == 0) {
                asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.addi,sp,null,s0,new Immediate((it.virtual_reg_offset+12))));
                asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Store(4, sp, s0, new Immediate(it.virtual_reg_offset + 4)));
                asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Store(4, sp, ra, new Immediate(it.virtual_reg_offset + 8)));
                asm_basicblock.Riscv_instruction_in_block.addFirst(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.addi,sp,null,sp,new Immediate(-(it.virtual_reg_offset+12))));
            }else if (i==it.asm_basicblock_in_function.size()-1){
                asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Load(4,sp,s0,new Immediate(it.virtual_reg_offset+4)));
                asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Load(4,sp,ra,new Immediate(it.virtual_reg_offset+8)));
                asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.addi,sp,null,sp,new Immediate((it.virtual_reg_offset+12))));
                asm_basicblock.Riscv_instruction_in_block.add(new RISCV_Instruction_Ret());
            }
            asm_basicblock.accept(this);
        }
        f_println("# end function : " + it.asm_function_name);
        f_println("");

    }

    @Override
    public void visit(ASM_Module it) {
        f_println(tab + ".text");
        f_println("");
        for (Map.Entry<String, ASM_Function> entry : asm_module.all_function.entrySet()) {
            entry.getValue().accept(this);
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
