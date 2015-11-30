%{
#include<stdlib.h>
int clc = 0;
%}

%x CMTML CMTSL

%%
"/*" {BEGIN CMTML; clc++;}
<CMTML>. ;
<CMTML>"*/" {BEGIN 0;}

"//" {BEGIN CMTSL; clc++;}
<CMTSL>. ;
<CMTSL>"\n" {BEGIN 0;}
%%

main(int argc,char * argv[])
{
	if(argc == 3)
	{
	 yyin = fopen(argv[1],"r");
	 yyout = fopen(argv[2],"w");
	 
	 if(yyin = NULL) yyerror();
	 
	 yylex();
	 printf("\ncmtln = %d\n",clc);
	}

	return 0;
}

yyerror(){
	printf("\nInvalid\n");
	exit(-1);
}
