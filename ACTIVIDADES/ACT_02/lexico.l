%{
    #include "sintactico.tab.h"
    /*extern yylval*/
%}
numero [0-9]+
%%
{numero}    {yylval=atoi(yytext); return(NUM);}
[\t]        ;
[\n]        {return(EOL);}
.           return yytext[0];
%%
int yywrap(){
    return 0;
}