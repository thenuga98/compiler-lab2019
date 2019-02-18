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
		case '+':while(stack[top] == '*' || stack[top] == '/')
			{
				op=stack[top];
				printf("%c", op);
				top--;}
			top++;
			stack[top]=match[i];
			break;
		case '-':while(stack[top] == '*' || stack[top] == '/')
			{
				op=stack[top];
				printf("%c", op);
				top--;}
			stack[++top]=match[i]; 
                        break;
		case '*':top++;
                        stack[top]=match[i];
                        break;
		case '/':top++;
                        stack[top]=match[i];
                        break;	
		default:	
			printf("%c", match[i]);	 
}
}
while(top != -1){
	printf("%c", stack[top]);
	top--;
}
}

%%

int main(int argc, char *argv[]) {
yylex();
return 0;
}

