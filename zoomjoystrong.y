/*********************************************
* Bison file 
* @author Adam Slifco
* @version 10/28/17
* Collaborated with Zachary Hern
**********************************************/

%{
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

%} 

%start program

/*Symbol semantic values*/
%union {
    int iV;
    float fV;
}
%token <iV> INT
%token <fV> FLOAT
%token END_STATEMENT
%token LINE POINT CIRCLE RECTANGLE SET_COLOR END INVALID

%%

program: statement_list end
	| end;

statement_list: statement
		| statement_list statement
		| error
		{ 
		  //retrieved this code from the almighty stack overflow -- https://stackoverflow.com/questions/16911792/how-to-continue-parser-after-syntax-error -- code provided by user Aymanadou
		  yyerrok; yyclearin; printf("\n INVALID COMMAND \n");
		}
		;
statement: line 
		| point
		| circle
		| rectangle
		| set_color
		;

//Line function in for Integer data
line: LINE INT INT INT INT END_STATEMENT
						{
							line($2, $3, $4, $5);
						}
						|
//Line function for Float data
LINE FLOAT FLOAT FLOAT FLOAT END_STATEMENT
						{						
							line($2, $3, $4, $5);
						}				
						;
//Point function for Integer data
point: POINT INT INT END_STATEMENT
						{
							point($2, $3);
						}
						|
//Point function for Float data
POINT FLOAT FLOAT END_STATEMENT
						{
							point($2, $3);
						}				
						;
//Circle function for Int data
circle: CIRCLE INT INT INT END_STATEMENT
						{
							circle($2, $3, $4);
						}
						|
//Circle function for Float data
CIRCLE FLOAT FLOAT FLOAT END_STATEMENT
						{
							circle($2, $3, $4);
						}				
						;
//Rectangle function for Int data
rectangle: RECTANGLE INT INT INT INT END_STATEMENT
						{
							rectangle($2, $3, $4, $5);
						}
						|
//Rectangle function for Float data
RECTANGLE FLOAT FLOAT FLOAT FLOAT END_STATEMENT
						{
							rectangle($2, $3, $4, $5);
						}				
						;
//Set Color function for Int data
set_color: SET_COLOR INT INT INT END_STATEMENT
						{
							if($2 < 0 || $2 > 255 || $3 < 0 || $3 > 255 || $4 < 0 || $4 > 255)
								printf("RGB color values range from 0 to 255 \n");
							else
								set_color($2, $3, $4);
						}
						|
//Set Color function for Float data
SET_COLOR FLOAT FLOAT FLOAT END_STATEMENT
						{
							if($2 < 0.0 || $2 > 255.0 || $3 < 0.0 || $3 > 255.0 ||$4 < 0.0 || $4 > 255.0)
								printf("RGB color values range from 0 to 255 \n");
							else
								set_color($2, $3, $4);
						}				
						;
//End program function
end: END END_STATEMENT
						{
							finish();
						}
						;

%%

//Function Definitions
int main(int argc, char** argv)
{
	//setup method from c file
	setup();
   	yyparse();
}



void yyerror (char const *s) {
   //error checking above kind of does this for me so it is blank
 }

