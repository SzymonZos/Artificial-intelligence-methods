load Data_PTC_vs_FTC.mat

gen(1,:) = Data.X(1,:);
gen(2,:) = Data.X(24,:);
t = Data.D;
t(t == -1) = 0;

class_0 = gen(:, logical(t == 0));
class_1 = gen(:, logical(t == 1));

figure;
plot(class_0(1,:), class_0(2,:), '*');
hold on
plot(class_1(1,:), class_1(2,:), '*');

numberOfSubsets = 86;
numberOfDataInSubset = floor(length(gen)/(numberOfSubsets - 1));
numberOfDataInLastSubset = length(gen) - (numberOfSubsets - 1) * numberOfDataInSubset;
genSubsets = mat2cell(gen, 2, [numberOfDataInSubset * ones(1, numberOfSubsets - 1), numberOfDataInLastSubset]);

for subsetIndex = 1 : numberOfSubsets
    genTest = genSubsets{subsetIndex};
    if subsetIndex == 1
        genLearn = cell2mat(genSubsets(2:end));
        classes = t(numberOfDataInSubset + 1:end);
    elseif subsetIndex == numberOfSubsets
        genLearn = cell2mat(genSubsets(1:end-1));
        classes = t(1:end - numberOfDataInLastSubset);
    else
        genLearn = cell2mat(genSubsets([1:(subsetIndex - 1), (subsetIndex + 1):end]));
        classes = t([1:numberOfDataInSubset*(subsetIndex - 1), (numberOfDataInSubset*subsetIndex+1):end]);
    end
    net = newp(genLearn, classes);
    net.trainParam.epochs = 50;
    net.trainParam.showWindow=false;
    net = train(net, genLearn, classes);
    Y{subsetIndex} = sim(net, genTest);
end
xD = sum(cell2mat(Y)==t);