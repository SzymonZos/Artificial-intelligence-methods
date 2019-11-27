/*****************************/
/*program edytora ekranowego */
mini_edit()
{
char c;
int i,j,column,list_regulanb,lregulanb,regulanb;

setscr();
sort(0,last_regula);
regulanb=column=0;
do
    {
    setscr();
    list_regulanb=lregulanb=regulanb;
    gotoxy(1,2);
    list_reguly(list_regulanb,list_regulanb+21);
    gotoxy((column>0)*16+column+1,regulanb-list_regulanb+2);
    do
	{
	while(!kbhit())
	    {
	    }
	c=getch();

        lregulanb=regulanb;
	if(c==0)
	    {
	    c=getch();
	    if(c==DEL)
		{
		if(last_regula>0)
		    {
		    for(i=regulanb;i<last_regula;i++)
			{
			for(j=0;j<3;j++)
			    {
			    reguly[i][j]=reguly[i+1][j];
			    }
			}
		    last_regula--;
		    }
		}
	    else
	    if(c==RIGHT)
		{
		if(column<2)
		    {
		    column++;
		    }
		else
		if(regulanb<last_regula)
		    {
		    regulanb++;
		    column=0;
		    }
		}
	    else
	    if(c==LEFT)
		{
		if(column>0)
		    {
		    column--;
		    }
		else
		if(regulanb>0)
		    {
		    column=2;
		    regulanb--;
		    }
		}
	    else
	    if(c==UP)
		{
		if(regulanb>0)
		   {
		   regulanb--;
		   }
		}
	    else
	    if(c==HOME)
		{
		column=0;
		}
	    else
	    if(c==END)
		{
		column=2;
		if(reguly[regulanb][1]==' ')
		    {
		    column=1;
		    }
		}
	    else
	    if(c==PGUP)
		{
		regulanb-=20;
		list_regulanb-=20;
		if(list_regulanb<0||regulanb<0)
		    {
		    regulanb=list_regulanb=0;
		    }
		gotoxy(1,2);
		list_reguly(list_regulanb,list_regulanb+21);
		lregulanb=regulanb;
		}
	    else
	    if(c==PGDOWN)
		{
		if(last_regula-20>list_regulanb)
		    {
		    regulanb+=20;
		    list_regulanb+=20;
		    if(regulanb>last_regula)
			{
			regulanb=last_regula;
			}
		    }
		else
		    {
		    regulanb=last_regula;
		    }
		gotoxy(1,2);
		list_reguly(list_regulanb,list_regulanb+21);
		lregulanb=regulanb;
		}
	    else
	    if(c==F1)
		{
		clrscr();
		help_edit();
		setscr();
		gotoxy(1,2);
		list_reguly(list_regulanb,list_regulanb+21);
		}
	    else
	    if(c==F2)
		{
		if(reguly[last_regula][0]!=' ')
		    {
		    last_regula++;
		    }
		save();
		setscr();
		gotoxy(1,2);
		list_reguly(list_regulanb,list_regulanb+21);
		}
	    else
	    if(c==F4)
		{
		if(reguly[last_regula][0]!=' ')
		    {
		    last_regula++;
		    }
		sort(0,last_regula);
		setscr();
		gotoxy(1,2);
		list_reguly(list_regulanb,list_regulanb+21);
		}
	    else
	    if(c==F6)
		{
		if(reguly[last_regula][0]!=' ')
		    {
		    last_regula++;
		    }
		clrscr();
		if(check_reguly()==YES)
		    {
		    press_a_key(14);
		    }
		setscr();
		gotoxy(1,2);
		list_reguly(list_regulanb,list_regulanb+21);
		}
	    else
	    if(c==DOWN)
		{
		if(regulanb<last_regula)
		    {
		    regulanb++;
		    }
		}
	    }
	else
	if(c==CTRL_Y)
	    {
	    if(regulanb<last_regula)
		{
		for(i=regulanb;i<last_regula;i++)
		    {
		    for(j=0;j<3;j++)
			{
			reguly[i][j]=reguly[i+1][j];
			}
		    }
		last_regula--;
		gotoxy(1,2);
		list_reguly(list_regulanb,list_regulanb+21);
		}
	    }
	else
	if(c==ENTER&&reguly[regulanb][0]!=' '&&reguly[regulanb][1]!=' ')
	    {
	    regulanb=(regulanb==MAX_REGULA_NB)?regulanb:regulanb+1;
	    last_regula=(last_regula<regulanb)?regulanb:last_regula;
	    column=0;
	    }
	else
	if(c==BS)
	    {
	    if(column>0)
		{
		column--;
		}
	    else
	    if(regulanb>0)
		{
		column=2;
		regulanb--;
		}
	    }
	else
	  {
	if(c>='a'&&c<='z')
	    {
	    c=c-32;
	    }
	if(c=='2')
	    {
	    c='@';
	    }
	if(c>='A'&&c<='Z'&&column==1)
	    {
	    reguly[regulanb][1]=c+32;
	    column=2;
	    naruszony=YES;
	    }
	else
	if((c==' '||(c>='A'&&c<='Z'))&&column==2)
	  {
	    reguly[regulanb][2]=c;
	    regulanb=(regulanb==MAX_REGULA_NB)?regulanb:regulanb+1;
	    last_regula=(last_regula<regulanb)?regulanb:last_regula;
	    column=0;
	    naruszony=YES;
	  }
	else
	if((c=='@'||(c>='A'&&c<='Z'))&&column==0)
	    {
	    reguly[regulanb][0]=c;
	    column=1;
	    naruszony=YES;
	    }
	  }

	if(reguly[regulanb][0]==' ')
	    {
	    column=0;
	    }

	if(list_regulanb>regulanb)
	    {
	    lregulanb=regulanb;
	    list_regulanb=regulanb;
	    gotoxy(1,2);
	    list_reguly(list_regulanb,list_regulanb+21);
	    }
	else
	if(list_regulanb+20<regulanb)
	    {
	    lregulanb=regulanb;
	    list_regulanb=regulanb-20;
	    gotoxy(1,2);
	    list_reguly(list_regulanb,list_regulanb+21);
	    }
	else
	    {
	    gotoxy(1,lregulanb-list_regulanb+2);
	    list_one_line(lregulanb);
	    gotoxy(1,regulanb-list_regulanb+2);
	    list_one_line(regulanb);
	    }
	gotoxy((column>0)*16+column+1,regulanb-list_regulanb+2);

	}
    while(c!=ESC);
    if(reguly[last_regula][0]!=' ')
	{
	last_regula++;
	}

    for(i=0;i<last_regula;i++)
	{
	if(reguly[i][0]==' ')
	    {
	    column=0;
	    regulanb=i;
	    break;
	    }
	if(reguly[i][1]==' ')
	    {
	    column=1;
	    regulanb=i;
	    break;
	    }
	}
    }
while(i!=last_regula);
clrscr();
/*printf(" ---------------------------- powrot do menu ------------------------------ ");
press_a_key(5);*/
}

help_edit()
{
textcolor(WHITE);
printf("อออออออออออออออออออออออออออออออออHELPอออออออออออออออออออออออออออออออออออออออออ");
printf("\n      Przez domniemanie przyjmuje sie ze zbior symboli terminalnych oraz");
printf("\n  zbior symboli pomocniczych to symbole zapisane w liscie produkcji.");
printf("\n\n  Symbolem poczatkowym jest '@' - ");
cprintf("<SHIFT>+'2'");
printf(".\n\n  Lista produkcji zapisana jest wedlug formatu");
printf("\n	    A>aA");
printf("\n	gdzie :");
printf("\n	    A oznacza dowolna duza litere alfabetu lacinskiego");
printf("\n	    a oznacza dowolna mala litere alfabetu lacinskiego.");
printf("\n\n      Edytor sam wybierze jaka litera jest dozwolona na danym polu,");
printf("\n   co pozwala na nie uzywanie");
cprintf("<SHIFT>");
printf(".\n      Jezeli nacisniety klawisz jest znakiem niedozwolonym ,kursor");
printf("\n   nie przesunie sie do nastepnego pola.");
printf("\n      W celu skasowania linii naciskamy ");
cprintf("<CTRL>+'Y'");
printf(".\n\n       UWAGA !!! Nie mozna wyjsc z edytora z pozostawionymi pustymi");
printf("\n   polami pierwszej i drugiej kolumny, przy probie wyjscia zostaniesz");
printf("\n   cofniety do pustego pola.\n");
press_a_key(0);
textcolor(LIGHTGRAY);
}