function results = matchImgToTheClosestSelectedPatterns(t, times, D)
    D_temp = [];
    
    % 2 patterns
    D_temp(:,1) = D(:,1);
    D_temp(:,2) = D(:,2);
    results{1} = matchImgToTheClosestPattern(t, times, D_temp);

    % 4 patterns
    D_temp(:,3) = D(:,3);
    D_temp(:,4) = D(:,4);
    results{2} = matchImgToTheClosestPattern(t, times, D_temp);

    % 6 patterns
    D_temp(:,5) = D(:,5);
    D_temp(:,6) = D(:,6);
    results{3} = matchImgToTheClosestPattern(t, times, D_temp);
end