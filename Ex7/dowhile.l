/*d "do"
v [A-Za-z0-9]
space " "
col ":"
def "default"
letter [a-z]
eq "="
number [0-9]*
expr {letter}{eq}{number}
swi "switch"
op "("
c1 ")"
op1 "{"

%{
	int count=0;
%}

%%

{swi}{op}{letter}*{c1}{op1} {}
{c}{space}{v}{col} {
	char *t = yytext;
	int i = 4;
	if(count==0)
		printf("if(expr==");
	else 
		printf("else if(expr==");
	while(i < yyleng-1){
	printf("%c", t[i]); i++;}
	count++;
	printf(")");
}
{expr} {printf("%s", yytext);}
{def}{col} { printf("else {");
int i = 7;
char *t = yytext;
while(i < yyleng-1){
	printf("%c", t[i]); i++;}
}

%%

int main(int argc, char *argv[]) {
yylex();
return 0;
}*/
