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