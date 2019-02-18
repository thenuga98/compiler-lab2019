%{

#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"

%}

%%

"for" { 
             yylval = atoi(yytext);
	     return FOR;
       }

"{" {
            yylval = atoi(yytext);
	     return OPEN;
  
}

[a-z0-9()=><+;]* {
            yylval = atoi(yytext);
	     return TEXT;
  
}

"}" {
            yylval = atoi(yytext);
	     return CLOSE;
  
}



%%

int yywrap(void)
{
return 1;
}


