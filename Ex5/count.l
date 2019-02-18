keyword "if"|"else"|"then"|"for"|"while"|"int"|"float"|"real"
relop "<"|">"|"="|"=="|"<="|">="|"!="
upper [A-Z]
lower [a-z]
spl "!"|"@"|"#"|"$"|"%"|"^"|"&"|"*"|"("|")"
%{
int nchar=0, nword=0, nline=0, nkey=0, nrel=0, nlower=0, nupper=0, nspl=0;
%}
%%
\n { nline++; nchar++;}
{keyword} {nkey++; REJECT;}
{relop} {nrel++; REJECT;}
{lower} {nlower++; REJECT;}
{upper} {nupper++; REJECT;}
{spl} {nspl++; REJECT;}
[^ \t\n]+ { nword++, nchar += yyleng;}
. { nchar++;}

%%
int main(int argc, char *argv[]) {
yyin = fopen("input.c", "r");
yylex();
printf("Keywords: %d\n", nkey);
printf("Relational Operators: %d\n", nrel);
printf("Upper case: %d, Lower case: %d\n", nupper, nlower);
printf("Special characters: %d\n", nspl);
printf("Characters: %d, Words: %d, Lines: %d\n", nchar, nword, nline);
fclose(yyin);
return 0;
}
