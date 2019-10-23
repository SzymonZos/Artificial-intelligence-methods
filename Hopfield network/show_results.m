function show_results(imgs, titles)
    figure;
    for i = 1:length(imgs)
        subplot(2, ceil(length(imgs))/2, i); imshow(imgs{i}, []); title(titles(i));
    end
end