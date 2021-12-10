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
//parameterlist include the declaratiob of type (used in function declar) while the vardeclarlist have the symbol '=' to make assign   while expressionlist is usually used in function call
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
            :'(' expression ')'                                                                                         #expr_parenexpr
             |expression op=(SELFPLUS|SELFSUB)                                                                           #expr_single_post
            |NEW newtype                                                                                                #expr_new
            |expression '.' Identifier                                                                                  #expr_member
            |expression '(' expressionlist? ')'                                                                         #expr_function
            |array=expression '['index=expression']'                                                                    #expr_array
            |<assoc=right> op=('!'|'~') expression                                                                         #expr_single
            |<assoc=right> op=('-'|'+') expression                                                                         #expr_single
            |<assoc=right>  op=('--'|'++') expression                                                                      #expr_single
            |operand1=expression op=('*'|'/'|'%') operand2=expression                                                   #expr_binary
            |operand1=expression op=('+'|'-') operand2=expression                                                       #expr_binary
            |operand1=expression op=('<<'|'>>') operand2=expression                                                     #expr_binary
                        |operand1=expression op=('=='|'!='|'>'|'>='|'<='|'<') operand2=expression                                   #expr_binary
            |operand1=expression op=('&&'|'||') operand2=expression                                                     #expr_binary
            |operand1=expression op=('&'|'|'|'^') operand2=expression                                                   #expr_binary
            |Lambda1 ('(' lambdapara=parameterlist? ')')? Lambda2 suite '(' (lambdaexprelist=expressionlist)? ')'       #expr_lambda
            |THIS                                                                                                       #expr_this
            |<assoc=right> operand1=expression '=' operand2=expression                                                  #expr_assign
            |allconst                                                            #expr_const
            |Identifier                                                                                                 #expr_idetifier
            ;
expressionlist:expression (','expression)*;
newtype:   nonarray ('[' expression']')+('['']')+('[' expression']')+ #newerror//设计成这样是为了防止被识别为 new int a[10][] [2] 把前面三个作为一个expr 后面作为数组的索引 其他乱七八糟的new的情况都被syntax干掉了 另外要注意这个要放在最上面不然还是被识别为原来一样的结果 这个可以在astbuilt的时候就被干掉
          |nonarray ('[' expression']')+('['']')*                      #newarray
         |nonarray '(' ')'                                           #newclass
        |nonarray                                                   #newclass
        ;
basictype:STRING|BOOL|INT;
nonarray:basictype|Identifier;
type:type '[' ']'                              #array
     |Identifier                               #class
     |basictype                               #basic
     ;
allconst:Logicconst|STRINGCONST|NULL|DecimalInteger ;
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


Logicconst:'true'|'false';
DecimalInteger
    : [1-9] [0-9]*
    | '0'
    ;
STRINGCONST:'"' (ESC|.)*? '"';
fragment
ESC:'\\"'|'\\\\'|'\\n';//to make Escape character reachable

Identifier
    : [a-zA-Z] [a-zA-Z_0-9]*
    ;

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

