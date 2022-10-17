grammar MxStar;

expr
  : DecimalInt
  | expr '+' expr
  ;
WS: [\t\r\n]+ -> skip;
DecimalInt: [1-9][0-9]* | '0';