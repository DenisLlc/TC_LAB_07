%{
    #include <stdio.h>
    extern int yylex(void);
    extern char *yytext;
    void yyerror(char *s);
%}
%token NUM
%%
stm_lst: stm '\n'
            | stm_lst stm '\n'
;
stm: exp {printf("= %d\n", $1);}
;
exp: '(' exp ')'    {$$=$2;}
        | NUM       {$$=$1;}
;
%%
void yyerror(char *s){
    printf("Error sintactico %s \n", s);
}
int main(int args, char **argv){
    yyparse();
    return 0;
}