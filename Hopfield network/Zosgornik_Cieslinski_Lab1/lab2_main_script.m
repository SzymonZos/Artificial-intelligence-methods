close all
clear all

%% 4x4

D(:,1) = [1; -1; -1; -1;  -1; 1; -1; -1;  -1; -1; 1; -1;  -1; -1; -1; 1];
D(:,2) = [-1; -1; -1; -1;  1; -1; -1; -1;  1; 1; -1; -1;  1; 1; 1; -1];
D(:,3) = ones(16,1); D(1:8,3) = -1;
D(:,4) = ones(16,1); D(8:16,4) = -1;
D(:,5) = -ones(16,1); D(1:5,5) = 1;
D(:,6) = -ones(16,1); D(10:16,6) = 1;
t = [-1; -1; -1; -1;  1; -1; -1; -1;  1; 1; -1; -1;  -1; 1; 1; -1];

results_4x4 = matchImgToTheClosestSelectedPatterns(t, 10, D);

%% 6x6
D = [];
D(:,1) = [1; -1; -1; -1; -1; 1;  -1; 1; -1; -1; -1; 1; -1; -1; 1; -1; -1; 1; -1; -1; -1; 1; -1; 1; -1; -1; -1; 1; -1; 1; -1; -1; -1; 1; -1; 1];
D(:,2) = [-1; -1; -1; -1; -1; -1;  1; -1; -1; -1; -1; -1;  1; 1; -1; -1; -1; -1;  1; 1; 1; -1; -1; -1;  1; 1; 1; 1; -1; -1;  1; 1; 1; 1; 1; -1];
D(:,3) = ones(36,1); D(1:18,3) = -1;
D(:,4) = ones(36,1); D(8:18,4) = -1;
D(:,5) = -ones(36,1); D(1:5,5) = 1;
D(:,6) = -ones(36,1); D(10:16,6) = 1;

t = [-1; -1; -1; -1; -1; -1;  1; -1; -1; -1; -1; -1;  1; 1; -1; -1; -1; -1;  1; 1; 1; -1; -1; -1;  -1; 1; 1; 1; -1; -1;  -1; -1; 1; 1; 1; -1];

results_6x6 = matchImgToTheClosestSelectedPatterns(t, 10, D);

%% 100x100

imgs{1} = imread('lena_cropped.bmp');
imgs{2} = imread('14.bmp');
imgs{3} = imread('baboon.bmp');
imgs{4} = imread('crow.bmp');
imgs{5} = imread('peppers.bmp');
imgs{6} = imread('kodim.bmp');
imgs{7} = imnoise(imgs{1}, 'salt & pepper', 0.2);
imgs{8} = imnoise(imgs{1}, 'salt & pepper', 0.4);
imgs{9} = imnoise(imgs{1}, 'salt & pepper', 0.6);

imgs = cellfun(@im2bw, imgs, 'UniformOutput', 0);
imgs = cellfun(@(img) double(reshape(img, numel(img), 1)), imgs, 'UniformOutput', 0);
D = zeros(size(imgs{1}, 1), 6);
for i = 1:length(imgs) 
    imgs{i}(imgs{i} == 0) = -1;
    if i <= size(D, 2)
        D(:,i) = imgs{i};
    end
end

results_100x100_2 = matchImgToTheClosestSelectedPatterns(imgs{7}, 10, D);

results_100x100_4 = matchImgToTheClosestSelectedPatterns(imgs{8}, 10, D);

results_100x100_6 = matchImgToTheClosestSelectedPatterns(imgs{9}, 10, D);
