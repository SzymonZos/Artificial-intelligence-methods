#define MAXLEN 100

check_wyraz(wordp)
char *wordp;

{
int position[MAXLEN];
int trace[MAXLEN*10];
int level,i;
char goin,c,next,znaleziony;

for(i=0;i<MAXLEN;i++)
    {
    position[i]=0;
    }
if(*wordp=='\0')
    {

    /*printf("\n                    wyraz nie zdefiniowany !");
    press_a_key(10);
    clrscr();*/
    return(NO);
    }
clrscr();
printf("       WYRAZ:%s\n\n",wordp);
level=0;
position[0]=0;
znaleziony=NO;
next=NO;

while(level>=0)
    {
    goin=NO;
    if(next==NO)
	{
	if(reguly[position[level]][1]==wordp[level])
	    {
	    goin=YES;
	    }
	}
    if(goin==YES)
	{
	if(wordp[level+1]=='\0'||wordp[level+1]==' ')
	    {
	    if(reguly[position[level]][2]==' ')
		{
		znaleziony=YES;
		break;
		}
	    else
		{
		next=YES;
		continue;
		}
	    }
	else
	    {
	    if(reguly[position[level]][2]==' ')
		{
		next=YES;
		continue;
		}
	    else
		{
		/*przejscie na poziom wyzej */
		c=reguly[position[level]][2];
		level++;
		position[level]=0;
		for(i=last_begining;
		    i<last_regula;
		    i++)
		    {
		    if(reguly[i][0]==c)
			{
			break;
			}
		    }
		position[level]=i;
		continue;
		}
	    }
	}
    else
	{
	next=NO;
	if(reguly[position[level]][0]==reguly[position[level]+1][0])
	    {
	    position[level]++;
	    }
	else
	    {
	    level--;
	    next=YES;
	    if(level<0)
		{
		znaleziony=NO;
		break;
		}
	    }
	}
    }
if(znaleziony)
    {
    printf(" SUKCES :Wyraz nalezy do gramatyki");
    printf("\nlista wywodu :\n");
    for(i=0;i<=level;i++)
	{
	list_one_line(position[i]);
	printf("\n");
	}
    press_a_key(21);
    }
else
    {
    printf("                       wyraz nie nalezy do gramatyki ");
    press_a_key(10);
    }
}