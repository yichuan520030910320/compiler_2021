package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.BaseOperand;
import IR.Operand.Register;
import IR.TypeSystem.Typesystem;

public class BitCastInstruction extends BaseInstru{
    public Register result_reg;
    public BaseOperand source_reg;
    public Typesystem targettype;
    public BitCastInstruction(IRbasicblock iRbasicblock,Register result_reg_,BaseOperand source_reg_,Typesystem targettype_) {
        super(iRbasicblock);


        result_reg=result_reg_;
        source_reg=source_reg_;
        targettype=targettype_;
    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return result_reg+" = bitcast "+source_reg.unit_output()+" to "+targettype;
    }
}
