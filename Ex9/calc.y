%{

#include<stdio.h>
int yylex(void);
void yyerror(char *);

%}

%token INTEGER
%token ID


%left '+' '-'
%left '*' '/'
%right UMINUS

%%

program:
	program expr '\n' {printf("%d\n",$2);}
	|
	;

expr: 
	ID		{$$=$1;}
	| INTEGER	{$$=$1;}
	| '('expr ')' {$$=$2;}
	| expr '+' expr {$$=$1+$3;}
	| expr '-' expr {$$=$1-$3;}
	| expr '*' expr {$$=$1*$3;}
	| expr '/' expr {$$=$1/$3;}
	| '-'expr %prec UMINUS {$$=-$2;}
	;

%%

void yyerror(char *s){
fprintf(stderr,"%s\n",s);
}


