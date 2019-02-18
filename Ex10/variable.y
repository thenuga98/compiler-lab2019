%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token INTEGER
%token ID


%%

program:
	program ID A '\n' {printf("Variable OK.\n");}
	| program INTEGER A '\n' {printf("Invalid.\n");}
	|
	;
	
A:
	ID A 
	|INTEGER A 
	|
	;
%%

void yyerror(char *s){
fprintf(stderr,"%s\n",s);
}



