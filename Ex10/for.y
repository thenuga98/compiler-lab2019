%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
int sym[26];
int i=0;
%}

%token FOR
%token WHILE
%token EN
%token OPEN
%token TEXT
%token CLOSE

%%

program:
	program statement '\n'
	|
	;
statement:

	expr1 {printf("Loop is nested.\n");}
	
	;
expr1: 
	FOR TEXT OPEN expr3 FOR TEXT OPEN expr3 expr2 expr3 CLOSE expr3 CLOSE
 
	; 
expr2: 
	FOR TEXT OPEN expr3 expr2 expr3 CLOSE
	|
	;
expr3: 
	TEXT
	|	
	; 


%%

void yyerror(char *s){
}
int main(void )
{
	yyparse();
	return 0;
}


