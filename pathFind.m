function [ mNW ] = pathFind(seq1, seq2, sMatrix, gap)

[letters, punctation] = substitutionMatrix(sMatrix);
[mNW,dir,N1,N2] = matrixScore(seq1, seq2, letters, punctation, gap);

max=0;
maxi=0;
maxj=0;

%znajdowanie maximum
for i=2:N2+1
    for j=2:N1+1
        if mNW(j,i)>=max
            max=mNW(j,i);
            maxi=i;
            maxj=j;
        end
        
    end
end

i=maxi;
j=maxj;

index= ismember(letters, 'AA');
match=punctation(index);

plus = match*100;

mNW(j,i) = mNW(j,i) + plus;

stringSeq1Lines = '';
stringSeq2Lines = '';
stringLines = '';
identity = 0;
gaps = 0;
length = 0;
score = mNW(j,i)- plus;

%while i>1
    while mNW(j,i)>plus %j>1
                
        dirValue = dir(j,i);
        if (dirValue == 0)
            mNW(j-1,i-1) = mNW(j-1,i-1) + plus;
            if(seq1(j-1)==seq2(i-1))
                identity = identity + 1;
                stringSeq1Lines = strcat(seq1(j-1),stringSeq1Lines);
                stringSeq2Lines = strcat(seq2(i-1),stringSeq2Lines);
                stringLines = strcat('|',stringLines);
            end
            i=i-1;
            j=j-1;
        end
        if (dirValue == 1)
            mNW(j,i-1) = mNW(j,i-1) + plus;
            stringSeq1Lines = strcat('-',stringSeq1Lines);
            stringSeq2Lines = strcat(seq2(i-1),stringSeq2Lines);
            stringLines = strcat({' '},stringLines);
            gaps = gaps+1;
            i=i-1;
            
        end
        if (dirValue == 2)
            mNW(j-1,i) = mNW(j-1,i) + plus;
            stringSeq1Lines = strcat(seq1(j-1),stringSeq1Lines);
            stringSeq2Lines = strcat('-',stringSeq2Lines);
            stringLines = strcat({' '},stringLines);
            gaps = gaps+1;
            j=j-1;            
        end      
        length = length + 1;
    end
    
    mNW(j,i)=mNW(j,i)-plus;
    
%end

fprintf('Path found');

record = [stringSeq1Lines;stringLines;stringSeq2Lines];
fileSave( seq1, seq2, sMatrix, gap, score, length, identity, gaps, record);


end


