function [ P ] = globalMatch( seq1, seq2, gap, match, missmatch )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

P = zeros(length(seq2)+1, length(seq1)+1);
%D = zeros(length(seq2)+1, length(seq1)+1);

seq1 = ' ' + seq1;
seq2 = ' ' + seq2;

column = 0;
row = 0;
befrow = 0;
befcol = 0;

for i=0:length(seq2) %wiersze    
    for j=0:length(seq1) %kolumny
        
        result = 0;
        
        
       
        if (i-befrow ~= 1 && j-befcol ~= 1)
            result = result - gap;
        elseif (seq1(j) == seq2(i))
            result = result + match;
        else
             result = result + missmatch;
        end
    

P(column, row) = result;

        befrow = i;
        befcol = j;

    end
end

end %end of function


