close all
clear all
warning('off', 'NNET:Obsolete')

%% Function
% 
% $(4*x - 3*x^2 + 2*x^3 - x^4 + 100*\sin(x) - 50*\cos(x))/100$
% 
%% Preparation of training and test sets
X = -4 : 0.01 : 4;
D = generateFunction(X);

Xlearn = X(1:30:end);
noise = randi([-5, 5], size(Xlearn))./100;
Dlearn = generateFunction(Xlearn) + noise;

Xtest = Xlearn + 0.2;
noise = randi([-5, 5], size(Xtest))./100;
Dtest = generateFunction(Xtest) + noise;

figure
plot(X,D);
hold on;
plot(Xlearn, Dlearn, '*');
plot(Xtest, Dtest, 'g*');
legend('function', 'learn', 'test');
title('Comparison of given function and sets');
%% Variable number of layers
maxNumberOfLayers = 7;
numberOfLayers = 1:maxNumberOfLayers;
layers = arrayfun(@(layer) [4*ones(1, layer), 1], numberOfLayers, 'UniformOutput', 0);
varLayersOutputs = cellfun(@(layer) trainMultipleNetworks(layer, 'layers', ...
    X, Xlearn, Dlearn, Xtest, Dtest, 7, D), layers, 'UniformOutput', 0);
plotErrors(varLayersOutputs);

%Do sprawka: liczba neuronow w warstwie pierwszej -> N1 wykres Elearn(N1) +
%Etest(N1) -> N1 opt znalezc

%% Variable number of neurons
maxNumberOfNeurons = 20;
neurons = cell(1, maxNumberOfNeurons);
for index = 1 : maxNumberOfNeurons
    neurons{index} = [index, 1];
end
varNeuronsOutputs = cellfun(@(neuron) trainMultipleNetworks(neuron, ...
    'layers', X, Xlearn, Dlearn, Xtest, Dtest, 7, D), neurons, 'UniformOutput', 0);
plotErrors(varNeuronsOutputs);

%% Variable activation functions
transferFunctions = {{'tansig', 'tansig', 'purelin'}, ...
                     {'tansig', 'logsig', 'purelin'}, ...
                     {'logsig', 'tansig', 'purelin'}, ...
                     {'logsig', 'logsig', 'purelin'}, ...
                     {'purelin', 'logsig', 'purelin'}, ...
                     {'tansig', 'purelin', 'purelin'}};
varTransferFunctionsOutputs = cellfun(@(transferFunction) trainMultipleNetworks(transferFunction, ...
    'transferFunctions', X, Xlearn, Dlearn, Xtest, Dtest, 7, D), transferFunctions, 'UniformOutput', 0);
plotErrors(varTransferFunctionsOutputs);
%% Variable method of learning
trainingFunctions = {'trainlm', 'traingd', 'traingdm'};
varTrainingFunctionsOutputs = cellfun(@(trainingFunction) trainMultipleNetworks(trainingFunction, ...
    'trainingFunction', X, Xlearn, Dlearn, Xtest, Dtest, 7, D), trainingFunctions, 'UniformOutput', 0);
plotErrors(varTrainingFunctionsOutputs);

%% Variable number of epochs