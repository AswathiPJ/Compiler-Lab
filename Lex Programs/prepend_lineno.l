%option noyywrap
%{
    int lineno=0;
%}
%%

^.*\n printf("%d %s",++lineno,yytext);

%%

void main()
{
    yyin=fopen("input1.txt","r");
    yylex();
    printf("Total no of lines:%d",lineno);
}
