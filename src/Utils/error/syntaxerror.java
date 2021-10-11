package Utils.error;

import Utils.position;

public class syntaxerror extends error{

    public syntaxerror(String msg, position pos) {
        super("syntax error can't build parser tree"+msg, pos);
    }
}
