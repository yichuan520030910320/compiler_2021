package Utils.error;

import Utils.position;

public class SemanticError extends Error {
    public SemanticError(String msg, position pos) {
        super("semantic error : "+msg, pos);
    }
}
