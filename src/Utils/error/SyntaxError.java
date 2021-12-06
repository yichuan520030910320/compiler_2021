package Utils.error;

import Utils.position;

public class SyntaxError extends Error {

    public SyntaxError(String msg, position pos) {
        super("syntax error can't build parser tree"+msg, pos);
    }
}
