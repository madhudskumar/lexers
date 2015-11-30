%{
int valid = 1,brace = 0,bracket = 0;
int count = 0;
int a = 0,s = 0,m = 0,d = 0;
%}

%%
[+] {
	a++;
	count--; 
	if(count < 0) valid = 0;
}

[-] {
	s++; 
	count--; 
	if(count < 0) valid = 0;
}

[*] {
	m++;
	count--; 
 	if(count < 0) valid = 0;
}

[/] {
	d++;
	count--; 
	if(count < 0) valid = 0;
}

[a-zA-Z0-9]* {
			 count++; 
			 if(count > 1) valid = 0;
			 fprintf(yyout,"\n%s\n",yytext);
}

[(] {
	brace++;
}

[)] {
	brace--;
	if(brace < 0) valid = 0;
}

[[] {
	bracket++;
}

[]] {
	bracket--;
	if(bracket < 0) valid = 0;
}
%%

main(int argc,char * argv[]){
	yyin = stdin;
	printf("\nEnter a arithmetic expression\n");
	yylex();

	if(valid != 1 || brace != 0 || bracket != 0 || count != 1)
		yyerror();

	printf("\nVALID\n");
	printf("\na = %d,s = %d,m = %d,d = %d\n",a,s,m,d);

	return 0;
}

yyerror(){
	printf("\nINVALID\n");
	exit(-1);
}
