close all
clear all

%% Generate function 
X = -4 : 0.01 : 4;
Xlearn = X(1:30:end);
D = generateFunction(X);
noise = randi([-30, 30], size(Xlearn));
Dlearn = generateFunction(Xlearn) + noise;

figure
plot(X,D);
hold on;
plot(Xlearn, Dlearn, '*');
%% Newff
net = newff([-4, 4], [8 1], {'tansig', 'purelin'}, 'trainlm'); %last: trainlm, traingd, traingdm; first: transig, logsig, purelin
net.trainParam.epochs = 200;

net = train(net, Xlearn, Dlearn);

Y = sim(net, X);
plot(X, Y);

Ylearn = sim(net, Xlearn);
Elearnmse = mse(Dlearn-Ylearn);

mse(net, D, Y)

%Do sprawka: liczba neuronow w warstwie pierwszej -> N1 wykres Elearn(N1) +
%Etest(N1) -> N1 opt znalezc