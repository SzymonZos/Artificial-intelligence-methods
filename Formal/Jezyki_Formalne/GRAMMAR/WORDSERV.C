/**********************/
char wyraz_bufor[]="abcdefg                                                                                                                             ";
char wyrazy_plik[]="wyrazy.wrd                                              ";
#define KLAW 1
#define PLIKI 2
char skad_czyta=KLAW;

word_service()

{
char c,*wyrazp;
int i;
FILE *fp,*fopen();

if(check_reguly()==NO)
   {
   return(NO);
   }
clrscr();
wyrazp=wyraz_bufor;
ask_source();

if(skad_czyta==KLAW)
    {
    do
	{
	clrscr();
	printf("wyraz pusty powoduje powrot do menu");
	gotoxy(1,3);
	printf("podaj wyraz:");
	inputtxt(wyrazp,30,30,13,3);
	check_wyraz(wyrazp);
	}
    while(*wyrazp!='\0');
    }
else
    {
    clrscr();
    gotoxy(1,5);
    printf("podaj nazwe pliku:");
    inputtxt(wyrazy_plik,12,13,19,5);
    fp=fopen(wyrazy_plik,"r");
    if(fp==NULL)
	{
	clrscr();
	printf("\n                     plik : %s   nie istnieje",wyrazy_plik);
	press_a_key(5);
	return(NO);
	}
    clr_buf(wyraz_bufor,100);
    i=0;
    while((c=getc(fp))!=EOF)
	{
	wyrazp[i]=c;
	if(c==' ')
	    {
            clrscr();
	    wyrazp[i]='\0';
	    i=0;
	    if(*wyrazp!='\0')
		{
		check_wyraz(&wyraz_bufor);
                clr_buf(wyraz_bufor,100);
		}
	    }
	}

    if(wyrazp[0]!=' '&&wyrazp[0]!='\0')
	{
	clrscr();
	check_wyraz(wyrazp);
        clr_buf(wyraz_bufor,100);
	}

    fclose(fp);
    }
return(YES);
}

/* czyszczenie bufora */

clr_buf(bufpoint,ile)
char *bufpoint;
int ile;

{
char *last;

for(last=bufpoint+ile;bufpoint<last;bufpoint++)
    {
    *bufpoint=' ';
    }
}

/*************/
ask_source()
{
char c,goout;

print_ask();
goout=NO;
do
    {
    c=getch();
    if(c==0)
	{
	c=getch();
	if(c==LEFT)
	    {
	    skad_czyta=PLIKI;
	    print_ask();
	    }
	else
	if(c==RIGHT)
	    {
	    skad_czyta=KLAW;
	    print_ask();
	    }
	}
    else
    if(c==ENTER)
	{
	goout=YES;
	}
    else
    if(c=='p'||c=='P')
	{
	goout=YES;
	skad_czyta=PLIKI;
	}
    else
    if(c=='k'||c=='K')
	{
	goout=YES;
	skad_czyta=KLAW;
	}
    }
while(goout!=YES);
}

/************/
print_ask()
{
clrscr();
gotoxy(10,2);

if(skad_czyta==PLIKI)
    {
    printf("wyrazy czytane z ");
    textcolor(WHITE);
    textbackground(LIGHTGRAY);
    cprintf("P");
    textcolor(BLACK);
    cprintf("liku");
    printf(" czy z ");
    textbackground(BLACK);
    textcolor(WHITE);
    cprintf("K");
    printf("lawiatury");
    textcolor(LIGHTGRAY);
    gotoxy(80,25);
    }
else
    {
    printf("wyrazy czytane z ");
    textcolor(WHITE);
    cprintf("P");
    printf("liku");
    printf(" czy z ");
    textbackground(LIGHTGRAY);
    cprintf("K");
    textcolor(BLACK);
    cprintf("lawiatury");
    textbackground(BLACK);
    textcolor(LIGHTGRAY);
    gotoxy(80,25);
    }

}