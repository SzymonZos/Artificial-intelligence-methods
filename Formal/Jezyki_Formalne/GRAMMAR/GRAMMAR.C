#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <graphics.h>
#define MAX_REGULA_NB 100

#define YES 1
#define NO 0
int   error_regulanb=0;
char *STRING;
char  naruszony=NO;
int   last_regula=0;
int   last_begining=0;
char turned_on;
char  wyraz[]="bbca        ";
char  bgrammar_name[30]=
{
"noname.grm     "
}
;
char *grammar_name;
char reguly[MAX_REGULA_NB][3];

main()
{

/*int i,koniec;*/

naruszony=NO;
turned_on=YES;

grammar_name=bgrammar_name;
do
    {
    clrscr();
    gotoxy(1,6);
    printf("\n                   ษออออออออออออออออออออออออออออออออออออป");
    printf("\n                   บ   GRAMATYKI FORMALNE WERSJA 1.5    บ");
    printf("\n                   บ     AUTOR :SYLWESTER WARECKI       บ");
    printf("\n                   ศออออออออออออออออออออออออออออออออออออผ");
    press_a_key(15);
    menu();
    turned_on=NO;
    }
while(turned_on);

}

/* ###############
       koniec main
    {
  */


#define COL 20
#define LOW 0
#define HIGH 5

menu()
{
char letters[]="smlctweqnhSMLCTWEQNH";
char c,quit;
int wykonac,i,ostatni;

quit=NO;
czysc(0);
do
{
clrscr();
printf("GRAMATYKA :%s",grammar_name);

gotoxy(COL,4);
textbackground(BLUE);
textcolor(WHITE);
cprintf("H");
printf("elp  - informacja o programie ");

gotoxy(COL,6);
cprintf("N");
printf("ew   - definicja nowej gramatyki ");

gotoxy(COL,8);
cprintf("Q");
printf("uit  - wyjscie z programu");

gotoxy(COL,10);
cprintf("S");
printf("ave  - Zapis gramatyki na dysk");

gotoxy(COL,12);
cprintf("M");
printf("erge - Dolaczenie gramatyki ");

gotoxy(COL,14);
cprintf("L");
printf("oad  - Zaladowanie gramatyki ");

gotoxy(COL,16);
cprintf("C");
printf("heck - Sprawdzenie poprawnosci ");

gotoxy(COL,18);
cprintf("T");
printf("est  - Losowe generowanie wyrazow ");

gotoxy(COL,20);
cprintf("W");
printf("ord  - sprawdzanie wyrazow ");

gotoxy(COL,22);
cprintf("E");
printf("dit  - Edytor gramatyki ");

textbackground(BLACK);
textcolor(LIGHTGRAY);

wykonac=NO;
ostatni=10;

do
    {
    while(!kbhit())
	{
	}

    c=getch();
    c=(c>='A')?c:c-32;
    for(i=0;i<ostatni;i++)
	{
	if(c==letters[i])
	    {
	    wykonac=YES;
	    break;
	    }
	}

    }
while(wykonac!=YES);

clrscr();

if(c=='t')
    {
    test();
    }
else
if(c=='w')
    {
    word_service();
    }
else
if(c=='e')
    {
    mini_edit();
    }
else
if(c=='h')
    {
    help();
    }
else
if(c=='c')
    {
    if(check_reguly())
	{
	press_a_key(12);
	}
    }
else
if(c=='m')
    {
    czysc(last_regula);
    getreguly(last_regula);
    }
else
if(c=='l')
    {
    if(naruszony==YES)
	{
	ask_if_save();
	}
    czysc(0);
    getreguly(0);
    }
else
if(c=='s')
    {
    save();
    }
else
if(c=='n')
    {
    if(naruszony==YES)
	{
	ask_if_save();
	}
    copystr(grammar_name,"noname.grm                                       ",20);
    czysc(0);
    mini_edit();
    }
else
if(c=='q')
    {
    quit=YES;
    }
 }
while(quit!=YES);
}

/*******************************/
/* SAVE PLIK */

save()
{
char c;
int i,goout;
FILE *fp,*fopen();

do
    {

    clrscr();
    printf("- - - - - - - - - - - - - - - - - - - S A V E - - - - - - - - - - - - - - - -");
    gotoxy(10,3);
    printf("nagrac gramatyke pod nazwa :");
    inputtxt(grammar_name,12,12,38,3);
    fp=fopen(grammar_name,"w");
    if(fp==NULL)
	{
	printf("\n\n                  BLEDNA NAZWA ALBO PELNY DYSK \n");
	gotoxy(15,7);
	textcolor(WHITE);
	cprintf("P");
	printf("owtorzyc ");
	cprintf("Z");
	printf("aniechac ");
	textcolor(LIGHTGRAY);
	do
	    {
	    while(!kbhit())
		{
		}
	    }
	while((c=get_ch())!='p'&&c!='z');
	if(c=='z')
	    {
	    return(YES);
	    }
	else
	    {
	    goout=NO;
	    }
	}

    else
	{
	goout=YES;
	}
    }
while(goout!=YES);

    for(i=0;i<last_regula;i++)
	{
	putc(reguly[i][0],fp);
	putc('>',fp);
	putc(reguly[i][1],fp);
	putc(reguly[i][2],fp);
	putc('\n',fp);
	}
    fclose(fp);
    naruszony=NO;
}

/*******************************/
    /*sprawdza czy nagrac*/

ask_if_save()
{
char c;
clrscr();
gotoxy(10,3);
printf("\n   ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป");
printf("\n   บ    gramatyka :%s nie nagrana. Nagrac t/n",grammar_name);
gotoxy(78,5);
printf("บ");
printf("\n   ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ");

while((c=get_ch())!='t'&&c!='n')
    {
    }
if(c=='t')
    {
    save();
    }

}

/*******************************/
/* laduje spacje do reguly[][] */

czysc(from)
int from;
{
int i,j;

for(i=from;i<MAX_REGULA_NB;i++)
    {
    for(j=0;j<3;j++)
	{
	reguly[i][j]=' ';
	}
    }
last_regula=from;
}

#include "getregul.h"
#include "getregul.c"

help()
{
FILE *fp,*fopen();
char c;

clrscr();
fp=fopen("gmhelp.hlp","r");
if(fp==NULL)
   {
   textcolor(WHITE);
   printf("brak pliku ");
   cprintf("GMHELP.HLP");
   printf(" na dysku");
   press_a_key(10);
   fclose(fp);
   textcolor(LIGHTGRAY);
   return(NO);
   }
while((c=getc(fp))!=EOF)
    {
    putchar(c);
    }
fclose(fp);
press_a_key(23);
gotoxy(1,24);
printf("ศออออออออออออออออออออออออออน");
gotoxy(58,24);
printf("ฬอออออออออออออออออออออออออออออผ");

}


#include "keyhead.h"
#include "chkwyraz.c"
#include "orders.c"
#include "ed.c"
#include "chkrules.c"
#include "wordserv.c"
#include "test.c"
#include "miniedit.c"

/* koniec programu */
