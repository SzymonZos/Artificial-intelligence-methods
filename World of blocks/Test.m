%% Zad 2
numberOfBlocks = 4;
Init = CreateBlocks(numberOfBlocks);
Init = ontable('A', Init);
Init = ontable('C', Init);
Init = on('D', 'C', Init);
Init = holding('B', Init);

Final = CreateBlocks(numberOfBlocks);
Final = ontable('B', Final);
Final = on('D', 'B', Final);
Final = ontable('C', Final);
Final = on('A', 'C', Final);

Solutions_2 = show_results(Init, Final, numberOfBlocks, @Heuristic);

%% Zad 3
disp('Heuristic default');
Solutions_3 = test_set_of_blocks(@Heuristic);

%% Zad 4
disp('Heuristic modified');
Solutions_4 = test_set_of_blocks(@HeuristicModified);

%% Zad 5
disp('Heuristic not optimal');
Solutions_5 = test_set_of_blocks(@HeuristicNotOptimal);
