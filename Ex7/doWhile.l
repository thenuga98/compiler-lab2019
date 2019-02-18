do "do{"
digit [0-9]
while "}while("
init [a-zA-Z0-9*=/+-]*
op [=|>|<]
cl ")"
cls "}"
%{

char *s1="";
char *s2="";
%}
%%
{do}{do} {printf("do{");}
{init}{cls} {
printf("\n%s\n",yytext);
}
{while} {
printf("&&(");
}
{init}{op}{digit}{cl} {
if(strcmp(s1,"")==0)
s1=yytext;
else 
s2=yytext;
}
%%
int main()
{
yylex();
}







