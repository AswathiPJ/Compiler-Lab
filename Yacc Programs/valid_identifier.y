%{
    #include<stdio.h>
    #include<stdlib.h>
%}
%token DIGIT LETTER NL

%%
stmt:identifier NL {printf("Valid identifier");return 0;}
identifier:LETTER alphanumeric| LETTER
alphanumeric: LETTER alphanumeric |DIGIT alphanumeric |LETTER|DIGIT

%%

void main()
{
    printf("Enter identifier:");
    yyparse();
    
}

int yyerror()
{
    printf("Invalid identifier");
    return 0;
}
