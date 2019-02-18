letter [A-Za-z]
digit [0-9]
sentence (({space}|{punc}|{letter})+|({digit})+|{punc}|{punc}{close}{punc}|{space})+
punc [\'|\"]
space " "
open "/*"
close "*/"
%{
int no=0;
%}
%%

{open}{close} {no++;}
{open}{sentence}{close}? {no++;}

%%
int main(int argc, char * argv[])
{
yylex();
printf("There are %d comments.\n", no);
return 0;
}

