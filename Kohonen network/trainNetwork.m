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
    display([toDisplay, 10, 'Index match: ', num2str(closestClassIndex), 10, 'Percentage of good matches: ' num2str(percentageOfGoodMatches), 10]);
    stats{1} = sumDistances;
    stats{2} = closestClassValue;
    stats{3} = closestClassIndex;
end