digit [0-9]
letters [A-Za-z]
%{
int count=0;
%}
%%
{digit}+	{ECHO; count++;} printf(" Unsigned Integer. Valid.");
.(digit)+	{ECHO; count++;} printf(" Unsigned Float. Valid.");
([E][+\-]?{digit}+)?	|
({digit})+(.{digit}+)?(([E][+\-]?{digit}+))?	{ECHO; count++;} printf(" Unsigned Exponent. Valid.");
{letters}+ {ECHO;} printf(" Not a number. Invalid.");
([+\-])(({digit})+(.{digit}+)?(([E][+\-]?{digit}+))?) {ECHO;} printf(" Signed Number. Not Valid");
	
%%
int main(void) {
yylex();
printf("no. of unsigned numbers = %d\n", count);
}
