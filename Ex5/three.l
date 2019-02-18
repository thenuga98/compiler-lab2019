keyword "if"|"else"|"then"|"for"|"while"|"int"|"float"|"real"|"def"|"print"|"return"
letter [a-zA-Z]
digit [0-9]
relop "<"|">"|"="|"=="|"<="|">="|"!="
op "+"|"/"|"-"|"*"|"++"|"--"
upper [A-Z]
lower [a-z]
space " "
brackets "("|")"|"["|"]"|"{"|"}"
%{
int key=0, br=0, dig=0, op=0, id=0;
%}
%%
{keyword} {key++; printf("Keyword: %s\n", yytext);}
{brackets} {br++; printf("Brackets: %s\n", yytext); }
{digit}+ {dig++; printf("Number: %s\n", yytext);}
{op} {op++; printf("Operator: %s\n", yytext); }
({letter}+|{letter}+{digit}+) {id++; printf("Identifier: %s\n", yytext);}

%%
int main(int argc, char *argv[]) {
yylex();
printf("No. of keywords: %d\nNo. of brackets: %d\nNo. of digits: %d\nNo. of operators: %d\nNo. of identifiers: %d\n", key, br, dig, op, id);
return 0;
}
