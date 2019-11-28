
%% Function
% 
% $(4*x - 3*x^2 + 2*x^3 - x^4 + 100*\sin(x) - 50*\cos(x))/100$
% 
%% Preparation of training and test sets
close all
clear all
warning('off', 'NNET:Obsolete')

X = -4 : 0.01 : 4;
D = generateFunction(X);

Xlearn = X(1:30:end);
noise = randi([-5, 5], size(Xlearn))./100;
Dlearn = generateFunction(Xlearn) + noise;

Xtest = Xlearn + 0.2;
noise = randi([-5, 5], size(Xtest))./100;
Dtest = generateFunction(Xtest) + noise;

figure
plot(X,D);
hold on;
plot(Xlearn, Dlearn, '*');
plot(Xtest, Dtest, 'g*');
legend('function', 'learn', 'test');
title('Comparison of given function and sets');
