#include <stdio.h>
#define MAX 100

#define YES 1
#define NO 0
#define LSYMBOL 0
#define RSYMBOL 1
#define RSYMBOL2 2

#define BLANK 0
#define AUXILIARY 1
#define TERMINATING 2
#define BEGINING 3
#define PRZYPISZ 4
#define UNKNOWN 5
#define FILEEND 6
#define WRONG 17

char *STRING;
int last_regula;
typedef char REG[3];

char reguly[MAX][3];

main()
{
char *filen[]=
    {
    "rules.l01"
    }
;
int i;
printf("\n\n\n\n");
/*for(i=0;i<10;i++)
   reguly[i][LSYMBOL]=90-i;
for(i=0;i<10;i++)
   printf("\n reguly=%s",&reguly[0][LSYMBOL]);
  */

getreguly(filen);
printf("\n reguly=%s\n",&reguly[0][LSYMBOL]);
list_reguly();
sort(&reguly[0][0],&reguly[last_regula][0]);
printf("\n reguly=%s\n",&reguly[0][LSYMBOL]);
list_reguly();
printf("\n point> %c",reguly[last_regula][0]);
list_reguly();
printf("\n point> %c",reguly[last_regula][0]);
for(i=0;i<10;i++)
printf("%c",reguly[i][LSYMBOL]);

while(getchar()!='q');

}

/* procedura sciagajaca plik
****************************** */

getreguly(filename)
char *filename[];Š
{
FILE *fopen(),*fp;
char *standardt[]=
    {
    "reguly.reg"
    }
;
char c;
int typc,position,state,nbegin;

if(*filename=='\0')
    {
    fopen(*standardt,"r");
    }
else
    {
    fp=fopen(*filename,"r");
    }

position=0;state=LSYMBOL;
nbegin=NO;
while((c=getc(fp))!=EOF)
    {
    putchar(c);
    typc=typeof(c);

    if(state==LSYMBOL)
	{
	if((typc==AUXILIARY)||(typc==BEGINING))
	    {
	    if(c=='@') nbegin=YES;
	    reguly[position][LSYMBOL]=c;
	    state=PRZYPISZ;
	    }
	else
	    {
	    if(typc==BLANK)
	    while(typeof(c)==BLANK)
		{
		c=getc(fp);
		}
	    else
		{
		state=WRONG;
		break;
		}
	    }
	}
    else
    if(state==RSYMBOL)
	{
	if(typc==TERMINATING)
	    {
	    state=RSYMBOL2;
	    reguly[position][RSYMBOL]=c;
	    }
	else
	    {
	    if(typc==BLANK)Š	    while(typeof(c)==BLANK)
		{
		c=getc(fp);
		}
	    else
		{
		state=WRONG;
		break;
		}
	    }
	}
    else
    if(state==PRZYPISZ)
	{
	if(typc==PRZYPISZ)
	    {
	    state=RSYMBOL;
	    }
	else
	    {
	    if(typc==BLANK)
	    while(typeof(c)==BLANK)
		{
		c=getc(fp);
		}
	    else
		{
		state=WRONG;
		break;
		}
	    }
	}
    else

    if(state==RSYMBOL2)
	{
	if(typc==AUXILIARY)
	    {
	    reguly[position][RSYMBOL2]=c;
	    state=LSYMBOL;
	    c=getc(fp);
	    position++;
	    if(((typc=typeof(c))!=BLANK)&&(typc!=FILEEND))
		{
		state=WRONG;
		break;
		}
	    }
	else
	    {
	    if(typc==BLANK)
		{
		reguly[position][RSYMBOL2]=' ';
		state=LSYMBOL;
		position++;
		}
	    else
		{
		state=WRONG;
		break;Š		}
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

printf("\n\n");
if(state==WRONG||state!=LSYMBOL)
    {
    printf("error 1 : BRAK KONCA DEFINICJI");
    return(NO);
    }
else
if(nbegin==NO)
    {
    printf("error 0 :BRAK SYMBOLU POCZATKOWEGO");
    return(NO);
    }
else
    {
    last_regula=position;
    if(check_reguly())    /* check reguly==yes */
	{
	printf("operacja zakonczona prawidlowo");
	return(YES);
	}
    else
	{
	return(NO);
	}
    }

}
  /* koniec procedury sciagajacej plik
      getregula */


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
elseŠif(arg=='@')
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


/* sprawdzanie poprawnosci definicji */

check_reguly()

{
char nspace,warunek,*point1,*point2,*leftarg;

nspace=NO;
for(point1=(&reguly[0][2]),point2=&reguly[last_regula][0]-1;
point1<point2;
point1+=3)
    {
    if(*point1!=' ')
	{
	for(leftarg=&reguly[0][0],warunek=NO;
	leftarg<&reguly[last_regula][0];
	leftarg+=3)
	    {
	    if(*leftarg==*point1)   /* czy symbol wystepuje po lewej stronie */
		{
		warunek=YES;
		}
	    }
	if(!warunek)
	    {
	    printf("\n error 2: BRAK DEFINICJI SYMBOLU POMOCNICZEGO :%c",*point1);
	    return(NO);
	    }
	}
    else
	{
	nspace=YES;
	}
    }
if(!nspace)
    {
    printf("\n error 3 : WYRAZ GRAMATYKI NIGDY SIE NIE KONCZY !");
    return(NO);
    }
else
    {
    return(YES);
    }
}
Š
sort(pos1,pos2)
char *pos1,*pos2;

{
char c;
char *i,*lpos1,*lppos1;

for(;pos1<pos2;pos1+=3)
    {
    lpos1=pos1;
    for(i=pos1;i<pos2;i+=3)
	{
	if((*lpos1)>(*i))
	    {
	    lpos1=i;
	    }
	}
    if (lpos1!=pos1)
	{
	for(lppos1=pos1;lppos1<pos1+3;lpos1++,lppos1++)
	    {
	    c=*lpos1;
	    *lpos1=*lppos1;
	    *lppos1=c;
	    }
	}
    }

}
/*koniec procedury sort */

/* listowanie regul wedlug wzorca
   ****************************** */

/* list_reguly(from,to)
char *from,*to;  */

list_reguly()

{
char *from,*to;
OL;
	    position++;
	    if(position>=MAX_REGULA_NB)
		{
		printf("ERROR 8:GRAMATYKA NIE MIESCI SIE W PAMIECI");
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
	state=WRONG;Š	break;
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
    printf("error 0 : BRAK KONCA DEFINICJI");
    return(NO);
    }
else
    {
    last_regula=position;
    if(check_reguly())    /* check reguly==yes */
	{
	printf("operacja zakonczona prawidlowo");
	return(YES);
	}
    el