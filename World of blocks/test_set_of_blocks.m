function Solutions = test_set_of_blocks(heuristicFunction)
% 3 klocki
numberOfBlocks = 3;
Init = CreateBlocks(numberOfBlocks);
Init = ontable('A', Init);
Init = ontable('C', Init);
Init = holding('B', Init);

Final = CreateBlocks(numberOfBlocks);
Final = ontable('B', Final);
Final = ontable('C', Final);
Final = on('A', 'C', Final);
Solutions.blocks_3 = show_results(Init, Final, numberOfBlocks, heuristicFunction);

% 4 klocki
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
Solutions.blocks_4 = show_results(Init, Final, numberOfBlocks, heuristicFunction);

% 5 klocków
numberOfBlocks = 5;
Init = CreateBlocks(numberOfBlocks);
Init = ontable('A', Init);
Init = on('E', 'A', Init);
Init = ontable('C', Init);
Init = on('D', 'C', Init);
Init = holding('B', Init);

numberOfBlocks = 5;
Final = CreateBlocks(numberOfBlocks);
Final = ontable('B', Final);
Final = on('D', 'B', Final);
Final = ontable('C', Final);
Final = on('A', 'C', Final);
Final = on('E', 'A', Final);

Solutions.blocks_5 = show_results(Init, Final, numberOfBlocks, heuristicFunction);

% 6 klocków
numberOfBlocks = 6;
Init = CreateBlocks(numberOfBlocks);
Init = ontable('A', Init);
Init = on('E', 'A', Init);
Init = ontable('C', Init);
Init = on('D', 'C', Init);
Init = on('B', 'D', Init);
Init = holding('F', Init);

numberOfBlocks = 6;
Final = CreateBlocks(numberOfBlocks);
Final = ontable('B', Final);
Final = on('D', 'B', Final);
Final = ontable('C', Final);
Final = on('A', 'C', Final);
Final = on('E', 'A', Final);
Final = ontable('F', Final);

Solutions.blocks_6 = show_results(Init, Final, numberOfBlocks, heuristicFunction);
end