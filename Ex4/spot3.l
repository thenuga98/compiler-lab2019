digits [0-9]
%%
(0.*0)|(1.*1)|(2.*2)|(3.*3)|(4.*4)|(5.*5)|(6.*6)|(7.*7)|(8.*8)|(9.*9)	{printf("repeated string: %s\n",yytext);}
%%
int yywrap(){
return 1;
}
int main(void)
{
yylex();
return 0;
}

