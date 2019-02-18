%{
int nchar, nword, nline;
%}
%%
\n { nline++; nchar++; }
[^ \t\n]+ { nword++, nchar += yyleng; }
. { nchar++; }
%%
int main(int argc, char *argv[]) {
yyin = fopen("file.txt", "r");
yylex();
printf("Characters: %d, Words: %d, Lines: %d\n", nchar, nword, nline);
fclose(yyin);
return 0;
}
