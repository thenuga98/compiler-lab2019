%{

#include<stdio.h>
int yylex(void);
void yyerror(char *);
int sym[26];

%}

%token DIGIT LETTER


%left '+' '-'
%left '*' '/'

%%

program:
	program stmt '\n'
	|
	;
stmt:
	expr	{printf("%d\n",$1);}
	|LETTER '=' expr	{sym[$1]=$3;}
	;

expr: 
	LETTER		{$$=sym[$1];}
	| DIGIT		
	| expr '+' expr {$$=$1+$3;}
	| expr '-' expr {$$=$1-$3;}
	| expr '*' expr {$$=$1*$3;}
	| expr '/' expr {$$=$1/$3;}
	|'(' expr ')'	{$$=$2;}		
	;

%%

void yyerror(char *s){
fprintf(stderr,"%s\n",s);
}

int main(void)
{
yyparse();
return 0;
}

int yylex(void)
{ int c;
  while((c=getchar())==' ')
  { }
  if(islower(c))
  { yylval=c-'a';
    return (LETTER);}
  if(isdigit(c))
  { yylval=c-'0';
    return (DIGIT);}
 return (c);
}
  
