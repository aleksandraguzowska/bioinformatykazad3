function [ mNW, dir, N1, N2 ] = matrixScore(seq1, seq2, letters, punctation, gap)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N1 = length(seq1);
N2 = length(seq2);

mNW = zeros(N1+1, N2+1); %macierz punktacji
dir = zeros(N1+1, N2+1); %macierz z kierunkami 0-skos 1-bok 2-góra


  

 
mNW(1,1) = 0;
dir (1,1) = 3;

for i=2:N1+1

    mNW(i,1) = 0;
    dir (i,1) = 2;
    
end

for j=2:N2+1

    mNW(1,j) = 0;
    dir (1,j) = 1; 
    
end

for i=2:N2+1
    for j=2:N1+1

        strSeq=strcat(seq1(j-1),seq2(i-1));
        index= ismember(letters, strSeq);
               
    
        dir0 = mNW(j-1,i-1) + punctation(index);
        dir1 = mNW(j,i-1) + gap;
        dir2 = mNW(j-1,i) + gap;
        
        if (dir0<0) 
            dir0 = 0; 
        end
        
        if (dir1<0) 
            dir1 = 0; 
        end
        
        if (dir2<0) 
            dir2 = 0; 
        end
        
        A = [dir0 dir1 dir2];
        maxA = max(A);
        mNW(j,i) = maxA;
        
        %KIERUNEK
        if (dir0 == maxA) 
            dir(j,i)=0;
        end
        if (dir1 == maxA)
            dir(j,i)=1;
        end
        if (dir2 == maxA)
            dir(j,i)=2;
        end
        
    
    end
    i
end

fprintf('Matrix of punctation done \n');
end

