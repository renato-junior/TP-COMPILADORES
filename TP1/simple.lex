/* 
 * Entrada para o gerador de analisador léxico
 * Uso: (1) $ flex simple.lex
 *        (2) $ gcc lex.yy.c -lfl
 *        (3) $ ./a.out
 */

%{ /* Declarações */

#include <stdio.h>
#include "y.tab.h"

%}

/* Definições regulares */

RELOP			"="|"<"|"≤"|">"|"≥"|"!="
ADDOP			"+"|"-"|"or"
MULOP			"*"|"/"|"div"|"mod"|"and"
LETTER			[a-zA-Z]
DIGIT			[0-9]
IDENTIFIER		{LETTER}({LETTER}|{DIGIT})*
UNSIGNED_INTEGER	{DIGIT}({DIGIT})*
SIGN			[+-]?
SCALE_FACTOR		E{SIGN}{UNSIGNED_INTEGER}
UNSIGNED_REAL		{UNSIGNED_INTEGER}((\.)?({DIGIT})*)(({SCALE_FACTOR})?)
INTEGER_CONSTANT	UNSIGNED_INTEGER
REAL_CONSTANT		UNSIGNED_REAL
CHAR_CONSTANT		"'"{LETTER}"'"

%% /* Regras de Tradução */

program			{ printf("program "); return PROGRAM; }
integer			{ printf("integer "); return INTEGER; }
real			{ printf("real "); return REAL; }
boolean			{ printf("boolean "); return BOOLEAN; }
char			{ printf("char "); return CHAR; }
PROCEDURE		{ printf("procedure "); return PROCEDURE; }
value			{ printf("value "); return VALUE; }
reference		{ printf("reference "); return REFERENCE; }
begin			{ printf("begin "); return BEGIN_T; }
end			{ printf("end "); return END_T; }
if			{ printf("if "); return IF_T; }
then			{ printf("then "); return THEN_T; }
else			{ printf("else "); return ELSE_T; }
repeat			{ printf("repeat "); return REPEAT_T; }
until			{ printf("until "); return UNTIL_T; }
read			{ printf("read "); return READ_T; }
write			{ printf("write "); return WRITE_T; }
not			{ printf("not "); return NOT_T; }
false			{ printf("false "); return FALSE_T; }
true			{ printf("true "); return TRUE_T; }
[;]			{ printf("pontoevirgula "); return PONTOEVIRGULA; }
[(]			{ printf("abrepar "); return ABREPAR; }
[)]			{ printf("fechapar "); return FECHAPAR; }
[:]			{ printf("doispontos "); return DOISPONTOS; }
[,]			{ printf("virgula "); return VIRGULA; }
[-]			{ printf("minus "); return MINUS; }
":="			{ printf("assignop "); return ASSIGNOP; }
NOT			{ printf("not "); return NOT_T; }
{RELOP}			{ printf("relop "); return RELOP; }
{ADDOP}			{ printf("addop "); return ADDOP; }
{MULOP}			{ printf("mulop "); return MULOP; }
{IDENTIFIER}		{ printf("identifier "); return IDENTIFIER; }
{UNSIGNED_INTEGER}	{ printf("unsigned_integer "); return UNSIGNED_INTEGER; }
{SIGN}			{ printf("sign "); return SIGN; }
{SCALE_FACTOR}		{ printf("scale_factor "); return SCALE_FACTOR; }
{UNSIGNED_REAL}		{ printf("unsigned_real "); return UNSIGNED_REAL; }
{INTEGER_CONSTANT}	{ printf("integer_constant "); return INTEGER_CONSTANT; }
{REAL_CONSTANT}		{ printf("real_constant "); return REAL_CONSTANT; }
{CHAR_CONSTANT}		{ printf("char_constant "); return CHAR_CONSTANT; }
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;

%%
void yyerror(char const *error){
    printf("ERROR: %s!\n",error);
}
