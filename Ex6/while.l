letter [a-z]
assign "="
digit [0-9]
keyword "while"
sc ";"
op ">"|"<"
aop "+"|"-"|"*"|"/"
brackets "("|")"
curlyBracket "{"|"}"
nl [\n]
sp " "
%{
char init[100];
char cond[100];
char inc[100];
char body[100];
#include<string.h>
%}
%%
{letter}{assign}{digit}{sc} {strcpy(init, yytext);}
{keyword}{brackets}{letter}{op}{digit}{brackets} {strcpy(cond, yytext);}
({letter}+{sp}{letter}+{sc}{nl})+ {strcpy(body, yytext);}
{letter}{assign}{letter}{aop}{digit} {strcpy(inc, yytext);}

%%
int main(int argc, char *argv[]) {
yylex();
int i, j=0;
char newCond[100]; 
int initLen = strlen(init);
int condLen = strlen(cond);
int incLen = strlen(inc);
for(i=0; i<condLen; i++)
{
	if(cond[i] == '(')
	{
		int k=i+1;
		while(cond[k] != ')'){
			newCond[j++] = cond[k];
			k++;
		}
	}
}	
newCond[j] = '\0';	
printf("for(%s %s; %s) {\n", init, newCond, inc);
printf("%s\n}", body);
printf("\n");
return 0;
}
