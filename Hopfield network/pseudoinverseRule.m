function weights = pseudoinverseRule(patterns, ~)
    weights = patterns * inv(patterns' * patterns) * patterns';
end