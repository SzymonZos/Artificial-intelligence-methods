function weights = hebbWeights(patterns, numberOfNeurons)
    weights = patterns * patterns' / numberOfNeurons;
end