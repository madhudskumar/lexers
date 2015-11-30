%{
#include<stdio.h>
int c = 0,w = 0,l = 0,s = 0;
%}

%%
[ \t] s++;
[ \n] l++;
[^ \t\n]+ {c += yyleng;w++;}
%%

main(int argc,char *argv[])
{
	if(argc == 1)
	{
	 yyin = stdin;
	 printf("\nWrite something\n");
	 yylex();
	}
	
	if(argc == 2)
	{
	 yyin = fopen(argv[1],"r");
	 yylex();
	 fclose(yyin);
	}
	
	printf("\nc = %d,w = %d,l = %d, s = %d\n",c,w,l,s);
	return 0;
} 
