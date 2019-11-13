function outputValues = trainMultipleNetworks(net, X, Xlearn, Dlearn, Xtest, Dtest, quantity, D)
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
        [nets{index}, Ys{index}, Elearns(index), Etests(index)] = trainSingleNetwork(net, X, Xlearn, Dlearn, Xtest, Dtest);
    end
    legend('function', 'Xlearn', 'Xtest', 'network');
    outputValues{1} = nets;
    outputValues{2} = Ys;
    outputValues{3} = mean(Elearns);
    outputValues{4} = mean(Etests);
end