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

int main(char *argc, char *argv)
{
yyin = fopen("in.txt", "r");
yyparse();
/*yyin = fopen("in2.txt", "r");
yyparse();
yyin = fopen("in3.txt", "r");
yyparse();*/
//int i; for(i=1;i<4;i++) {yyin =  fopen(argv[i], "r"); yyparse();}//
return 0;
}
