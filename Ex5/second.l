%%
[A-Z]* { yymore(); printf("%s\n", yytext);}
[a-z]* { yymore(); printf("%s\n", yytext);}
%%
int main(int argc, char *argv[])
{
yylex();
return 0;
}
