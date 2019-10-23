%% 2 zadanie
close all
clear all
%% 100x100

imgs{1} = imread('lena_cropped.bmp');
imgs{2} = imread('14.bmp');
imgs{3} = imread('baboon.bmp');
imgs{4} = imread('crow.bmp');
imgs{5} = imread('peppers.bmp');
imgs{6} = imread('kodim.bmp');
imgs{7} = imnoise(imgs{1}, 'salt & pepper', 1);

imgs = cellfun(@im2bw, imgs, 'UniformOutput', 0);
imgs = cellfun(@(img) double(reshape(img, numel(img), 1)), imgs, 'UniformOutput', 0);
for i = 1:length(imgs) 
    imgs{i}(imgs{i} == 0) = -1;
end

d1 = imgs{1};
d2 = imgs{2};
d3 = imgs{3};
d4 = imgs{4};
d5 = imgs{5};
d6 = imgs{6};

t = imgs{7};
%%  2 wzorce
D(:,1) = d1;
D(:,2) = d2;

y_hebb = hopfieldNetwork(t, 10, D, @hebbWeights);
results_1_hebb = {d1, d2, t, y_hebb(:,end)};
results_1_hebb = cellfun(@(img) reshape(img, 100, 100), results_1_hebb, 'UniformOutput', 0);
titles_hebb = {'Hebb d1', 'Hebb d2', 'Hebb t', 'Hebb wynik'};

y_inv = hopfieldNetwork(t, 10, D, @pseudoinverseRule);
results_1_inv = {d1, d2, t, y_inv(:,end)};
results_1_inv = cellfun(@(img) reshape(img, 100, 100), results_1_inv, 'UniformOutput', 0);

results_1 = [results_1_hebb, results_1_inv];
titles_inv = {'Inv d1', 'Inv d2', 'Inv t', 'Inv wynik'};
titles_1 = [titles_hebb, titles_inv];
show_results(results_1, titles_1);

%%  4 wzorce
D(:,3) = d3;
D(:,4) = d4;

y_hebb_2 = hopfieldNetwork(t, 10, D, @hebbWeights);
results_2_hebb = {d1, d2, d3, d4, t, y_hebb_2(:,end)};
results_2_hebb = cellfun(@(img) reshape(img, 100, 100), results_2_hebb, 'UniformOutput', 0);
titles_hebb = {'Hebb d1', 'Hebb d2', 'Hebb d3', 'Hebb d4', 'Hebb t', 'Hebb wynik'};

y_inv_2 = hopfieldNetwork(t, 10, D, @pseudoinverseRule);
results_2_inv = {d1, d2, d3, d4, t, y_inv_2(:,end)};
results_2_inv = cellfun(@(img) reshape(img, 100, 100), results_2_inv, 'UniformOutput', 0);

results_2 = [results_2_hebb, results_2_inv];
titles_inv = {'Inv d1', 'Inv d2', 'Inv d3', 'Inv d4', 'Inv t', 'Inv wynik'};
titles_2 = [titles_hebb, titles_inv];
show_results(results_2, titles_2);

%% 6 wzorców
D(:,5) = d5;
D(:,6) = d6;

y_hebb_3 = hopfieldNetwork(t, 10, D, @hebbWeights);
results_3_hebb = {d1, d2, d3, d4, d5, d6, t, y_hebb_3(:,end)};
results_3_hebb = cellfun(@(img) reshape(img, 100, 100), results_3_hebb, 'UniformOutput', 0);
titles_hebb = {'Hebb d1', 'Hebb d2', 'Hebb d3', 'Hebb d4', 'Hebb d5', 'Hebb d6', 'Hebb t', 'Hebb wynik'};

y_inv_3 = hopfieldNetwork(t, 10, D, @pseudoinverseRule);
results_3_inv = {d1, d2, d3, d4, d5, d6, t, y_inv_3(:,end)};
results_3_inv = cellfun(@(img) reshape(img, 100, 100), results_3_inv, 'UniformOutput', 0);

results_3 = [results_3_hebb, results_3_inv];
titles_inv = {'Inv d1', 'Inv d2', 'Inv d3', 'Inv d4', 'Inv d5', 'Inv d6', 'Inv t', 'Inv wynik'};
titles_3 = [titles_hebb, titles_inv];
show_results(results_3, titles_3);
