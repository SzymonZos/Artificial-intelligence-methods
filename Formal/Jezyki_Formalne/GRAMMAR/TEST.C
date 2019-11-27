/*********************/
/* program testujacy */
#define MAXB 100
int test()
{
char bufor[MAXB+1];
int regulanb,which,i,ile,j,ile_prob;
char dalej,auxiliary,*wyrazp;

sort(0,last_regula);
if(check_reguly()==NO)
    {
    return(NO);
    }

    clrscr();
    printf("--------------------------------T E S T-------------------------------------\n\n");
ile_prob=12;
for(j=0;j<ile_prob;j++)
    {
    dalej=YES;
    auxiliary='@';
    regulanb=0;
    wyrazp=bufor;
    for(i=0;i<MAXB;i++)
	{
	wyrazp[i]='\0';
	}
    while(dalej==YES)
	{
	for(i=regulanb;
	i<last_regula;
	i++)
	    {
	    if(reguly[i+1][0]!=reguly[i][0])
		{
		break;
		}
	    }

	ile=1+i-regulanb;
	which=random(ile)+regulanb;
	*wyrazp=reguly[which][1];
	wyrazp++;
	if(wyrazp>bufor+MAXB)
	    {
	    printf("Wyraz wyszedl poza zakres!! Za duzo wygenerowanych liter\n");
	    break;
	    }
	if(reguly[which][2]==' ')
	    {
	    dalej=NO;
	    break;
	    }
	auxiliary=reguly[which][2];
	for(i=0;i<last_regula;i++)
	    {
	    if(reguly[i][0]==auxiliary)
		{
		break;
		}
	    }
	if(i==last_regula)
	    {
	    printf("tragedy");
	    return(NO);
	    }
	else
	    {
	    regulanb=i;
	    }
	}
    printf("\n%s",bufor);

    }
  press_a_key(20);
}

