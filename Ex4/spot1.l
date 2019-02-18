letter [A-Za-z]
B [b]
S [s]
%%
^{B}{letter}*{S}[\t\n]	{printf("Starting with b and ending with s : %s\n",yytext);}
%%
int yywrap(){
return 1;
}
int main(void)
{
yylex();
return 0;
}
