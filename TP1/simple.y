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

program             :   "program" IDENTIFIER ";" decl_list compound_stmt
                    ;

decl_list           :   decl_list ";" decl
                    |   decl
                    ;

decl                :   dcl_var
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
                    |   %empty/* empty */
                    ;

corpo               :   ":" decl_list ";" compound_stmt id_return
                    ;

id_return           :   IDENTIFIER
                    |   %empty/* empty */
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

assign_stmt         :   IDENTIFIER ":=" expr
                    ;

if_stmt             :   "if" cond "then" stmt
                    |   "if" cond "then" stmt "else" stmt
                    ;

cond                : expr
                    ;

repeat_stmt         :   "repeat" stmt_list "until" expr
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

constant            :   INTEGER_CONSTANT
                    |   REAL_CONSTANT
                    |   CHAR_CONSTANT
                    |   boolean_constant
                    ;

boolean_constant    :   "false"
                    |   "true"
                    ;
%%

int yywrap(){
    return 1;
}

int main(){
    yyparse();
    return 1;
}
