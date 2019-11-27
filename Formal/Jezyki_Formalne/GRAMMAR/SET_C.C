#include <stdio.h>
#include <conio.h>
#include "ed.c"
#define ABLE 0
#define COMMENT 1
#define QUOTE 2
#define EARS 3
#define WCIECIE 1
#define TEKST 2

FILE *fd,*fp; /* fd destiny */
char name_source[100]="noname.c                                    ";
char name_destiny[100]="noname.c1                                   ";
int level=0;
int tabnb=8;
char screen;
int tabpos[]=
{
 0,0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128
/* { 0,0,6,12,18,24,30,36,42,48,54,60,66,72,78,84,90,96,102,108,114,120,126,132,138,144,150,156,162
	*/
}
;
main()
{
int i,mode,state,comlev,nspac;
char znak,lznak,c;
nspac=0;
comlev=0;
state=ABLE;
mode=WCIECIE;
lznak='\n';
gotoxy(1,24);
printf("\n\n\n\n\n\n\n\n\n\n");
gotoxy(1,20);
printf(" source: ");
inputtxt(name_source,30,10,10,20);
gotoxy(1,21);
for(i=0;i<30;i++)
    {
    name_destiny[i]=name_source[i];
    }
for(i=29;i>=0;i--)
    {
    if(name_destiny[i]=='.')
	{
	break;
	}
 