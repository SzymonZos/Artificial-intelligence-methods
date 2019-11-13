function [net, Y, Elearn, Etest] = trainSingleNetwork(net, X, Xlearn, Dlearn, Xtest, Dtest)
    net = train(net, Xlearn, Dlearn);

    Y = sim(net, X);
    plot(X, Y, 'm');

    Ylearn= sim(net,Xlearn);
    Elearn = mse(Dlearn - Ylearn);

    Ytest= sim(net,Xtest);
    Etest = mse(Dtest - Ytest);
end