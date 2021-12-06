package Utils.error;

import Utils.position;

public class IRbuilderError extends Error{
    public IRbuilderError(String msg, position pos) {
        super("irbuilder error : "+msg, pos);
    }
}
