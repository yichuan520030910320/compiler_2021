package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;

public class CmpInstruction extends BaseInstru{
    public CmpInstruction(IRbasicblock iRbasicblock) {
        super(iRbasicblock);
    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return null;
    }
}
