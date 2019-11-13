load Data_PTC_vs_FTC.mat

gen(1,:) = Data.X(1,:);
gen(2,:) = Data.X(24,:);
t = Data.D;

figure;
plot(gen(1,:), gen(2,:), '*');

net = newp(gen, t, 'hardlims', 'learnp');
net.trainParam.epochs = 200;
net = train(net, gen);
Y = sim(net, gen); 
%%
numberOfSubsets = 11;
numberOfDataInSubset = floor(length(gen)/(numberOfSubsets - 1));
genSubsets = mat2cell(gen, 2, [(numberOfSubsets - 1) * ones(1, numberOfDataInSubset), length(gen) - (numberOfSubsets - 1) * numberOfDataInSubset]);

for subsetIndex = 1 : numberOfSubsets
    genTest = genSubsets{subsetIndex};
    genLearn = cell2mat(genSubsets)
end