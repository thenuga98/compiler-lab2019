pair (a*b*)
vowels [a-z]
digits [0-9]
consonant [bcdfghjklmnpqrstvwxyz]
%{
#include<stdio.h>
%}
%%
{consonant}*a{consonant}*e{consonant}*i{consonant}*o{consonant}*u{consonant}* {printf("Valid.");}
!({consonant}*a{consonant}*e{consonant}*i{consonant}*o{consonant}*u{consonant}*) {printf("Not valid.");}
{digits}+ {
int count[10] = {0,0,0,0,0,0,0,0,0,0};
int flag = 0;
int i=0;
for(i=0;i<yyleng;i++)
{
switch(yytext[i])
{
case '0': count[0]++; break;
case '1': count[1]++; break;
case '2': count[2]++;break;
case '3': count[3]++;break;
case '4': count[4]++;break;
case '5': count[5]++;break;
case '6': count[6]++;break;
case '7': count[7]++;break;
case '8': count[8]++;break;
case '9': count[9]++;break;
}
}
for(i=0;i<10;i++)
{
	if(count[i]>2){
		flag=1;
		break;}
	else {
		if(count[i]==2) {
			int j;
			for(j=i; j<10; j++)
				if(count[j]==2){
					flag=1;
					break;
				}
		}
	}
}
if(flag==0)
printf("Matched string: %s", yytext);
flag=0;
}	
{pair} {
int a=0, b=0, i;
for(i=0; i<yyleng; i++)
	if(yytext[i]=='a')
		a++;
	else 
		b++;
if(a%2==0 && b%2!=0)
	printf("Valid.");
else 
	printf("Not valid.");
}
%%
int main(void){
yylex();
}
