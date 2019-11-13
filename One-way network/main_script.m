close all
clear all
warning('off', 'last')

%% Introduction
% 
% Function:
%
% $4*x - 3*x^2 + 2*x^3 - x^4 + 100*\sin(x) - 50*\cos(x)$
% 
%% Generate function 
X = -4 : 0.01 : 4;
D = generateFunction(X);

Xlearn = X(1:15:end);
noise = randi([-15, 15], size(Xlearn));
Dlearn = generateFunction(Xlearn) + noise;

Xtest = Xlearn + 0.05;
noise = randi([-15, 15], size(Xtest));
Dtest = generateFunction(Xtest) + noise;

figure
plot(X,D);
hold on;
plot(Xlearn, Dlearn, '*');
plot(Xtest, Dtest, 'g*');
legend('function', 'learn', 'test');
%% Number of layers var
numberOfLayers = 1:10;
layers = arrayfun(@(layer) [8*ones(1, layer), 1], numberOfLayers, 'UniformOutput', 0);

varLayersNets = cellfun(@(layer) newffPrettyWrapper(layer, 'layers'), layers, 'UniformOutput', 0);
varLayersOutputs = cellfun(@(net) trainMultipleNetworks(net, X, Xlearn, Dlearn, Xtest, Dtest, 10, D), varLayersNets, 'UniformOutput', 0);
%%
net = newff([-4, 4], [7 1], {'tansig', 'purelin'}, 'trainlm'); %last: trainlm, traingd, traingdm; first: transig, logsig, purelin
net.trainParam.epochs = 200;

net = train(net, Xlearn, Dlearn);

Y = sim(net, X);
plot(X, Y);

Ylearn = sim(net, Xlearn);
Elearnmse = mse(Dlearn-Ylearn);

%mse(net, D, Y)

%Do sprawka: liczba neuronow w warstwie pierwszej -> N1 wykres Elearn(N1) +
%Etest(N1) -> N1 opt znalezc

%% Number of neurons var

%% Activation function var

%% Method of learning var

%% Epochs var