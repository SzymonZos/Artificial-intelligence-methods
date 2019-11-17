load Data_microarray

lenOnes = 100;
d1 = randn(2, lenOnes);
d2 = randn(2, lenOnes) + 9;
d3 = randn(2, lenOnes);
d3(1,:) = d3(1,:) + 9;


%X = [d1, d2, d3];
X = [Data(:,1)' Data(:,2)'];

lenOnes = length(Data);

%%

%{
Na podstawie wektora przynale�no�ci konkretnych pr�bek do klas nale�y oceni� wp�yw
� liczby neuron�w: pierwszy parametr w selforgmap
� topologii sieci (prosz� zmodyfikowa� struktur� sieci, lub zwi�kszy�
liczb� klas abstrakcji): ???????? hextop gridtop randtop?
� wyboru funkcji odleg�o�ci: ostatni parametr: dist linkdist, mandist
� liczby epok uczenia: net.trainParam.epochs = 500;
� wymiarowo�ci sieci: ?????
%}

%%

net = selforgmap([1 3], 100, 3, 'hextop', 'dist'); %hextop gridtop randtop -> co� sprawdzi�
net.trainParam.epochs = 500;
net = train(net, X);
%view(net);
y = net(X);
classes = vec2ind(y); 

distances = dist(net.IW{1}, X);
[d, ind] = min(distances, [], 1);

sumDistances = sum(double(Data(:,3)' == ind));
