%% 1 zadanie
close all
clear all

%% 4x4

d1 = [1; -1; -1; -1;  -1; 1; -1; -1;  -1; -1; 1; -1;  -1; -1; -1; 1];
d2 = [-1; -1; -1; -1;  1; -1; -1; -1;  1; 1; -1; -1;  1; 1; 1; -1];
d3 = ones(16,1); d3(1:8) = -1;
d4 = ones(16,1); d4(8:16) = -1;
d5 = -ones(16,1); d5(1:5) = 1;
d6 = -ones(16,1); d6(10:16) = 1;


t = [-1; -1; -1; -1;  1; -1; -1; -1;  1; 1; -1; -1;  -1; 1; 1; -1];

%%  2 wzorce
D(:,1) = d1;
D(:,2) = d2;

y_hebb = hopfieldNetwork(t, 10, D, @hebbWeights);
results_1_hebb = {d1, d2, t, y_hebb(:,end)};
results_1_hebb = cellfun(@(img) reshape(img, 4, 4), results_1_hebb, 'UniformOutput', 0);
titles_hebb = {'Hebb d1', 'Hebb d2', 'Hebb t', 'Hebb wynik'};

y_inv = hopfieldNetwork(t, 10, D, @pseudoinverseRule);
results_1_inv = {d1, d2, t, y_inv(:,end)};
results_1_inv = cellfun(@(img) reshape(img, 4, 4), results_1_inv, 'UniformOutput', 0);

results_1 = [results_1_hebb, results_1_inv];
titles_inv = {'Inv d1', 'Inv d2', 'Inv t', 'Inv wynik'};
titles_1 = [titles_hebb, titles_inv];
show_results(results_1, titles_1);

%%  4 wzorce
D(:,3) = d3;
D(:,4) = d4;

y_hebb_2 = hopfieldNetwork(t, 10, D, @hebbWeights);
results_2_hebb = {d1, d2, d3, d4, t, y_hebb_2(:,end)};
results_2_hebb = cellfun(@(img) reshape(img, 4, 4), results_2_hebb, 'UniformOutput', 0);
titles_hebb = {'Hebb d1', 'Hebb d2', 'Hebb d3', 'Hebb d4', 'Hebb t', 'Hebb wynik'};

y_inv_2 = hopfieldNetwork(t, 10, D, @pseudoinverseRule);
results_2_inv = {d1, d2, d3, d4, t, y_inv_2(:,end)};
results_2_inv = cellfun(@(img) reshape(img, 4, 4), results_2_inv, 'UniformOutput', 0);

results_2 = [results_2_hebb, results_2_inv];
titles_inv = {'Inv d1', 'Inv d2', 'Inv d3', 'Inv d4', 'Inv t', 'Inv wynik'};
titles_2 = [titles_hebb, titles_inv];
show_results(results_2, titles_2);

%% 6 wzorców
D(:,5) = d5;
D(:,6) = d6;

y_hebb_3 = hopfieldNetwork(t, 10, D, @hebbWeights);
results_3_hebb = {d1, d2, d3, d4, d5, d6, t, y_hebb_3(:,end)};
results_3_hebb = cellfun(@(img) reshape(img, 4, 4), results_3_hebb, 'UniformOutput', 0);
titles_hebb = {'Hebb d1', 'Hebb d2', 'Hebb d3', 'Hebb d4', 'Hebb d5', 'Hebb d6', 'Hebb t', 'Hebb wynik'};

y_inv_3 = hopfieldNetwork(t, 10, D, @pseudoinverseRule);
results_3_inv = {d1, d2, d3, d4, d5, d6, t, y_inv_3(:,end)};
results_3_inv = cellfun(@(img) reshape(img, 4, 4), results_3_inv, 'UniformOutput', 0);

results_3 = [results_3_hebb, results_3_inv];
titles_inv = {'Inv d1', 'Inv d2', 'Inv d3', 'Inv d4', 'Inv d5', 'Inv d6', 'Inv t', 'Inv wynik'};
titles_3 = [titles_hebb, titles_inv];
show_results(results_3, titles_3);
