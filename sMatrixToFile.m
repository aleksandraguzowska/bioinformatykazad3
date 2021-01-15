function [ sMatrixStr ] = sMatrixToFile( sMatrix )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

s = size(sMatrix); 
for i=2:s(1,1)
    for j=2:s(1,2)
       number=cell2mat(sMatrix(i,j));
       string=num2str(number);
       if(length(string)==1)
           string = [' ',string];
       end
       sMatrix(i,j)=cellstr(string);
    end
end

row1 = strjoin(sMatrix(1,:), '   ');
row2 = strjoin(sMatrix(2,:), '  ');
row3 = strjoin(sMatrix(3,:), '  ');
row4 = strjoin(sMatrix(4,:), '  ');
row5 = strjoin(sMatrix(5,:), '  ');

S = {row1,row2,row3,row4,row5};

sMatrixStr = strjoin(S,'\n');

end

