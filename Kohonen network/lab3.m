%% Ex. 1 Initial

rng(1.5);
lenOnes = 100;
x1 = randn(2, lenOnes);
x2 = randn(2, lenOnes) + 9;
x3 = randn(2, lenOnes);
x3(1,:) = x3(1,:) + 9;
X = [x1, x2, x3];

numberOfClasses = 3;
possibleClasses = mat2cell(perms(1:numberOfClasses), ones(1, factorial(numberOfClasses)), numberOfClasses);
possibleClasses = cellfun(@(possibleClass) cell2mat(arrayfun(@(x) x*ones(1,100), possibleClass, 'UniformOutput', 0)), possibleClasses, 'UniformOutput', 0);

%% Variable number of neurons
maxNumberOfNeurons = 10;
neurons = cell(1, maxNumberOfNeurons);
for index = 1 : maxNumberOfNeurons
    neurons{index} = [index, 1];
end
[netN, yN, classesN, sumDistancesN] = cellfun(@(neuron) trainNetwork(neuron, ...
    'layers', X, possibleClasses), neurons, 'UniformOutput', 0);

%% Variable topology functions
topologyFunctions = {'hextop', 'tritop', 'gridtop', 'randtop'};
[netT, yT, classesT, sumDistancesT] = cellfun(@(topologyFunction) trainNetwork(topologyFunction, ...
    'topologyFunction', X, possibleClasses), topologyFunctions, 'UniformOutput', 0);

%% Variable method of distance
distanceFunctions = {'dist', 'linkdist', 'mandist'};
[netD, yD, classesD, sumDistancesD] = cellfun(@(distanceFunction) trainNetwork(distanceFunction, ...
    'distanceFunction', X, possibleClasses), distanceFunctions, 'UniformOutput', 0);


%% Variable number of epochs
epochs = {5, 10, 20, 50, 100, 200, 300, 400};
[netE, yE, classesE, sumDistancesE] = cellfun(@(epoch) trainNetwork(epoch, ...
    'epochs', X, possibleClasses), epochs, 'UniformOutput', 0);

%% Variable number of layers
maxNumberOfLayers = 5;
numberOfLayers = 1:maxNumberOfLayers;
layers = arrayfun(@(layer) [2*ones(1, layer), 1], numberOfLayers, 'UniformOutput', 0);

[netL, yL, classesL, sumDistancesL] = cellfun(@(layer) trainNetwork(layer, ...
    'layers', X, possibleClasses), layers, 'UniformOutput', 0);

%% Ex. 2 Initial
load Data_microarray

X = [Data(:,1)'; Data(:,2)'];
numberOfIndeces = accumarray(Data(:,3), 1);

numberOfClasses = 3;
possibleClasses = mat2cell(perms(1:numberOfClasses), ones(1, factorial(numberOfClasses)), numberOfClasses);
possibleClasses = cellfun(@(possibleClass) cell2mat(arrayfun(@(x) x*ones(1,numberOfIndeces(x)), possibleClass, 'UniformOutput', 0)), possibleClasses, 'UniformOutput', 0);

%% Variable number of neurons
maxNumberOfNeurons = 10;
neurons = cell(1, maxNumberOfNeurons);
for index = 1 : maxNumberOfNeurons
    neurons{index} = [index, 1];
end
[netN, yN, classesN, sumDistancesN] = cellfun(@(neuron) trainNetwork(neuron, ...
    'layers', X, possibleClasses, 1), neurons, 'UniformOutput', 0);

%% Variable topology functions
topologyFunctions = {'hextop', 'tritop', 'gridtop', 'randtop'};
[netT, yT, classesT, sumDistancesT] = cellfun(@(topologyFunction) trainNetwork(topologyFunction, ...
    'topologyFunction', X, possibleClasses, 1), topologyFunctions, 'UniformOutput', 0);

%% Variable method of distance
distanceFunctions = {'dist', 'linkdist', 'mandist'};
[netD, yD, classesD, sumDistancesD] = cellfun(@(distanceFunction) trainNetwork(distanceFunction, ...
    'distanceFunction', X, possibleClasses, 1), distanceFunctions, 'UniformOutput', 0);


%% Variable number of epochs
epochs = {5, 10, 20, 50, 100, 200, 300, 400};
[netE, yE, classesE, sumDistancesE] = cellfun(@(epoch) trainNetwork(epoch, ...
    'epochs', X, possibleClasses, 1), epochs, 'UniformOutput', 0);

%% Variable number of layers
maxNumberOfLayers = 5;
numberOfLayers = 1:maxNumberOfLayers;
layers = arrayfun(@(layer) [2*ones(1, layer), 1], numberOfLayers, 'UniformOutput', 0);

[netL, yL, classesL, sumDistancesL] = cellfun(@(layer) trainNetwork(layer, ...
    'layers', X, possibleClasses, 1), layers, 'UniformOutput', 0);

%% Additional functions
%{
function net = selforgmapPrettyWrapper(variableInput, variableFunctionality)
    layers = 3;
    coverSteps = 100;
    initNeighbor = 3;
    topologyFunction = 'hextop';
    distanceFunction = 'linkdist';
    numberOfEpochs = 200;
    
    switch variableFunctionality
        case 'layers'
            net = selforgmap(variableInput, coverSteps, initNeighbor, topologyFunction, distanceFunction);
            net.trainParam.epochs = numberOfEpochs;
        case 'layersSecondIteration'
            net = selforgmap(layers, coverSteps, initNeighbor, topologyFunction, distanceFunction);
            net.trainParam.epochs = numberOfEpochs;
        case {'topologyFunction', 'topologyFunctionSecondIteration'}
            net = selforgmap(layers, coverSteps, initNeighbor, variableInput, distanceFunction);
            net.trainParam.epochs = numberOfEpochs;
        case {'distanceFunction', 'distanceFunctionSecondIteration'}
            net = selforgmap(layers, coverSteps, initNeighbor, topologyFunction, variableInput);
            net.trainParam.epochs = numberOfEpochs;
        case {'epochs', 'epochsSecondIteration'}
            net = selforgmap(layers, coverSteps, initNeighbor, topologyFunction, distanceFunction);
            net.trainParam.epochs = variableInput;    
        otherwise
            error('Not supported parameter. Check for spelling mistakes.');
    end
    net.trainParam.showWindow = false;
end

function [net, y, classes, stats] = trainNetwork(variableInput, variableFunctionality, X, D, varargin)
    net{1} = selforgmapPrettyWrapper(variableInput, variableFunctionality);
    net{1} = train(net{1}, X);
    y{1} = net{1}(X);
    classes{1} = vec2ind(y{1}); 

    if strcmp(variableFunctionality, 'layers') || strcmp(variableFunctionality, 'epochs') || strcmp(variableFunctionality, 'inputsLimits')
        toDisplay = [variableFunctionality, ': ', num2str(variableInput)];
    elseif strcmp(variableFunctionality, 'topologyFunction') || strcmp(variableFunctionality, 'distanceFunction')
        toDisplay = [variableFunctionality, ': ', variableInput];
    end
    
    figure;
    if isempty(varargin)
        plotsompos(net{1}, X);
    else
        hold on;
        plot(X(1,:), X(2,:), 'g*');
        plot(net{1}.iw{1}(:,1), net{1}.iw{1}(:,2), 'b*');
    end
    title(['Step 1 - ', toDisplay]);
    
    neuronsFromFirstNet = net{1}.iw{1};
    net{2} = selforgmapPrettyWrapper(variableInput, [variableFunctionality, 'SecondIteration']);
    net{2} = train(net{2}, neuronsFromFirstNet');
    y{2} = net{2}(X);
    classes{2} = vec2ind(y{2});
    sumDistances = cellfun(@(Di) sum(double(Di == classes{2})), D);

    figure;
    if isempty(varargin)
        plotsompos(net{2}, X);
    else
        hold on;
        plot(X(1,:), X(2,:), 'g*');
        plot(net{2}.iw{1}(:,1), net{2}.iw{1}(:,2), 'b*');
    end
    title(['Step 2 - ', toDisplay]);
    
    [closestClassValue, closestClassIndex] = max(sumDistances);
    percentageOfGoodMatches = (closestClassValue / 300) * 100;
    display([toDisplay, 10, 'Index match: ', num2str(closestClassIndex), 10, 'Percentage of good matches: ' num2str(percentageOfGoodMatches)]);
    stats{1} = sumDistances;
    stats{2} = closestClassValue;
    stats{3} = closestClassIndex;
end
%}