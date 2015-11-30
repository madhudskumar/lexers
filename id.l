%{
#include <stdio.h>
int id = 0,flag = 1;
%}

ID [a-zA-Z][a-zA-Z0-9]*
WS [ \t\n]

%%
void |
int |
char |
float |
double |
long |
short |
bool {
		flag = 1;
}  

{ID}{WS}*"(" {flag = 0;}

{ID} {
		if(flag == 1)
		{
		 id++;
		 fprintf(yyout,"\n%s\n",yytext);
		}
}

";" {flag = 0;}
. ;
%%

main(int argc,char * argv[])
{
	yyin = fopen(argv[1],"r");
	yyout = fopen(argv[2],"w");
	
	yylex();

	printf("\nID = %d\n",id);

	return 0;
}
