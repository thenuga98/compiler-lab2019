digit [0-9]
letters [A-Za-z]
%{
int count=0;
%}
%%
{digit}+	|
.(digit)+	|
([E][+\-]?{digit}+)?	|
({digit})+(.{digit}+)?(([E][+\-]?{digit}+))?	{ECHO; count++;} printf(" Valid");
{letters}+ |
([+\-]){digit}+ {ECHO;} printf(" Not Valid");
	
%%
int main(void) {
yylex();
printf("no. of unsigned numbers = %d\n", count);
}
