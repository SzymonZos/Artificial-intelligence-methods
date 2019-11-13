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