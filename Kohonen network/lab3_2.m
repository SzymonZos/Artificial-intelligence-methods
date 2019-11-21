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