%{
    #include "sintactico.tab.h"
    #include "string.h"
    /*extern yylval*/
%}
numero [0-9]+
variable [a-zA-Z]+
%%
{numero}    {yylval.nombre_variable=atoi(yytext); return(NUM);}
{variable}  {yylval.valor=yytext; return(VAR);}
\+          {return(MAS)}
[\t]        ;
[\n]        {return(EOL);}
.           return yytext[0];
%%
int yywrap(){
    return 0;
}