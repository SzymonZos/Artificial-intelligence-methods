load Data_microarray

%X = [d1, d2, d3];
X = [Data(:,1)'; Data(:,2)'];


%%

net = selforgmap(3, 100, 3, 'hextop', 'dist'); %hextop gridtop randtop -> coœ sprawdziæ
net.trainParam.epochs = 200;
net = train(net, X);
%view(net);
y = net(X);
classes = vec2ind(y); 

sumDistances = sum(double(Data(:,3)' == classes));
