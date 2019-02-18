digit [0-9]
letter [A-Za-z]
under [_]
%{
int count=0;
%}
%%
({under}|{digit})({letter}|{digit}|{under})* {ECHO;} printf(" (not valid)");
{letter}({letter}|{digit}|{under})*	{ECHO; count++;}
%%
int main(void) {
yyin = fopen("file.txt", "r");
yylex();
printf("number of identifiers = %d\n", count);
fclose(yyin);
return 0;
}
