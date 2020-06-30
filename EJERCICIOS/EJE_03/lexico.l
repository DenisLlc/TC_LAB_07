%{
#include "sintactico.tab.h" 
#include "string.h"
int yyparse();
%}
cadena [a-zA-Z]+
numero [0-9]+
%%
{cadena} {return(CAD);};
{numero} {return(NUM);}; 
"+" {return(MAS);};
"\n" {return(EOL);};
. ;
%%
int yywrap(){ return 0;}
void main(){
yyparse();
}