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

program			{ return PROGRAM; }
integer			{ return INTEGER; }
real			{ return REAL; }
boolean			{ return BOOLEAN; }
char			{ return CHAR; }
PROCEDURE		{ return PROCEDURE; }
value			{ return VALUE; }
reference		{ return REFERENCE; }
begin			{ return BEGIN_T; }
end			{ return END; }
if			{ return IF; }
then			{ return THEN; }
else			{ return ELSE; }
repeat			{ return REPEAT; }
until			{ return UNTIL; }
read			{ return READ; }
write			{ return WRITE; }
not			{ return NOT; }
false			{ return FALSE_T; }
true			{ return TRUE_T; }
[;]			{ return PONTOEVIRGULA; }
[(]			{ return ABREPAR; }
[)]			{ return FECHAPAR; }
[:]			{ return DOISPONTOS; }
[,]			{ return VIRGULA; }
[-]			{ return MINUS; }
":="			{ return ASSIGNOP; }
NOT			{ return NOT_T; }
{RELOP}			{ return RELOP; }
{ADDOP}			{ return ADDOP; }
{MULOP}			{ return MULOP; }
{IDENTIFIER}		{ return IDENTIFIER; }
{UNSIGNED_INTEGER}	{ return UNSIGNED_INTEGER; }
{SIGN}			{ return SIGN; }
{SCALE_FACTOR}		{ return SCALE_FACTOR; }
{UNSIGNED_REAL}		{ return UNSIGNED_REAL; }
{INTEGER_CONSTANT}	{ return INTEGER_CONSTANT; }
{REAL_CONSTANT}		{ return REAL_CONSTANT; }
{CHAR_CONSTANT}		{ return CHAR_CONSTANT; }
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;

%%
void yyerror(char const *error){
    printf("ERROR: %s!\n",error);
}
