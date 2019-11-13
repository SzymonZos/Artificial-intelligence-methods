function y = hopfieldNetwork(initialConditions, timeLimit, patterns, calculateWeights)
    numberOfNeurons = max(size(initialConditions));
    y = zeros([numberOfNeurons, timeLimit + 1]);
    y(:, 1) = initialConditions;
    weights = calculateWeights(patterns, numberOfNeurons);
    for i = 2 : timeLimit + 1
        y(:, i) = sign(weights * y(:, i-1));
    end
end