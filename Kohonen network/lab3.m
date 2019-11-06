lenOnes = 100;
rng(1.5);
d1 = randn(2, lenOnes);
d2 = randn(2, lenOnes) + 9;
d3 = randn(2, lenOnes);
d3(1,:) = d3(1,:) + 9;

n = 100;
x0 = [1, 10];
y0 = [0, 1];

x = (x0(2) - x0(1)) * randn(n, 1) + x0(1);
y = (y0(1) - y0(2)) / (x0(1) - x0(2)) * (x - x0(1)) + y0(1);

X = [d1, d2, d3, [x';y']];

%%
subD1 = ones(1,lenOnes); %odleg³oœci od neuronów i bierzemy grupê, której wartoœæ bêdzie najwiêksza
subD2 = 2 * ones(1,lenOnes);
subD3 = 3 * ones(1,lenOnes);

D{1} = [subD1, subD2, subD3];
D{2} = [subD1, subD3, subD2];
D{3} = [subD2, subD1, subD3];

D{4} = [subD2, subD3, subD1];
D{5} = [subD3, subD1, subD2];
D{6} = [subD3, subD2, subD1];
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

sumDistances = cellfun(@(Di) sum(double(Di == ind)), D);
