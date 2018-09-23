/*
yacc -d bas.y                   # create y.tab.h, y.tab.c
lex bas.l                       # create lex.yy.c
cc lex.yy.c y.tab.c -obas.exe   # compile/link
*/

%{ /* Declarações */

#include <stdio.h>

%}

%token RELOP
%token ADDOP
%token MULOP
%token LETTER
%token DIGIT
%token IDENTIFIER
%token UNSIGNED_INTEGER
%token SIGN
%token SCALE_FACTOR
%token UNSIGNED_REAL
%token INTEGER_CONSTANT
%token REAL_CONSTANT
%token CHAR_CONSTANT

%%

program             :   "program" IDENTIFIER ";" dec1_List compound_stmt
                    ;

dec1_List           :   dec1_List ";" dec1
                    |   dec1
                    ;

dec1                :   dcl_var
                    |   dcl_proc
                    ;

dcl_var             :   ident_list ":" type
                    ;

ident_list          :   ident_list "," IDENTIFIER
                    |   IDENTIFIER
                    ;
        
type                :   "integer"
                    |   "real"
                    |   "boolean"
                    |   "char"
                    ;

dcl_proc            :   tipo_retornado "PROCEDURE" IDENTIFIER espec_parametros corpo
                    ;

tipo_retornado      :   "integer"
                    |   "real"
                    |   "boolean"
                    |   "char"
                    |   /* empty */
                    ;

corpo               :   ":" dec1_List ";" compound_stmt id_return
                    ;

id_return           :   IDENTIFIER
                    |   /* empty */
		    ;	

espec_parametros    :   "(" lista_de_parametros ")"
                    ;

lista_de_parametros :   parametro
                    |   lista_de_parametros "," parametro
                    ;

parametro           :   modo type ":" IDENTIFIER
                    ;

modo                :   "value"
                    |   "reference"
                    ;

compound_stmt       :   "begin" stmt_list "end"
                    ;

stmt_list           :   stmt_list   ";" stmt
                    |   stmt
                    ;

stmt                :   assign_stmt
                    |   if_stmt
                    |   repeat_stmt
                    |   read_stmt
                    |   write_stmt
                    |   compound_stmt
                    |   function_ref_par
                    ;

assign_stmt         :   IDENTIFIER ":=" expr                    {$1 = $3}
                    ;

if_stmt             :   "if" cond "then" stmt                   {if($2) $4}
                    |   "if" cond "then" stmt "else" stmt       {if($2) $4 else $6}
                    ;

cond                : expr
                    ;

repeat_stmt         :   "repeat" stmt_list "until" expr         {while($4) $$2 }
                    ;

read_stmt           :   "read" "(" ident_list ")"
                    ;

write_stmt          :   "write" "(" expr_list ")"
                    ;

expr_list           :   expr
                    |   expr_list "," expr
                    ;

expr                :   Simple_expr
                    |   Simple_expr RELOP Simple_expr
                    ;

Simple_expr         :   term
                    |   Simple_expr ADDOP term
                    ;

term                :   factor_a
                    |   term MULOP term
                    ;

factor_a            :   "-" factor
                    |   factor
                    ;

factor              :   IDENTIFIER
                    |   constant
                    |   "(" expr ")"
                    |   "NOT" factor
                    |   function_ref_par
                    ;

function_ref_par    :   variable "(" expr_list ")"
                    ;

variable            :   Simple_variable_or_proc
                    ;

Simple_variable_or_proc :   IDENTIFIER
                        ;

constant            :   INTEGER_CONSTANT    {const int}
                    |   REAL_CONSTANT       {const float}
                    |   CHAR_CONSTANT       {const char}
                    |   boolean_constant    {const int}
                    ;

boolean_constant    :   "false"             {false}
                    |   "true"              {true}
                    ;
%%
