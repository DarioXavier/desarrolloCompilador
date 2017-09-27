%{

/* Programa escrito en lenguaje ANSI C, en flex que lee un archivo y realiza las siguientes funcionalidades:

	> Reconoce expresiones regulares que describen a cada token.
        > Controla el número de línea del archivo de entrada, implementando una función que devuelve el número de la línea 		  		  donde encuentre un error léxico.
        > Ignora comentarios de línea única y de múltiples líneas.
        > Lanza errores léxicos al encontrar caracteres no válidos en la entrada, retornando un token de error.
*/

#include<stdio.h>

FILE *fileOuput;
int numLinea=1;

%}

delim [ ,\n,\t]
ws {delim}*
letra [a-zA-Z]
digito [0-9]
charEsp [\,,\;,\:,\(,\),\[,\],\{,\},\+,\-,\*,\/,\<,\>,\=,\!,\&,\$]
id {letra}+({letra}|{digito})*
idInt [-]?{digito}+
idFloat {idInt}([\.]{digito}+)?
idBool (true|false)
idChar (\')+({letra}|{charEsp}|[ ])+(\')
idString (\")+({letra}|{charEsp}|{digito}|[ ]|{id})++(\")
comentParr (\/\*)+({letra}|{charEsp}|{digito}|[\#,\^,\%]|{ws}|{id})*+(\*\/)
comentLin (\/\/)+({letra}|{charEsp}|{digito}|{id}|[\#,\^,\%]|[ ,\t])*+(\n)

%%


bool fprintf(fileOuput,"%s\t es una palabra reservada Bool\n",yytext);
char fprintf(fileOuput,"%s\t es una palabra reservada Char\n",yytext);
string fprintf(fileOuput,"%s\t es una palabra reservada String\n",yytext);
if fprintf(fileOuput,"%s\t es una palabra reservada If\n",yytext);
then fprintf(fileOuput,"%s\t es una palabra reservada Then\n",yytext);
else fprintf(fileOuput,"%s\t es una palabra reservada Else\n",yytext);
while fprintf(fileOuput,"%s\t es una palabra reservada While\n",yytext);
do fprintf(fileOuput,"%s\t es una palabra reservada Do\n",yytext);
input fprintf(fileOuput,"%s\t es una palabra reservada Input\n",yytext);
output fprintf(fileOuput,"%s\t es una palabra reservada Output\n",yytext);
return fprintf(fileOuput,"%s\t es una palabra reservada Return\n",yytext);
"<" fprintf(fileOuput,"%s\t es el operando Menor que\n",yytext);
"<=" fprintf(fileOuput,"%s\t es el operando Menor e igual que\n",yytext);
">" fprintf(fileOuput,"%s\t es el operando Mayor que\n",yytext);
">=" fprintf(fileOuput,"%s\t es el operando Mayor e igual que\n",yytext);
"==" fprintf(fileOuput,"%s\t es el operando SI es igual\n",yytext);
"!=" fprintf(fileOuput,"%s\t es el operando NO es igual\n",yytext);
"~=" fprintf(fileOuput,"%s\t es el operando NO es igual\n",yytext);
"&&" fprintf(fileOuput,"%s\t es el operando Y\n",yytext);
"||" fprintf(fileOuput,"%s\t es el operando O\n",yytext);

\n {++numLinea;}
[ ]
{comentParr}
{comentLin}
{idInt} fprintf(fileOuput,"%s\t es un numero Entero\n",yytext);
{idFloat} fprintf(fileOuput,"%s\t es un numero Decimal\n",yytext);
{idBool} fprintf(fileOuput,"%s\t es un Boolean\n",yytext);
{id} fprintf(fileOuput,"%s\t es una Variable\n",yytext);
{idChar} fprintf(fileOuput,"%s\t es un Char\n",yytext);
{idString} fprintf(fileOuput,"%s\t es una (cadena) String\n",yytext);
{charEsp} fprintf(fileOuput,"%s\t es un Caracter Especial\n",yytext);
.     {    
	++numLinea;
	fprintf(fileOuput, "Error en la línea: %d    %s\n",numLinea, yytext );
	yyterminate();}

%%

main (int argc, char *argv[]) {
	yyin=fopen(argv[1],"r");
	fileOuput=fopen("secuenciaTokens.txt","w");
	yylex();
	fclose(fileOuput);
}
