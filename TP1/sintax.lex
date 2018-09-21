

progam              :   program identifier ";" dec1_List compound_stmt
                    ;

dec1_List           :   dec1_List ";" dec1
                    |   dec1
                    ;

dec1                :   dcl_var
                    |   dcl_proc
                    ;

dcl_var             :   ident_list ":" type
                    ;

ident_list          :   ident_list "," identifier
                    |   identifier
                    ;
        
type                :   integer
                    |   real
                    |   boolean
                    |   char
                    ;

dcl_proc            :   tipo_retornado PROCEDURE identifier espec_parametros corpo
                    ;

tipo_retornado      :   integer
                    |   real
                    |   boolean
                    |   char
                    |   vazio
                    ;

corpo               :   ":" dec1_List ";" compound_stmt id_return
                    ;

id_return           :   identifier
                    |   vazio

espec_parametros    :   "(" lista_de_parametros ")"
                    ;

lista_de_parametros :   parametro 
                    |   lista_de_parametros "," parametro
                    ;

parametro           :   modo type ":" identifier
                    ;

modo                :   value
                    |   reference
                    ;

compound_stmt       :   begin stmt_list end
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

assign_stmt         :   identifier ":=" expr
                    ;

if_stmt             :   if cond then stmt
                    |   if cond then stmt else stmt
                    ;

cond                : expr
                    ;

repeat_stmt         :   repeat stmt_list until expr
                    ;

read_stmt           :   read "(" ident_list ")"
                    ;

write_stmt          :   write "(" expr_list ")"
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

factor              :   identifier
                    |   constant
                    |   "(" expr ")"
                    |   "NOT" factor
                    |   function_ref_par
                    ;

function_ref_par    :   variable "(" expr_list ")"
                    ;

variable            :   Simple_variable_or_proc
                    ;

Simple_variable_or_proc :   identifier
                        ;

constant            :   integer_constant
                    |   real_constant
                    |   char_constant
                    |   boolean_constant
                    ;

boolean_constant    :   "false"
                    |   "true"
                    ;
