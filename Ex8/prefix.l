expr [A-Za-z0-9*+/-]
%{
char match[100];
#include<string.h>
%}
%%
{expr}* {strcpy(match, yytext); printf("Expression matched: %s\n", match);
char stack[10], op;
int i, len=strlen(match), j=0, top=-1;
for(i=0; i<len; i++) {
	switch(match[i]) {
		case '+':
		case '-':
		case '*':
		case '/':
                        stack[++top]=match[i];
                        break;	
		default:	
			printf("%c", match[i]);
			op = stack[top--];
			printf("%c", op);	 
}
}
}

%%

int main(int argc, char *argv[]) {
yylex();
return 0;
}

