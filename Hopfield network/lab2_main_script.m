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

% 2 patterns
D(:,1) = d1;
D(:,2) = d2;
results_4x4_2 = matchImgToTheClosestPattern(t, 10, D);

% 4 patterns
D(:,3) = d3;
D(:,4) = d4;
results_4x4_4 = matchImgToTheClosestPattern(t, 10, D);

% 6 patterns
D(:,5) = d5;
D(:,6) = d6;
results_4x4_6 = matchImgToTheClosestPattern(t, 10, D);

%% 6x6

d1 = [1; -1; -1; -1; -1; 1;  -1; 1; -1; -1; -1; 1; -1; -1; 1; -1; -1; 1; -1; -1; -1; 1; -1; 1; -1; -1; -1; 1; -1; 1; -1; -1; -1; 1; -1; 1];
d2 = [-1; -1; -1; -1; -1; -1;  1; -1; -1; -1; -1; -1;  1; 1; -1; -1; -1; -1;  1; 1; 1; -1; -1; -1;  1; 1; 1; 1; -1; -1;  1; 1; 1; 1; 1; -1];
d3 = ones(36,1); d3(1:18) = -1;
d4 = ones(36,1); d4(8:18) = -1;
d5 = -ones(36,1); d5(1:5) = 1;
d6 = -ones(36,1); d6(10:16) = 1;

t = [-1; -1; -1; -1; -1; -1;  1; -1; -1; -1; -1; -1;  1; 1; -1; -1; -1; -1;  1; 1; 1; -1; -1; -1;  -1; 1; 1; 1; -1; -1;  -1; -1; 1; 1; 1; -1];
D = [];

% 2 patterns
D(:,1) = d1;
D(:,2) = d2;
results_6x6_2 = matchImgToTheClosestPattern(t, 10, D);

% 4 patterns
D(:,3) = d3;
D(:,4) = d4;
results_6x6_4 = matchImgToTheClosestPattern(t, 10, D);

% 6 patterns
D(:,5) = d5;
D(:,6) = d6;
results_6x6_6 = matchImgToTheClosestPattern(t, 10, D);

%% 100x100

imgs{1} = imread('lena_cropped.bmp');
imgs{2} = imread('14.bmp');
imgs{3} = imread('baboon.bmp');
imgs{4} = imread('crow.bmp');
imgs{5} = imread('peppers.bmp');
imgs{6} = imread('kodim.bmp');
imgs{7} = imnoise(imgs{1}, 'salt & pepper', 0.2);

imgs = cellfun(@im2bw, imgs, 'UniformOutput', 0);
imgs = cellfun(@(img) double(reshape(img, numel(img), 1)), imgs, 'UniformOutput', 0);
for i = 1:length(imgs) 
    imgs{i}(imgs{i} == 0) = -1;
end
D = [];
% 2 patterns
D(:,1) = imgs{1};
D(:,2) = imgs{2};
results_100x100_2 = matchImgToTheClosestPattern(imgs{7}, 10, D);

% 4 patterns
D(:,3) = imgs{3};
D(:,4) = imgs{4};
results_100x100_4 = matchImgToTheClosestPattern(imgs{7}, 10, D);

% 6 patterns
D(:,5) = imgs{5};
D(:,6) = imgs{6};
results_100x100_6 = matchImgToTheClosestPattern(imgs{7}, 10, D);