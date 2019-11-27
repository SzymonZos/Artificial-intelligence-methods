
/* ###################################
   procedura obslugi edytora liniowego
   *********************************** */

inputtxt(bufor,maxlen,firstlen,showx,showy)

char *bufor;  	/* wskaznik bufora 	    */
int maxlen;   	/* maxymalny wymiar bufora  */
int firstlen;   /* podstawowy wymiar bufora */
int showx,showy;/* pozycja druku na ekranie */

#define YES 1
#define NO 0

{
int wejscie;
int posit,x;
int c,l;        /* znaki aski sczytywane */
int buflen;    	/* dlugosc bufora uaktualniana ,na poczatku=firstlen */

buflen=firstlen;
for(x=buflen;x>0;x--)
    {
    if((bufor[x-1]!=' ')&&(bufor[x-1]!='\0'))
	{
	break;
	}
    }
posit=x;
*(bufor+posit)=' ';
showbuf(bufor,showx,showy);
gotoxy(showx+posit,showy);
do
    {
    }
while(!(kbhit()));
wejscie=YES;
while((c=getch())!=ENTER)
    {
    if(wejscie)
	{
	wejscie=NO;
	if(c>=32&&c<=127)
	    {
	    clrbuf(bufor,buflen);
	    posit=0;
	    showbuf(bufor,showx,showy);
	    }

	}


    if(c!=0)
	{
	if(c>31&&c<=127)
	    {
	    if((posit<buflen)&&((l=bufor[buflen-1])==' '||l=='\0'))
		{
		posit++;
		for(x=buflen-1;x>=posit;x--)
		    {
		    bufor[x]=bufor[x-1];
		    }
		*(bufor+posit-1)=c;
		}
	    else
	    if(buflen<maxlen)
		{
		buflen++;
		posit++;
		for(x=buflen-1;x>=posit;x--)
		    {
		    bufor[x]=bufor[x-1];
		    }
		*(bufor+posit-1)=c;
		}
	    }
	else
	if(c==BS&&posit>0)
	    {
	    posit--;
	    for(x=posit;x<buflen;x++)
		{
		bufor[x]=bufor[x+1];
		}
	    bufor[buflen-1]=' ';
	    }
	}
    else
	{
	c=getch();
	if(c==LEFT&&posit>0)
	    {
	    posit--;
	    }
	else
	if(c==RIGHT&&posit<buflen)
	    {
	    posit++;
	    }
	else
	if(c==HOME)
	    {
	    posit=0;
	    }
	else
	if(c==END)
	    {
	    for(posit=buflen-1;
	    posit>0;
	    posit--)
		{
		if(bufor[posit]!=' ')
		break;
		}
	    posit++;
	    }
	else
	if(c==DEL)
	    {
	    for(x=posit;
	    x<buflen;
	    x++)
		{
		bufor[x]=bufor[x+1];
		}
	    if(posit<buflen)
		{
		bufor[buflen-1]=' ';
		}
	    }
	}
    showbuf(bufor,showx,showy);
    gotoxy(showx+posit,showy);
    do
	{
	}
    while(!(kbhit()));
    }
for(x=buflen;x>0;x--)
    {
    if((bufor[x-1]!=' ')&&(bufor[x-1]!='\0'))
	{
	break;
	}
    }
bufor[x]='\0';
}

/* ***********************
   funkcja drukujaca bufor
   *********************** */

showbuf(bufor1,x,y)
char *bufor1;
int x,y;
{
gotoxy(x,y);
cprintf("%s",bufor1);

}

/* Procedura czyszczaca bufor */

clrbuf(bufor,length)
char *bufor;
int length;

{
int i;
for(i=0;i<length;i++)
    {
    *bufor=' ';
    bufor++;
    }
*bufor='\0';
}
