function showData(data, classes, titleData)
    class_0 = data(:, logical(classes == 0));
    class_1 = data(:, logical(classes == 1));
    figure;
    plot(class_0(1,:), class_0(2,:), '*');
    hold on;
    plot(class_1(1,:), class_1(2,:), '*');
    title(titleData);
end