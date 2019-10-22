function weights = hebbWeights(patterns, numberOfNeurons)
    patterns = reshape(patterns, [], 1);
    weights = patterns * patterns' / numberOfNeurons;
end