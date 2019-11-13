%% Function
% 
% $(4*x - 3*x^2 + 2*x^3 - x^4 + 100*\sin(x) - 50*\cos(x))/100$
% 
%% Preparation of training and test sets
close all
clear all
warning('off', 'NNET:Obsolete')

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
epochs = {5, 10, 20, 50, 100, 200, 300, 400};
varEpochsOutputs = cellfun(@(epoch) trainMultipleNetworks(epoch, ...
    'epochs', X, Xlearn, Dlearn, Xtest, Dtest, 7, D), epochs, 'UniformOutput', 0);
plotErrors(varEpochsOutputs);

%% Other functions
%{
function D = generateFunction(X)
    D = 0;
    n = 5;
    for i = 1 : n
        if mod(i,2)
        D = D - (i-n)*X.^ i;
        else
        D = D + (i-n)*X.^ i;
        end
    end
    D = (D + 100*sin(X) - 50*cos(X))./100;
end

function net = newffPrettyWrapper(variableInput, variableFunctionality)
    inputsLimits = [-4, 4];
    layers = [7 1];
    transferFunctions = {'tansig', 'purelin'};
    trainingFunction = 'trainlm';

    switch variableFunctionality
        case 'inputsLimits'
            net = newff(variableInput, layers, transferFunctions, trainingFunction);
            net.trainParam.epochs = 200;
        case 'layers'
            transferFunctions = cell(size(variableInput));
            for index = 1:length(variableInput)-1
                transferFunctions{index} = 'tansig';
            end
            transferFunctions{length(variableInput)} = 'purelin';
            net = newff(inputsLimits, variableInput, transferFunctions, trainingFunction);
            net.trainParam.epochs = 200;
        case 'transferFunctions'
            layers = [6 6 1];
            net = newff(inputsLimits, layers, variableInput, trainingFunction);
            net.trainParam.epochs = 200;
        case 'trainingFunction'
            net = newff(inputsLimits, layers, transferFunctions, variableInput);
            net.trainParam.epochs = 200;
        case 'epochs'
            net = newff(inputsLimits, layers, transferFunctions, trainingFunction);
            net.trainParam.epochs = variableInput;    
        otherwise
            error('Not supported parameter. Check for spelling mistakes.');
    end
    net.trainParam.showWindow=false;
end

function [net, Y, Elearn, Etest] = trainSingleNetwork(net, X, Xlearn, Dlearn, Xtest, Dtest)
    net = train(net, Xlearn, Dlearn);

    Y = sim(net, X);
    plot(X, Y, 'm');

    Ylearn= sim(net,Xlearn);
    Elearn = mse(Dlearn - Ylearn);

    Ytest= sim(net,Xtest);
    Etest = mse(Dtest - Ytest);
end

function outputValues = trainMultipleNetworks(variableInput, variableFunctionality, X, Xlearn, Dlearn, Xtest, Dtest, quantity, D)
    nets = cell(1, quantity);
    Ys = cell(1, quantity);
    Elearns = zeros(1, quantity);
    Etests = zeros(1, quantity);
      
    figure
    plot(X,D);
    hold on;
    plot(Xlearn, Dlearn, '*');
    plot(Xtest, Dtest, 'g*');
    for index = 1 : quantity
        net = newffPrettyWrapper(variableInput, variableFunctionality);
        [nets{index}, Ys{index}, Elearns(index), Etests(index)] = trainSingleNetwork(net, X, Xlearn, Dlearn, Xtest, Dtest);
    end
    legend('function', 'Xlearn', 'Xtest', 'network');
    if strcmp(variableFunctionality, 'layers') || strcmp(variableFunctionality, 'epochs') || strcmp(variableFunctionality, 'inputsLimits')
        title([variableFunctionality, ': ', num2str(variableInput)])
    elseif strcmp(variableFunctionality, 'transferFunctions')
        toDisplay = '';
        for index = 1 : length(variableInput)
           toDisplay = [toDisplay, ' ', variableInput{index}]; 
        end
        title([variableFunctionality, ': ', toDisplay]);
    elseif strcmp(variableFunctionality, 'trainingFunction')
        title([variableFunctionality, ': ', variableInput]);
    end
    outputValues{1} = nets;
    outputValues{2} = Ys;
    outputValues{3} = mean(Elearns);
    outputValues{4} = mean(Etests);
end

function plotErrors(networkData)
    Elearn = zeros(size(networkData));
    Etest = Elearn;
    for index = 1:length(networkData)
        Elearn(index) = networkData{index}{3};
        Etest(index) = networkData{index}{4};
    end
    figure;
    hold on;
    plot(Elearn, '*');
    plot(Etest, '*');
    title('Comparison of errors');
    legend('Elearn', 'Etest');
end
%}