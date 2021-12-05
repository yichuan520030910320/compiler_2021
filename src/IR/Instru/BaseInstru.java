package IR.Instru;

import IR.IRbasicblock.IRbasicblock;

abstract  class BaseInstru {
    public BaseInstru PreInstru;
    public BaseInstru NxtInstru;
    public IRbasicblock Current_Basicblock;
public BaseInstru(IRbasicblock iRbasicblock){
    this.Current_Basicblock=iRbasicblock;
}


}
