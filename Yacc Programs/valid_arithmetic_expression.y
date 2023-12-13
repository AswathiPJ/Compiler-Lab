%{
    #include<stdio.h>
    #include<ctype.h>
    #define YYSTYPE double
    int main();
    int yyerror();
%}
%token NUM ID
%left '+' '-'
%left '*' '/'

%%

e:e'+'e|e'-'e|e'*'e|e'/'e|'('e')'|NUM|ID

%%

int main()
{
    printf("Enter the arithmetic expression:");
    yyparse();
    printf("Valid expression");
    return 0;
}

int yyerror()
{
    printf("Invalid expression");
    return 0;
}
