%option noyywrap
%{
    int number=0;
%}
%%
[a-zA-Z]*nt[a-zA-Z]* printf("%d.%s\n",++number,yytext);
.|\n

%%
void main()
{
    yyin=fopen("input2.txt","r");
    yylex();
}
