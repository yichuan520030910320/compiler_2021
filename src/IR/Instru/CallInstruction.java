package IR.Instru;

import IR.IRbasicblock.IRbasicblock;
import IR.IRfunction.IRfunction;
import IR.IRvisitor;
import IR.Operand.BaseOperand;
import IR.Operand.Register;

import java.util.LinkedList;

//%call.0 = call i32 @test_function(i32 %b.0) or call void @gan() or     %call.0 = call i32 @test_function(i32 %b.0, i32 %a.0)
public class CallInstruction extends BaseInstru {
    public Register call_result;
    public LinkedList<BaseOperand> paralist;
    public IRfunction call_fuction;

    public CallInstruction(IRbasicblock iRbasicblock, Register call_result_, LinkedList<BaseOperand> paralist_, IRfunction call_fuction_) {
        super(iRbasicblock);
        call_result = call_result_;
        paralist = paralist_;
        call_fuction = call_fuction_;
        if (call_result!=null)call_result.Add_def(this);
        if (paralist!=null){
            for (BaseOperand baseOperand : paralist) {
                baseOperand.Add_be_used(this);
            }
        }
        call_fuction.Add_be_used(this);


    }

    @Override
    public void accept(IRvisitor visitor) {
        visitor.visit(this);
    }
// only for     call void @printInt(i32 1) and when the call stand for operand I display in anotherway
    @Override
    public String toString() {
        StringBuilder result_string=new StringBuilder();
        if (call_result!=null) result_string.append(call_result).append(" = ");
        result_string.append("call ").append(call_fuction.function_type.returntype.toString()).append(" ");
        result_string.append("@").append(call_fuction.functionname).append("(");
        if (paralist!=null){
            for (int i = 0; i <paralist.size() ; i++) {
                result_string.append(call_fuction.function_type.parament_list.get(i).type+" "+paralist.get(i).toString());
                if (i!=paralist.size()-1)result_string.append(", ");
            }
        }
        result_string.append(")");
        return result_string.toString();
    }
}
