package Utils.error;

import Utils.position;

public class InstSelectError extends Error {
    public InstSelectError(String msg, position pos) {
        super("instslect error : "+msg, pos);
    }
}
