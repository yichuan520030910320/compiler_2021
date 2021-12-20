package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;
import IR.Operand.Register;
import IR.TypeSystem.Typesystem;

public class BitCastInstruction extends BaseInstru{
    Register result_reg;
    Register source_reg;
    Typesystem targettype;
    public BitCastInstruction(IRbasicblock iRbasicblock,Register result_reg_,Register source_reg_,Typesystem targettype_) {
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
