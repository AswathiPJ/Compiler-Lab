%option noyywrap
%{
    #include "identifier.tab.h"
    
%}

%%

[0-9] return DIGIT;
[a-zA-Z_] return LETTER;
\n return NL;
. return yytext[0];

%%
