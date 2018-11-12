/*
yacc -d bas.y                   # create y.tab.h, y.tab.c
lex bas.l                       # create lex.yy.c
cc lex.yy.c y.tab.c -obas.exe   # compile/link
*/

%{ /* Declarações */

#include <stdio.h>

%}
%token PROGRAM
%token INTEGER
%token REAL
%token BOOLEAN
%token CHAR
%token PROCEDURE
%token VALUE
%token REFERENCE
%token BEGIN_T
%token END_T
%token IF_T
%token THEN_T
%token ELSE_T
%token REPEAT_T
%token UNTIL_T
%token READ_T
%token WRITE_T
%token FALSE_T
%token TRUE_T
%token PONTOEVIRGULA
%token ABREPAR
%token FECHAPAR
%token DOISPONTOS
%token VIRGULA
%token MINUS
%token ASSIGNOP
%token NOT_T
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

program             :   PROGRAM IDENTIFIER PONTOEVIRGULA decl_list compound_stmt
                    ;

decl_list           :   decl_list PONTOEVIRGULA decl
                    |   decl
                    ;

decl                :   dcl_var
                    |   dcl_proc
                    ;

dcl_var             :   ident_list DOISPONTOS type
                    ;

ident_list          :   ident_list VIRGULA IDENTIFIER
                    |   IDENTIFIER
                    ;
        
type                :   INTEGER
                    |   REAL
                    |   BOOLEAN
                    |   CHAR
                    ;

dcl_proc            :   tipo_retornado PROCEDURE IDENTIFIER espec_parametros corpo
                    ;

tipo_retornado      :   INTEGER
                    |   REAL
                    |   BOOLEAN
                    |   CHAR
                    |   %empty/* empty */
                    ;

corpo               :   DOISPONTOS decl_list PONTOEVIRGULA compound_stmt id_return
                    ;

id_return           :   IDENTIFIER                              {return $1;}
                    |   %empty/* empty */
		    ;	

espec_parametros    :   ABREPAR lista_de_parametros FECHAPAR
                    ;

lista_de_parametros :   parametro
                    |   lista_de_parametros VIRGULA parametro
                    ;

parametro           :   modo type DOISPONTOS IDENTIFIER
                    ;

modo                :   VALUE
                    |   REFERENCE
                    ;

compound_stmt       :   BEGIN_T stmt_list END_T
                    ;

stmt_list           :   stmt_list PONTOEVIRGULA stmt
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

assign_stmt         :   IDENTIFIER ASSIGNOP expr
                    ;

if_stmt             :   IF_T cond THEN_T stmt                    { if($2){$4}; }
                    |   IF_T cond THEN_T stmt ELSE_T stmt        { if($2){$4}else{$6}; }
                    ;

cond                : expr
                    ;

repeat_stmt         :   REPEAT_T stmt_list UNTIL_T expr          { while($4){$2}; }
                    ;

read_stmt           :   READ_T ABREPAR ident_list FECHAPAR       { scanf("%c",&$$); }
                    ;

write_stmt          :   WRITE_T ABREPAR expr_list FECHAPAR       { printf("%c",$3); }
                    ;

expr_list           :   expr
                    |   expr_list VIRGULA expr
                    ;

expr                :   Simple_expr
                    |   Simple_expr RELOP Simple_expr
                    ;

Simple_expr         :   term                                     { $$ = $1; }
                    |   Simple_expr ADDOP term                   { $$ = $1 + $3; }
                    ;

term                :   factor_a
                    |   term MULOP term                          { $$ = $1 * $3; }
                    ;

factor_a            :   MINUS factor                             { $$ = $1*$2; }
                    |   factor                                   { $$ = $1; }
                    ;

factor              :   IDENTIFIER
                    |   constant
                    |   ABREPAR expr FECHAPAR
                    |   NOT_T factor
                    |   function_ref_par
                    ;

function_ref_par    :   variable ABREPAR expr_list FECHAPAR
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

boolean_constant    :   FALSE_T
                    |   TRUE_T
                    ;
%%

int yywrap(){
    return 1;
}

int main(){
    yyparse();
    return 1;
}
