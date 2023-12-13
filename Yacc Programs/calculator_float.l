%option noyywrap
%{
    #define YYSTYPE double
    #include<stdlib.h>
    #include<stdio.h>
    #include "calculator.tab.h"
%}
%%

[0-9](\.([0-9]+))? {yylval=atof(yytext); return NUMBER;}
\n  return 0;
. return yytext[0];

%%
