package Optimize;

import IR.IRfunction.IRfunction;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.Instruction.RISCV_Instruction_Move;
import RISCV.Operand.Register.Base_RISCV_Register;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Stack;

public class Graph_Coloring {
    //inspired by the tiger book chapter11
    public ASM_Module asm_module;
    private ASM_Function cur_function;

    //every vertex can only in one set or sheet
    public HashSet<Base_RISCV_Register> precolored = new LinkedHashSet<>();
    public HashSet<Base_RISCV_Register> initialed = new LinkedHashSet<>();
    public HashSet<Base_RISCV_Register> simplifyWorklist = new LinkedHashSet<>();
    public HashSet<Base_RISCV_Register> freezeWorklist = new LinkedHashSet<>();
    public HashSet<Base_RISCV_Register> spillWorklist = new LinkedHashSet<>();
    public HashSet<Base_RISCV_Register> spilledNodes = new LinkedHashSet<>();
    public HashSet<Base_RISCV_Register> coalescedNodes = new LinkedHashSet<>();
    public HashSet<Base_RISCV_Register> coloredNodes = new LinkedHashSet<>();
    public Stack<Base_RISCV_Register> selectStack = new Stack<>();

    //for move instructions
    //every move can only in one set
    public HashSet<RISCV_Instruction_Move> coalescedMoves = new LinkedHashSet<>();
    public HashSet<RISCV_Instruction_Move> constrainedMoves = new LinkedHashSet<>();
    public HashSet<RISCV_Instruction_Move> frozenMoves = new LinkedHashSet<>();
    public HashSet<RISCV_Instruction_Move> worklistMoves = new LinkedHashSet<>();
    public HashSet<RISCV_Instruction_Move> activeMoves = new LinkedHashSet<>();

    public Graph_Coloring(ASM_Module asm_module_) {
        asm_module = asm_module_;
        for (Map.Entry<String, ASM_Function> entry : asm_module.all_function.entrySet()) {
            Graph_Coloring_on_Function(entry.getValue());

        }
    }

    public void Graph_Coloring_on_Function(ASM_Function asm_function) {
        cur_function = asm_function;
        while (true) {
            SetInitialed_and_Compute_Spillcost();
            new LivenessAnalysis(asm_function);
            Build();
            MakeWorklist();
            do {
                if (!simplifyWorklist.isEmpty()) Simplify();
                else if (!worklistMoves.isEmpty()) Coalesce();
                else if (!freezeWorklist.isEmpty()) Freeze();
                else if (!spillWorklist.isEmpty()) SelectSpill();
            } while (!(simplifyWorklist.isEmpty() || worklistMoves.isEmpty() || freezeWorklist.isEmpty() || spillWorklist.isEmpty()));
            AssignColors();
            if (!spillWorklist.isEmpty()) {
                ReWritePrograms();
            } else break;
        }

    }

    private void SetInitialed_and_Compute_Spillcost() {


    }

    private void Build() {


    }

    private void MakeWorklist() {

    }

    private void Simplify() {

    }

    private void Coalesce() {

    }

    private void Freeze() {

    }

    private void SelectSpill() {

    }

    private void AssignColors() {

    }

    private void ReWritePrograms() {

    }


}
