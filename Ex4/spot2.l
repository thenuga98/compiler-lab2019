A [a]
B [b]
E [ \t\n]
%%
{B}*({A}+{B}{01}{A}*)+{E}	{printf("\nSubstring without abb: %s",yytext);}
%%
int yywrap(){
return 1;
}
int main(void)
{
yylex();
return 0;
}
