%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
int sym[26];
int i=0;
%}

%token INTEGER
%token ID

%left '+' '-'
%left '*' '/'

%%

program:
	program statement '\n'
	|
	;
statement:
	expr1 {printf("Infix expression.\n");}
	| expr2 {printf("Prefix expression. \n");}
	| expr3 {printf("Postfix expression. \n");}
	;
expr1: 
	INTEGER
	| ID {$$=sym[$1];}
	| expr1 '+' expr1 {i=1;}
	| expr1 '-' expr1 {i=1;}
	| expr1 '*' expr1 {i=1;}
	| expr1 '/' expr1 {i=1;}
	;
expr2:
	INTEGER
	| ID {$$=sym[$1];}	
	| '+' expr2 expr2 {i=2;}
	| '-' expr2 expr2 {i=2;}
	| '*' expr2 expr2 {i=2;}
	| '/' expr2 expr2 {i=2;}
	;
expr3:
	INTEGER
	| ID {$$=sym[$1];}
	| expr3 expr3 '+' {i=3;}
	| expr3 expr3 '-' {i=3;}
	| expr3 expr3 '*' {i=3;}
	| expr3 expr3 '/' {i=3;}
	;

%%

void yyerror(char *s){
fprintf(stderr,"%s\n",s);
}



