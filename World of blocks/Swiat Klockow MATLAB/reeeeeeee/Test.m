Init=ReadSTRIPS('Initial.txt');
Final=ReadSTRIPS('Final.txt');

%Je¿eli wczytywanie z pliku nie dzia³a to mo¿na zadeklarowaæ zmienne rêcznie:
%
%Init=CreateBlocks(3);
%Init=ontable('A',Init);
%Init=on('B','A',Init);
%Init=holding('C',Init);
%Final=CreateBlocks(3);
%Final=ontable('B',Final);
%Final=on('C','B',Final);
%Final=ontable('A',Final);

% Na obecn¹ chwilê dostêpne s¹ 2 alorytmy planowania
SolutionsBF=BruteForce(Init,Final);
SolutionsH=Heuristic(Init,Final);

% Ta funkcja s³u¿y jedynie do wyœwietlania kolejnych kroków. Nie jest potrzebna
Path=FinalPath(SolutionsBF); 

disp('Algorytm heurystyczny');
disp(['liczba kroków: ' num2str(SolutionsH(size(SolutionsH,2)).cost(1)) ]);
disp(['przeanalizowano ' num2str(size(SolutionsH,2)) ' przypadków']);

disp('Przegl¹d zupe³ny');
disp(['liczba kroków: ' num2str(SolutionsBF(size(SolutionsBF,2)).cost(1)) ]);
disp(['przeanalizowano ' num2str(size(SolutionsBF,2)) ' przypadków']);