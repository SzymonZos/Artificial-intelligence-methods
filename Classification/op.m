%% Code
%
% function computeKfold(gen, t, numberOfSubsets)
%
%     numberOfDataInSubset = floor(length(gen)/(numberOfSubsets - 1));
%     numberOfDataInLastSubset = length(gen) - (numberOfSubsets - 1) * ...
%     numberOfDataInSubset;
%     genSubsets = mat2cell(gen, 2, [numberOfDataInSubset * ones(1, ...
%     numberOfSubsets - 1), numberOfDataInLastSubset]);
% 
%     for subsetIndex = 1 : numberOfSubsets
%         genTest = genSubsets{subsetIndex};
%         if subsetIndex == 1
%             genLearn = cell2mat(genSubsets(2:end));
%             classes = t(numberOfDataInSubset + 1:end);
%         elseif subsetIndex == numberOfSubsets
%             genLearn = cell2mat(genSubsets(1:end-1));
%             classes = t(1:end - numberOfDataInLastSubset);
%         else
%             genLearn = cell2mat(genSubsets([1:(subsetIndex - 1), ...
%             (subsetIndex + 1):end]));
%             classes = t([1:numberOfDataInSubset*(subsetIndex - 1), ...
%             (numberOfDataInSubset*subsetIndex+1):end]);
%         end
%         net = newp(genLearn, classes, 'hardlims', 'learnp');
%         net.trainParam.epochs = 100;
%         net.trainParam.showWindow = false;
%         net = train(net, genLearn, classes);
%         Y{subsetIndex} = sim(net, genTest);
%     end
%     
%     display(['Number of subsets = ' num2str(numberOfSubsets) 10]);
%     results = cell2mat(Y);
%     results(results == -1) = 0;
%     numberOfMatches = sum(results==t);
%     numberOfPositiveMatches = sum(results(logical(t==0)) == 0);
%     numberOfNegativeMatches = sum(results(logical(t==1)) == 1);
% 
%     efficiency = numberOfMatches/length(t);
%     display(['Efficiency = ' num2str(efficiency) 10]);
% 
%     responsivity = numberOfPositiveMatches/sum(t==0);
%     display(['(Positive group is "0") Responsivity = ' ...
%     num2str(responsivity) 10]);
% 
%     specifity = numberOfNegativeMatches/sum(t==1);
%     display(['(Negative group is "1") Specifity = ' ...
%     num2str(specifity) 10 10]);
%     showData(gen, t, 'Original data');
%     showData(gen, results, ['Learnt data, number of subsets: ' ...
%     num2str(numberOfSubsets)]);
% end
%
% function showData(data, classes, titleData)
%
%     class_0 = data(:, logical(classes == 0));
%     class_1 = data(:, logical(classes == 1));
%     figure;
%     plot(class_0(1,:), class_0(2,:), '*');
%     hold on;
%     plot(class_1(1,:), class_1(2,:), '*');
%     title(titleData);
% end