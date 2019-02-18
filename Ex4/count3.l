letter [A-Za-z]
digit [0-9]
digits [0-9]+
opfrac (.{digits})?
opexp ([E][+|-]?{digits})?
assgn (:=)
op [+|-|*|/]
delim [\t|\n]
punct [{|}|(|)|"|;|,]
space " "
word [a-z][a-z]+{space}
datatype "int"|"float"|"char"|"double"
%{
int no=0,id=0,assg=0,op=0,punc=0,ws=0;
char *s;
%}
%%

{digits}{opfrac}{opexp}	{no++;}

{assgn}	{assg++;}
{op}	{op++;}
{delim}+	{ws++;}
{punct}	{punc++;}
{datatype}{space}{letter}({letter}|{digit})*	{id++;}
,{letter}({letter}|{digit})*,	{id++;}
,{letter}({letter}|{digit})*;	{id++;}
{word}	{
s=yytext;
s[0]-=32;
printf("\nCapitalised=%s\n",s);
}
%%
int main(int argc, char * argv[])
{
yylex();
printf("There were %d numbers %d identifiers %d assignment operators %d operator symbols %d white spaces %d punctuations\n",no,id,assg,op,ws,punc);
return 0;
}

