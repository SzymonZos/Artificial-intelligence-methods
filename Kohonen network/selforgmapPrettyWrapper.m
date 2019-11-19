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