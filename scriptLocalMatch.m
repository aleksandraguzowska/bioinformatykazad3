clc;
clear all;

fprintf('Script search local match of two sequences using gap and substitution matrix\n\n');

FastaSet1 = loadSequence('first');
seq1 = char(FastaSet1(1,2));
seq1ID = char(FastaSet1(1,1));

FastaSet2 = loadSequence('second');
seq2 = char(FastaSet2(1,2));
seq2ID = char(FastaSet2(1,1));
  
fprintf('Insert gap punctation\n');
gapString = input('','s');    
gap = str2double(gapString);

sMatrix ={'#' 'A' 'C' 'G' 'T' 'U';
            'A' 2 -7 -5 -7 -7;
            'C' -7 2 -7 -5 -5;
            'G' -5 -7 2 -7 -7;
            'T' -7 -5 -7 2 0;
            'U' -7 -5 -7 0 2};

        
%result = pathFind('ACGTCGACGTCGACGTCGACGTCGACGTCG','ACGTCGAFCTTCACGTCGACGTCGACGTCG',sMatrix,-2);
result=pathFind(seq1,seq2,sMatrix,gap);

%umieszczenie ka¿dej litery sekwencji osobno w tablicy w celu umieszczenia
%ich na osiach
names1 = cellstr(seq1');
names2 = cellstr(seq2');

h = figure;
imagesc(result)
%tytu³ wykresu
T = ['Œcie¿ka optymalnego dopasowania ',seq1ID,' vs. ',seq2ID];
title(gca,T);
%zastêpowanie znaczników osi literami
set(gca, 'xtick',[1:length(seq1)], 'xticklabel',names1);
set(gca, 'ytick',[1:length(seq2)], 'yticklabel',names2);
%przesuwanie znaczniików osi x ponad wykres
set(gca, 'XAxisLocation', 'top');  
colorbar

print(h, '-dpng', 'dopasowanieLokalne.png');
