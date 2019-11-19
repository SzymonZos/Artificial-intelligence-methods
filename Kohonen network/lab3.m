rng(1.5);
lenOnes = 100;
x1 = randn(2, lenOnes);
x2 = randn(2, lenOnes) + 9;
x3 = randn(2, lenOnes);
x3(1,:) = x3(1,:) + 9;
X = [x1, x2, x3];

numberOfClasses = 3;
%%

%{
Na podstawie wektora przynale¿noœci konkretnych próbek do klas nale¿y oceniæ wp³yw
• liczby neuronów: pierwszy parametr w selforgmap
• topologii sieci (proszê zmodyfikowaæ strukturê sieci, lub zwiêkszyæ
liczbê klas abstrakcji): ???????? hextop gridtop randtop?
• wyboru funkcji odleg³oœci: ostatni parametr: dist linkdist, mandist
• liczby epok uczenia: net.trainParam.epochs = 500;
• wymiarowoœci sieci: ?????
%}

%%
possibleClasses = mat2cell(perms(1:numberOfClasses), ones(1, factorial(numberOfClasses)), numberOfClasses);
possibleClasses = cellfun(@(possibleClass) cell2mat(arrayfun(@(x) x*ones(1,100), possibleClass, 'UniformOutput', 0)), possibleClasses, 'UniformOutput', 0);

netFirst = selforgmap([1 5], 100, 3 , 'hextop', 'dist'); %hextop gridtop randtop -> coœ sprawdziæ
netFirst.trainParam.epochs = 200;
netFirst = train(netFirst, X);
yFirst = netFirst(X);
classesFirst = vec2ind(yFirst); 

figure;
plotsompos(netFirst, X);

neuronsFromFirstNet = netFirst.iw{1};
netSecond = selforgmap(3, 100, 3, 'hextop', 'dist');
netSecond = train(netSecond, neuronsFromFirstNet');
ySecond = netSecond(X);
classesSecond = vec2ind(ySecond);
sumDistancesMain = cellfun(@(Di) sum(double(Di == classesSecond)), D);

figure;
plotsompos(netSecond, X);