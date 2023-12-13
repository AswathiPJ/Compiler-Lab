%option noyywrap
%{
    #include "arithe.tab.h"
%}

%%

[0-9]+ return NUM;
[a-zA-Z_] return ID;
\n return 0;
. return yytext[0];

%%
