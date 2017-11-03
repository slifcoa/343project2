/************************************************
* Lexer file 
* @author Adam Slifco
* @version 10/27/17
* Collaborated with Zachary Hern
*************************************************/

%{
	#include<stdio.h>
	#include<stdlib.h>
	#include"zoomjoystrong.tab.h"
%}

%option noyywrap

%%

[0-9]+ 	{
	yylval.iV = atoi(yytext);
	return INT;
	}

[0-9]+\.[0-9]+ {
	yylval.fV = atof(yytext);
	return FLOAT;
	}

"line" 	{
	return LINE;
	}

"point"	{
	return POINT;
	}

"circle" {
	return CIRCLE;
   	 }

"rectangle" {
	return RECTANGLE;
	}

"set_color" {
	return SET_COLOR;
	}

"end" {
	return END;
      }
[ \n\t]+ {
        
	}

";" {
	return END_STATEMENT;
	}

. {
		printf("Invalid Character\n");
		}

%%
