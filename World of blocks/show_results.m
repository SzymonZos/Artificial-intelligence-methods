function Solutions = show_results(Init, Final, numberOfBlocks, heuristicFunction)
    figure;
    title('Init');
    DrawBlocks(Init);
    
    figure;
    title('Final');
    DrawBlocks(Final);

    Solutions.BF = BruteForce(Init,Final);
    Solutions.H = heuristicFunction(Init,Final);

    disp(['Liczba blok�w: ', num2str(numberOfBlocks)]);
    disp('Algorytm heurystyczny');
    disp(['liczba krok�w: ' num2str(Solutions.H(size(Solutions.H,2)).cost(1)) ]);
    disp(['przeanalizowano ' num2str(size(Solutions.H,2)) ' przypadk�w' 10]);

    disp('Przegl�d zupe�ny');
    disp(['liczba krok�w: ' num2str(Solutions.BF(size(Solutions.BF,2)).cost(1)) ]);
    disp(['przeanalizowano ' num2str(size(Solutions.BF,2)) ' przypadk�w' 10 10]);
end