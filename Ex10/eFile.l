%{

#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"

%}

%%

[0-9] { 
             yylval = atoi(yytext);
	     return INTEGER;
       }



[a-z] {
	     yylval= *yytext;	
	     return ID;			
}

[-+()*/\n] return *yytext;

[\t] ;


%%

int yywrap(void)
{
return 1;
}

int main(void) {
yyparse();
return 0;
}

