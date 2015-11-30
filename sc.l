%{
#include <stdlib.h>
int is_simple = 1; 
%}

%%
[ \t\n]*[aA][nN][dD][ \t\n]+ {is_simple = 0;}
[ \t\n]*[oO][rR][ \t\n]+ {is_simple = 0;}
[ \t\n]*[bB][uU][tT][ \t\n]+ {is_simple = 0;}
. ;
%%

main(){
	yyin = stdin;

	printf("\nEnter a statement\n");
	yylex();

	if(is_simple == 1) printf("\nSimple\n");

	else printf("\nCompound\n");

	return 0;
}