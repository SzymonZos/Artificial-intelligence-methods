lenOnes = 100;
d1 = randn(2, lenOnes);
d2 = randn(2, lenOnes) + 9;
d3 = randn(2, lenOnes);
d3(1,:) = d3(1,:) + 9;


%X = [d1, d2, d3];
X = [Data(:,1)' Data(:,2)'];

lenOnes = length(Data);

%%
%wybór funkcji odleg³o
%dist linkdist, mandist

net = selforgmap([1 3], 100, 3, 'hextop', 'dist'); %hextop gridtop randtop -> coœ sprawdziæ
net.trainParam.epochs = 500;
net = train(net, X);
%view(net);
y = net(X);
classes = vec2ind(y); 

distances = dist(net.IW{1}, X);
[d, ind] = min(distances, [], 1);

sumDistances = sum(double(Data(:,3)' == ind));
