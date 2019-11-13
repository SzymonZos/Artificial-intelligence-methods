
close all
%clear all
clearvars -except tab_elearn tab_etest
X=-10:0.1:10;
D=funkcja(X);
figure(1);
plot(X,D,'k'); hold on
legend('Prawdziwa funkcja');grid on;xlabel('x'); ylabel('y');
Xlearn=-7:1:7;
Dlearn=funkcja_z_szumem(Xlearn);
plot(Xlearn,Dlearn,'k*');
legend('Prawdziwa funkcja', 'Zbiór ucz¹cy');

Xtest=Xlearn+0.5;
Dtest= funkcja_z_szumem(Xtest);
plot(Xtest,Dtest, 'r*');
legend('prawdziwa funkcja', 'zbior uczacy','zbior testowy');

%%
N=[ 2,3,5,10,15,25,50,75,100,150,200,300,500];
Epochs=[25,50,100,125,150,200,250,300,500];
Layers=[1,2,3,4,5,6,7,8,9,10];
Lsize = length(Layers);
L = cell(1,Lsize);
for i =1:Lsize
 L{1,i} = 5*ones(1,i-1);
end
Nsize= length(N);
Epsize= length(Epochs);
Lsize = length(Layers);
tab_elearn = zeros(Nsize,1);
tab_etest = zeros(Nsize,1);
fid=fopen('csvB.csv','w');
fprintf(fid,'it; Lneu; Elearn; Etest; F; F1; Epochs\r\n');

for j=1:Nsize
% j=6;
 for i=1:10
 F1='tansig';
 Tr='trainlm';
 net=newff([7,7], [N(j) 1], {'tansig', 'purelin'}, 'trainlm');
 %net=newff([7,7], [L{1,j} 1], {'tansig','purelin'}, 'trainlm');
 net.trainParam.epochs=Epochs(5);
 net.trainParam.showWindow=false;
 net=train(net, Xlearn, Dlearn);
 Y= sim(net, X);
 plot(X,Y,'g')

 legend('Prawdziwa funkcja', 'Zbior uczacy','zbior testowy', 'Model neuronowy');
 xlabel('x'); ylabel('y');
 Ylearn= sim(net,Xlearn);
 Elearn(i)= mse(Dlearn - Ylearn);

 Ytest= sim(net,Xtest);
 Etest(i)= mse(Dtest - Ytest);

 fprintf(fid,'%d; %d; %.5f; %.5f; tansig, purelin ; %s; %d\r\n ',i,N, Elearn(i), Etest(i), F1, Epochs(5));
 end

El=median(Elearn);
Et=median(Etest);
tab_elearn(j) = El;
tab_etest(j) = Et;
end
% El=median(Elearn);
% Et=median(Etest);
dim1 = [.2 .6 .3 .3]; % do adnotacji
dim2 = [.5 .6 .6 .3];%[.5 .6 .3 .3]; % do adnotacji
txt1 = {'Blad uczacego:' num2str(El) 'Blad testowego:' num2str(Et)};
txt2 = {'Warstwy' num2str(2) ,'Neurony' num2str(N(j)), 'Aktywacja' F1,
'Metoda' Tr ,'Epoki' num2str(Epochs(j))};
annotation('textbox',dim1,'String',txt1,'FitBoxToText','on');
annotation('textbox',dim2,'String',txt2,'FitBoxToText','on');
% figure(2);
% set(gcf,'units','normalized','outerposition',[0 0 1 1]);
% plot(N, tab_elearn,'-*');
% hold on
% plot(N, tab_etest,'-o');
% legend('Elearn','Etest'); grid on;
% xlabel('liczba neuronów'); ylabel('MSE');
close all
clear all
data=readtable('csv2.csv');
N=[ 2,3,5,10,15,25,50,75,100,150,200,300,500];
Nsize= length(N);
Epochs=[25,50,100,125,150,200,250,300,500];
Epsize= length(Epochs);
tab_elearn = zeros(Epsize,1);
tab_etest = zeros(Epsize,1);
for i=0:Epsize-1
 var = i*10+1;
 tab_elearn(i+1) = median(table2array(data(var:var+9,3)));
end
for i=0:Epsize-1
 var1 = i*10+1;
 tab_etest(i+1) = median(table2array(data(var1:var1+9,4)));
end
figure(1);
set(gcf,'units','normalized','outerposition',[0 0 1 1]);
plot(Epochs, tab_elearn,'-*');
hold on
plot(Epochs, tab_etest,'-o');
legend('Elearn','Etest'); grid on;
xlabel('liczba epok'); ylabel('MSE');
