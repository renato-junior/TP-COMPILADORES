/* 
 * Entrada para o gerador de analisador léxico
 * Uso: (1) $ flex simple.lex
 *        (2) $ gcc lex.yy.c -lfl
 *        (3) $ ./a.out
 */

%{ /* Declarações */

#include <stdio.h>

%}

/* Definições regulares */

LETTER			[a-zA-Z]
DIGIT			[0-9]
IDENTIFIER		{LETTER}({LETTER}|{DIGIT})*
UNSIGNED_INTEGER	{DIGIT}({DIGIT})*
SIGN			[ + - ]?
SCALE_FACTOR		E{SIGN}{UNSIGNED_INTEGER}
UNSIGNED_REAL		{UNSIGNED_INTEGER}((.)?({DIGIT})*)(({SCALE_FACTOR})?)
INTEGER_CONSTANT	UNSIGNED_INTEGER
REAL_CONSTANT		UNSIGNED_REAL
CHAR_CONSTANT		"'"{ LETTER }"'"

%% /* Regras de Tradução */

{IDENTIFIER}		{ printf("IDENTIFIER ");}
{UNSIGNED_INTEGER}	{ printf("UNSIGNED_INTEGER ");}

%%