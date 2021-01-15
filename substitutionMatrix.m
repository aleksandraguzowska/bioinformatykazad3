function [ letters, punctation ] = substitutionMatrix(sMatrix)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

s = size(sMatrix);   
letters=[];
punctation=[];
    
for i=2:s(1,1)
    for j=2:s(1,2)
        string=strcat(sMatrix(i,1),sMatrix(1,j));
        letters = [letters, string];
        number=cell2mat(sMatrix(i,j));
        punctation = [punctation,number];
    end
end

fprintf('Substitution matrix done');

end

