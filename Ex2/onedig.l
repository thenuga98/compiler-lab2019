digit [0-9]
letters [A-Za-z]
%{
int count=0;
%}
%%
([+\-])?({digit})+ {ECHO;} printf(" Valid");
([+\-])?(({digit})+(.{digit}+)?(([E][+\-]?{digit}+))?({letters}+)?) {ECHO;} printf(" Not valid");
{letters}+ {ECHO;} printf(" Not valid");
	
%%
int main(void) {
yylex();
}
