function name = getVariablesNames(varargin)
    name = cell(size(varargin));
    for index = 1 : length(varargin)
        name{index} = inputname(index);
    end
end