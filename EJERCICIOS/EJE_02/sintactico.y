%{
#include <stdio.h>
extern int yylex(void);
extern int linea;
void yyerror(char *s);
%}
%token NUMERO
%token OPENKEY
%token CLOSEKEY
%token EOL
%%
statement_list: statement EOL
| statement_list statement EOL
;
statement: expression { printf("= %d\n", $1); }
;
expression: OPENKEY expression CLOSEKEY{ $$ = $2; }
| NUMERO { $$ = $1; }
;
%%
void yyerror(char *s)
{
printf("Error Sintactico %s",s);
}