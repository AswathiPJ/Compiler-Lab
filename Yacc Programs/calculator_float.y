%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<ctype.h>
    #include<math.h>
    #define YYSTYPE double
    int main();
    int yyerror();
%}
%token NUMBER
%left '+''-'
%left '*''/'
%left '('')'

%%

stmt:e { printf("Result=%.2f",$1); return 0;}
e:e'+'e {$$=$1+$3;}
| e'-'e {$$=$1-$3;}
| e'*'e {$$=$1*$3;}
| e'/'e {$$=$1/$3;}
| '('e')' {$$=$2;}
|NUMBER {$$=$1;}


%%

int main()
{
    printf("Enter the arithmetic expression");
    yyparse();
    return 0;
}

int yyerror()
{
    printf("Invalid arithemtic expression");
    return 0;
}
