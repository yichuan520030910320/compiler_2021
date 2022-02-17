package MidEndOptimizen;

import IR.IRmodule.IRmodule;

public abstract class IR_Pass {
    public IRmodule iRmodule;
    public boolean changed=false;
    IR_Pass(IRmodule iRmodule_){
        iRmodule=iRmodule_;
    }
    abstract boolean run();
}
