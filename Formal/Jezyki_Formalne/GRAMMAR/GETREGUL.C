/* procedura sciagajaca plik
****************************** */

getreguly(nb)
int nb ;

{
FILE *fopen(),*fp;
char standardt[]="reguly.reg";


char c;
int typc,position,state;
clrscr();
printf(" - - - - - - - - - - - - - - - - - -L O A D - - - - - - - - - - - - - - - - -\n");
gotoxy(10,3);
printf("nazwa pliku :");
inputtxt(grammar_name,12,12,23,3);
if(grammar_name=='\0')
    {
    fp=fopen(standardt,"r");
    }
else
    {
    fp=fopen(grammar_name,"r");
    }
if(fp==NULL)
    {
    clrscr();
    gotoxy(20,6);
    printf("brak pliku :%s na dysku\n");
    press_a_key(10);
    return(NO);
    }

position=nb;
czysc(position);
state=LSYMBOL;

while((c=getc(fp))!=EOF)
    {
    /*    putchar(c);
*/  typc=typeof(c);

    if(state==LSYMBOL)
	{
	leave_blank(&c,fp);
	if((typc=typeof(c))==FILEEND)
	    {
	    break;
	    }
	if((typc==AUXILIARY)||(typc==BEGINING))
	    {
	    reguly[position][LSYMBOL]=c;
	    state=PRZYPISZ;
	    }
	else
	    {

	    state=WRONG;
	    break;

	    }
	}
    else
    if(state==RSYMBOL)
	{
	while(typeof(c)==BLANK)
	    {
	    c=getc(fp);
	    }

	if(typeof(c)==TERMINATING)
	    {
	    state=RSYMBOL2;
	    reguly[position][RSYMBOL]=c;
	    }
	else
	    {
	    state=WRONG;
	    break;
	    }
	}
    else
    if(state==PRZYPISZ)
	{
	leave_blank(&c,fp);
	typc=typeof(c);

	if(typc==PRZYPISZ)
	    {
	    state=RSYMBOL;
	    }
	else
	    {
	    state=WRONG;
	    break;
	    }
	}
    else

    if(state==RSYMBOL2)
	{
	if(typc==AUXILIARY)
	    {
	    reguly[position][RSYMBOL2]=c;
	    state=LSYMBOL;
	    position++;
	    if(position>=MAX_REGULA_NB)
		{
		error(4);
		last_regula=MAX_REGULA_NB;
		press_a_key(4);
		return(NO);
		}

	    }
	else
	if((typc=typeof(c))==FILEEND)
	    {
	    reguly[position][RSYMBOL2]=' ';
	    state=LSYMBOL;
	    break;
	    }
	else
	if(typc==BLANK)
	    {
	    reguly[position][RSYMBOL2]=' ';
	    state=LSYMBOL;
	    position++;
	    if(position>=MAX_REGULA_NB)
		{
		error(5);
		last_regula=MAX_REGULA_NB;
		return(NO);
		}
	    }
	else
	    {
	    state=WRONG;
	    break;
	    }
	}
    else
	{
	state=WRONG;
	break;
	}


    }
/* koniec while() */
fclose(fp);
if (state==RSYMBOL2)
    {
    state=LSYMBOL;
    reguly[position][RSYMBOL2]=' ';
    position++;
    }
printf("\n\n");
if((state==WRONG)||(state!=LSYMBOL))
    {
    error(0);
    press_a_key(4);
    return(NO);
    }
else
    {
    last_regula=position;
	printf("gramatyka wczytana \n");
	press_a_key(10);
	return(YES);
    }

}
/* koniec procedury sciagajacej plik
      getregula */

/*************************/
/*opuszcza znaki ' ','\t'*/
leave_blank(c,fp)
FILE *fp;
char *c;
{
while(typeof(*c)==BLANK)
    {
    *c=getc(fp);
    }
}

/* wyznaczanie typu znaku z pliku
  ********************************* */
typeof(arg)
char arg;

{
if((arg==' ')||(arg=='\t')||(arg=='\n'))
return(BLANK);
else
if((arg>='A')&&(arg<='Z'))
return(AUXILIARY);
else
if((arg>='a')&&(arg<='z'))
return(TERMINATING);
else
if(arg=='@')
return(BEGINING);
else
if(arg=='>')
return(PRZYPISZ);
else
if(arg==EOF)
return(FILEEND);
else
return(UNKNOWN);
}
/* koniec typeof
 ************* */
