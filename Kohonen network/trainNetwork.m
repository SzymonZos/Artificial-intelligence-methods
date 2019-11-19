function [net, y, classes, sumDistances] = trainNetwork(variableInput, variableFunctionality)
%    net{1} = selforgmap([1 5], 100, 3 , 'hextop', 'dist'); %hextop gridtop randtop -> coœ sprawdziæ
%    net{1}.trainParam.epochs = 200;
    net{1} = selforgmapPrettyWrapper(variableInput, variableFunctionality);
    net{1} = train(net{1}, X);
    y{1} = net{1}(X);
    classes{1} = vec2ind(y{1}); 

    figure;
    plotsompos(net{1}, X);

    neuronsFromFirstNet = net{1}.iw{1};
    net{2} = selforgmapPrettyWrapper(variableInput, [variableFunctionality, 'SecondIteration']);
    net{2} = train(net{2}, neuronsFromFirstNet');
    y{2} = net{2}(X);
    classes{2} = vec2ind(y{2});
    sumDistances = cellfun(@(Di) sum(double(Di == classes{2})), D);

    figure;
    plotsompos(net{2}, X);
end