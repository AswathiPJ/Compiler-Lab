%option noyywrap
%{
    int words,chars,lines;
%}
%%
[a-zA-Z]* {words++; chars+=strlen(yytext);}
\n lines++;
. chars++;
%%
void main()
{
    yyin=fopen("input.txt","r");
    yylex();
    printf("chars=%d\nwords=%d,lines=%d",chars,words,lines);
}
