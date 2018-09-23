/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PROGRAM = 258,
    INTEGER = 259,
    REAL = 260,
    BOOLEAN = 261,
    CHAR = 262,
    PROCEDURE = 263,
    VALUE = 264,
    REFERENCE = 265,
    BEGIN_T = 266,
    END = 267,
    IF = 268,
    THEN = 269,
    ELSE = 270,
    REPEAT = 271,
    UNTIL = 272,
    READ = 273,
    WRITE = 274,
    NOT = 275,
    FALSE_T = 276,
    TRUE_T = 277,
    PONTOEVIRGULA = 278,
    ABREPAR = 279,
    FECHAPAR = 280,
    DOISPONTOS = 281,
    VIRGULA = 282,
    MINUS = 283,
    ASSIGNOP = 284,
    NOT_T = 285,
    RELOP = 286,
    ADDOP = 287,
    MULOP = 288,
    LETTER = 289,
    DIGIT = 290,
    IDENTIFIER = 291,
    UNSIGNED_INTEGER = 292,
    SIGN = 293,
    SCALE_FACTOR = 294,
    UNSIGNED_REAL = 295,
    INTEGER_CONSTANT = 296,
    REAL_CONSTANT = 297,
    CHAR_CONSTANT = 298
  };
#endif
/* Tokens.  */
#define PROGRAM 258
#define INTEGER 259
#define REAL 260
#define BOOLEAN 261
#define CHAR 262
#define PROCEDURE 263
#define VALUE 264
#define REFERENCE 265
#define BEGIN_T 266
#define END 267
#define IF 268
#define THEN 269
#define ELSE 270
#define REPEAT 271
#define UNTIL 272
#define READ 273
#define WRITE 274
#define NOT 275
#define FALSE_T 276
#define TRUE_T 277
#define PONTOEVIRGULA 278
#define ABREPAR 279
#define FECHAPAR 280
#define DOISPONTOS 281
#define VIRGULA 282
#define MINUS 283
#define ASSIGNOP 284
#define NOT_T 285
#define RELOP 286
#define ADDOP 287
#define MULOP 288
#define LETTER 289
#define DIGIT 290
#define IDENTIFIER 291
#define UNSIGNED_INTEGER 292
#define SIGN 293
#define SCALE_FACTOR 294
#define UNSIGNED_REAL 295
#define INTEGER_CONSTANT 296
#define REAL_CONSTANT 297
#define CHAR_CONSTANT 298

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
