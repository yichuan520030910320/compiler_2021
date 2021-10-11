package Utils.error;

import Utils.position;

public class semanticerror extends error{
    public semanticerror(String msg, position pos) {
        super("semantic error : "+msg, pos);
    }
}
