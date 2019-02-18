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
	expr1 {printf("Infix expression. Answer = %d\n", $$);}
	| expr2 {printf("Prefix expression. Answer = %d\n", $$);}
	| expr3 {printf("Postfix expression. Answer = %d\n", $$);}
	;
expr1: 
	ID
	| INTEGER {$$=$1;}
	| expr1 '+' expr1 {$$=$1+$3;}
	| expr1 '-' expr1 {$$=$1-$3;}
	| expr1 '*' expr1 {$$=$1*$3;}
	| expr1 '/' expr1 {$$=$1/$3;}
	;
expr2:
	ID
	| INTEGER {$$=$1;}	
	| '+' expr2 expr2 {$$=$2+$3;}
	| '-' expr2 expr2 {$$=$2-$3;}
	| '*' expr2 expr2 {$$=$2*$3;}
	| '/' expr2 expr2 {$$=$2/$3;}
	;
expr3:
	ID
	| INTEGER {$$=$1;}
	| expr3 expr3 '+' {$$=$1+$2;}
	| expr3 expr3 '-' {$$=$1-$2;}
	| expr3 expr3 '*' {$$=$1*$2;}
	| expr3 expr3 '/' {$$=$1/$2;}
	;

%%

void yyerror(char *s){
fprintf(stderr,"%s\n",s);
}


