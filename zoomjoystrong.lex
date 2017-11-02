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

  //Values
int [0-9]+
float [0-9]+\.[0-9]+
  //Commands
line "line"
point "point"
circle "circle"
rectangle "rectangle"
set_color "set_color"
end "end"
  //Symbols
whitespace [ \n\t]+
end_statement ";"

%option noyywrap

%%

{int} {
	yylval.iVal = atoi(yytext);
	return INT;
	}

{float} {
	yylval.fVal = atof(yytext);
	return FLOAT;
	}

{line} {
	return LINE;
	}

{point} {
	yylval.val = yytext;
	return POINT;
	}

{circle} {
	return CIRCLE;
	}

{rectangle} {
	return RECTANGLE;
	}

{set_color} {
	return SET_COLOR;
	}

{end} {
	return END;
	}

{whitespace} {
      
	}

{end_statement} {
	return END_STATEMENT;
	}

. {
		printf("Invalid Character\n");
		}

%%
