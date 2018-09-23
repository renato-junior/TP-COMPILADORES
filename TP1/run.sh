#!/bin/bash

rm a.out
yacc -d simple.y
flex simple.lex
gcc lex.yy.c y.tab.c
