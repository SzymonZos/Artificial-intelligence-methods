function D = generateFunction(X)
    D = 0;
    n = 5;
    for i = 1 : n
        if mod(i,2)
        D = D - (i-n)*X.^ i;
        else
        D = D + (i-n)*X.^ i;
        end
    end
    D = (D + 100*sin(X) - 50*cos(X))./100;
end