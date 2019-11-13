function results = matchImgToTheClosestPattern(t, times, D)
    y_hebb = hopfieldNetwork(t, times, D, @hebbWeights);
    y_inv = hopfieldNetwork(t, 10, D, @pseudoinverseRule);

    results = mat2cell(D, size(D,1), ones(1,size(D,2)));
    results = [results, {t, y_hebb(:, end), y_inv(:, end), t}];

    results = cellfun(@(img) reshape(img, sqrt(length(img)), sqrt(length(img))), results, 'UniformOutput', 0);
    titles = cell(1, size(D, 2));
    for index = 1 : size(D, 2)
        titles{index} = ['d', num2str(index)];
    end
    titles = [titles, {'t', 'Hebb result', 'Pseudoinverse result', 't'}];
    show_results(results, titles);
end