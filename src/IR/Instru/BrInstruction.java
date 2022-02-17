package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.BaseOperand;
import IR.Operand.Register;

public class BrInstruction extends BaseInstru {
    public BaseOperand cond;
    public IRbasicblock true_block;
    public IRbasicblock false_block;
    public BrInstruction(IRbasicblock iRbasicblock,BaseOperand cond_,IRbasicblock true_block_,IRbasicblock false_block_) {
        super(iRbasicblock);
        cond=cond_;
        true_block=true_block_;
        false_block=false_block_;
        //add the relation
        if (cond!=null){
            if (cond instanceof Register) cond.Add_be_used(this);
            Current_Basicblock.nxt_basic_block.add(false_block);
            false_block.pre_basicblock.add(Current_Basicblock);
            false_block.Add_def(this);
        }
        true_block.Add_def(this);
        Current_Basicblock.nxt_basic_block.add(true_block);
        true_block.pre_basicblock.add(Current_Basicblock);
    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

//    br label %returnBlock.0  || br i1 %greaterThan.0, label %ifThenBlock.0, label %ifElseBlock.0
    @Override
    public String toString() {
        if (cond==null)return "br label %"+true_block.toString();
        else return "br "+cond.unit_output()+", label %"+true_block.toString()+", label %"+false_block.toString();
    }


}
