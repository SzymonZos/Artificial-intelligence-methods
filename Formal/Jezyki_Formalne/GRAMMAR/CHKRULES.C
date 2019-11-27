/*************************************/
/* sprawdzanie poprawnosci definicji */
check_reguly()

{
char warunek,*point1,*point2,*leftarg;

clrscr();
error_regulanb=0;
if(last_regula==0)
    {
    gotoxy(3,3);
    printf("             GRAMATYKA NIE ZDEFINIOWANA\n");
    /*press_a_key(10);*/
    }
else
    {

    sort(0,last_regula);

    for(last_begining=0;
    last_begining<last_regula;/************************/
    last_begining++)          /* ustawia last_begining*/
	{
	if(reguly[last_begining][0]!='@')
	    {
	    break;
	    }
	}

    for(point1=(&reguly[0][2]),point2=&reguly[last_regula][2];
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
		error(2);
		error_regulanb=(point1-&reguly[0][0]-2)/3;
		printf("%c",*point1);
		press_a_key(10);
		return(NO);
		}
	    }
	else
	    {
	    }
	}
    if(!check_finit())
	{
	error(3);
	press_a_key(10);
	return(NO);
	}
    else
    if(last_begining==0)
	{
	error(1);
	press_a_key(10);
	return(NO);
	}
    else
	{
	printf("                     Gramatyka zdefiniowana prawidlowo ");
	/*press_a_key(10);*/
	return(YES);
	}
    }
}

/* sprawdza przynaleznosc do konczacych */

#define MAX1 100
static char konczace[MAX1];
static char symb_pomocn[MAX1];
static int last_konczacy;

/**********************/
/* sprawdza skonczonosc gramatyki */

check_finit()
{
int dopisany,checked;
int x,y;
symb_pomocn[0]='@';     /* tablica symboli pomocniczych */
y=x=0;			/* y w symb_pomocn */
			/* last_konczacy w konczacych  */
last_konczacy=0;
for(x=0;        /* x pozycja w reguly[] */
   x<last_regula;
   x++)
    {
    if(reguly[x][2]==' ')
	{
	add(reguly[x][0]); /* dopisuje konczacy */
	}
    if(symb_pomocn[y]!=reguly[x][0])
	{
	y++;
	symb_pomocn[y]=reguly[x][0];
	}
    }
	      /* y wskazuje ostatni
		 x wskazuje lastregula
		   wskazuje nastepny za ostatnim
	      */
checked=NO;
dopisany=YES;
while(dopisany==YES)
    {
    dopisany=NO;
    checked=NO;
    for(x=0;x<last_regula;x++)
	{
	if(belongs(reguly[x][0]))
	    {
	    x=skipover(x);
	    }
	else
	    {
	    checked=YES;
	    if(belongs(reguly[x][2]))
		{
		add(reguly[x][0]);
		x=skipover(x);
		dopisany=YES;
		}
	    else
		{
		error_regulanb=x;
		}
	    }
	}
    }
if(checked==YES)
    {
    return(NO);
    }
else
    {
    error_regulanb=0;
    return(YES);
    }

}

/**********************/
skipover(x)
int x;
{
while(reguly[x]==reguly[x+1])
x++;
return(x);
}
/**********************/

belongs(alfa)
char alfa;
{
int p;

for(p=0;p<last_konczacy;p++)
    {
    if(alfa==konczace[p])
	{
	return(YES);
	}
    }
return(NO);
}

/**********************/
add(alfa)
char alfa;
{
konczace[last_konczacy]=alfa;
last_konczacy++;
}
