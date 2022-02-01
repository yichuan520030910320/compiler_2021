package Optimize;

import RISCV.ASM_Basicblock.ASM_Basicblock;
import RISCV.ASM_Function.ASM_Function;
import RISCV.ASM_Module.ASM_Module;
import RISCV.Instruction.*;
import RISCV.Operand.Imm.Immediate;
import RISCV.Operand.Register.Base_RISCV_Register;
import RISCV.Operand.Register.Physical_Register;
import RISCV.Operand.Register.Virtual_Register;
import org.antlr.v4.runtime.misc.Pair;

import java.util.*;

public class Graph_Coloring {
    //inspired by the tiger book chapter11
    public ASM_Module asm_module;
    private ASM_Function cur_function;
    // Except zero, sp, gp and tp.
    private static final int K = 28;

    public LivenessAnalysis livenessAnalysis;
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

    //other data structure
    public HashSet<Pair<Base_RISCV_Register, Base_RISCV_Register>> adjSet = new HashSet<>();
    public HashMap<Base_RISCV_Register, HashSet<Base_RISCV_Register>> adjList = new HashMap<>();
    public HashMap<Base_RISCV_Register, Integer> degree = new HashMap<>();
    public HashMap<Base_RISCV_Register, HashSet<RISCV_Instruction_Move>> moveList = new HashMap<>();
    public HashMap<Base_RISCV_Register, Base_RISCV_Register> alias = new HashMap<>();
    public HashMap<Base_RISCV_Register, Integer> color_ = new HashMap<>();

    public Physical_Register s0;
    public ListIterator<Base_RISCV_Instruction> it;

    public Graph_Coloring(ASM_Module asm_module_) {
        asm_module = asm_module_;
        s0 = asm_module_.physical_registers.get(8);
        for (Map.Entry<String, ASM_Function> entry : asm_module.all_function.entrySet()) {
            Graph_Coloring_on_Function(entry.getValue());

        }
    }

    public void Graph_Coloring_on_Function(ASM_Function asm_function) {
        cur_function = asm_function;
        while (true) {
            SetInitialed();
            Compute_SpillCost();
            livenessAnalysis = new LivenessAnalysis(asm_function);
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

    private void SetInitialed() {
        //initial
        precolored = new LinkedHashSet<>();
        initialed = new LinkedHashSet<>();
        simplifyWorklist = new LinkedHashSet<>();
        freezeWorklist = new LinkedHashSet<>();
        spillWorklist = new LinkedHashSet<>();
        spilledNodes = new LinkedHashSet<>();
        coalescedNodes = new LinkedHashSet<>();
        coloredNodes = new LinkedHashSet<>();
        selectStack = new Stack<>();

        //for move instructions
        //every move can only in one set
        coalescedMoves = new LinkedHashSet<>();
        constrainedMoves = new LinkedHashSet<>();
        frozenMoves = new LinkedHashSet<>();
        worklistMoves = new LinkedHashSet<>();
//        the move instructions that failed to the briggs test
        activeMoves = new LinkedHashSet<>();

        //other data structure
        adjSet = new HashSet<>();
        adjList = new HashMap<>();
        degree = new HashMap<>();
        moveList = new HashMap<>();
        alias = new HashMap<>();
        color_ = new HashMap<>();
        //collect all the register (either physic or virtual)
        for (int i = 0; i < cur_function.asm_basicblock_in_function.size(); i++) {
            ASM_Basicblock asm_basicblock = cur_function.asm_basicblock_in_function.get(i);
            for (int j = 0; j < asm_basicblock.Riscv_instruction_in_block.size(); j++) {
                Base_RISCV_Instruction base_riscv_instruction = asm_basicblock.Riscv_instruction_in_block.get(i);
                initialed.addAll(base_riscv_instruction.def_reg);
                initialed.addAll(base_riscv_instruction.use_reg);
            }
        }
        //init physic reg and add to precolored
        for (int i = 0; i < asm_module.physical_registers.size(); i++) {
            Base_RISCV_Register base_riscv_register = asm_module.physical_registers.get(i);
            precolored.add(base_riscv_register);

            adjList.put(base_riscv_register, new HashSet<>());
            degree.put(base_riscv_register, Integer.MAX_VALUE);
            moveList.put(base_riscv_register, new HashSet<>());
            alias.put(base_riscv_register, null);
            color_.put(base_riscv_register, i);
        }
        //remove the physical reg from the initialed
        initialed.removeAll(precolored);
        //init the initialed reg
        for (Base_RISCV_Register base_riscv_register : initialed) {
            adjList.put(base_riscv_register, new HashSet<>());
            degree.put(base_riscv_register, 0);
            moveList.put(base_riscv_register, new HashSet<>());
            alias.put(base_riscv_register, null);
            color_.put(base_riscv_register, 0);
        }
    }

    private void Compute_SpillCost() {
        //naive
        //inspired by hz and cater the formula in P173 tiger book
        //can be optimized by the loop analysis but anyhow it doesn't influence the correctness
        for (int i = 0; i < cur_function.asm_basicblock_in_function.size(); i++) {
            ASM_Basicblock asm_basicblock = cur_function.asm_basicblock_in_function.get(i);
            double loop_factor = Math.pow(10, Math.min(asm_basicblock.nxt_basicblock.size(), asm_basicblock.pre_basicblock.size()));
            for (int j = 0; j < asm_basicblock.Riscv_instruction_in_block.size(); j++) {
                Base_RISCV_Instruction base_riscv_instruction = asm_basicblock.Riscv_instruction_in_block.get(i);
                for (Base_RISCV_Register base_riscv_register : base_riscv_instruction.def_reg)
                    base_riscv_register.spill_factor += loop_factor;
                for (Base_RISCV_Register base_riscv_register : base_riscv_instruction.use_reg)
                    base_riscv_register.spill_factor += loop_factor;
            }
        }
    }

    private void Build() {
        for (int i = 0; i < cur_function.asm_basicblock_in_function.size(); i++) {
            ASM_Basicblock asm_basicblock = cur_function.asm_basicblock_in_function.get(i);
            HashSet<Base_RISCV_Register> live = livenessAnalysis.block_liveout.get(asm_basicblock);
            for (int j = asm_basicblock.Riscv_instruction_in_block.size() - 1; j >= 0; j--) {
                Base_RISCV_Instruction base_riscv_instruction = asm_basicblock.Riscv_instruction_in_block.get(j);
                if (base_riscv_instruction instanceof RISCV_Instruction_Move) {
                    //because it's move instruction so we change the live set
                    live.removeAll(base_riscv_instruction.use_reg);
                    for (Base_RISCV_Register base_riscv_register : base_riscv_instruction.def_reg)
                        moveList.get(base_riscv_register).add((RISCV_Instruction_Move) base_riscv_instruction);
                    for (Base_RISCV_Register base_riscv_register : base_riscv_instruction.use_reg)
                        moveList.get(base_riscv_register).add((RISCV_Instruction_Move) base_riscv_instruction);
                    worklistMoves.add((RISCV_Instruction_Move) base_riscv_instruction);
                }
                live.addAll(base_riscv_instruction.def_reg);
                for (Base_RISCV_Register base_riscv_register : base_riscv_instruction.def_reg)
                    for (Base_RISCV_Register base_riscv_register1 : live)
                        AddEdge(base_riscv_register, base_riscv_register1);
                live.removeAll(base_riscv_instruction.def_reg);
                live.addAll(base_riscv_instruction.use_reg);
            }
        }
    }

    private void MakeWorklist() {
        for (Base_RISCV_Register base_riscv_register : initialed) {
            initialed.remove(base_riscv_register);
            if (degree.get(base_riscv_register) >= K) spillWorklist.add(base_riscv_register);
            else if (MoveRelated(base_riscv_register)) freezeWorklist.add(base_riscv_register);
            else simplifyWorklist.add(base_riscv_register);
        }
    }

    private void Simplify() {
        //get an element in the set ,so we choose the first element
        Base_RISCV_Register base_riscv_register = simplifyWorklist.iterator().next();
        simplifyWorklist.remove(base_riscv_register);
        selectStack.push(base_riscv_register);
        //decrease the degree
        for (Base_RISCV_Register m : Adjacent(base_riscv_register)) DecrementDegree(m);
    }

    //coalesce rd rs1 of move instructions in worklist
    private void Coalesce() {
        RISCV_Instruction_Move m = worklistMoves.iterator().next();
        Base_RISCV_Register x = GetAlias(m.rd);
        Base_RISCV_Register y = GetAlias(m.rs1);
        Base_RISCV_Register u, v;
        if (precolored.contains(y)) {
            u = y;
            v = x;
        } else {
            u = x;
            v = y;
        }
        worklistMoves.remove(m);
        if (u == v) {
            //when u==v we coalesce it directly
            coalescedMoves.remove(m);
            AddWorklist(u);
        } else if (precolored.contains(u) || adjSet.contains(new Pair<>(u, v))) {
            //the registers of the move instructions is constrained (in other work these two registers are contracted)
            constrainedMoves.add(m);
            AddWorklist(u);
            AddWorklist(v);
        } else {
            boolean flag = true;
            for (Base_RISCV_Register t : Adjacent(v)) flag &= OK(t, u);
            HashSet<Base_RISCV_Register> union = new HashSet<>(Adjacent(u));
            union.addAll(Adjacent(v));
            if ((precolored.contains(u) && flag) || (!precolored.contains(u)) && Conservative(union)) {
                //pass the test and eventually combine
                coalescedMoves.add(m);
                Combine(u, v);
                AddWorklist(u);
            } else activeMoves.add(m);
        }
    }

    private void Freeze() {
        Base_RISCV_Register u = freezeWorklist.iterator().next();
        freezeWorklist.remove(u);
        simplifyWorklist.add(u);
        FrezzeMoves(u);
    }

    private void SelectSpill() {
        Base_RISCV_Register m = null;
        double MAX = Double.POSITIVE_INFINITY;
        for (Base_RISCV_Register tmp : spillWorklist) {
            if ((tmp.spill_factor / degree.get(tmp)) < MAX) {
                m = tmp;
                MAX = tmp.spill_factor / degree.get(tmp);
            }
        }

        spillWorklist.remove(m);
        simplifyWorklist.add(m);
        FrezzeMoves(m);
    }

    private void AssignColors() {
        while (!selectStack.isEmpty()) {
            Base_RISCV_Register n = selectStack.pop();
            ArrayList<Physical_Register> okColors = new ArrayList<>(asm_module.okColors);
            //delete the already colored  color
            for (Base_RISCV_Register w : adjList.get(n)) {
                HashSet<Base_RISCV_Register> union = new HashSet<>(coloredNodes);
                union.addAll(precolored);
                if (union.contains(GetAlias(w)))
                    okColors.remove(asm_module.physical_registers.get(color_.get(GetAlias(w))));
            }
            //spill or coloring
            if (okColors.size() == 0) {
                spilledNodes.add(n);
            } else {
                coloredNodes.add(n);
                Physical_Register tmp = okColors.get(0);
                Integer c = asm_module.physical_registerIntegerHashMap.get(tmp);
                color_.replace(n, c);
            }
        }
        //assign the color for the coalesced node
        for (Base_RISCV_Register n : coalescedNodes) color_.replace(n, color_.get(GetAlias(n)));

    }

    private void ReWritePrograms() {
        for (int i = 0; i < cur_function.asm_basicblock_in_function.size(); i++) {
            ASM_Basicblock curbasicblock = cur_function.asm_basicblock_in_function.get(i);
            it = curbasicblock.Riscv_instruction_in_block.listIterator(0);
            while (it.hasNext()) {
                //note that the first it.next mean the first element
                Base_RISCV_Instruction instruction = it.next();

                Virtual_Register add_to_def = null;
                for (Base_RISCV_Register reg : instruction.def_reg) {
                    if (spilledNodes.contains(reg)) {
                        assert reg instanceof Virtual_Register;
                        Virtual_Register virtual_register_spill = new Virtual_Register("virtual_register_spill_def", ((Virtual_Register) reg).byte_num);
                        if (cur_function.Virtual_to_offset.containsKey(reg))
                            cur_function.alloca((Virtual_Register) reg, ((Virtual_Register) reg).byte_num);
                        int imm_ = -cur_function.Virtual_to_offset.get(reg);
                        if (checkimmrange(imm_)) {
                            it.add(new RISCV_Instruction_Store(virtual_register_spill.byte_num, s0, virtual_register_spill, new Immediate(imm_)));
                        } else {
                            Virtual_Register li_dest_in_graphcoloring = new Virtual_Register("li_dest_in_graphcoloring_def", 4);
                            it.add(new RISCV_Instruction_Li(li_dest_in_graphcoloring, new Immediate(imm_)));
                            it.add(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, s0, li_dest_in_graphcoloring, li_dest_in_graphcoloring, null));
                            it.add(new RISCV_Instruction_Store(virtual_register_spill.byte_num, li_dest_in_graphcoloring, virtual_register_spill, new Immediate(0)));
                        }
                        add_to_def = virtual_register_spill;
                        instruction.rd = virtual_register_spill;
                    }
                }
                if (add_to_def != null) {
                    instruction.def_reg.clear();
                    instruction.def_reg.add(add_to_def);
                }

                HashMap<Base_RISCV_Register, Base_RISCV_Register> origin_to_new = new HashMap<>();
                for (Base_RISCV_Register reg : instruction.use_reg) {
                    if (spilledNodes.contains(reg)) {
                        assert reg instanceof Virtual_Register;
                        Virtual_Register virtual_register_spill = new Virtual_Register("virtual_register_spill_use", ((Virtual_Register) reg).byte_num);
                        if (cur_function.Virtual_to_offset.containsKey(reg))
                            cur_function.alloca((Virtual_Register) reg, ((Virtual_Register) reg).byte_num);
                        int imm_ = -cur_function.Virtual_to_offset.get(reg);
                        it.previous();
                        if (checkimmrange(imm_)) {
                            it.add(new RISCV_Instruction_Load(virtual_register_spill.byte_num, s0, virtual_register_spill, new Immediate(imm_)));
                        } else {
                            Virtual_Register li_dest_in_graphcoloring = new Virtual_Register("li_dest_in_graphcoloring_use", 4);
                            it.add(new RISCV_Instruction_Li(li_dest_in_graphcoloring, new Immediate(imm_)));
                            it.add(new RISCV_Instruction_Binary(RISCV_Instruction_Binary.RISCVBinarytype.add, s0, li_dest_in_graphcoloring, li_dest_in_graphcoloring, null));
                            it.add(new RISCV_Instruction_Load(virtual_register_spill.byte_num, li_dest_in_graphcoloring, virtual_register_spill, new Immediate(0)));
                        }
                        it.next();
                        origin_to_new.put(reg, virtual_register_spill);
                    }
                }
                for (Map.Entry<Base_RISCV_Register, Base_RISCV_Register> entry : origin_to_new.entrySet()) {
                    if (instruction.rs1 == entry.getKey()) instruction.rs1 = entry.getValue();
                    else if (instruction.rs2 == entry.getKey()) instruction.rs2 = entry.getValue();
                    instruction.use_reg.remove(entry.getKey());
                    instruction.use_reg.add(entry.getValue());
                }
            }
        }
    }

    private boolean checkimmrange(int imm_) {
        return imm_ >= -2048 && imm_ < 2048;
    }


    private void AddEdge(Base_RISCV_Register u, Base_RISCV_Register v) {
        if (u != v && !adjSet.contains(new Pair<>(u, v))) {
            //the contain of new element is correct because the pair has write the function equal and the contain transfer the equal function
            //theh u!=v is the compare between the quote
            adjSet.add(new Pair<>(u, v));
            adjSet.add(new Pair<>(v, u));
            if (!precolored.contains(u)) {
                adjList.get(u).add(v);
                degree.replace(u, degree.get(u) + 1);
            }
            if (!precolored.contains(v)) {
                adjList.get(v).add(u);
                degree.replace(v, degree.get(v) + 1);
            }
        }
    }

    private boolean MoveRelated(Base_RISCV_Register base_riscv_register) {
        return NodeMoves(base_riscv_register).size() != 0;

    }

    //still active move instructions
    private HashSet<RISCV_Instruction_Move> NodeMoves(Base_RISCV_Register base_riscv_register) {
        HashSet<RISCV_Instruction_Move> moveHashSet = new HashSet<>(activeMoves);
        moveHashSet.addAll(worklistMoves);
        moveHashSet.retainAll(moveList.get(base_riscv_register));
        return moveHashSet;
    }

    private HashSet<Base_RISCV_Register> Adjacent(Base_RISCV_Register base_riscv_register) {
        HashSet<Base_RISCV_Register> registerHashSet = new HashSet<>(adjList.get(base_riscv_register));
        HashSet<Base_RISCV_Register> registerHashSet1 = new HashSet<>(coalescedNodes);
        registerHashSet1.addAll(selectStack);
        registerHashSet.removeAll(registerHashSet1);
        return registerHashSet;
    }

    private void DecrementDegree(Base_RISCV_Register base_riscv_register) {
        int d = degree.get(base_riscv_register);
        degree.replace(base_riscv_register, d - 1);
        //the spill can be changed into simplify or freeze
        if (d == K) {
            HashSet<Base_RISCV_Register> registerHashSet = new HashSet<>(Adjacent(base_riscv_register));
            registerHashSet.add(base_riscv_register);
            EnableMoves(registerHashSet);
            if (MoveRelated(base_riscv_register)) {
                freezeWorklist.add(base_riscv_register);
            } else simplifyWorklist.add(base_riscv_register);
        }
    }

    //the active move may be changed into moveworklist because of the decrease of the degree
    private void EnableMoves(HashSet<Base_RISCV_Register> nodes) {
        for (Base_RISCV_Register n : nodes)
            for (RISCV_Instruction_Move m : NodeMoves(n)) {
                if (activeMoves.contains(m)) {
                    activeMoves.remove(m);
                    worklistMoves.add(m);
                }
            }

    }

    //remove from the freeze and add to simpilfy
    private void AddWorklist(Base_RISCV_Register u) {
        if ((!precolored.contains(u)) && (!MoveRelated(u)) && (degree.get(u) < K)) {
            freezeWorklist.remove(u);
            simplifyWorklist.add(u);
        }
    }

    //george test
    private boolean OK(Base_RISCV_Register t, Base_RISCV_Register r) {
        return degree.get(t) < K || precolored.contains(t) || adjSet.contains(new Pair<>(t, r));
    }

    //the number of high degree neighbor node less than K
    private boolean Conservative(HashSet<Base_RISCV_Register> nodes) {
        int k = 0;
        for (Base_RISCV_Register n : nodes) {
            if (degree.get(n) >= K) k++;
        }
        return k < K;
    }

    //find the external merge node
    private Base_RISCV_Register GetAlias(Base_RISCV_Register n) {
        if (coalescedNodes.contains(n)) return GetAlias(alias.get(n));
        else return n;
    }

    private void Combine(Base_RISCV_Register u, Base_RISCV_Register v) {
        //remove the u from the spill or freeze list
        if (freezeWorklist.contains(v)) freezeWorklist.remove(v);
        else spillWorklist.remove(v);
        coalescedNodes.add(v);
        alias.replace(v, u);
        moveList.get(u).addAll(moveList.get(v));

        //the neighbor of v may enable to move
        HashSet<Base_RISCV_Register> tmp = new HashSet<>();
        tmp.add(v);
        EnableMoves(tmp);

        //add contradict of t's neighbor to u
        for (Base_RISCV_Register t : Adjacent(v)) {
            AddEdge(t, u);
            DecrementDegree(t);
        }
        //the change of u may lead to its move from freeze list to spill list
        if (degree.get(u) >= K && freezeWorklist.contains(u)) {
            freezeWorklist.remove(u);
            spillWorklist.add(u);
        }
    }

    private void FrezzeMoves(Base_RISCV_Register u) {
        //freeze the node u and change the state of u's neighbor
        for (RISCV_Instruction_Move m : NodeMoves(u)) {
            Base_RISCV_Register x = m.rd;
            Base_RISCV_Register y = m.rs1;
            Base_RISCV_Register v;
            if (GetAlias(y) == GetAlias(u)) v = GetAlias(x);
            else v = GetAlias(y);
            activeMoves.remove(m);
            frozenMoves.add(m);
            //the change of v may let it can be simplified
            if (NodeMoves(v).size() == 0 && degree.get(v) < K) {
                freezeWorklist.remove(v);
                simplifyWorklist.add(v);
            }
        }

    }


}