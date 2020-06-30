%{
    #include <stdio.h>
    extern int yylex(void);
    extern char *yytext;
    void yyerror(char *s);
%}
%token NUM
%token VAR
%token MAS
%token EOL

%union{
    char nombre_variable[100];
    int valor;
}
%%
entrada: expcad EOL {printf("Reconocio una expresion de variables\n");}
            |expnum EOL {printf("Reconocio una expresion de numeros\n");}
            |expcad MAS expnum {printf("Combinacion entre variables y numeros\n");}
            |expnum MAS expvar {printf("Combinacion entre numeros y variables\n");}
;
expcad: expcad MAS expcad {printf("Suma de variables\n");}
        |VAR                {printf("Se reconocio variable\n");}
;
expnum: expnum MAS expnum {printf("Suma de numeros\n");}
        |NUM                {printf("Se reconocio numero\n");}
;
%%
void yyerror(char *s){
    printf("Error sintactico %s \n", s);
}
int main(int args, char **argv){
    yyparse();
    return 0;
}

