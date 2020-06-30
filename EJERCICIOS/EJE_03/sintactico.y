%{
#include <stdio.h>
extern int yylex(void);
extern int linea;
void yyerror(char *s);
%}
%union {
char cadena[100];
int numero;
}
%token <numero> NUM
%token <cadena> CAD
%token MAS
%token EOL

%left MAS

%%
entrada: expcad EOL {printf("Expresion reconocida \n");}
|expnum EOL {printf("Expresion reconocida \n");}
|expcad MAS expnum {printf("Es una operacion entre numeros y variables\n");}
|expnum MAS expcad {printf("Es una operacion entre numeros y variables\n");}
;
expcad: expcad MAS expcad {printf("Es una suma de variables \n");}
| CAD {printf("Es una variable \n");}
;
expnum: expnum MAS expnum {printf("Es una suma de numeros\n");}
| NUM {printf("Es un numero \n");}
;
%%
void yyerror(char *s)
{
printf("%s",s);
}