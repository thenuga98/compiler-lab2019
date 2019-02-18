hash "#define "
letters [a-zA-Z]*
defop "{ "
sp " "
defcl " }"
op "*"|"+"|"-"|"/"
%%
{hash} {}
{letters} {printf("\n %s(){",yytext);}
{defop}{letters}{sp} {
printf("%s",yytext);
}
({letters}{op}{letters})* {printf("%s}",yytext);}
%%
int main()
{
yylex();
}


