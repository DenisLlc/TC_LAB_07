%{
    #include <stdio.h>
    extern int yylex(void);
    extern char *yytext;
    void yyerror(char *s);
%}
%token NUM
%token EOL

%left '+' '-'
%left '*'
%left '/'
%%
stm_lst: stm EOL
            | stm_lst stm EOL
;
stm: exp {printf("= %d\n", $1);}
;
exp:   exp '+' exp      {$$ = $1 + $3;}
        |exp '-' exp    {$$ = $1 - $3;}
        |exp '*' exp    {$$ = $1 * $3;}
        |exp '/' exp    {
                            if($3 != 0) 
                                $$ = $1 / $3;
                            else{
                                yyerror("NO existe division entre cero\n");
                                $$ = -1;
                            }
                                
                        }
        |'(' exp ')'    {$$ = $2;}
        |NUM            {$$ = $1;}
;
%%
void yyerror(char *s){
    printf("Error sintactico %s \n", s);
}
int main(int args, char **argv){
    yyparse();
    return 0;
}

