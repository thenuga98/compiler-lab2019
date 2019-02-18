%{
int no=0;
%}
%%

[ \t\n].*[a-z]+.*[ \t\n] {printf("Not Valid\n");}
^.*[a-z]+.*[ \t\n] {printf("Not Valid\n");}

%%
int main(int argc, char * argv[])
{
yylex();
return 0;
}

