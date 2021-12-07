package IR.Instru;

import AST.ASTvisitor;
import IR.IRbasicblock.IRbasicblock;
import IR.IRvisitor;

public abstract class BaseInstru {
    public IRbasicblock Current_Basicblock;

    public BaseInstru(IRbasicblock iRbasicblock) {
        Current_Basicblock = iRbasicblock;
    }

    abstract public void accept(IRvisitor visitor);
    abstract public String toString();


}
