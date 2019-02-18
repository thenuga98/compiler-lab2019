
%{
int nchar=0, nword=0, nline=0, nkey=0;
%}
%%

\n { nline++; nchar++; }
[^ \t\n]+ { nword++, nchar += yyleng; }
. { nchar++; }
%%
int main(int argc, char *argv[]) {
yyin = fopen("input.c", "r");
yylex();
printf("Characters: %d, Words: %d, Lines: %d\n", nchar, nword, nline);
fclose(yyin);
return 0;
}
