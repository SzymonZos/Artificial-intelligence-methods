lenOnes = 100;
numberOfClasses = 3;
rng(1.5);
d1 = randn(2, lenOnes);
d2 = randn(2, lenOnes) + 9;
d3 = randn(2, lenOnes);
d3(1,:) = d3(1,:) + 9;

%{
some rng garbo dunno
n = 100;
x0 = [1, 10];
y0 = [0, 1];
x = (x0(2) - x0(1)) * randn(n, 1) + x0(1);
y = (y0(1) - y0(2)) / (x0(1) - x0(2)) * (x - x0(1)) + y0(1);
%}
X = [d1, d2, d3];

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
%> dd = mat2cell(perms(1:3), ones(1,6), 3)
possibleClasses = mat2cell(perms(1:numberOfClasses), ones(1, factorial(numberOfClasses)), numberOfClasses);
possibleClasses = cellfun(@(possibleClass) cell2mat(arrayfun(@(x) x*ones(1,100), possibleClass, 'UniformOutput', 0)), possibleClasses, 'UniformOutput', 0);
%possibleClasses = arrayfun(@(possibleClass) )
%{
subD1 = ones(1,lenOnes); %odleg³oœci od neuronów i bierzemy grupê, której wartoœæ bêdzie najwiêksza
subD2 = 2 * ones(1,lenOnes);
subD3 = 3 * ones(1,lenOnes);

D{1} = [subD1, subD2, subD3];
D{2} = [subD1, subD3, subD2];
D{3} = [subD2, subD1, subD3];

D{4} = [subD2, subD3, subD1];
D{5} = [subD3, subD1, subD2];
D{6} = [subD3, subD2, subD1];
%}
net = selforgmap([1 5], 100, 3 , 'hextop', 'dist'); %hextop gridtop randtop -> coœ sprawdziæ
net.trainParam.epochs = 200;
net = train(net, X);
%view(net);
y = net(X);
classes = vec2ind(y); 
sumDistances = cellfun(@(possibleClass) sum(double(possibleClass == classes)), possibleClasses);

dupaDupa = net.iw{1};
netMain = selforgmap(3, 100, 3, 'hextop', 'dist');
netMain = train(netMain, dupaDupa');
yMain = netMain(X);
classesMain = vec2ind(yMain);
sumDistancesMain = cellfun(@(Di) sum(double(Di == classesMain)), D);

% nice workaround bro XD
%distances = dist(net.IW{1}, X);
%[d, ind] = min(distances, [], 1);
%sumDistances = cellfun(@(Di) sum(double(Di == ind)), D);

figure;
plotsompos(netMain, X);