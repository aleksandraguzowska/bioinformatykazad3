function [ FastaSet ] = loadSequence( numberOfSequence )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

way = '';
print = ['Choose the way to input ',numberOfSequence,'sequence \nmanual - manual\nfile - from FASTA format file\nncbi - from NCBI database \nexit - end \n\n'];

while ~(strcmp(way,'manual') || strcmp(way,'file') || strcmp(way,'ncbi') || strcmp(way,'exit'))
  fprintf(print);
  way = input('','s');
  if strcmp(way,'manual') || strcmp(way,'file') || strcmp(way,'ncbi') || strcmp(way,'exit')
      break;
  end
end

if strcmp(way,'manual')
    FastaSet = loadFasta(way);    
elseif strcmp(way,'file')
    filename = input('filename: ','s');
    FastaSet = loadFasta(way, filename); 
elseif strcmp(way,'ncbi')
    identifier = input('identifier: ','s');
    FastaSet = loadFasta(way, identifier); 
elseif strcmp(way,'exit')
    error('Script stopped');
end

fprintf('Sequence import succesfully\n\n');


end

