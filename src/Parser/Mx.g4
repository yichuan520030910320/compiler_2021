grammar Mx;
@header {
package Parser;
}
program:(programunit)*;
programunit:classdef                                       #programunit_class
           |vardeclarstat                                  #programunit_vardeclar
           |fundeclar                                      #programunit_fun
           |';'                                            #programunit_semi
           ;

classdef:CLASS calssname=Identifier '{'(constructdeclar|fundeclar|vardeclarstat)* '}'';';
constructdeclar:Identifier'('parameterlist? ')'suite;
fundeclar:(Void|type) Identifier '(' parameterlist?')' suite;
//parameterlist include the declaratiob of type (used in function declar)while the vardeclarlist have the symbol '=' to make assign while expressionlist is usually used in function call
parameterlist:type Identifier (',' type Identifier)*;
vardeclarstat:vardeclarlist ';';
vardeclarlist:type vardeclar (','vardeclar)*;
vardeclar:Identifier ('=' expression)?;
suite : '{' statement* '}';

statement
    : suite                                                                                                                             #stat_suite
    |vardeclarstat                                                                                                                      #stat_vardeclar
    |BREAK ';'                                                                                                                          #stat_break
    |CONTINUE ';'                                                                                                                       #stat_continue
    | ';'                                                                                                                               #stat_semi
    |Return (expression)? ';'                                                                                                           #stat_return
    |expression';'                                                                                                                      #stat_expr
    |If '(' codition=expression')'  thenstat=statement (Else elsestat=statement)?                                                       #stat_if
    |WHILE '('codition=expression ')' whilestat=statement                                                                               #stat_while
    |FOR '(' (initvar=vardeclarlist|initexpr=expression)? ';' (codition=expression)?  ';' (incr=expression)?  ')' forstat=statement     #stat_for
    ;

expression
            :Identifier                                                                                                 #expr_idetifier
            |THIS                                                                                                       #expr_this
            |(LOGIC_CONST|STRINGCONST|NULL|DecimalInteger)                                                                #expr_const
            |'(' expression ')'                                                                                         #expr_parenexpr
            |<assoc=right> operand1=expression '=' operand2=expression                                                  #expr_assign
            |expression op=(SELFPLUS|SELFSUB)                                                                           #expr_single
            |NEW newtype                                                                                                #expr_new
            |expression '.' Identifier                                                                                  #expr_member
            |expression '(' expressionlist? ')'                                                                         #expr_function
            |array=expression '['index=expression']'                                                                    #expr_array
            |<assoc=right> ('!'|'~') expression                                                                         #expr_single
            |<assoc=right> ('-'|'+') expression                                                                         #expr_single
            |<assoc=right>  ('--'|'++') expression                                                                      #expr_single
            |operand1=expression op=('*'|'/'|'%') operand2=expression                                                   #expr_binary
            |operand1=expression op=('+'|'-') operand2=expression                                                       #expr_binary
            |operand1=expression op=('<<'|'>>') operand2=expression                                                     #expr_binary
            |operand1=expression op=('&&'|'||') operand2=expression                                                     #expr_binary
            |operand1=expression op=('&'|'|'|'^') operand2=expression                                                   #expr_binary
            |operand1=expression op=('=='|'!='|'>'|'>='|'<='|'<') operand2=expression                                   #expr_binary
            |Lambda1 ('(' lambdapara=parameterlist? ')')? Lambda2 suite '(' (lambdaexprelist=expressionlist)? ')'       #expr_lambda
            ;
expressionlist:expression (','expression)*;
newtype:nonarray ('[' expression']')+('['']')*                      #newarray
        |nonarray ('[' expression']')+('['']')+('[' expression']')+ #newerror
        |nonarray '(' ')'                                           #newclass
        |nonarray                                                   #newclass
        ;
basictype:STRING|BOOL|INT;
nonarray:basictype|Identifier;
type:type '[' ']'                              #array
     |Identifier                               #class
     |basictype                               #basic
     ;
//key word
INT:'int';
BOOL:'bool';
STRING:'string';
If : 'if';
Else : 'else';
Return : 'return';
Void:'void';
FOR:'for';
WHILE:'while';
BREAK:'break';
CONTINUE:'continue';
NEW:'new';
CLASS:'class';
THIS:'this';
NULL:'null';
TRUE:'true';
FALSE:'false';

LeftParen : '(';
RightParen : ')';
LeftBracket : '[';
RightBracket : ']';
LeftBrace : '{';
RightBrace : '}';

Less : '<';
LessEqual : '<=';
Greater : '>';
GreaterEqual : '>=';
LeftShift : '<<';
RightShift : '>>';

Plus : '+';
Minus : '-';
MUL:'*';
DIV:'/';
MOD:'%';
SELFPLUS:'++';
SELFSUB:'--';

And : '&';
Or : '|';
AndAnd : '&&';
OrOr : '||';
Xor : '^';
Not : '!';
Tilde : '~';

//Delimiter
Question : '?';
Colon : ':';
Semi : ';';
Comma : ',';

Assign : '=';
Equal : '==';
NotEqual : '!=';

//Special symbol
Dot:'.';
Lambda1:'[&]';
Lambda2:'->';


LOGIC_CONST:FALSE|TRUE;
Identifier
    : [a-zA-Z] [a-zA-Z_0-9]*
    ;
DecimalInteger
    : [1-9] [0-9]*
    | '0'
    ;
STRINGCONST:'"' (ESC|.)*? '"';
fragment
ESC:'\\"'|'\\\\'|'\\n';//to make Escape character reachable

//white space and comment
Whitespace
    :   [ \t]+
        -> skip
    ;
Newline
    :   (   '\r' '\n'?
        |   '\n'
        )
        -> skip
    ;
BlockComment
    :   '/*' .*? '*/'
        -> skip
    ;
LineComment
    :   '//' ~[\r\n]*
        -> skip
    ;

