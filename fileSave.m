function [ output_args ] = fileSave( seq1, seq2, sMatrix, gap, score, length, identity, gaps, record)

%przygotowanie macierzy do zapisu
stringSeq1 = strcat('# 1:',{' '},seq1);
stringSeq2 = strcat('# 2:',{' '},seq2);

stringMode = '# Mode: distance';

% matchStr = num2str(match);
% stringMatch = strcat('# Match:',{' '},matchStr);
% 
% mismatchStr = num2str(mismatch);
% stringMismatch = strcat('# Mismatch:',{' '},mismatchStr);
sMatrixStr = sMatrixToFile( sMatrix );

gapStr = num2str(gap);
stringGap = strcat('# Gap:',{' '},gapStr);

scoreStr = num2str(score);
stringScore = strcat('# Score:',{' '},scoreStr);

lengthStr = num2str(length);
stringLength = strcat('# Length:',{' '},lengthStr);

identityStr = num2str(identity);
procentIdentityStr = num2str(floor(identity/length*100));
stringIdentity = strcat('# Identity:',{' '},identityStr,'/',lengthStr,' (',procentIdentityStr,'%)');

gapsStr = num2str(gaps);
procentGapsStr = num2str(floor(gaps/length*100));
stringGaps = strcat('# Identity:',{' '},gapsStr,'/',lengthStr,' (',procentGapsStr,'%)');

F = [stringSeq1;
        stringSeq2;
        stringMode;
        sMatrixStr;
        stringGap;
        stringScore;
        stringLength;
        stringIdentity;
        stringGaps;
        record];
    
    
fileID = fopen('dopasowanieLokalne.txt','w');
formatSpec = '%s\r\n';
[nrows,ncols] = size(F);
for row = 1:nrows
    fprintf(fileID,formatSpec,F{row,1});  
end
fclose(fileID);

%type dopasowanieGlobalne.txt

end



