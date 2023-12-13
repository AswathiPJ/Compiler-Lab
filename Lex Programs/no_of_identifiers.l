%option noyywrap
digit [0-9]
letter [_a-zA-Z]
%{
    int count=0;
%}
%%
{letter}({letter}|{digit})* count++;
%%
void main()
{
    yyin=fopen("input3.txt","r");
    yylex();
    printf("Number of identifiers:%d",count);
}
