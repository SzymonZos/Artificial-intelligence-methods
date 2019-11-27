/******************************/
list_all()
{
int i;
clrscr();
for(i=0;i<last_regula;i++)
    {
    list_one_line(i);
    printf("\n");
    }
}

/******************************/
list_one_line(linenb)
int linenb;
{

putchar(reguly[linenb][0]);
printf("               >");
putchar(reguly[linenb][1]);
putchar(reguly[linenb][2]);
}

list_reguly(from,to)
int from,to;
{
int i;
for(i=from;i<to;i++)
    {
    list_one_line(i);
    printf("\n");
    }

}

/***********************/
sort(from,to)
int from,to;
{
char c;
int i,j,k,nb;

for(i=from;i<to;i++)
    {
    c=reguly[i][0];
    nb=i;
    for(j=i;j<to;j++)
	{
	if(reguly[j][0]<c)
	    {
	    nb=j;
	    }
	}
    for(k=0;k<3;k++)
	{
	c=reguly[i][k];
	reguly[i][k]=reguly[nb][k];
	reguly[nb][k]=c;
	}
    }
}

/*****************/

error(nb)
int nb;
{
char *errors[]=
    {
    "BRAK KONCA DEFINICJI",
    "BRAK DEFINICJI SYMBOLU POCZATKOWEGO",
    "BRAK DEFINICJI SYMBOLU POMOCNICZEGO :",
    "WYRAZ GRAMATYKI NIGDY SIE NIE KONCZY !",
    "BRAK MIEJSCA W PAMIECI NA GRAMATYKE "
    };
if(nb>=0&&nb<5)
    {
    printf("error :%d %s",nb,errors[nb]);
    }
}
/*****************/

int get_ch()
{
int c;
c=getch();
if(c>='A'&&c<='Z')
    {
    c=c-32;
    }
return(c);
}

/*****************/

press_a_key(line)
int line;

{
    gotoxy(1,line);
      printf("                     ษอออออออออออออออออออออออออออออป");
    printf("\n                     บ   NACISNIJ DOWOLNY KLAWISZ  บ                           ");
    printf("\n                     ศอออออออออออออออออออออออออออออผ");
    get_znak();
}

/*****************/

setscr()
{

clrscr();
gotoxy(1,1);

highvideo();
textcolor(WHITE);
cprintf("F1");
printf("-Help ");
cprintf("F2");
printf("-schowanie na dysk  ");
cprintf("F4");
printf("-sortowanie ");
cprintf("F6");
printf("- sprawdzenie ");
cprintf("ESC");
printf("-powrot");
textcolor(LIGHTGRAY);
/*Edit  Load  Check  Merge  Test  Word check");*/
normvideo();
}

copystr(point1,point2,ile)
char *point1,*point2;
int ile;
{
char *point3;
for(point3=point1+ile;point1<point3;point1++,point2++)
    {
    *point1=*point2;
    }
}

/*********/
get_znak()
{
int c;

while(!kbhit())
    {
    }
if((c=getch())=='\0')
    {
    c=getch()+256;
    }
}
/******************/
