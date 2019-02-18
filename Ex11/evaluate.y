%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
int sym[26];
int i=0;
%}

%token INTEGER
%token ID

%left '!' '&' '|' 
%left '>' '<' '=' 


%%

program:
	program statement '\n'
	|
	;
statement:
	expr1 {if($$==1){printf("True\n");} else {printf("False\n");} }
	
	;
expr1: 
	ID
	| INTEGER {$$=$1;}
	|'(' expr1 ')'	{$$=$2;}
	| expr1 '>' expr1 {$$=$1>$3;}
	| expr1 '<' expr1 {$$=$1<$3;}
	| expr1 '>''=' expr1 {$$=($1>=$4);}
	| expr1 '<''=' expr1 {$$=($1<=$4);}
	| expr1 '&''&' expr1 {$$=$1&&$4;}
	| expr1 '|''|' expr1 {$$=$1||$4;}
	| expr1 '=''=' expr1 {$$=($1==$4);}
	| expr1 '!''=' expr1 {$$=($1!=$4);}
	| '!' expr1 {$$=(!$2);}
	
	;
	

%%

void yyerror(char *s){
fprintf(stderr,"%s\n",s);
}
int main(void )
{
	yyparse();
	return 0;
}


