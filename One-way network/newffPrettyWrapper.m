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