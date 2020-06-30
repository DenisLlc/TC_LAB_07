%{
#include "sintactico.tab.h"
#include "string.h"
int yyparse();
%}
exp [0-9]+
%%
{exp} { yylval=atoi(yytext); return(NUMERO);};
"{" {return(OPENKEY);};
"}" {return(CLOSEKEY);};
\n {return(EOL);};
.   return yytext[0];
%%
int yywrap(){ return 0;}
void main(){
yyparse();
}